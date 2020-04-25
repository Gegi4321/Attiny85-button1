; ------------Control an LED with a button on ATTiny85--------------
; Made By: xxgegi4321xx
; When: 25-Apr-20
; INSTRUCTIONS:
; Put an LED onto PB3, and a button onto PB4
; Then just flash the hex file that I provided you in this git
; ------------------------------------------------------------------

init:					; begin "init" method
	ldi r16, 0b00001000		; put 0b00001000 into r16
	ldi r18, 0b00010000		; put 0b00010000 into r18
	ldi r17, 0b00011000		; put 0b00011000 into r17
	ldi r20, 0			; put 0 into r20
	out DDRB, r16			; set PB3 (led) to output and all other pins to input
	out PORTB, r18			; "turn on" PB4 (button)
	rjmp chk_bt_hgh			; check button state
chk_bt_hgh:				; begin "chk_bt_hgh" method
	in r19, PINB			; load input states to r19
	andi r19, 1<<4			; load only 4th bit (PB4 (button)) into r19
	cpi r19, 0			; compare r19 to 0 (is button pressed)
	brne led_off			; if button isn't pressed then turn off led
	rjmp led_on			; if button is pressed then turn on led
led_off:				; begin "led_off" method
	out PORTB, r18			; "turn on" PB4 (button)
	rjmp chk_bt_hgh			; check button state
led_on:					; begin "led_on" method
	out PORTB, r17			; "turn on" PB4 (button) and PB3 (led)
	rjmp chk_bt_hgh			; check button state
