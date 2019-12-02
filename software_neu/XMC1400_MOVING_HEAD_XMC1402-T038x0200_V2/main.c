#include <DAVE.h>                 //Declarations from DAVE Code Generation (includes SFR declaration)
#include "includes/my_fsm.h"

int main(void)
{
  DAVE_STATUS_t status;

  status = DAVE_Init();           /* Initialization of DAVE APPs  */

  state_t cur_state = MANUAL_MOVEMENT;
  if(status != DAVE_STATUS_SUCCESS)
  {
    /* Placeholder for error handler code. The while loop below can be replaced with an user error handler. */
    XMC_DEBUG("DAVE APPs initialization failed\n");

    while(1U)
    {

    }
  }
  /* Placeholder for user application code. The while loop below can be replaced with user application code. */
  PWM_SetDutyCycle(&PWM_LED_1, 0);
  while(1U)
  {
	  cur_state = run_state(cur_state);
  }
}
