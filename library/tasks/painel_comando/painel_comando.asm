
_PAINEL_COMANDO_init:

;painel_comando.c,136 :: 		void PAINEL_COMANDO_init()
;painel_comando.c,139 :: 		}
L_end_PAINEL_COMANDO_init:
	RETURN      0
; end of _PAINEL_COMANDO_init

_PAINEL_COMANDO_main:

;painel_comando.c,141 :: 		void PAINEL_COMANDO_main()
;painel_comando.c,143 :: 		MODO_FUNCIONAMENTO_T = TASK_PAINEL_COMANDO;
	MOVLW       2
	MOVWF       _writeBuffer+6 
;painel_comando.c,144 :: 		}
L_end_PAINEL_COMANDO_main:
	RETURN      0
; end of _PAINEL_COMANDO_main
