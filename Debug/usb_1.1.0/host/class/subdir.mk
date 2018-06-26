################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../usb_1.1.0/host/class/usb_host_audio.c \
../usb_1.1.0/host/class/usb_host_cdc.c \
../usb_1.1.0/host/class/usb_host_hid.c \
../usb_1.1.0/host/class/usb_host_hub.c \
../usb_1.1.0/host/class/usb_host_hub_app.c \
../usb_1.1.0/host/class/usb_host_msd.c \
../usb_1.1.0/host/class/usb_host_msd_ufi.c \
../usb_1.1.0/host/class/usb_host_phdc.c \
../usb_1.1.0/host/class/usb_host_printer.c 

OBJS += \
./usb_1.1.0/host/class/usb_host_audio.o \
./usb_1.1.0/host/class/usb_host_cdc.o \
./usb_1.1.0/host/class/usb_host_hid.o \
./usb_1.1.0/host/class/usb_host_hub.o \
./usb_1.1.0/host/class/usb_host_hub_app.o \
./usb_1.1.0/host/class/usb_host_msd.o \
./usb_1.1.0/host/class/usb_host_msd_ufi.o \
./usb_1.1.0/host/class/usb_host_phdc.o \
./usb_1.1.0/host/class/usb_host_printer.o 

C_DEPS += \
./usb_1.1.0/host/class/usb_host_audio.d \
./usb_1.1.0/host/class/usb_host_cdc.d \
./usb_1.1.0/host/class/usb_host_hid.d \
./usb_1.1.0/host/class/usb_host_hub.d \
./usb_1.1.0/host/class/usb_host_hub_app.d \
./usb_1.1.0/host/class/usb_host_msd.d \
./usb_1.1.0/host/class/usb_host_msd_ufi.d \
./usb_1.1.0/host/class/usb_host_phdc.d \
./usb_1.1.0/host/class/usb_host_printer.d 


# Each subdirectory must supply rules for building sources it contributes
usb_1.1.0/host/class/%.o: ../usb_1.1.0/host/class/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -O3 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -flto -Wall -Wextra  -g3 -D"CPU_MK20DN512VLK10" -I../freertos/Source/include -I../startup -I../board -I../utilities -I../freertos/Source/portable/GCC/ARM_CM3 -I../source -I../CMSIS -I../drivers -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


