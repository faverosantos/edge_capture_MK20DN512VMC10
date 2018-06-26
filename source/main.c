// A code by Fávero Santos, 25/06/2018

// Includes
#include <string.h>
#include "board.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_debug_console.h"
#include "apalis-tk1-k20-api.h"
#include "fsl_ftm.h"

// Defines
#define BOARD_FTM_BASEADDR FTM0
// FTM channel used for input capture
#define BOARD_FTM_INPUT_CAPTURE_CHANNEL kFTM_Chnl_0

// Interrupt number and interrupt handler for the FTM instance used
#define FTM_INTERRUPT_NUMBER FTM0_IRQn
#define FTM_INPUT_CAPTURE_HANDLER FTM0_IRQHandler

// Interrupt to enable and flag to read; depends on the FTM channel pair used
#define FTM_CHANNEL_INTERRUPT_ENABLE kFTM_Chnl0InterruptEnable
#define FTM_CHANNEL_FLAG kFTM_Chnl0Flag

volatile bool ftmIsrFlag = false;
volatile uint32_t previous_count = 0;

void FTM_INPUT_CAPTURE_HANDLER(void){

	if ((FTM_GetStatusFlags(BOARD_FTM_BASEADDR) & FTM_CHANNEL_FLAG) == FTM_CHANNEL_FLAG){
		/* Clear interrupt flag.*/
		FTM_ClearStatusFlags(BOARD_FTM_BASEADDR, FTM_CHANNEL_FLAG);
		/* Resets the timer */
		BOARD_FTM_BASEADDR->CNT = 0x0;
	}
	ftmIsrFlag = true;
}

int main(void){

	ftm_config_t ftmInfo;
	uint32_t previous_count = 0;

	BOARD_InitPins();
	BOARD_BootClockRUN();
	BOARD_InitDebugConsole();

	PRINTF("\033[2J"); // Limpa tela, em ANSI
	PRINTF("\033[H");  // Cursor para home
	PRINTF("\r -- K20 Capture V00 R00 -- \n ");
	PRINTF("\r -- Aloha from MK20DN512VMC10! -- \n");
	PRINTF("\r -- Apalis K20 Firmware Version %d.%d \n", FW_MAJOR, FW_MINOR);
	PRINTF("\r -- MCGFLLCLK (Hz): %d \n", CLOCK_GetFixedFreqClkFreq());

	FTM_GetDefaultConfig(&ftmInfo);
	//ftmInfo.prescale = kFTM_Prescale_Divide_16;
	/* Initialize FTM module */
	FTM_Init(BOARD_FTM_BASEADDR, &ftmInfo);

	/* Setup single-edge capture on a FTM channel pair */
	FTM_SetupInputCapture(BOARD_FTM_BASEADDR, BOARD_FTM_INPUT_CAPTURE_CHANNEL, kFTM_RiseAndFallEdge, 0);

	/* Set the timer to be in free-running mode */
	BOARD_FTM_BASEADDR->MOD = 0xFFFF;

	/* Set the initial value of the timer*/
	BOARD_FTM_BASEADDR->CNTIN = 0x0;

	/* Enable channel interrupt when the second edge is detected */
	FTM_EnableInterrupts(BOARD_FTM_BASEADDR, FTM_CHANNEL_INTERRUPT_ENABLE);

	/* Enable at the NVIC */
	EnableIRQ(FTM_INTERRUPT_NUMBER);

	FTM_StartTimer(BOARD_FTM_BASEADDR, kFTM_FixedClock);

	uint32_t counter = 0;
	bool first_cap = true;
	uint32_t present_count = 0;
	uint32_t count_value = 0;
	float frequency_value = 0;

	for(;;){
		counter++;
		if (counter == 30000000){
			counter = 0;
			PRINTF("\r -- Alive! \n");
		}

		if ((ftmIsrFlag == true)&&(first_cap == true)){
			ftmIsrFlag = false;
			first_cap = false;
			present_count = BOARD_FTM_BASEADDR->CONTROLS[BOARD_FTM_INPUT_CAPTURE_CHANNEL].CnV;

		}else if ((ftmIsrFlag == true)&&(first_cap == false)){
			ftmIsrFlag = false;

			previous_count = present_count;
			present_count = BOARD_FTM_BASEADDR->CONTROLS[BOARD_FTM_INPUT_CAPTURE_CHANNEL].CnV;

			count_value = present_count + previous_count;

			frequency_value = (float)CLOCK_GetFixedFreqClkFreq()/(float)count_value;

			PRINTF("\r -- -- -- \n");
			PRINTF("\r -- Present count value: %d \n", present_count);
			PRINTF("\r -- Previous count value: %d \n", previous_count);
			PRINTF("\r -- Count value: %d \n", count_value);
			PRINTF("\r -- Frequency value [Hz]: %f \n", frequency_value);
			PRINTF("\r -- -- -- \n");
			PRINTF("\r\n");

		}

	}
}





