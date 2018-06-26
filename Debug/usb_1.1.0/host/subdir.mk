################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../usb_1.1.0/host/usb_host_devices.c \
../usb_1.1.0/host/usb_host_framework.c \
../usb_1.1.0/host/usb_host_hci.c \
../usb_1.1.0/host/usb_host_khci.c 

OBJS += \
./usb_1.1.0/host/usb_host_devices.o \
./usb_1.1.0/host/usb_host_framework.o \
./usb_1.1.0/host/usb_host_hci.o \
./usb_1.1.0/host/usb_host_khci.o 

C_DEPS += \
./usb_1.1.0/host/usb_host_devices.d \
./usb_1.1.0/host/usb_host_framework.d \
./usb_1.1.0/host/usb_host_hci.d \
./usb_1.1.0/host/usb_host_khci.d 


# Each subdirectory must supply rules for building sources it contributes
usb_1.1.0/host/%.o: ../usb_1.1.0/host/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -flto -Wall -Wextra  -g3 -D"CPU_MK20DN512VLK10" -I../freertos/Source/include -I../startup -I../board -I../utilities -I../freertos/Source/portable/GCC/ARM_CM3 -I../source -I../CMSIS -I../drivers -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


