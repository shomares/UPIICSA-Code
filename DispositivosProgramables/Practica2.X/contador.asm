

 LIST P=18F4550 				;directive to define processor
		#include <P18F4550.INC> 	;processor specific variable definitions
 
    	;CONFIG1L dir 300000h 		20
		CONFIG	PLLDIV=1	 	; 
		CONFIG	CPUDIV=OSC1_PLL2 ;CUANDO SE USA 	
		CONFIG	USBDIV=2

		;CONFIG1H dir 300001h	   08
		CONFIG	FOSC=INTOSCIO_EC	;OSCILADOR INTERNO, RA6 COMO PIN, USB USA OSC EC
		CONFIG	FCMEN=OFF       ;DESHABILITDO EL MONITOREO DEL RELOJ
		CONFIG	IESO=OFF
		;CONFIG2L DIR 300002H	   	38
		CONFIG	PWRT=ON         ;PWRT HABILITADO
		CONFIG  BOR=OFF		 	;BROWN OUT RESET DESHABILITADO
		CONFIG BORV=3			;RESET AL MINIMO VOLTAJE NO UTILZADO EN ESTE CASO
		CONFIG	VREGEN=ON	 	;REULADOR DE USB ENCENDIDO
		;CONFIG2H DIR 300003H	   	1E
		CONFIG	WDT=OFF         ;WACH DOG DESHABILITADO
		CONFIG WDTPS=32768      ;TIMER DEL WATCHDOG 
		;CONFIG3H DIR 300005H 	   	81
		CONFIG	CCP2MX=ON	 	;CCP2 MULTIPLEXADAS CON RC1	
		CONFIG	PBADEN=OFF      ;PUERTO B PINES DEL 0 AL 4 ENTRADAS DIGITALES
		CONFIG  LPT1OSC=OFF	 	;TIMER1 CONFIURADO PARA OPERAR EN BAJA POTENCIA
		CONFIG	MCLRE=ON        ;MASTER CLEAR HABILITADO
		;CONFIG4L DIR 300006H	   	81
		CONFIG	STVREN=ON	 	;SI EL STACK SE LLENA CAUSE RESET		
		CONFIG	LVP=OFF		 	;PROGRAMACIÒN EN BAJO VOLTAJE APAGADO
		CONFIG	ICPRT=OFF	 	;REGISTRO ICPORT DESHABILITADO
		CONFIG	XINST=OFF  		;SET DE EXTENCION DE INSTRUCCIONES Y DIRECCIONAMIENTO INDEXADO DESHABILITADO
		;CONFIG5L DIR 300008H 		0F
		CONFIG	CP0=OFF		 	;LOS BLOQUES DEL CÒDIGO DE PROGRAMA
		CONFIG	CP1=OFF         ;NO ESTAN PROTEGIDOS
		CONFIG	CP2=OFF		 
		CONFIG	CP3=OFF
		;CONFIG5H DR 300009H  		80
		CONFIG	CPB=ON		 	;SECTOR BOOT ESTA PROTEGIDO
		CONFIG	CPD=OFF		 	;EEPROM N PROTEGIDA
		;CONFIG6L DIR 30000AH 		0F
		CONFIG	 WRT0=OFF	 	;BLOQUES NO PROTEGIDOS CONTRA ESCRITURA
		CONFIG	 WRT1=OFF
		CONFIG	 WRT2=OFF
		CONFIG	 WRT3=OFF

		;CONFIG6H DIR 30000BH		A0
		CONFIG	 WRTC=OFF	 	;CONFIGURACION DE REGISTROS NO PROTEGIDO
		CONFIG	 WRTB=ON	 	;BLOQUE BOOTEBLE NO PROTEGIDO
		CONFIG	 WRTD=OFF	 	;EEPROMDE DATOS NO PROTGIDA

		;CONFIG7L DIR 30000CH		0F
		CONFIG	 EBTR0=OFF	 	;TABLAS DE LETURA NO PROTEGIDAS
		CONFIG	 EBTR1=OFF
		CONFIG	 EBTR2=OFF
		CONFIG	 EBTR3=OFF

		;CONFIG7H DIR 30000DH		40
		CONFIG	 EBTRB=OFF	 	;TABLAS NO PROTEGIDAS

 	CBLOCK 0x0			; PARA VARIABLES
	    CONT
	    CONT1
	    CONT2
 	ENDC 
	
 		org 0					; DIRECCION 0 DE LA MEMORIA
 
;-------------------------------------------------------------	
; CONFIGURACION DE PUERTOS
	
    		clrf TRISA  			; 
		clrf TRISB
 		clrf TRISC 			; 
    		clrf TRISD
    		clrf TRISE
;----------------------------------------------------------		
;AQUI CONFIGURO LOS PUERTOS DE ENTRADA O SALIDA
		movlw 0xFF
		movwf TRISA
		movlw 0x00
		movwf TRISB
;//------------------------------------------------------
; ahora viene la deshabilitación de modulos (pheriperals)
;*******************************************************
 		clrf ADCON0 			; desactiva el CAD
 		movlw 0xf 
 		movwf ADCON1 			; todas digitales

 		movlw 0x07 
 		movwf CMCON 			;desactiva el modulo comparador
 	
 	
;//-------------------------------------------
; CUERPO DE PROGRAMA
		clrf CONT1
		clrf CONT2
	ini	
		clrf CONT		;limpio CONT
	ini2
		movf CONT,w		;Cargo contador a w
		andlw b'00011111'	;enmascaramiento
		call tabla		;llamo a tabla
		movwf PORTB		;muestro el valor de la tabla en B
		call retardo_1		;me tardo 1seg
		
		movf CONT,w		;muevo CONT a w
		sublw 0x1e		;Resto una constante 0x1e
		btfss STATUS,Z		;compruebo que no sea cero
		bra inc			;Si no es cero incremento en contador
		bra ini			;Es cero y comienza el ciclo de nuevo
		
	inc
		incf CONT,f		;Incremento 1 a Contador
		incf CONT,f		;Incremento 1 a Contador
		bra ini2		;Llamo a ini2 para cambiar de caracter
		
	tabla
		addwf PCL,f		;????
		retlw 0x3f		;1
		retlw 0x06		;1
		retlw 0x5b		;2
		retlw 0x4f		;3
		retlw 0x66		;4
		retlw 0x6d		;5
		retlw 0x7d		;6
		retlw 0x07		;7
		retlw 0x7f		;8
		retlw 0x67		;9
		retlw 0x77		;A
		retlw 0x7c		;B
		retlw 0x39		;C
		retlw 0x5e		;D
		retlw 0x79		;E
		retlw 0x71		;F
		

	retardo_1
		movlw d'1000'		    ;1 seg
		movwf CONT2		    ;muevo a
	ini_1	
		movlw d'498'
		movwf CONT1
	bucle
		nop
		decfsz CONT1,f
		goto bucle
		decfsz CONT2,f
		goto ini_1
		return
		end
