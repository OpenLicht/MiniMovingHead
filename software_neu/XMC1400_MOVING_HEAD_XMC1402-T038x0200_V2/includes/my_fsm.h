#ifndef INCLUDES_MY_FSM_H_
#define INCLUDES_MY_FSM_H_

#define DC_MIN 			29
#define DC_MAX 			917

typedef enum { POSITION_DETECTION, MANUAL_MOVEMENT, NUM_STATES} state_t;

typedef state_t state_func_t();

state_t run_state(state_t cur_state);

state_t position_detection();
state_t manual_movement();

uint8_t msg[3];

#endif /* INCLUDES_MY_FSM_H_ */
