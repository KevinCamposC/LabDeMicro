;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"blink.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	__divsint
	extern	__modsint
	extern	_ANSEL
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_binario_d
	global	_binario_u
	global	_generateRandomNumber
	global	_num_decenas
	global	_num_unidades
	global	_delay
	global	_patterns
	global	_counter

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_blink_0	udata
r0x1017	res	1
r0x1016	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1028	res	1
r0x1029	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
_main_arreglo_65537_17	res	20
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_blink_0	idata
_counter
	db	0x00, 0x00	; 0


IDC_blink_1	code
_patterns
	retlw 0x00	;  0
	retlw 0x00
	retlw 0x01	;  1
	retlw 0x00
	retlw 0x02	;  2
	retlw 0x00
	retlw 0x03	;  3
	retlw 0x00
	retlw 0x04	;  4
	retlw 0x00
	retlw 0x05	;  5
	retlw 0x00
	retlw 0x06	;  6
	retlw 0x00
	retlw 0x07	;  7
	retlw 0x00
	retlw 0x08	;  8
	retlw 0x00
	retlw 0x09	;  9
	retlw 0x00
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_blink	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _generateRandomNumber
;   _num_unidades
;   _num_decenas
;   _binario_u
;   _binario_d
;   _delay
;   _delay
;   _generateRandomNumber
;   _num_unidades
;   _num_decenas
;   _binario_u
;   _binario_d
;   _delay
;   _delay
;19 compiler assigned registers:
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   STK00
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   STK02
;   STK01
;; Starting pCode block
S_blink__main	code
_main:
; 2 exit points
;	.line	86; "blink.c"	TRISIO = 0b00001000; //Poner todos los pines como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	87; "blink.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	88; "blink.c"	ANSEL = 0b00001000; // Set GP3 as digital input
	MOVLW	0x08
	BANKSEL	_ANSEL
	MOVWF	_ANSEL
;	.line	97; "blink.c"	for (int i = 0; i < 10; ++i) {
	BANKSEL	r0x101E
	CLRF	r0x101E
	CLRF	r0x101F
	CLRF	r0x1020
	CLRF	r0x1021
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
_00173_DS_:
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00219_DS_
	MOVLW	0x0a
	SUBWF	r0x101E,W
_00219_DS_:
	BTFSC	STATUS,0
	GOTO	_00157_DS_
;;genSkipc:3307: created from rifx:0x7ffe2a92e100
;	.line	98; "blink.c"	arreglo[i] = -1; // Inicializar el arreglo con -1 (porque este numero no puede salir)
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	ADDLW	(_main_arreglo_65537_17 + 0)
	MOVWF	r0x1022
	MOVLW	high (_main_arreglo_65537_17 + 0)
	MOVWF	r0x1023
	MOVF	r0x1021,W
	BTFSC	STATUS,0
	INCFSZ	r0x1021,W
	ADDWF	r0x1023,F
	MOVF	r0x1022,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1023
	BTFSC	r0x1023,0
	BSF	STATUS,7
	MOVLW	0xff
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	MOVLW	0xff
	MOVWF	INDF
;	.line	97; "blink.c"	for (int i = 0; i < 10; ++i) {
	MOVLW	0x02
	BANKSEL	r0x1020
	ADDWF	r0x1020,F
	BTFSC	STATUS,0
	INCF	r0x1021,F
	INCF	r0x101E,F
	BTFSC	STATUS,2
	INCF	r0x101F,F
	GOTO	_00173_DS_
_00157_DS_:
;	.line	102; "blink.c"	while (indice < 1) {
	BANKSEL	r0x101E
	CLRF	r0x101E
	CLRF	r0x101F
	CLRF	r0x1020
	CLRF	r0x1021
;;signed compare: left < lit(0x1=1), size=2, mask=ffff
_00163_DS_:
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00220_DS_
	MOVLW	0x01
	SUBWF	r0x101E,W
_00220_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3307: created from rifx:0x7ffe2a92e100
;	.line	103; "blink.c"	unsigned int num_generado = generateRandomNumber();
	PAGESEL	_generateRandomNumber
	CALL	_generateRandomNumber
	PAGESEL	$
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVF	STK00,W
	MOVWF	r0x1022
;	.line	104; "blink.c"	int duplicado = 0;
	CLRF	r0x1024
	CLRF	r0x1025
;	.line	107; "blink.c"	for (int i = 0; i < 10; ++i) {
	CLRF	r0x1026
	CLRF	r0x1027
	CLRF	r0x1028
	CLRF	r0x1029
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
_00176_DS_:
	BANKSEL	r0x1027
	MOVF	r0x1027,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00221_DS_
	MOVLW	0x0a
	SUBWF	r0x1026,W
_00221_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3307: created from rifx:0x7ffe2a92e100
;	.line	108; "blink.c"	if (arreglo[i] == num_generado) {
	BANKSEL	r0x1028
	MOVF	r0x1028,W
	ADDLW	(_main_arreglo_65537_17 + 0)
	MOVWF	r0x102A
	MOVLW	high (_main_arreglo_65537_17 + 0)
	MOVWF	r0x102B
	MOVF	r0x1029,W
	BTFSC	STATUS,0
	INCFSZ	r0x1029,W
	ADDWF	r0x102B,F
	MOVF	r0x102A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102B
	BTFSC	r0x102B,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x102C
	MOVWF	r0x102C
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVF	r0x1022,W
	XORWF	r0x102C,W
	BTFSS	STATUS,2
	GOTO	_00177_DS_
	MOVF	r0x1023,W
	XORWF	r0x102D,W
	BTFSS	STATUS,2
	GOTO	_00177_DS_
;	.line	109; "blink.c"	duplicado = 1;
	MOVLW	0x01
	MOVWF	r0x1024
	CLRF	r0x1025
;	.line	110; "blink.c"	break;
	GOTO	_00160_DS_
_00177_DS_:
;	.line	107; "blink.c"	for (int i = 0; i < 10; ++i) {
	MOVLW	0x02
	BANKSEL	r0x1028
	ADDWF	r0x1028,F
	BTFSC	STATUS,0
	INCF	r0x1029,F
	INCF	r0x1026,F
	BTFSC	STATUS,2
	INCF	r0x1027,F
	GOTO	_00176_DS_
_00160_DS_:
;	.line	113; "blink.c"	if (!duplicado) {
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	IORWF	r0x1024,W
	BTFSS	STATUS,2
	GOTO	_00163_DS_
;	.line	114; "blink.c"	arreglo[indice] = num_generado;
	MOVF	r0x1020,W
	ADDLW	(_main_arreglo_65537_17 + 0)
	MOVWF	r0x1024
	MOVLW	high (_main_arreglo_65537_17 + 0)
	MOVWF	r0x1025
	MOVF	r0x1021,W
	BTFSC	STATUS,0
	INCFSZ	r0x1021,W
	ADDWF	r0x1025,F
	MOVF	r0x1024,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1025
	BTFSC	r0x1025,0
	BSF	STATUS,7
	MOVF	r0x1022,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	r0x1023
	MOVF	r0x1023,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	115; "blink.c"	indice++; // En este caso el numero no es duplicado, entonces se agrega
	MOVLW	0x02
	BANKSEL	r0x1020
	ADDWF	r0x1020,F
	BTFSC	STATUS,0
	INCF	r0x1021,F
	INCF	r0x101E,F
	BTFSC	STATUS,2
	INCF	r0x101F,F
	GOTO	_00163_DS_
_00165_DS_:
;	.line	118; "blink.c"	int unidad = num_unidades(arreglo[j]);
	BANKSEL	_main_arreglo_65537_17
	MOVF	(_main_arreglo_65537_17 + 0),W
	BANKSEL	r0x101E
	MOVWF	r0x101E
	BANKSEL	_main_arreglo_65537_17
	MOVF	(_main_arreglo_65537_17 + 1),W
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	_num_unidades
	CALL	_num_unidades
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x101E
;	.line	119; "blink.c"	int decena = num_decenas(arreglo[j]);
	BANKSEL	_main_arreglo_65537_17
	MOVF	(_main_arreglo_65537_17 + 0),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_main_arreglo_65537_17
	MOVF	(_main_arreglo_65537_17 + 1),W
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVF	r0x1020,W
	MOVWF	STK00
	MOVF	r0x1021,W
	PAGESEL	_num_decenas
	CALL	_num_decenas
	PAGESEL	$
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVF	STK00,W
	MOVWF	r0x1020
;	.line	120; "blink.c"	int unidades_bin = binario_u(unidad, j);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	_binario_u
	CALL	_binario_u
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x101E
;	.line	121; "blink.c"	int decenas_bin = binario_d(decena, j);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1020,W
	MOVWF	STK00
	MOVF	r0x1021,W
	PAGESEL	_binario_d
	CALL	_binario_d
	PAGESEL	$
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVF	STK00,W
;	.line	124; "blink.c"	int b3d = (decenas_bin >> 3) & 1; // Bit 3 (MSB)
	MOVWF	r0x1020
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1022
;	.line	125; "blink.c"	int b2d = (decenas_bin >> 2) & 1; // Bit 2
	MOVF	r0x1020,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1023
;	.line	126; "blink.c"	int b1d = (decenas_bin >> 1) & 1; // Bit 1
	MOVF	r0x1020,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1024
;	.line	127; "blink.c"	int b0d = decenas_bin & 1; // Bit 0 (LSB)
	MOVF	r0x1020,W
	MOVWF	r0x1025
;	.line	130; "blink.c"	int b3u = (unidades_bin >> 3) & 1; // Bit 3 (MSB)
	MOVF	r0x101E,W
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1020
;	.line	131; "blink.c"	int b2u = (unidades_bin >> 2) & 1; // Bit 2
	MOVF	r0x101E,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1021
;	.line	132; "blink.c"	int b1u = (unidades_bin >> 1) & 1; // Bit 1
	MOVF	r0x101E,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1026
;	.line	133; "blink.c"	int b0u = unidades_bin & 1; // Bit 0 (LSB)
	MOVF	r0x101E,W
	MOVWF	r0x1027
_00167_DS_:
;	.line	140; "blink.c"	GP5 = 0x00; // Se prende en bajo
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	141; "blink.c"	GP0 = b0u;
	BANKSEL	r0x1027
	RRF	r0x1027,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00001_DS_:
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00002_DS_:
;	.line	142; "blink.c"	GP1 = b1u;
	BANKSEL	r0x1026
	RRF	r0x1026,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00003_DS_:
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00004_DS_:
;	.line	143; "blink.c"	GP2 = b2u;
	BANKSEL	r0x1021
	RRF	r0x1021,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00005_DS_:
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00006_DS_:
;	.line	144; "blink.c"	GP4 = b3u;
	BANKSEL	r0x1020
	RRF	r0x1020,W
	BTFSC	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00007_DS_:
	BTFSS	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00008_DS_:
;	.line	145; "blink.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	148; "blink.c"	GP0 = 0x00;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	149; "blink.c"	GP1 = 0x00;
	BCF	_GPIObits,1
;	.line	150; "blink.c"	GP2 = 0x00;
	BCF	_GPIObits,2
;	.line	151; "blink.c"	GP4 = 0x00;
	BCF	_GPIObits,4
;	.line	154; "blink.c"	GP5 = ~GP5; // Encender decenas
	BANKSEL	r0x101E
	CLRF	r0x101E
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00009_DS_
	BANKSEL	r0x101E
	INCF	r0x101E,F
_00009_DS_:
	BANKSEL	r0x101E
	COMF	r0x101E,W
	MOVWF	r0x101E
	RRF	r0x101E,W
	BTFSC	STATUS,0
	GOTO	_00010_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00010_DS_:
	BTFSS	STATUS,0
	GOTO	_00011_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00011_DS_:
;	.line	155; "blink.c"	GP0 = b0d;
	BANKSEL	r0x1025
	RRF	r0x1025,W
	BTFSC	STATUS,0
	GOTO	_00012_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00012_DS_:
	BTFSS	STATUS,0
	GOTO	_00013_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00013_DS_:
;	.line	156; "blink.c"	GP1 = b1d;
	BANKSEL	r0x1024
	RRF	r0x1024,W
	BTFSC	STATUS,0
	GOTO	_00014_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00014_DS_:
	BTFSS	STATUS,0
	GOTO	_00015_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00015_DS_:
;	.line	157; "blink.c"	GP2 = b2d;
	BANKSEL	r0x1023
	RRF	r0x1023,W
	BTFSC	STATUS,0
	GOTO	_00016_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00016_DS_:
	BTFSS	STATUS,0
	GOTO	_00017_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00017_DS_:
;	.line	158; "blink.c"	GP4 = b3d;
	BANKSEL	r0x1022
	RRF	r0x1022,W
	BTFSC	STATUS,0
	GOTO	_00018_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00018_DS_:
	BTFSS	STATUS,0
	GOTO	_00019_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00019_DS_:
;	.line	159; "blink.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	162; "blink.c"	GP0 = 0x00;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	163; "blink.c"	GP1 = 0x00;
	BCF	_GPIObits,1
;	.line	164; "blink.c"	GP2 = 0x00;
	BCF	_GPIObits,2
;	.line	165; "blink.c"	GP4 = 0x00;
	BCF	_GPIObits,4
	GOTO	_00167_DS_
;	.line	170; "blink.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;; Starting pCode block
S_blink__binario_d	code
_binario_d:
; 2 exit points
;	.line	78; "blink.c"	int binario_d(int decenas, int j) {
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
;;1	MOVWF	r0x1017
;	.line	79; "blink.c"	return decenas;
	MOVWF	STK00
	MOVF	r0x1016,W
;	.line	80; "blink.c"	}
	RETURN	
; exit point of _binario_d

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;; Starting pCode block
S_blink__binario_u	code
_binario_u:
; 2 exit points
;	.line	72; "blink.c"	int binario_u(int unidades, int j) {
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
;;1	MOVWF	r0x1017
;	.line	73; "blink.c"	return unidades;
	MOVWF	STK00
	MOVF	r0x1016,W
;	.line	74; "blink.c"	}
	RETURN	
; exit point of _binario_u

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1016
;   r0x1017
;; Starting pCode block
S_blink__generateRandomNumber	code
_generateRandomNumber:
; 2 exit points
;	.line	65; "blink.c"	counter += 0xDEADBEEF;
	MOVLW	0xef
	BANKSEL	_counter
	ADDWF	_counter,F
	MOVLW	0xbe
	BTFSC	STATUS,0
	MOVLW	0xbf
	ADDWF	(_counter + 1),F
;	.line	66; "blink.c"	unsigned int random = (counter % 100); // Limitacion del rango entre 0 y 99
	MOVLW	0x64
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	_counter,W
	MOVWF	STK00
	MOVF	(_counter + 1),W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
;;1	MOVWF	r0x1017
;	.line	67; "blink.c"	return random;
	MOVWF	STK00
	MOVF	r0x1016,W
;	.line	68; "blink.c"	}
	RETURN	
; exit point of _generateRandomNumber

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divsint
;   __divsint
;5 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   STK02
;   STK01
;; Starting pCode block
S_blink__num_decenas	code
_num_decenas:
; 2 exit points
;	.line	58; "blink.c"	int num_decenas(int num) {
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
	MOVWF	r0x1017
;	.line	59; "blink.c"	int decenas = num / 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1016,W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
;	.line	60; "blink.c"	return decenas;
	MOVWF	r0x1017
	MOVWF	STK00
	MOVF	r0x1016,W
;	.line	61; "blink.c"	}
	RETURN	
; exit point of _num_decenas

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modsint
;   __modsint
;5 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   STK02
;   STK01
;; Starting pCode block
S_blink__num_unidades	code
_num_unidades:
; 2 exit points
;	.line	52; "blink.c"	int num_unidades(int num) {
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
	MOVWF	r0x1017
;	.line	53; "blink.c"	int unidades = num % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1016,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
;	.line	54; "blink.c"	return unidades;
	MOVWF	r0x1017
	MOVWF	STK00
	MOVF	r0x1016,W
;	.line	55; "blink.c"	}
	RETURN	
; exit point of _num_unidades

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
S_blink__delay	code
_delay:
; 2 exit points
;	.line	24; "blink.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
	MOVWF	r0x1017
;	.line	29; "blink.c"	for(m=0;m<tiempo;m++)
	CLRF	r0x1018
	CLRF	r0x1019
_00111_DS_:
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	SUBWF	r0x1019,W
	BTFSS	STATUS,2
	GOTO	_00132_DS_
	MOVF	r0x1017,W
	SUBWF	r0x1018,W
_00132_DS_:
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3307: created from rifx:0x7ffe2a92e100
;	.line	30; "blink.c"	for(n=0;n<1275;n++);
	MOVLW	0xfb
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVLW	0x04
	MOVWF	r0x101B
_00109_DS_:
	MOVLW	0xff
	BANKSEL	r0x101A
	ADDWF	r0x101A,W
	MOVWF	r0x101C
	MOVLW	0xff
	MOVWF	r0x101D
	MOVF	r0x101B,W
	BTFSC	STATUS,0
	INCFSZ	r0x101B,W
	ADDWF	r0x101D,F
	MOVF	r0x101C,W
	MOVWF	r0x101A
	MOVF	r0x101D,W
	MOVWF	r0x101B
	MOVF	r0x101D,W
	IORWF	r0x101C,W
	BTFSS	STATUS,2
	GOTO	_00109_DS_
;	.line	29; "blink.c"	for(m=0;m<tiempo;m++)
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
	GOTO	_00111_DS_
_00113_DS_:
;	.line	31; "blink.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  414+  106 =   520 instructions ( 1252 byte)

	end
