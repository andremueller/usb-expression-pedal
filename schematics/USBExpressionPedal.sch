EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Switch
LIBS:USBExpressionPedal-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ARDUINO_MICRO_SHIELD U1
U 1 1 5A679B26
P 4600 5200
F 0 "U1" H 6350 5600 60  0000 C CNN
F 1 "ARDUINO_MICRO_SHIELD" H 5450 5800 60  0000 C CNN
F 2 "" H 5000 5150 60  0000 C CNN
F 3 "" H 5000 5150 60  0000 C CNN
	1    4600 5200
	1    0    0    -1  
$EndComp
$Comp
L Audio-Jack-3 J1-ExpressionPedalInput
U 1 1 5A679C31
P 3450 3750
F 0 "J1-ExpressionPedalInput" H 3400 3925 50  0000 C CNN
F 1 "Audio-Jack-3" H 3550 3680 50  0000 C CNN
F 2 "" H 3700 3850 50  0001 C CNN
F 3 "" H 3700 3850 50  0001 C CNN
	1    3450 3750
	1    0    0    -1  
$EndComp
$Comp
L DB15_Female J2-JoystickPort
U 1 1 5A679DF8
P 5450 2100
F 0 "J2-JoystickPort" H 5470 2950 50  0000 C CNN
F 1 "DB15_Female" H 5450 1225 50  0000 C CNN
F 2 "" H 5450 2100 50  0001 C CNN
F 3 "" H 5450 2100 50  0001 C CNN
	1    5450 2100
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR?
U 1 1 5A67A059
P 4350 2950
F 0 "#PWR?" H 4350 2700 50  0001 C CNN
F 1 "GNDD" H 4350 2825 50  0000 C CNN
F 2 "" H 4350 2950 50  0001 C CNN
F 3 "" H 4350 2950 50  0001 C CNN
	1    4350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1800 4350 2950
Wire Wire Line
	4350 2000 5150 2000
Wire Wire Line
	5150 2200 4350 2200
Connection ~ 4350 2200
Wire Wire Line
	4150 2800 5150 2800
Wire Wire Line
	4150 900  4150 2800
Wire Wire Line
	4150 1400 5150 1400
$Comp
L +5V #PWR?
U 1 1 5A67A16F
P 3850 2950
F 0 "#PWR?" H 3850 2800 50  0001 C CNN
F 1 "+5V" H 3850 3090 50  0000 C CNN
F 2 "" H 3850 2950 50  0001 C CNN
F 3 "" H 3850 2950 50  0001 C CNN
	1    3850 2950
	1    0    0    -1  
$EndComp
Connection ~ 4150 1400
$Comp
L R R1
U 1 1 5A67A3DD
P 4600 1800
F 0 "R1" V 4680 1800 50  0000 C CNN
F 1 "100k" V 4600 1800 50  0000 C CNN
F 2 "" V 4530 1800 50  0001 C CNN
F 3 "" H 4600 1800 50  0001 C CNN
	1    4600 1800
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5A67A42F
P 4600 2400
F 0 "R2" V 4680 2400 50  0000 C CNN
F 1 "100k" V 4600 2400 50  0000 C CNN
F 2 "" V 4530 2400 50  0001 C CNN
F 3 "" H 4600 2400 50  0001 C CNN
	1    4600 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 2400 5150 2400
Wire Wire Line
	4750 1800 5150 1800
Wire Wire Line
	4450 1800 4350 1800
Connection ~ 4350 2000
Wire Wire Line
	4450 2400 4350 2400
Connection ~ 4350 2400
Wire Wire Line
	5000 3400 5000 1800
Connection ~ 5000 1800
Wire Wire Line
	4900 2400 4900 3500
Connection ~ 4900 2400
$Comp
L GNDD #PWR?
U 1 1 5A67ADE6
P 3250 4150
F 0 "#PWR?" H 3250 3900 50  0001 C CNN
F 1 "GNDD" H 3250 4025 50  0000 C CNN
F 2 "" H 3250 4150 50  0001 C CNN
F 3 "" H 3250 4150 50  0001 C CNN
	1    3250 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4150 3250 3850
$Comp
L GNDD #PWR?
U 1 1 5A67AE43
P 5150 6350
F 0 "#PWR?" H 5150 6100 50  0001 C CNN
F 1 "GNDD" H 5150 6225 50  0000 C CNN
F 2 "" H 5150 6350 50  0001 C CNN
F 3 "" H 5150 6350 50  0001 C CNN
	1    5150 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5400 5150 6350
$Comp
L POT RV?
U 1 1 5A67AF84
P 2750 3750
F 0 "RV?" V 2575 3750 50  0000 C CNN
F 1 "48k" V 2650 3750 50  0000 C CNN
F 2 "" H 2750 3750 50  0001 C CNN
F 3 "" H 2750 3750 50  0001 C CNN
	1    2750 3750
	-1   0    0    -1  
$EndComp
$Comp
L Audio-Jack-3 J2-ExpressionPedal
U 1 1 5A67AFE6
P 2000 3750
F 0 "J2-ExpressionPedal" H 1950 3925 50  0000 C CNN
F 1 "Audio-Jack-3" H 2100 3680 50  0000 C CNN
F 2 "" H 2250 3850 50  0001 C CNN
F 3 "" H 2250 3850 50  0001 C CNN
	1    2000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3900 2750 4200
Wire Wire Line
	2750 4200 1800 4200
Wire Wire Line
	1800 4200 1800 3850
Wire Wire Line
	2200 3650 2600 3650
Wire Wire Line
	2600 3650 2600 3750
Wire Wire Line
	2200 3750 2450 3750
Wire Wire Line
	2450 3750 2450 3500
Wire Wire Line
	2450 3500 2750 3500
Wire Wire Line
	2750 3500 2750 3600
$Comp
L R R3
U 1 1 5A67B3A9
P 3850 3300
F 0 "R3" V 3930 3300 50  0000 C CNN
F 1 "330" V 3850 3300 50  0000 C CNN
F 2 "" V 3780 3300 50  0001 C CNN
F 3 "" H 3850 3300 50  0001 C CNN
	1    3850 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3450 3850 3750
Wire Wire Line
	3850 3750 3650 3750
Wire Wire Line
	3850 2950 3850 3150
Wire Wire Line
	3650 3650 5950 3650
$Comp
L +5V #PWR?
U 1 1 5A67B5E1
P 4150 900
F 0 "#PWR?" H 4150 750 50  0001 C CNN
F 1 "+5V" H 4150 1040 50  0000 C CNN
F 2 "" H 4150 900 50  0001 C CNN
F 3 "" H 4150 900 50  0001 C CNN
	1    4150 900 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5A67B6C4
P 5150 4050
F 0 "#PWR?" H 5150 3900 50  0001 C CNN
F 1 "+5V" H 5150 4190 50  0000 C CNN
F 2 "" H 5150 4050 50  0001 C CNN
F 3 "" H 5150 4050 50  0001 C CNN
	1    5150 4050
	1    0    0    -1  
$EndComp
Text Notes 8150 7650 0    60   ~ 0
23.01.2018
Text Notes 10600 7650 0    60   ~ 0
0.1
Text Notes 7300 7250 0    60   ~ 0
1
Text Notes 7400 7250 0    60   ~ 0
1
Text Notes 7350 7500 0    60   ~ 0
USB Expression Pedal
$Comp
L LED D1
U 1 1 5A67BBF6
P 5550 5950
F 0 "D1" H 5550 6050 50  0000 C CNN
F 1 "LED" H 5550 5850 50  0000 C CNN
F 2 "" H 5550 5950 50  0001 C CNN
F 3 "" H 5550 5950 50  0001 C CNN
	1    5550 5950
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 5A67BDC5
P 5550 5600
F 0 "R4" V 5630 5600 50  0000 C CNN
F 1 "120" V 5550 5600 50  0000 C CNN
F 2 "" V 5480 5600 50  0001 C CNN
F 3 "" H 5550 5600 50  0001 C CNN
	1    5550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5400 5550 5450
Wire Wire Line
	5550 5750 5550 5800
Wire Wire Line
	5150 6250 5550 6250
Wire Wire Line
	5550 6250 5550 6100
Connection ~ 5150 6250
Wire Wire Line
	5950 3650 5950 4050
Wire Wire Line
	4900 3500 5850 3500
Wire Wire Line
	5850 3500 5850 4050
Wire Wire Line
	5750 4050 5750 3400
Wire Wire Line
	5750 3400 5000 3400
$EndSCHEMATC
