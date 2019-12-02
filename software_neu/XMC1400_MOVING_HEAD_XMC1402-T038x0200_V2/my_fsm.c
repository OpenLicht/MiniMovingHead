#include <DAVE.h>
#include "includes/my_fsm.h"

static uint8_t bot_speed = 1;

state_func_t* const state_table[NUM_STATES] =
{
		position_detection, manual_movement
};

state_t run_state(state_t cur_state)
{
	return state_table[cur_state]();
}

void delay(uint32_t time)
{
	for(uint32_t i = 0; i < time; i++)
	{
		__asm("nop");
	}
}

static long map(long x, long in_min, long in_max, long out_min, long out_max)
{
	return(x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

static void get_position(int *pos)
{
	uint16_t cycle = CCU40_CC41->CV[3];

	unsigned int time = 0.02 * cycle;

	// 0,0010989 --- 0.001099  || 1099 us => 100% 2,7% == 29 us, 97,1% == 1067 us
	// 0 - 360 angular position in units full circle = ((dc - dc_min) * 360) /(dc_max - dc_min + 1)

	int dc = 1000 * (time / 1099.0);
	*pos = (360 - 1) - ((dc - DC_MIN) * 360) / (DC_MAX - DC_MIN + 1); // (DC_MAX - DC_MIN + 1)
	if(*pos < 0) *pos = 0;
	else if(*pos > (360 - 1)) *pos = 360 - 1;
}

static int top_position = 0; // 750 <= get position from top servo

static void move_top_servo(int8_t offset)
{
	PWM_Start(&PWM_SERVO_TOP);
	while(msg[0] != 0x90)
	{
		UART_Receive(&UART_0, msg, 3);
		top_position += offset;
		if(top_position > 1100) top_position = 1100;
		if(top_position < 250) top_position = 250;
		PWM_SetDutyCycle(&PWM_SERVO_TOP, top_position);
		delay(80000); // 80000 adjust this value for a smooth rotation
	}
	PWM_Stop(&PWM_SERVO_TOP);
}

static void move_top_servo_to(int position)
{
	PWM_Start(&PWM_SERVO_TOP);
	PWM_SetDutyCycle(&PWM_SERVO_TOP, position);
	delay(1200000);
	PWM_Stop(&PWM_SERVO_TOP);
}

state_t position_detection()
{
	int position, top_pos;
	int pos = 0;
	int old_pos = 0, turns = 0, angle = 0, errorAng;
	int output, offset;
	uint32_t led_val;

	PWM_SetDutyCycle(&PWM_SERVO_BOTTOM, 730);
	while(1)
	{
		if(UART_Receive(&UART_0, msg, 3) == UART_STATUS_SUCCESS)
		{
			switch(msg[0])
			{
			case 0x60:
				pos = ((msg[1] << 8) | (msg[2] & 0xFF));
				pos = pos * 3;
				break;
			case 0x61:
				top_pos = ((msg[1] << 8) | (msg[2] & 0xFF));
				int map_pos = map(top_pos, 0, 180, 250, 1100);
				move_top_servo_to(map_pos);
				break;
			case 0x70:
				led_val = ((msg[1] << 8) | (msg[2] & 0xFF));
				int led_map = map(led_val, 0, 100, 0, 10000);
				PWM_SetDutyCycle(&PWM_LED_1, led_map);
				break;
			case 0x91:
				return MANUAL_MOVEMENT;
			}
		}

		get_position(&position);
		if(position < 90 && old_pos > 270)
		{
		  turns++;
		}
		else if(old_pos < 90 && position > 270)
		{
		  turns--;
		}
		if(turns >= 0) angle = (turns * 360) + position;
		else if(turns < 0) angle = ((turns + 1) * 360) - (360 - position);
		old_pos = position;

		errorAng = pos - angle;
		output = errorAng;
		if(output > 60) output = 60;
		if(output < -50) output = -50;
		if(errorAng > 0 ) offset = 10;
		else if(errorAng < 0) offset = -10;
		else offset = 0;
		PWM_SetDutyCycle(&PWM_SERVO_BOTTOM, 750 + output + offset);

		delay(240000);
	}
}

state_t manual_movement()
{
	uint32_t led_val;
	if(UART_Receive(&UART_0, msg, 3) == UART_STATUS_SUCCESS)
	{
		switch(msg[0])
		{
		case 0x41:
		  PWM_SetDutyCycle(&PWM_SERVO_BOTTOM, 750 + (bot_speed * 5) + 20);
		  break;
		case 0x42:
		  PWM_SetDutyCycle(&PWM_SERVO_BOTTOM, 750 - (bot_speed * 5) - 10);
		  break;
		case 0x45:
			bot_speed = msg[2];
			if(bot_speed > 10) bot_speed = 10;
			if(bot_speed < 1) bot_speed = 1;
			break;
		case 0x51:
		  move_top_servo(-10);
		  break;
		case 0x52:
		  move_top_servo(10);
		  break;
		case 0x70:
			led_val = ((msg[1] << 8) | (msg[2] & 0xFF));
			int led_map = map(led_val, 0, 100, 0, 10000);
			PWM_SetDutyCycle(&PWM_LED_1, led_map);
			break;
		case 0x90:
		  PWM_SetDutyCycle(&PWM_SERVO_BOTTOM, 750);
		  break;
		case 0x92:
			return POSITION_DETECTION;
		}
	}

	return MANUAL_MOVEMENT;
}
