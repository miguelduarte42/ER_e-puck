#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/I2C/e_I2C_master_module.o ${OBJECTDIR}/I2C/e_I2C_protocol.o ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o ${OBJECTDIR}/btcom.o ${OBJECTDIR}/cam_test.o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o ${OBJECTDIR}/camera/fast_2_timer/e_common.o ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o ${OBJECTDIR}/camera/fast_2_timer/e_timers.o ${OBJECTDIR}/camtest2.o ${OBJECTDIR}/ctrhnnmultilayercontroller.o ${OBJECTDIR}/e_randb.o ${OBJECTDIR}/main_c.o ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o ${OBJECTDIR}/motor_led/e_init_port.o ${OBJECTDIR}/runfollowball.o ${OBJECTDIR}/search_ball.o ${OBJECTDIR}/uart/e_init_uart1.o ${OBJECTDIR}/uart/e_init_uart2.o ${OBJECTDIR}/uart/e_uart1_rx_char.o ${OBJECTDIR}/uart/e_uart1_tx_char.o ${OBJECTDIR}/uart/e_uart2_rx_char.o ${OBJECTDIR}/uart/e_uart2_tx_char.o ${OBJECTDIR}/utilities.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/Applications/microchip/mplabc30/v3.30c/bin/pic30-gcc
# MP_BC is not defined
MP_AS=/Applications/microchip/mplabc30/v3.30c/bin/pic30-as
MP_LD=/Applications/microchip/mplabc30/v3.30c/bin/pic30-ld
MP_AR=/Applications/microchip/mplabc30/v3.30c/bin/pic30-ar
# MP_BC is not defined
MP_CC_DIR=/Applications/microchip/mplabc30/v3.30c/bin
# MP_BC_DIR is not defined
MP_AS_DIR=/Applications/microchip/mplabc30/v3.30c/bin
MP_LD_DIR=/Applications/microchip/mplabc30/v3.30c/bin
MP_AR_DIR=/Applications/microchip/mplabc30/v3.30c/bin
# MP_BC_DIR is not defined

.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=30F6014A
MP_LINKER_FILE_OPTION=,-Tp30f6014A.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/uart/e_uart2_rx_char.o: uart/e_uart2_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok ${OBJECTDIR}/uart/e_uart2_rx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_rx_char.s -o ${OBJECTDIR}/uart/e_uart2_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart2_rx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_rx_char.s -o ${OBJECTDIR}/uart/e_uart2_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart2_rx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart2_rx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart2_rx_char.o.d > ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart2_rx_char.o.d > ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart2_rx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_uart1_rx_char.o: uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok ${OBJECTDIR}/uart/e_uart1_rx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_rx_char.s -o ${OBJECTDIR}/uart/e_uart1_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart1_rx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_rx_char.s -o ${OBJECTDIR}/uart/e_uart1_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart1_rx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart1_rx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart1_rx_char.o.d > ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart1_rx_char.o.d > ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart1_rx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_init_uart1.o: uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.ok ${OBJECTDIR}/uart/e_init_uart1.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart1.s -o ${OBJECTDIR}/uart/e_init_uart1.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_init_uart1.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart1.s -o ${OBJECTDIR}/uart/e_init_uart1.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_init_uart1.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_init_uart1.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_init_uart1.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart1.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart1.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_init_uart1.o.d > ${OBJECTDIR}/uart/e_init_uart1.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart1.o.tmp ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart1.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart1.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_init_uart1.o.d > ${OBJECTDIR}/uart/e_init_uart1.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart1.o.tmp ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_init_uart1.o.err 
	@cat ${OBJECTDIR}/uart/e_init_uart1.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_init_uart1.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_init_uart1.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o: camera/fast_2_timer/e_interrupt.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  camera/fast_2_timer/e_interrupt.s -o ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  camera/fast_2_timer/e_interrupt.s -o ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_uart1_tx_char.o: uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok ${OBJECTDIR}/uart/e_uart1_tx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_tx_char.s -o ${OBJECTDIR}/uart/e_uart1_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart1_tx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_tx_char.s -o ${OBJECTDIR}/uart/e_uart1_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart1_tx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart1_tx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart1_tx_char.o.d > ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart1_tx_char.o.d > ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart1_tx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_uart2_tx_char.o: uart/e_uart2_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok ${OBJECTDIR}/uart/e_uart2_tx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_tx_char.s -o ${OBJECTDIR}/uart/e_uart2_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart2_tx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_tx_char.s -o ${OBJECTDIR}/uart/e_uart2_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_uart2_tx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart2_tx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart2_tx_char.o.d > ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart2_tx_char.o.d > ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart2_tx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_init_uart2.o: uart/e_init_uart2.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.ok ${OBJECTDIR}/uart/e_init_uart2.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart2.s -o ${OBJECTDIR}/uart/e_init_uart2.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_init_uart2.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart2.s -o ${OBJECTDIR}/uart/e_init_uart2.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1 --defsym=__MPLAB_DEBUG=1 --defsym=__ICD2RAM=1 --defsym=__DEBUG=1 --defsym=__MPLAB_DEBUGGER_ICD3=1 -g  -MD ${OBJECTDIR}/uart/e_init_uart2.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_init_uart2.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_init_uart2.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart2.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart2.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_init_uart2.o.d > ${OBJECTDIR}/uart/e_init_uart2.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart2.o.tmp ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart2.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart2.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_init_uart2.o.d > ${OBJECTDIR}/uart/e_init_uart2.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart2.o.tmp ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_init_uart2.o.err 
	@cat ${OBJECTDIR}/uart/e_init_uart2.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_init_uart2.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_init_uart2.o.ok; else exit 1; fi
	
else
${OBJECTDIR}/uart/e_uart2_rx_char.o: uart/e_uart2_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok ${OBJECTDIR}/uart/e_uart2_rx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_rx_char.s -o ${OBJECTDIR}/uart/e_uart2_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart2_rx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_rx_char.s -o ${OBJECTDIR}/uart/e_uart2_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart2_rx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart2_rx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart2_rx_char.o.d > ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart2_rx_char.o.d > ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_rx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart2_rx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart2_rx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart2_rx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_uart1_rx_char.o: uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok ${OBJECTDIR}/uart/e_uart1_rx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_rx_char.s -o ${OBJECTDIR}/uart/e_uart1_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart1_rx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_rx_char.s -o ${OBJECTDIR}/uart/e_uart1_rx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart1_rx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart1_rx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart1_rx_char.o.d > ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart1_rx_char.o.d > ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_rx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart1_rx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart1_rx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart1_rx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_init_uart1.o: uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.ok ${OBJECTDIR}/uart/e_init_uart1.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart1.s -o ${OBJECTDIR}/uart/e_init_uart1.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_init_uart1.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart1.s -o ${OBJECTDIR}/uart/e_init_uart1.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_init_uart1.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_init_uart1.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_init_uart1.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart1.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart1.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_init_uart1.o.d > ${OBJECTDIR}/uart/e_init_uart1.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart1.o.tmp ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart1.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart1.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_init_uart1.o.d > ${OBJECTDIR}/uart/e_init_uart1.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart1.o.tmp ${OBJECTDIR}/uart/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart1.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_init_uart1.o.err 
	@cat ${OBJECTDIR}/uart/e_init_uart1.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_init_uart1.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_init_uart1.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o: camera/fast_2_timer/e_interrupt.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  camera/fast_2_timer/e_interrupt.s -o ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  camera/fast_2_timer/e_interrupt.s -o ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_interrupt.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_uart1_tx_char.o: uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok ${OBJECTDIR}/uart/e_uart1_tx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_tx_char.s -o ${OBJECTDIR}/uart/e_uart1_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart1_tx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart1_tx_char.s -o ${OBJECTDIR}/uart/e_uart1_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart1_tx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart1_tx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart1_tx_char.o.d > ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart1_tx_char.o.d > ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart1_tx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart1_tx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart1_tx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart1_tx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_uart2_tx_char.o: uart/e_uart2_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok ${OBJECTDIR}/uart/e_uart2_tx_char.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_tx_char.s -o ${OBJECTDIR}/uart/e_uart2_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart2_tx_char.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_uart2_tx_char.s -o ${OBJECTDIR}/uart/e_uart2_tx_char.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_uart2_tx_char.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_uart2_tx_char.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_uart2_tx_char.o.d > ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ] ; then touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_uart2_tx_char.o.d > ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${CP} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp ${OBJECTDIR}/uart/e_uart2_tx_char.o.d 
	@${RM} ${OBJECTDIR}/uart/e_uart2_tx_char.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_uart2_tx_char.o.err 
	@cat ${OBJECTDIR}/uart/e_uart2_tx_char.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_uart2_tx_char.o.ok; else exit 1; fi
	
${OBJECTDIR}/uart/e_init_uart2.o: uart/e_init_uart2.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/uart 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.ok ${OBJECTDIR}/uart/e_init_uart2.o.err 
	@echo ${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart2.s -o ${OBJECTDIR}/uart/e_init_uart2.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_init_uart2.o.d$(MP_EXTRA_AS_POST)
	@-${MP_AS} $(MP_EXTRA_AS_PRE)  uart/e_init_uart2.s -o ${OBJECTDIR}/uart/e_init_uart2.o -omf=elf -p=$(MP_PROCESSOR_OPTION) --defsym=__MPLAB_BUILD=1  -MD ${OBJECTDIR}/uart/e_init_uart2.o.d$(MP_EXTRA_AS_POST) 2>&1 > ${OBJECTDIR}/uart/e_init_uart2.o.err  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/uart/e_init_uart2.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart2.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart2.o.d ; fi 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart/e_init_uart2.o.d > ${OBJECTDIR}/uart/e_init_uart2.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart2.o.tmp ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.tmp}
else 
	@if ! [ -f ${OBJECTDIR}/uart/e_init_uart2.o.d ] ; then touch ${OBJECTDIR}/uart/e_init_uart2.o.d ; fi 
	@sed -e 's/\"//g' ${OBJECTDIR}/uart/e_init_uart2.o.d > ${OBJECTDIR}/uart/e_init_uart2.o.tmp
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${CP} ${OBJECTDIR}/uart/e_init_uart2.o.tmp ${OBJECTDIR}/uart/e_init_uart2.o.d 
	@${RM} ${OBJECTDIR}/uart/e_init_uart2.o.tmp
endif
	@touch ${OBJECTDIR}/uart/e_init_uart2.o.err 
	@cat ${OBJECTDIR}/uart/e_init_uart2.o.err 
	@if [ -f ${OBJECTDIR}/uart/e_init_uart2.o.ok ] ; then rm -f ${OBJECTDIR}/uart/e_init_uart2.o.ok; else exit 1; fi
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o: camera/fast_2_timer/e_po6030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o camera/fast_2_timer/e_po6030k_registers.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o camera/fast_2_timer/e_po6030k_registers.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o: camera/fast_2_timer/e_calc_po6030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o camera/fast_2_timer/e_calc_po6030k.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o camera/fast_2_timer/e_calc_po6030k.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok; else exit 1; fi
	
${OBJECTDIR}/e_randb.o: e_randb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/e_randb.o.d 
	@${RM} ${OBJECTDIR}/e_randb.o.ok ${OBJECTDIR}/e_randb.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/e_randb.o.d -o ${OBJECTDIR}/e_randb.o e_randb.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/e_randb.o.d -o ${OBJECTDIR}/e_randb.o e_randb.c    2>&1  > ${OBJECTDIR}/e_randb.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/e_randb.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/e_randb.o.d > ${OBJECTDIR}/e_randb.o.tmp
	@${RM} ${OBJECTDIR}/e_randb.o.d 
	@${CP} ${OBJECTDIR}/e_randb.o.tmp ${OBJECTDIR}/e_randb.o.d 
	@${RM} ${OBJECTDIR}/e_randb.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/e_randb.o.d > ${OBJECTDIR}/e_randb.o.tmp
	@${RM} ${OBJECTDIR}/e_randb.o.d 
	@${CP} ${OBJECTDIR}/e_randb.o.tmp ${OBJECTDIR}/e_randb.o.d 
	@${RM} ${OBJECTDIR}/e_randb.o.tmp
endif
	@touch ${OBJECTDIR}/e_randb.o.err 
	@cat ${OBJECTDIR}/e_randb.o.err 
	@if [ -f ${OBJECTDIR}/e_randb.o.ok ] ; then rm -f ${OBJECTDIR}/e_randb.o.ok; else exit 1; fi
	
${OBJECTDIR}/main_c.o: main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main_c.o.d 
	@${RM} ${OBJECTDIR}/main_c.o.ok ${OBJECTDIR}/main_c.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/main_c.o.d -o ${OBJECTDIR}/main_c.o main_c.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/main_c.o.d -o ${OBJECTDIR}/main_c.o main_c.c    2>&1  > ${OBJECTDIR}/main_c.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/main_c.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/main_c.o.d > ${OBJECTDIR}/main_c.o.tmp
	@${RM} ${OBJECTDIR}/main_c.o.d 
	@${CP} ${OBJECTDIR}/main_c.o.tmp ${OBJECTDIR}/main_c.o.d 
	@${RM} ${OBJECTDIR}/main_c.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/main_c.o.d > ${OBJECTDIR}/main_c.o.tmp
	@${RM} ${OBJECTDIR}/main_c.o.d 
	@${CP} ${OBJECTDIR}/main_c.o.tmp ${OBJECTDIR}/main_c.o.d 
	@${RM} ${OBJECTDIR}/main_c.o.tmp
endif
	@touch ${OBJECTDIR}/main_c.o.err 
	@cat ${OBJECTDIR}/main_c.o.err 
	@if [ -f ${OBJECTDIR}/main_c.o.ok ] ; then rm -f ${OBJECTDIR}/main_c.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_common.o: camera/fast_2_timer/e_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_common.o camera/fast_2_timer/e_common.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_common.o camera/fast_2_timer/e_common.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o: motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led/advance_one_timer 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o motor_led/advance_one_timer/e_motors.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o motor_led/advance_one_timer/e_motors.c    2>&1  > ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err 
	@cat ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok; else exit 1; fi
	
${OBJECTDIR}/ctrhnnmultilayercontroller.o: ctrhnnmultilayercontroller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d -o ${OBJECTDIR}/ctrhnnmultilayercontroller.o ctrhnnmultilayercontroller.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d -o ${OBJECTDIR}/ctrhnnmultilayercontroller.o ctrhnnmultilayercontroller.c    2>&1  > ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d > ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${CP} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d > ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${CP} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp
endif
	@touch ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err 
	@cat ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err 
	@if [ -f ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok ] ; then rm -f ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o: camera/fast_2_timer/e_po3030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o camera/fast_2_timer/e_po3030k_registers.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o camera/fast_2_timer/e_po3030k_registers.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok; else exit 1; fi
	
${OBJECTDIR}/runfollowball.o: runfollowball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/runfollowball.o.ok ${OBJECTDIR}/runfollowball.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/runfollowball.o.d -o ${OBJECTDIR}/runfollowball.o runfollowball.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/runfollowball.o.d -o ${OBJECTDIR}/runfollowball.o runfollowball.c    2>&1  > ${OBJECTDIR}/runfollowball.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/runfollowball.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/runfollowball.o.d > ${OBJECTDIR}/runfollowball.o.tmp
	@${RM} ${OBJECTDIR}/runfollowball.o.d 
	@${CP} ${OBJECTDIR}/runfollowball.o.tmp ${OBJECTDIR}/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/runfollowball.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/runfollowball.o.d > ${OBJECTDIR}/runfollowball.o.tmp
	@${RM} ${OBJECTDIR}/runfollowball.o.d 
	@${CP} ${OBJECTDIR}/runfollowball.o.tmp ${OBJECTDIR}/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/runfollowball.o.tmp
endif
	@touch ${OBJECTDIR}/runfollowball.o.err 
	@cat ${OBJECTDIR}/runfollowball.o.err 
	@if [ -f ${OBJECTDIR}/runfollowball.o.ok ] ; then rm -f ${OBJECTDIR}/runfollowball.o.ok; else exit 1; fi
	
${OBJECTDIR}/cam_test.o: cam_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/cam_test.o.d 
	@${RM} ${OBJECTDIR}/cam_test.o.ok ${OBJECTDIR}/cam_test.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/cam_test.o.d -o ${OBJECTDIR}/cam_test.o cam_test.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/cam_test.o.d -o ${OBJECTDIR}/cam_test.o cam_test.c    2>&1  > ${OBJECTDIR}/cam_test.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/cam_test.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/cam_test.o.d > ${OBJECTDIR}/cam_test.o.tmp
	@${RM} ${OBJECTDIR}/cam_test.o.d 
	@${CP} ${OBJECTDIR}/cam_test.o.tmp ${OBJECTDIR}/cam_test.o.d 
	@${RM} ${OBJECTDIR}/cam_test.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/cam_test.o.d > ${OBJECTDIR}/cam_test.o.tmp
	@${RM} ${OBJECTDIR}/cam_test.o.d 
	@${CP} ${OBJECTDIR}/cam_test.o.tmp ${OBJECTDIR}/cam_test.o.d 
	@${RM} ${OBJECTDIR}/cam_test.o.tmp
endif
	@touch ${OBJECTDIR}/cam_test.o.err 
	@cat ${OBJECTDIR}/cam_test.o.err 
	@if [ -f ${OBJECTDIR}/cam_test.o.ok ] ; then rm -f ${OBJECTDIR}/cam_test.o.ok; else exit 1; fi
	
${OBJECTDIR}/utilities.o: utilities.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/utilities.o.d 
	@${RM} ${OBJECTDIR}/utilities.o.ok ${OBJECTDIR}/utilities.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/utilities.o.d -o ${OBJECTDIR}/utilities.o utilities.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/utilities.o.d -o ${OBJECTDIR}/utilities.o utilities.c    2>&1  > ${OBJECTDIR}/utilities.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/utilities.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/utilities.o.d > ${OBJECTDIR}/utilities.o.tmp
	@${RM} ${OBJECTDIR}/utilities.o.d 
	@${CP} ${OBJECTDIR}/utilities.o.tmp ${OBJECTDIR}/utilities.o.d 
	@${RM} ${OBJECTDIR}/utilities.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/utilities.o.d > ${OBJECTDIR}/utilities.o.tmp
	@${RM} ${OBJECTDIR}/utilities.o.d 
	@${CP} ${OBJECTDIR}/utilities.o.tmp ${OBJECTDIR}/utilities.o.d 
	@${RM} ${OBJECTDIR}/utilities.o.tmp
endif
	@touch ${OBJECTDIR}/utilities.o.err 
	@cat ${OBJECTDIR}/utilities.o.err 
	@if [ -f ${OBJECTDIR}/utilities.o.ok ] ; then rm -f ${OBJECTDIR}/utilities.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/advance_one_timer/e_led.o: motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led/advance_one_timer 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o motor_led/advance_one_timer/e_led.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o motor_led/advance_one_timer/e_led.c    2>&1  > ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err 
	@cat ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok; else exit 1; fi
	
${OBJECTDIR}/I2C/e_I2C_protocol.o: I2C/e_I2C_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/I2C 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok ${OBJECTDIR}/I2C/e_I2C_protocol.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_protocol.o.d -o ${OBJECTDIR}/I2C/e_I2C_protocol.o I2C/e_I2C_protocol.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_protocol.o.d -o ${OBJECTDIR}/I2C/e_I2C_protocol.o I2C/e_I2C_protocol.c    2>&1  > ${OBJECTDIR}/I2C/e_I2C_protocol.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/I2C/e_I2C_protocol.o.d > ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/I2C/e_I2C_protocol.o.d > ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp
endif
	@touch ${OBJECTDIR}/I2C/e_I2C_protocol.o.err 
	@cat ${OBJECTDIR}/I2C/e_I2C_protocol.o.err 
	@if [ -f ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok ] ; then rm -f ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok; else exit 1; fi
	
${OBJECTDIR}/search_ball.o: search_ball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/search_ball.o.d 
	@${RM} ${OBJECTDIR}/search_ball.o.ok ${OBJECTDIR}/search_ball.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/search_ball.o.d -o ${OBJECTDIR}/search_ball.o search_ball.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/search_ball.o.d -o ${OBJECTDIR}/search_ball.o search_ball.c    2>&1  > ${OBJECTDIR}/search_ball.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/search_ball.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/search_ball.o.d > ${OBJECTDIR}/search_ball.o.tmp
	@${RM} ${OBJECTDIR}/search_ball.o.d 
	@${CP} ${OBJECTDIR}/search_ball.o.tmp ${OBJECTDIR}/search_ball.o.d 
	@${RM} ${OBJECTDIR}/search_ball.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/search_ball.o.d > ${OBJECTDIR}/search_ball.o.tmp
	@${RM} ${OBJECTDIR}/search_ball.o.d 
	@${CP} ${OBJECTDIR}/search_ball.o.tmp ${OBJECTDIR}/search_ball.o.d 
	@${RM} ${OBJECTDIR}/search_ball.o.tmp
endif
	@touch ${OBJECTDIR}/search_ball.o.err 
	@cat ${OBJECTDIR}/search_ball.o.err 
	@if [ -f ${OBJECTDIR}/search_ball.o.ok ] ; then rm -f ${OBJECTDIR}/search_ball.o.ok; else exit 1; fi
	
${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o: a_d/advance_ad_scan/e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/a_d/advance_ad_scan 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o a_d/advance_ad_scan/e_prox.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o a_d/advance_ad_scan/e_prox.c    2>&1  > ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp
endif
	@touch ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err 
	@cat ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err 
	@if [ -f ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok ] ; then rm -f ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok; else exit 1; fi
	
${OBJECTDIR}/I2C/e_I2C_master_module.o: I2C/e_I2C_master_module.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/I2C 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok ${OBJECTDIR}/I2C/e_I2C_master_module.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_master_module.o.d -o ${OBJECTDIR}/I2C/e_I2C_master_module.o I2C/e_I2C_master_module.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_master_module.o.d -o ${OBJECTDIR}/I2C/e_I2C_master_module.o I2C/e_I2C_master_module.c    2>&1  > ${OBJECTDIR}/I2C/e_I2C_master_module.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/I2C/e_I2C_master_module.o.d > ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/I2C/e_I2C_master_module.o.d > ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp
endif
	@touch ${OBJECTDIR}/I2C/e_I2C_master_module.o.err 
	@cat ${OBJECTDIR}/I2C/e_I2C_master_module.o.err 
	@if [ -f ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok ] ; then rm -f ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o: camera/fast_2_timer/e_calc_po3030.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o camera/fast_2_timer/e_calc_po3030.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o camera/fast_2_timer/e_calc_po3030.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok; else exit 1; fi
	
${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o: a_d/advance_ad_scan/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/a_d/advance_ad_scan 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o a_d/advance_ad_scan/e_ad_conv.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o a_d/advance_ad_scan/e_ad_conv.c    2>&1  > ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp
endif
	@touch ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err 
	@cat ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err 
	@if [ -f ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok ] ; then rm -f ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok; else exit 1; fi
	
${OBJECTDIR}/camtest2.o: camtest2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/camtest2.o.d 
	@${RM} ${OBJECTDIR}/camtest2.o.ok ${OBJECTDIR}/camtest2.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camtest2.o.d -o ${OBJECTDIR}/camtest2.o camtest2.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camtest2.o.d -o ${OBJECTDIR}/camtest2.o camtest2.c    2>&1  > ${OBJECTDIR}/camtest2.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camtest2.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camtest2.o.d > ${OBJECTDIR}/camtest2.o.tmp
	@${RM} ${OBJECTDIR}/camtest2.o.d 
	@${CP} ${OBJECTDIR}/camtest2.o.tmp ${OBJECTDIR}/camtest2.o.d 
	@${RM} ${OBJECTDIR}/camtest2.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camtest2.o.d > ${OBJECTDIR}/camtest2.o.tmp
	@${RM} ${OBJECTDIR}/camtest2.o.d 
	@${CP} ${OBJECTDIR}/camtest2.o.tmp ${OBJECTDIR}/camtest2.o.d 
	@${RM} ${OBJECTDIR}/camtest2.o.tmp
endif
	@touch ${OBJECTDIR}/camtest2.o.err 
	@cat ${OBJECTDIR}/camtest2.o.err 
	@if [ -f ${OBJECTDIR}/camtest2.o.ok ] ; then rm -f ${OBJECTDIR}/camtest2.o.ok; else exit 1; fi
	
${OBJECTDIR}/btcom.o: btcom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/btcom.o.d 
	@${RM} ${OBJECTDIR}/btcom.o.ok ${OBJECTDIR}/btcom.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/btcom.o.d -o ${OBJECTDIR}/btcom.o btcom.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/btcom.o.d -o ${OBJECTDIR}/btcom.o btcom.c    2>&1  > ${OBJECTDIR}/btcom.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/btcom.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/btcom.o.d > ${OBJECTDIR}/btcom.o.tmp
	@${RM} ${OBJECTDIR}/btcom.o.d 
	@${CP} ${OBJECTDIR}/btcom.o.tmp ${OBJECTDIR}/btcom.o.d 
	@${RM} ${OBJECTDIR}/btcom.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/btcom.o.d > ${OBJECTDIR}/btcom.o.tmp
	@${RM} ${OBJECTDIR}/btcom.o.d 
	@${CP} ${OBJECTDIR}/btcom.o.tmp ${OBJECTDIR}/btcom.o.d 
	@${RM} ${OBJECTDIR}/btcom.o.tmp
endif
	@touch ${OBJECTDIR}/btcom.o.err 
	@cat ${OBJECTDIR}/btcom.o.err 
	@if [ -f ${OBJECTDIR}/btcom.o.ok ] ; then rm -f ${OBJECTDIR}/btcom.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o: motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led/advance_one_timer 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o motor_led/advance_one_timer/e_agenda.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o motor_led/advance_one_timer/e_agenda.c    2>&1  > ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err 
	@cat ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_timers.o: camera/fast_2_timer/e_timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_timers.o camera/fast_2_timer/e_timers.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_timers.o camera/fast_2_timer/e_timers.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/e_init_port.o: motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.ok ${OBJECTDIR}/motor_led/e_init_port.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/e_init_port.o.d -o ${OBJECTDIR}/motor_led/e_init_port.o motor_led/e_init_port.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/e_init_port.o.d -o ${OBJECTDIR}/motor_led/e_init_port.o motor_led/e_init_port.c    2>&1  > ${OBJECTDIR}/motor_led/e_init_port.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/e_init_port.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/e_init_port.o.d > ${OBJECTDIR}/motor_led/e_init_port.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${CP} ${OBJECTDIR}/motor_led/e_init_port.o.tmp ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/e_init_port.o.d > ${OBJECTDIR}/motor_led/e_init_port.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${CP} ${OBJECTDIR}/motor_led/e_init_port.o.tmp ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/e_init_port.o.err 
	@cat ${OBJECTDIR}/motor_led/e_init_port.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/e_init_port.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/e_init_port.o.ok; else exit 1; fi
	
else
${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o: camera/fast_2_timer/e_po6030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o camera/fast_2_timer/e_po6030k_registers.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o camera/fast_2_timer/e_po6030k_registers.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_po6030k_registers.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o: camera/fast_2_timer/e_calc_po6030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o camera/fast_2_timer/e_calc_po6030k.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o camera/fast_2_timer/e_calc_po6030k.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po6030k.o.ok; else exit 1; fi
	
${OBJECTDIR}/e_randb.o: e_randb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/e_randb.o.d 
	@${RM} ${OBJECTDIR}/e_randb.o.ok ${OBJECTDIR}/e_randb.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/e_randb.o.d -o ${OBJECTDIR}/e_randb.o e_randb.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/e_randb.o.d -o ${OBJECTDIR}/e_randb.o e_randb.c    2>&1  > ${OBJECTDIR}/e_randb.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/e_randb.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/e_randb.o.d > ${OBJECTDIR}/e_randb.o.tmp
	@${RM} ${OBJECTDIR}/e_randb.o.d 
	@${CP} ${OBJECTDIR}/e_randb.o.tmp ${OBJECTDIR}/e_randb.o.d 
	@${RM} ${OBJECTDIR}/e_randb.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/e_randb.o.d > ${OBJECTDIR}/e_randb.o.tmp
	@${RM} ${OBJECTDIR}/e_randb.o.d 
	@${CP} ${OBJECTDIR}/e_randb.o.tmp ${OBJECTDIR}/e_randb.o.d 
	@${RM} ${OBJECTDIR}/e_randb.o.tmp
endif
	@touch ${OBJECTDIR}/e_randb.o.err 
	@cat ${OBJECTDIR}/e_randb.o.err 
	@if [ -f ${OBJECTDIR}/e_randb.o.ok ] ; then rm -f ${OBJECTDIR}/e_randb.o.ok; else exit 1; fi
	
${OBJECTDIR}/main_c.o: main_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main_c.o.d 
	@${RM} ${OBJECTDIR}/main_c.o.ok ${OBJECTDIR}/main_c.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/main_c.o.d -o ${OBJECTDIR}/main_c.o main_c.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/main_c.o.d -o ${OBJECTDIR}/main_c.o main_c.c    2>&1  > ${OBJECTDIR}/main_c.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/main_c.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/main_c.o.d > ${OBJECTDIR}/main_c.o.tmp
	@${RM} ${OBJECTDIR}/main_c.o.d 
	@${CP} ${OBJECTDIR}/main_c.o.tmp ${OBJECTDIR}/main_c.o.d 
	@${RM} ${OBJECTDIR}/main_c.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/main_c.o.d > ${OBJECTDIR}/main_c.o.tmp
	@${RM} ${OBJECTDIR}/main_c.o.d 
	@${CP} ${OBJECTDIR}/main_c.o.tmp ${OBJECTDIR}/main_c.o.d 
	@${RM} ${OBJECTDIR}/main_c.o.tmp
endif
	@touch ${OBJECTDIR}/main_c.o.err 
	@cat ${OBJECTDIR}/main_c.o.err 
	@if [ -f ${OBJECTDIR}/main_c.o.ok ] ; then rm -f ${OBJECTDIR}/main_c.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_common.o: camera/fast_2_timer/e_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_common.o camera/fast_2_timer/e_common.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_common.o camera/fast_2_timer/e_common.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_common.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_common.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_common.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_common.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o: motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led/advance_one_timer 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o motor_led/advance_one_timer/e_motors.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o motor_led/advance_one_timer/e_motors.c    2>&1  > ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err 
	@cat ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/advance_one_timer/e_motors.o.ok; else exit 1; fi
	
${OBJECTDIR}/ctrhnnmultilayercontroller.o: ctrhnnmultilayercontroller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d -o ${OBJECTDIR}/ctrhnnmultilayercontroller.o ctrhnnmultilayercontroller.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d -o ${OBJECTDIR}/ctrhnnmultilayercontroller.o ctrhnnmultilayercontroller.c    2>&1  > ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d > ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${CP} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d > ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${CP} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp ${OBJECTDIR}/ctrhnnmultilayercontroller.o.d 
	@${RM} ${OBJECTDIR}/ctrhnnmultilayercontroller.o.tmp
endif
	@touch ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err 
	@cat ${OBJECTDIR}/ctrhnnmultilayercontroller.o.err 
	@if [ -f ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok ] ; then rm -f ${OBJECTDIR}/ctrhnnmultilayercontroller.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o: camera/fast_2_timer/e_po3030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o camera/fast_2_timer/e_po3030k_registers.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o camera/fast_2_timer/e_po3030k_registers.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_po3030k_registers.o.ok; else exit 1; fi
	
${OBJECTDIR}/runfollowball.o: runfollowball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/runfollowball.o.ok ${OBJECTDIR}/runfollowball.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/runfollowball.o.d -o ${OBJECTDIR}/runfollowball.o runfollowball.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/runfollowball.o.d -o ${OBJECTDIR}/runfollowball.o runfollowball.c    2>&1  > ${OBJECTDIR}/runfollowball.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/runfollowball.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/runfollowball.o.d > ${OBJECTDIR}/runfollowball.o.tmp
	@${RM} ${OBJECTDIR}/runfollowball.o.d 
	@${CP} ${OBJECTDIR}/runfollowball.o.tmp ${OBJECTDIR}/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/runfollowball.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/runfollowball.o.d > ${OBJECTDIR}/runfollowball.o.tmp
	@${RM} ${OBJECTDIR}/runfollowball.o.d 
	@${CP} ${OBJECTDIR}/runfollowball.o.tmp ${OBJECTDIR}/runfollowball.o.d 
	@${RM} ${OBJECTDIR}/runfollowball.o.tmp
endif
	@touch ${OBJECTDIR}/runfollowball.o.err 
	@cat ${OBJECTDIR}/runfollowball.o.err 
	@if [ -f ${OBJECTDIR}/runfollowball.o.ok ] ; then rm -f ${OBJECTDIR}/runfollowball.o.ok; else exit 1; fi
	
${OBJECTDIR}/cam_test.o: cam_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/cam_test.o.d 
	@${RM} ${OBJECTDIR}/cam_test.o.ok ${OBJECTDIR}/cam_test.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/cam_test.o.d -o ${OBJECTDIR}/cam_test.o cam_test.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/cam_test.o.d -o ${OBJECTDIR}/cam_test.o cam_test.c    2>&1  > ${OBJECTDIR}/cam_test.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/cam_test.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/cam_test.o.d > ${OBJECTDIR}/cam_test.o.tmp
	@${RM} ${OBJECTDIR}/cam_test.o.d 
	@${CP} ${OBJECTDIR}/cam_test.o.tmp ${OBJECTDIR}/cam_test.o.d 
	@${RM} ${OBJECTDIR}/cam_test.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/cam_test.o.d > ${OBJECTDIR}/cam_test.o.tmp
	@${RM} ${OBJECTDIR}/cam_test.o.d 
	@${CP} ${OBJECTDIR}/cam_test.o.tmp ${OBJECTDIR}/cam_test.o.d 
	@${RM} ${OBJECTDIR}/cam_test.o.tmp
endif
	@touch ${OBJECTDIR}/cam_test.o.err 
	@cat ${OBJECTDIR}/cam_test.o.err 
	@if [ -f ${OBJECTDIR}/cam_test.o.ok ] ; then rm -f ${OBJECTDIR}/cam_test.o.ok; else exit 1; fi
	
${OBJECTDIR}/utilities.o: utilities.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/utilities.o.d 
	@${RM} ${OBJECTDIR}/utilities.o.ok ${OBJECTDIR}/utilities.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/utilities.o.d -o ${OBJECTDIR}/utilities.o utilities.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/utilities.o.d -o ${OBJECTDIR}/utilities.o utilities.c    2>&1  > ${OBJECTDIR}/utilities.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/utilities.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/utilities.o.d > ${OBJECTDIR}/utilities.o.tmp
	@${RM} ${OBJECTDIR}/utilities.o.d 
	@${CP} ${OBJECTDIR}/utilities.o.tmp ${OBJECTDIR}/utilities.o.d 
	@${RM} ${OBJECTDIR}/utilities.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/utilities.o.d > ${OBJECTDIR}/utilities.o.tmp
	@${RM} ${OBJECTDIR}/utilities.o.d 
	@${CP} ${OBJECTDIR}/utilities.o.tmp ${OBJECTDIR}/utilities.o.d 
	@${RM} ${OBJECTDIR}/utilities.o.tmp
endif
	@touch ${OBJECTDIR}/utilities.o.err 
	@cat ${OBJECTDIR}/utilities.o.err 
	@if [ -f ${OBJECTDIR}/utilities.o.ok ] ; then rm -f ${OBJECTDIR}/utilities.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/advance_one_timer/e_led.o: motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led/advance_one_timer 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o motor_led/advance_one_timer/e_led.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o motor_led/advance_one_timer/e_led.c    2>&1  > ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err 
	@cat ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/advance_one_timer/e_led.o.ok; else exit 1; fi
	
${OBJECTDIR}/I2C/e_I2C_protocol.o: I2C/e_I2C_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/I2C 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok ${OBJECTDIR}/I2C/e_I2C_protocol.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_protocol.o.d -o ${OBJECTDIR}/I2C/e_I2C_protocol.o I2C/e_I2C_protocol.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_protocol.o.d -o ${OBJECTDIR}/I2C/e_I2C_protocol.o I2C/e_I2C_protocol.c    2>&1  > ${OBJECTDIR}/I2C/e_I2C_protocol.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/I2C/e_I2C_protocol.o.d > ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/I2C/e_I2C_protocol.o.d > ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp ${OBJECTDIR}/I2C/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_protocol.o.tmp
endif
	@touch ${OBJECTDIR}/I2C/e_I2C_protocol.o.err 
	@cat ${OBJECTDIR}/I2C/e_I2C_protocol.o.err 
	@if [ -f ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok ] ; then rm -f ${OBJECTDIR}/I2C/e_I2C_protocol.o.ok; else exit 1; fi
	
${OBJECTDIR}/search_ball.o: search_ball.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/search_ball.o.d 
	@${RM} ${OBJECTDIR}/search_ball.o.ok ${OBJECTDIR}/search_ball.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/search_ball.o.d -o ${OBJECTDIR}/search_ball.o search_ball.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/search_ball.o.d -o ${OBJECTDIR}/search_ball.o search_ball.c    2>&1  > ${OBJECTDIR}/search_ball.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/search_ball.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/search_ball.o.d > ${OBJECTDIR}/search_ball.o.tmp
	@${RM} ${OBJECTDIR}/search_ball.o.d 
	@${CP} ${OBJECTDIR}/search_ball.o.tmp ${OBJECTDIR}/search_ball.o.d 
	@${RM} ${OBJECTDIR}/search_ball.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/search_ball.o.d > ${OBJECTDIR}/search_ball.o.tmp
	@${RM} ${OBJECTDIR}/search_ball.o.d 
	@${CP} ${OBJECTDIR}/search_ball.o.tmp ${OBJECTDIR}/search_ball.o.d 
	@${RM} ${OBJECTDIR}/search_ball.o.tmp
endif
	@touch ${OBJECTDIR}/search_ball.o.err 
	@cat ${OBJECTDIR}/search_ball.o.err 
	@if [ -f ${OBJECTDIR}/search_ball.o.ok ] ; then rm -f ${OBJECTDIR}/search_ball.o.ok; else exit 1; fi
	
${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o: a_d/advance_ad_scan/e_prox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/a_d/advance_ad_scan 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o a_d/advance_ad_scan/e_prox.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o a_d/advance_ad_scan/e_prox.c    2>&1  > ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.tmp
endif
	@touch ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err 
	@cat ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.err 
	@if [ -f ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok ] ; then rm -f ${OBJECTDIR}/a_d/advance_ad_scan/e_prox.o.ok; else exit 1; fi
	
${OBJECTDIR}/I2C/e_I2C_master_module.o: I2C/e_I2C_master_module.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/I2C 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok ${OBJECTDIR}/I2C/e_I2C_master_module.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_master_module.o.d -o ${OBJECTDIR}/I2C/e_I2C_master_module.o I2C/e_I2C_master_module.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/I2C/e_I2C_master_module.o.d -o ${OBJECTDIR}/I2C/e_I2C_master_module.o I2C/e_I2C_master_module.c    2>&1  > ${OBJECTDIR}/I2C/e_I2C_master_module.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/I2C/e_I2C_master_module.o.d > ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/I2C/e_I2C_master_module.o.d > ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${CP} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp ${OBJECTDIR}/I2C/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/I2C/e_I2C_master_module.o.tmp
endif
	@touch ${OBJECTDIR}/I2C/e_I2C_master_module.o.err 
	@cat ${OBJECTDIR}/I2C/e_I2C_master_module.o.err 
	@if [ -f ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok ] ; then rm -f ${OBJECTDIR}/I2C/e_I2C_master_module.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o: camera/fast_2_timer/e_calc_po3030.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o camera/fast_2_timer/e_calc_po3030.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o camera/fast_2_timer/e_calc_po3030.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_calc_po3030.o.ok; else exit 1; fi
	
${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o: a_d/advance_ad_scan/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/a_d/advance_ad_scan 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o a_d/advance_ad_scan/e_ad_conv.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d -o ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o a_d/advance_ad_scan/e_ad_conv.c    2>&1  > ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d > ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${CP} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.tmp
endif
	@touch ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err 
	@cat ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.err 
	@if [ -f ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok ] ; then rm -f ${OBJECTDIR}/a_d/advance_ad_scan/e_ad_conv.o.ok; else exit 1; fi
	
${OBJECTDIR}/camtest2.o: camtest2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/camtest2.o.d 
	@${RM} ${OBJECTDIR}/camtest2.o.ok ${OBJECTDIR}/camtest2.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camtest2.o.d -o ${OBJECTDIR}/camtest2.o camtest2.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camtest2.o.d -o ${OBJECTDIR}/camtest2.o camtest2.c    2>&1  > ${OBJECTDIR}/camtest2.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camtest2.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camtest2.o.d > ${OBJECTDIR}/camtest2.o.tmp
	@${RM} ${OBJECTDIR}/camtest2.o.d 
	@${CP} ${OBJECTDIR}/camtest2.o.tmp ${OBJECTDIR}/camtest2.o.d 
	@${RM} ${OBJECTDIR}/camtest2.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camtest2.o.d > ${OBJECTDIR}/camtest2.o.tmp
	@${RM} ${OBJECTDIR}/camtest2.o.d 
	@${CP} ${OBJECTDIR}/camtest2.o.tmp ${OBJECTDIR}/camtest2.o.d 
	@${RM} ${OBJECTDIR}/camtest2.o.tmp
endif
	@touch ${OBJECTDIR}/camtest2.o.err 
	@cat ${OBJECTDIR}/camtest2.o.err 
	@if [ -f ${OBJECTDIR}/camtest2.o.ok ] ; then rm -f ${OBJECTDIR}/camtest2.o.ok; else exit 1; fi
	
${OBJECTDIR}/btcom.o: btcom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/btcom.o.d 
	@${RM} ${OBJECTDIR}/btcom.o.ok ${OBJECTDIR}/btcom.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/btcom.o.d -o ${OBJECTDIR}/btcom.o btcom.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/btcom.o.d -o ${OBJECTDIR}/btcom.o btcom.c    2>&1  > ${OBJECTDIR}/btcom.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/btcom.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/btcom.o.d > ${OBJECTDIR}/btcom.o.tmp
	@${RM} ${OBJECTDIR}/btcom.o.d 
	@${CP} ${OBJECTDIR}/btcom.o.tmp ${OBJECTDIR}/btcom.o.d 
	@${RM} ${OBJECTDIR}/btcom.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/btcom.o.d > ${OBJECTDIR}/btcom.o.tmp
	@${RM} ${OBJECTDIR}/btcom.o.d 
	@${CP} ${OBJECTDIR}/btcom.o.tmp ${OBJECTDIR}/btcom.o.d 
	@${RM} ${OBJECTDIR}/btcom.o.tmp
endif
	@touch ${OBJECTDIR}/btcom.o.err 
	@cat ${OBJECTDIR}/btcom.o.err 
	@if [ -f ${OBJECTDIR}/btcom.o.ok ] ; then rm -f ${OBJECTDIR}/btcom.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o: motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led/advance_one_timer 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o motor_led/advance_one_timer/e_agenda.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d -o ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o motor_led/advance_one_timer/e_agenda.c    2>&1  > ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d > ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${CP} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err 
	@cat ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/advance_one_timer/e_agenda.o.ok; else exit 1; fi
	
${OBJECTDIR}/camera/fast_2_timer/e_timers.o: camera/fast_2_timer/e_timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/camera/fast_2_timer 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_timers.o camera/fast_2_timer/e_timers.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d -o ${OBJECTDIR}/camera/fast_2_timer/e_timers.o camera/fast_2_timer/e_timers.c    2>&1  > ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d > ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${CP} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.d 
	@${RM} ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.tmp
endif
	@touch ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err 
	@cat ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.err 
	@if [ -f ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok ] ; then rm -f ${OBJECTDIR}/camera/fast_2_timer/e_timers.o.ok; else exit 1; fi
	
${OBJECTDIR}/motor_led/e_init_port.o: motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/motor_led 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.ok ${OBJECTDIR}/motor_led/e_init_port.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/e_init_port.o.d -o ${OBJECTDIR}/motor_led/e_init_port.o motor_led/e_init_port.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -mlarge-code -MMD -MF ${OBJECTDIR}/motor_led/e_init_port.o.d -o ${OBJECTDIR}/motor_led/e_init_port.o motor_led/e_init_port.c    2>&1  > ${OBJECTDIR}/motor_led/e_init_port.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/motor_led/e_init_port.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/motor_led/e_init_port.o.d > ${OBJECTDIR}/motor_led/e_init_port.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${CP} ${OBJECTDIR}/motor_led/e_init_port.o.tmp ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.tmp 
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/motor_led/e_init_port.o.d > ${OBJECTDIR}/motor_led/e_init_port.o.tmp
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${CP} ${OBJECTDIR}/motor_led/e_init_port.o.tmp ${OBJECTDIR}/motor_led/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/motor_led/e_init_port.o.tmp
endif
	@touch ${OBJECTDIR}/motor_led/e_init_port.o.err 
	@cat ${OBJECTDIR}/motor_led/e_init_port.o.err 
	@if [ -f ${OBJECTDIR}/motor_led/e_init_port.o.ok ] ; then rm -f ${OBJECTDIR}/motor_led/e_init_port.o.ok; else exit 1; fi
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf  -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=1300,--stack=1900,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf  -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=1300,--stack=1900,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}/pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/ER_e-puck.X.${IMAGE_TYPE}.elf -omf=elf
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
