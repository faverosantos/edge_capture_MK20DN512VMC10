################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freertos/Source/portable/GCC/ARM_CM3/fsl_tickless_lptmr.c \
../freertos/Source/portable/GCC/ARM_CM3/fsl_tickless_systick.c \
../freertos/Source/portable/GCC/ARM_CM3/port.c 

OBJS += \
./freertos/Source/portable/GCC/ARM_CM3/fsl_tickless_lptmr.o \
./freertos/Source/portable/GCC/ARM_CM3/fsl_tickless_systick.o \
./freertos/Source/portable/GCC/ARM_CM3/port.o 

C_DEPS += \
./freertos/Source/portable/GCC/ARM_CM3/fsl_tickless_lptmr.d \
./freertos/Source/portable/GCC/ARM_CM3/fsl_tickless_systick.d \
./freertos/Source/portable/GCC/ARM_CM3/port.d 


# Each subdirectory must supply rules for building sources it contributes
freertos/Source/portable/GCC/ARM_CM3/%.o: ../freertos/Source/portable/GCC/ARM_CM3/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -flto -Wall -Wextra  -g3 -D"CPU_MK20DN512VLK10" -I../freertos/Source/include -I../startup -I../board -I../utilities -I../freertos/Source/portable/GCC/ARM_CM3 -I../source -I../CMSIS -I../drivers -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


