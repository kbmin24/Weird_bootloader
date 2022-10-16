;init
org 0x7c00				;0x7c00: MBR Location
mov		ax, 0xB800		;Colour mode
mov		es, ax

;clear
call	cls

;print
xor		di, di
mov		ah, 12			;pink
mov		al, 'L'
call	pchar
mov		al, 'o'
call	pchar
mov		al, 'v'
call	pchar
mov		al, 'e'
call	pchar
mov		al, 'L'
call	pchar
mov		al, 'i'
call	pchar
mov		al, 'v'
call	pchar
mov		al, 'e'
call	pchar
mov		al, '!'
call	pchar
mov		al, '!'
call	pchar

;newline
add		di, 140

mov		ah, 11			;Light Cyan
mov		al, 'S'
call	pchar
mov		al, 'u'
call	pchar
mov		al, 'n'
call	pchar
mov		al, 's'
call	pchar
mov		al, 'h'
call	pchar
mov		al, 'i'
call	pchar
mov		al, 'n'
call	pchar
mov		al, 'e'
call	pchar
mov		al, '!'
call	pchar
mov		al, '!'
call	pchar

;newline
add		di, 140

;┌─────┐
;│_♥♥♥_│
;└─────┘
;centre
add		di, 1440
;L1
add		di, 74			;move to the middle
mov		ah, 9			;lightblue

mov		al, 218			;┌
call	pchar
mov		al, 196			;─
call	pchar
call	pchar
call	pchar
call	pchar
call	pchar			;draw 5 times
mov		al, 191			;┐
call	pchar

;L2
add		di, 72
add		di, 74			;middle
mov		al, 179			;│
call	pchar
add		di, 2			;space
mov		ah, 4			;red
mov		al, 3			;hihi
call	pchar
mov		al, 3
call	pchar
mov		al, 3
call	pchar
mov		ah, 9			;lightblue
add		di, 2
mov		al, 179
call	pchar

;L3
add		di, 72
add		di, 74			;middle
mov		al, 192			;└
call	pchar
mov		al, 196			;─
call	pchar
call	pchar
call	pchar
call	pchar
call	pchar			;draw 5 times
mov		al, 217			;┘
call	pchar

add		di, 72			;L15.
add		di, 1440
mov		ah, 9			;blue
mov		al, 'U'
call	pchar
mov		al, 'm'
call	pchar
mov		al, 'i'
call	pchar
mov		al, 'c'
call	pchar
mov		al, 'h'
call	pchar
mov		al, 'a'
call	pchar
mov		al, 'n'
call	pchar
mov		al, '~'
call	pchar

add		di, 144
mov		ah, 12			;magenta
mov		al, 'W'
call	pchar
mov		al, 'h'
call	pchar
mov		al, 'a'
call	pchar
mov		al, 't'
call	pchar
mov		al, ' '
call	pchar
mov		al, 'i'
call	pchar
mov		al, 'n'
call	pchar
mov		al, ' '
call	pchar
mov		al, 't'
call	pchar
mov		al, 'h'
call	pchar
mov		al, 'e'
call	pchar
mov		al, ' '
call	pchar
mov		al, 'w'
call	pchar
mov		al, 'o'
call	pchar
mov		al, 'r'
call	pchar
mov		al, 'l'
call	pchar
mov		al, 'd'
call	pchar
mov		al, ' '
call	pchar
mov		al, 'i'
call	pchar
mov		al, 's'
call	pchar
mov		al, ' '
call	pchar
mov		al, 't'
call	pchar
mov		al, 'h'
call	pchar
mov		al, 'i'
call	pchar
mov		al, 's'
call	pchar
jmp		$
;=====
cls:
	;clears the screen.
	mov		al, 0
	mov		ah, 0
	xor		di, di
	mov		cx, 80*25*2
	cls_lp1:
		call	pchar
		loop	cls_lp1
	ret
pchar:
	;https://en.wikipedia.org/wiki/Code_page_437
	mov		byte[es:di], al
	inc		edi
	mov		byte[es:di], ah
	inc		edi
	ret
;=====
times	510-($-$$) db 0x00
dw		0xaa55