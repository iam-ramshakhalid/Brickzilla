[org 0x0100]
jmp start

start_game: db 0


inst: db 'PRESS A TO KNOW MORE ABOUT THE GAME'
oldisr: dd 0
colume: dw 0
row: dw 0
incC: db 0
incR: db 0
previous: dw 0
tickcount: db 0
left_edge: dw 3524
right_edge: dw 3652
right_: dw 0
left_: dw 0
pre_stack_pos: dw 3580

second: dw 0
minute: db 0
clock: db 0
bonus: dw 0

bricks_start_location: dw 810 , 828 , 846 , 864 , 882 , 900 , 918 , 936 , 1290 , 1308 , 1326 , 1344 , 1362, 1380, 1398 , 1416 , 1770 , 1788 , 1806 , 1824 , 1842 , 1860 , 1878 , 1896 , 2250 , 2268 , 2286 , 2304 , 2322 , 2340 , 2358 , 2376
bricks_end_location: dw 822 , 840 , 858 , 876 , 894 , 912 , 930 , 948 , 1302 , 1320 , 1338 , 1356 , 1374 , 1392 , 1414 , 1428 , 1782 , 1800  , 1818 , 1836 ,1854 , 1872 , 1890 , 1908 , 2262 , 2280 , 2298 , 2316 , 2334 , 2352 , 2370 , 2388

score: dw 0
total_bricks: dw 32
calculated_location:  dw 0
left_limit dw 0
right_limit dw 0
mid dw 0
left_or_right: db 0
preBall:dw 0

live: db 3
end_of_game: dw 0
StayOnStacker: db 0

;counter: dw 0
solid: db 0
solid1: db 0
red_brick_hits: db 0


coin_joke1: db 'Insert coin to start.'
coin_joke2: db 'Just kidding. Press ENTER.'

; Game Over Header
game_over_line1: db '       ==============================='
game_over_title: db '### GAME OVER ###'
game_over_line2: db '     ==============================='

; Status messages
quit_msg_title: db 'YOU QUIT'
lose_msg_title: db 'OOPS YOU LOSE'
win_msg_title: db 'CONGO U WON'


; Score display
total_score_str: db 'YOUR TOTAL SCORE : '
lives_remain_str: db 'LIVES REMAINING :'

; Flavor text for each ending
quit_flavor: db 'Leaving so soon? The bricks will miss you!   '
lose_flavor: db 'Nice try! The bricks won this round  '
win_flavor: db 'LEGENDARY! You destroyed everything!'

; Separator
menu_separator: db '-----------------------------------------'

; Menu options
restart_option: db 'PRESS ENTER+R  ->  RESTART (RUN IT BACK) '
quit_option: db 'PRESS ENTER+Q  ->  QUIT GAME(NO JUDGEMENT)'


Score_str: db 'SCORE'
Lives_str: db 'LIVES'
heart_char: db '<3'
countdown_3_line1: db '  ***   '
countdown_3_line2: db ' *   *  '
countdown_3_line3: db '   **   '
countdown_3_line4: db ' *   *  '
countdown_3_line5: db '  ***   '

countdown_2_line1: db '  ***   '
countdown_2_line2: db ' *   *  '
countdown_2_line3: db '   *    '
countdown_2_line4: db '  *     '
countdown_2_line5: db ' *****  '

countdown_1_line1: db '   *    '
countdown_1_line2: db '  **    '
countdown_1_line3: db '   *    '
countdown_1_line4: db '   *    '
countdown_1_line5: db '  ***   '

countdown_go: db '   GO!   '
ready_str: db 'GET READY!'
empty_line db "                                        ", 0

title_line1: db '  ####   ####   ###   ####  #  #'
title_line2: db '  #   #  #   #   #   #      # #'
title_line3: db '  ####   ####    #   #      ##'
title_line4: db '  #   #  #   #   #   #      # #'
title_line5: db '  ####   #   #  ###   ####  #  #'
title_line6: db '  ####   ####   #####   #   #  #  #####  ####'
title_line7: db '  #   #  #   #  #      # #  # #   #      #   #'
title_line8: db '  ####   ####   ###   #####  ##   ###    ####'
title_line9: db '  #   #  #   #  #     #   #  # #  #      #   #'
title_line10: db'  ####   #   #  ##### #   #  #  # ##### #   #'

presented_str: db 'PRESENTED BY'
name1_str: db 'ZUHAR FAISAL (24L-3068)'
name2_str: db 'RAMSHA KHALID (24L-3052)'

option_str: db 'PLEASE SELECT OPTIONS'

play_str: db 'PRESS ENTER TO PLAY GAME'


 exit_str: db 'PRESS E TO EXIT'
quit_str: db 'PRESS ENTER+Q TO QUIT GAME'
restart_str: db 'PRESS ENTER+R TO RESTART YOUR GAME'



welcome_title: db 'WELCOME TO BRICK BREAKER'
welcome_emoji: db ' '  ; We'll use a star character
welcome_subtitle: db 'Where chaos meets strategy and only the QUICK survive.'

how_to_win_title: db 'HOW TO WIN: '
rule1: db '* Smash every brick like your GPA depends on it'
rule2: db '* RED bricks = Power-up paddle (basically your upgrade booster)'
rule3: db '* Do it FAST -> finish in under 2 mins = BONUS      '
rule4: db '* Miss the ball? Lose a life. Miss 3? GG, try again. '

dev_crew_title: db 'MEET THE DEV CREW: '
dev1: db 'Zuhar Faisal (24L3068) - Chief Bug Fixer   '
dev2: db 'Ramsha Khalid (24L3052) - Queen of Paddle Physics '
dev_footer: db 'Built with love, caffeine, and too many debugging tears.'


intro_sound_played: db 0
countdown_active: db 1
draw_background:
    push es
    push ax
    push di
    push cx
    
    mov ax, 0xb800
    mov es, ax
    mov di, 0
    mov cx, 2000
    mov ax, 0xDF20

background_loop:
    mov [es:di], ax
    add di, 2
    loop background_loop
    
    pop cx
    pop di
    pop ax
    pop es
    ret

sound:
	push ax
	push bx
	mov al,182
	out 43h,al
	mov ax, 4560
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,2
	pre:
	mov cx,65535
	pre1:
	dec cx
	jne pre1
	dec bx
	jne pre
	in al,61h
	and AL,11111100b
	out 61h,al 
	pop bx
	pop ax
	ret 

intro_sound:
    push ax
    push bx
    push cx
    
    mov al, 182
    out 43h, al
    mov ax, 2280
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov bx, 4
intro_sound_loop1:
    mov cx, 65535
intro_sound_delay1:
    dec cx
    jne intro_sound_delay1
    dec bx
    jne intro_sound_loop1
    
    mov al, 182
    out 43h, al
    mov ax, 1820
    out 42h, al
    mov al, ah
    out 42h, al
    
    mov bx, 3
intro_sound_loop2:
    mov cx, 65535
intro_sound_delay2:
    dec cx
    jne intro_sound_delay2
    dec bx
    jne intro_sound_loop2
    
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop cx
    pop bx
    pop ax
    ret

sound_lose:
	push ax
	push bx
	push cx
	
	; First tone - medium (louder, longer)
	mov al,182
	out 43h,al
	mov ax, 800
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,8
	pre_lose1:
	mov cx,65535
	pre1_lose1:
	dec cx
	jne pre1_lose1
	dec bx
	jne pre_lose1
	
	; Second tone - lower
	mov al,182
	out 43h,al
	mov ax, 600
	out 42h,al
	mov al,ah
	out 42h,al
	mov bx,8
	pre_lose2:
	mov cx,65535
	pre1_lose2:
	dec cx
	jne pre1_lose2
	dec bx
	jne pre_lose2
	
	; Third tone - lowest (very sad)
	mov al,182
	out 43h,al
	mov ax, 400
	out 42h,al
	mov al,ah
	out 42h,al
	mov bx,12
	pre_lose3:
	mov cx,65535
	pre1_lose3:
	dec cx
	jne pre1_lose3
	dec bx
	jne pre_lose3
	
	in al,61h
	and AL,11111100b
	out 61h,al 
	pop cx
	pop bx
	pop ax
	ret

sound_win:
	push ax
	push bx
	push cx
	
	; First note - loud and clear
	mov al,182
	out 43h,al
	mov ax, 2000
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,5
	pre_win1:
	mov cx,65535
	pre1_win1:
	dec cx
	jne pre1_win1
	dec bx
	jne pre_win1
	
	in al,61h
	and AL,11111100b
	out 61h,al
	mov cx,20000
	delay_win1:
	loop delay_win1
	
	; Second note - higher
	mov al,182
	out 43h,al
	mov ax, 2500
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,5
	pre_win2:
	mov cx,65535
	pre1_win2:
	dec cx
	jne pre1_win2
	dec bx
	jne pre_win2
	
	in al,61h
	and AL,11111100b
	out 61h,al
	mov cx,20000
	delay_win2:
	loop delay_win2
	
	; Third note - even higher
	mov al,182
	out 43h,al
	mov ax, 3000
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,5
	pre_win3:
	mov cx,65535
	pre1_win3:
	dec cx
	jne pre1_win3
	dec bx
	jne pre_win3
	
	in al,61h
	and AL,11111100b
	out 61h,al
	mov cx,20000
	delay_win3:
	loop delay_win3
	
	; Fourth note - victory! (longest and loudest)
	mov al,182
	out 43h,al
	mov ax, 4000
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,10
	pre_win4:
	mov cx,65535
	pre1_win4:
	dec cx
	jne pre1_win4
	dec bx
	jne pre_win4
	
	in al,61h
	and AL,11111100b
	out 61h,al 
	pop cx
	pop bx
	pop ax
	ret

sound_solid:
	push ax
	push bx
	mov al,182
	out 43h,al
	mov ax, 3000
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	or al,00000011b
	out 61h,al
	mov bx,3
	pre_solid:
	mov cx,65535
	pre1_solid:
	dec cx
	jne pre1_solid
	dec bx
	jne pre_solid
	in al,61h
	and AL,11111100b
	out 61h,al 
	pop bx
	pop ax
	ret


aboutme_music:
    push ax
    push bx
    push cx
    
    ; Play a soothing melody - multiple soft tones
    
    ; Note 1 - C (soft, gentle)
    mov al, 182
    out 43h, al
    mov ax, 4560  ; C note
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov bx, 3
music_note1:
    mov cx, 40000
music_delay1:
    dec cx
    jne music_delay1
    dec bx
    jne music_note1
    
    ; Brief silence
    in al, 61h
    and al, 11111100b
    out 61h, al
    mov cx, 10000
music_pause1:
    loop music_pause1
    
    ; Note 2 - E (slightly higher)
    mov al, 182
    out 43h, al
    mov ax, 5120
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov bx, 3
music_note2:
    mov cx, 40000
music_delay2:
    dec cx
    jne music_delay2
    dec bx
    jne music_note2
    
    ; Brief silence
    in al, 61h
    and al, 11111100b
    out 61h, al
    mov cx, 10000
music_pause2:
    loop music_pause2
    
    ; Note 3 - G (harmonious)
    mov al, 182
    out 43h, al
    mov ax, 6080
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov bx, 3
music_note3:
    mov cx, 40000
music_delay3:
    dec cx
    jne music_delay3
    dec bx
    jne music_note3
    
    ; Brief silence
    in al, 61h
    and al, 11111100b
    out 61h, al
    mov cx, 10000
music_pause3:
    loop music_pause3
    
    ; Note 4 - Higher C (resolution)
    mov al, 182
    out 43h, al
    mov ax, 4560
    out 42h, al
    mov al, ah
    out 42h, al
    in al, 61h
    or al, 00000011b
    out 61h, al
    
    mov bx, 4
music_note4:
    mov cx, 40000
music_delay4:
    dec cx
    jne music_delay4
    dec bx
    jne music_note4
    
    ; Turn off sound
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop cx
    pop bx
    pop ax
    ret
	
	stop_music:
    push ax
    
    ; Turn off the PC speaker
    in al, 61h
    and al, 11111100b
    out 61h, al
    
    pop ax
    ret
	
clrscr_intro:
    push es
    push ax
    push cx
    push di

    mov ax, 0xb800
    mov es, ax
    xor di, di
    mov ax, 0xDE20
    mov cx, 2000
    rep stosw

    pop di
    pop cx
    pop ax
    pop es
    ret
delay_countdown:
    ; Delay for countdown (approximately 2-3 seconds)
    ; Input: none
    push cx
    push bx
    push dx
    mov bx, 12        ; Increase outer loop iterations
delay_loop_outer:
    mov cx, 65535
delay_loop_inner:
    dec cx
    jne delay_loop_inner
    dec bx
    jne delay_loop_outer
    pop dx
    pop bx
    pop cx
    ret
	

start_menu:
call clrscr_intro

mov ax, 0600h
mov bh, 1Eh
mov cx, 0
mov dx, 184Fh
int 10h

call draw_background

cmp byte[intro_sound_played], 1
je skip_intro_sound
    call intro_sound
    mov byte[intro_sound_played], 1
skip_intro_sound:

push ax

mov ax, 330
push ax
mov ax, title_line1
push ax
mov ax, 32
push ax
call printstr_B

mov ax, 490
push ax
mov ax, title_line2
push ax
mov ax, 32
push ax
call printstr_B

mov ax, 650
push ax
mov ax, title_line3
push ax
mov ax, 32
push ax
call printstr_B

mov ax, 810
push ax
mov ax, title_line4
push ax
mov ax, 32
push ax
call printstr_B

mov ax, 970
push ax
mov ax, title_line5
push ax
mov ax, 32
push ax
call printstr_B

mov ax, 1130
push ax
mov ax, empty_line
push ax
mov ax, 32
push ax
call printstr_B

mov ax, 1290
push ax
mov ax, title_line6
push ax
mov ax, 45
push ax
call printstr_B

mov ax, 1450
push ax
mov ax, title_line7
push ax
mov ax, 45
push ax
call printstr_B

mov ax, 1610
push ax
mov ax, title_line8
push ax
mov ax, 45
push ax
call printstr_B

mov ax, 1770
push ax
mov ax, title_line9
push ax
mov ax, 45
push ax
call printstr_B

mov ax, 1930
push ax
mov ax, title_line10
push ax
mov ax, 45
push ax
call printstr_B

mov ax, 2250
push ax
mov ax, presented_str
push ax
mov ax, 12
push ax
call printstr

mov ax, 2410
push ax
mov ax, name1_str
push ax
mov ax, 23
push ax
call printstr

mov ax, 2570
push ax
mov ax, name2_str
push ax
mov ax, 24
push ax
call printstr

mov ax, 2890
push ax
mov ax, option_str
push ax
mov ax, 21
push ax
call printstr



mov ax , 3050      ; Row 19
push ax
mov ax , coin_joke1
push ax
mov ax , 21
push ax
call printstr

mov ax , 3210      ; Row 20
push ax
mov ax , coin_joke2
push ax
mov ax , 26
push ax
call printstr

mov ax , 3530      ; Row 22
push ax
mov ax , inst
push ax
mov ax , 36
push ax
call printstr

pop ax
ret
	
printnum: 
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax
mov ax, [bp+4]
mov bx, 10
mov cx, 0
nextdigit: mov dx, 0
div bx
add dl, 0x30
push dx
inc cx
cmp ax, 0
jnz nextdigit
mov di, [bp+6]
nextpos: pop dx
mov dh, 0x07
mov [es:di], dx
add di, 2
loop nextpos
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 4

printstr:
 push bp
mov bp, sp
push es
push ax
push cx
push si
push di
mov ax, 0xb800
mov es, ax
mov di, [bp+8]
mov si, [bp+6]
mov cx, [bp+4]
mov ah, 0x07
nextchar: 
mov al, [si]
mov [es:di], ax
add di, 2
add si, 1
loop nextchar
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 6

printstr_B:
 push bp
mov bp, sp
push es
push ax
push cx
push si
push di
mov ax, 0xb800
mov es, ax
mov di, [bp+8]
mov si, [bp+6]
mov cx, [bp+4]
mov ah, 05Fh

nextchar1: 
mov al, [si]
mov [es:di], ax
add di, 2
add si, 1
loop nextchar1
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 6

time_str: db 'TIME '
printStrings:
	push ax
	
	mov ax , 280
	push ax
	mov ax , Lives_str
	push ax
	mov ax , 5
	push ax
	call printstr_B
	
	mov ax , 162
	push ax
	mov ax , Score_str
	push ax
	mov ax , 5
	push ax
	call printstr_B
	
	mov ax , 390
	push ax
	mov ax , time_str
	push ax
	mov ax , 5
	push ax
	call printstr_B
	
	pop ax
ret

clrscr: 
	push es
	push ax
	push cx
	push di
	mov ax, 0xb800
	mov es, ax
	xor di, di
	mov ax, 0x0720
	mov cx, 2000
	cld
	rep stosw
	pop di 
	pop cx
	pop ax
	pop es
ret 

boader:
	push ax
	push es
	push di
	
	mov ax,0xb800
	mov es,ax
	
	mov ah,0x60
	mov al,0x20
	mov di,482
	l1:
		 mov word[es:di],ax
		 add di,2
		 cmp di,636
		 jne l1
	
	cmp byte[cs:solid],1
	jne nnp
		mov ah,0x40
		jmp npp
	nnp:
		mov ah,0x60
	npp:
		mov di,3682
		l2:
			mov word[es:di],ax
			add di,2
			cmp di,3836
			jne l2
	
	mov ah,0x60
	mov al,0x20
	mov di,482
	l3:
		mov word[es:di],ax
		add di,160
		cmp di,3842
		jne l3
		
	mov di,636
	l4:
		mov word[es:di],ax
		add di,160
		cmp di,3996
		jne l4
	pop di
	pop es
	pop ax
ret

brick_remove:
	push es
	push ax
	push dx
	push cx
	push si
	push bx
	
	mov ax,0xb800
	mov es,ax
	
	mov cx , 32
	mov si , 0
	
	mov dx , [cs:calculated_location]
	
check:
	mov ax , word[cs:bricks_start_location + si]
	mov bx , word[cs:bricks_end_location + si]
	add si , 2
	
	cmp dx , ax
	jae checknext
	loop check
	jmp end_ofFunc

checknext:
	cmp dx , bx
	jbe remove
	loop check
	jmp end_ofFunc

remove:	
	cmp ax,864
	jne np
		inc byte[cs:red_brick_hits]
		cmp byte[cs:red_brick_hits], 2
		jb just_solidify
			mov byte[cs:solid],1
			call sound_solid
			sub si , 2
			mov di , word[cs:bricks_start_location + si]
			mov cx , 6
			mov ax , 0x0720
			rep stosw
			dec word[cs:total_bricks]
			add word[cs:score] , 10
			mov ax , 174
			push ax
			push word[cs:score]
			call printnum
			jmp end_ofFunc
		just_solidify:
			mov byte[cs:solid],1
			call sound_solid
			jmp end_ofFunc
	np:
	
	sub si , 2
	
	mov di , word[cs:bricks_start_location + si]
	mov cx , 6
	mov ax , 0x0720
	rep stosw
	call sound
	add word[cs:score] , 10
	dec word[cs:total_bricks]
	
	mov ax , 174
	push ax
	push word[cs:score]
	call printnum
	
end_ofFunc:
	pop bx
	pop si
	pop	cx
	pop dx
	pop ax
	pop es
ret

bricks:
	push es
	push cx
	push bx
	push si
	push di
	
	mov ax, 0xb800
	mov es, ax
	mov di,	810
	mov si , 0
	mov bx , 0
	
	cld
	
	brickline1:
		cmp di , 936
		ja brickline2
			mov ah , 0x2F
			mov al , 0x20
			mov cx , 6
			rep stosw
			mov cx , 3
			mov ax, 0x0720 
			rep stosw
			add si , 2	
			jmp brickline1
	
	brickline2:
		mov di , 1290
	brickline2_print:
		cmp di, 1416
		ja brickline3
			mov ah , 0x3F
			mov al , 0x20
			mov cx , 6
			rep stosw
			mov cx , 3
			mov ax, 0x0720 
			rep stosw
			add si , 2	
			jmp brickline2_print
	
brickline3:
		mov di, 1770
	brickline2_print3:
		cmp di, 1896
		ja brickline4
			mov ah , 0x5F
			mov al , 0x20
			mov cx , 6
			rep stosw
			mov cx , 3
			mov ax, 0x0720 
			rep stosw
			add si , 2	
			jmp brickline2_print3
	
	brickline4:
		mov di, 2250
	brickline4_print:
		cmp di, 2376
		ja endn
			mov ah , 0x6F
			mov al , 0x20
			mov cx , 6
			rep stosw
			mov cx , 3
			mov ax, 0x0720 
			rep stosw
			add si , 2	
			jmp brickline4_print
	
	endn:
	mov di,864
	mov cx,6
	mov al,0x20
	mov ah,0x40
	rep stosw
	
	pop di
	pop si
	pop bx
	pop cx
	pop es
ret

clearStacker:
	push bp
	mov bp , sp
	push es
	push ax
	push di
	push cx
	
	mov ax , 0xb800
	mov es , ax
	
	mov ax , 0x0720
	mov cx , 13
	mov di , [bp+4]
	
	rep stosw
	mov di,[cs:preBall]
	mov word[es:di],ax
	
	pop cx
	pop di
	pop ax
	pop es
	pop bp
ret	2

printStacker:
	push bp
	mov bp , sp
	push es
	push ax
	push di
	push cx
	
	mov ax , 0xb800
	mov es , ax
	
	mov al , 0x20
	mov ah , 0xb0
	mov cx , 13
	mov di , [bp+4]
	
	mov word[cs:left_limit] , di
	rep stosw
	sub di , 2
	mov word[cs:right_limit] , di
	
	mov ax , word[cs:right_limit]
	sub ax,12
	mov word[cs:mid] , ax
	
	sub ax,160
	mov di,ax
	shr ax,1
	sub ax,1680
	mov cx,ax
	
	cmp byte[cs:StayOnStacker],1
	jne endi
		mov al,0x07
		mov ah,0x0E
		mov word[es:di],ax
		mov [cs:preBall],di
		mov word[cs:row],21
		mov word[cs:colume],cx
		mov word[cs:previous],di
		
	endi:
	pop cx
	pop di
	pop ax
	pop es
	pop bp
ret	2

stacker:
	push ax
	push di
	
	cmp word[cs:right_] , 1
	je movRight
	cmp word[cs:left_] , 1
	je movLeft
	
	movRight:
		mov ax, word[cs:pre_stack_pos]
		add ax , 8
		cmp ax , word[cs:right_edge]
		ja exit1
			mov di, word[cs:pre_stack_pos]
			push di
			call clearStacker
			push ax
			call printStacker
			mov word[cs:pre_stack_pos] , ax
			jmp exit1
	
	movLeft:
		mov ax, word[cs:pre_stack_pos]
		sub ax , 8
		cmp ax , word[cs:left_edge]
		jb exit1
			mov di, word[cs:pre_stack_pos]
			push di
			call clearStacker
			push ax
			call printStacker
			mov word[cs:pre_stack_pos] , ax
			jmp exit1
	
	exit1:
		pop di
		pop ax
ret

calculate_position:
	push bp
	mov bp , sp
	push ax
	
	mov al , 80
	mul byte[bp+4]
	add ax , [bp+6]
	shl ax ,1
	
	mov word[cs:calculated_location] , ax
	
	pop ax
	pop bp
	ret 4

nextposition:
	push ax
	push bx
	push cx
	
	mov al,[cs:incC]
	mov ah,[cs:incR]
	mov bx,[cs:colume]
	mov cx,[cs:row]

	cmp word[cs:colume],3
	jne nextcond4
		mov al,1
		jmp rowCheck3
	nextcond4:
		cmp word[cs:colume],77
		jne rowCheck3
			mov al,0
			
	rowCheck3:
		cmp word[cs:row],4
		jne nextcond5
			mov ah,1
			jmp printingLocation1
		nextcond5:
			cmp word[cs:row],22
			jne printingLocation1
				mov ah,0
	
	printingLocation1:
		cmp al,1
		jne nextcond6
			add bx,1
			jmp rowCheck4
		nextcond6:
			sub bx,1
			
		rowCheck4:
			cmp ah,1
			jne nextcond7
				add cx,1
				jmp calculatelocation1
			nextcond7:
				sub cx,1
	calculatelocation1:
		push bx
		push cx
		call calculate_position
		
	pop cx
	pop bx
	pop ax
ret

left_right:
	push ax
	
	mov ax , word[cs:calculated_location]
	cmp ax , [cs:mid]
	ja check_right
	
	cmp ax , [cs:left_limit]
	jb endit
	mov byte[cs:left_or_right] , 0
	jmp endit
	
	check_right:
	cmp ax , [cs:right_limit]
	ja endit
	mov byte[cs:left_or_right] , 1
	jmp endit
	
	endit:
	pop ax
ret

ball:
	push es
	push ax
	push bx
	push cx
	push di
	
	; Don't draw ball during countdown
	cmp byte[cs:countdown_active],1
	jne ball_continue
	jmp ball_skip_draw
	
	ball_continue:
	mov ax,0xb800
	mov es,ax
	
	mov di,[cs:previous]
	mov word[es:di],0x0720
	call nextposition
	mov di,[cs:calculated_location]
	mov ax,word[es:di]
	cmp ah,0x07
	je R
		cmp ah,0xb0
		je n
		call brick_remove
		jmp n1
		n:
			call left_right
			cmp byte[cs:left_or_right],1
			jne n3
				mov byte[cs:incC],1
				jmp n1
			n3:
				mov byte[cs:incC],0
		n1:
		cmp byte[cs:incR],1
		jne r1
			mov byte[cs:incR],0
			jmp R
		r1:
			cmp byte[cs:incR],0
			jne R
				mov byte[cs:incR],1
	R:
	cmp word[cs:colume],3
	jne nextcond
		mov byte[cs:incC],1
		jmp rowCheck
	nextcond:
		cmp word[cs:colume],77
		jne rowCheck
			mov byte[cs:incC],0
			
	rowCheck:
		cmp word[cs:row],4
		jne nextcond1
			mov byte[cs:incR],1
			jmp printingLocation
		nextcond1:
			cmp byte[cs:solid],0
			jne solid12
				cmp word[cs:row],22
				jne printingLocation
					mov byte[cs:StayOnStacker],1 
					mov ax,word[cs:mid]
	
					sub ax,160
					mov di,ax
					shr ax,1
					sub ax,1680
					mov cx,ax

					mov al,0x07
					mov ah,0x0E
					mov word[es:di],ax
					mov [cs:preBall],di
					mov word[cs:row],21
					mov word[cs:colume],cx
					mov word[cs:previous],di
					sub byte[cs:live],1
					call sound_lose
					cmp byte[cs:live],0
					call print_lives
					jne endii
					jmp endii
			solid12:
				cmp word[cs:row],23
				jne printingLocation
					mov byte[incR],0
	printingLocation:
		cmp byte[cs:incC],1
		jne nextcond2
			add word[cs:colume],1
			jmp rowCheck1
		nextcond2:
			sub word[cs:colume],1
			
		rowCheck1:
			cmp byte[cs:incR],1
			jne nextcond3
				add word[cs:row],1
				jmp calculatelocation
			nextcond3:
				sub word[cs:row],1
		calculatelocation:
		mov ax,word[cs:row]
		mov bx,80
		mul bx
		add ax,word[cs:colume]
		shl ax,1
		mov di,ax
		mov word[cs:previous],ax
		
	mov al,0x07
	mov ah,0x0E
	mov word[es:di],ax
	ball_skip_draw:
	endii:
	pop di
	pop cx
	pop bx
	pop ax
	pop es
ret 

call_instruction_menu: db 0
instruction_menu:
    call clrscr_intro
	 call aboutme_music 
    push ax

    ; Title: "WELCOME TO BRICK BREAKER"
    mov ax, 330
    push ax
    mov ax, welcome_title
    push ax
    mov ax, 24             
    push ax
    call printstr_B

    ; Subtitle
    mov ax, 650
    push ax
    mov ax, welcome_subtitle
    push ax
    mov ax, 54             
    push ax
    call printstr

    ; "HOW TO WIN:"
    mov ax, 1130
    push ax
    mov ax, how_to_win_title
    push ax
    mov ax, 12              
    push ax
    call printstr_B

    ; Rule 1
    mov ax, 1290
    push ax
    mov ax, rule1
    push ax
    mov ax, 47            
    push ax
    call printstr

    ; Rule 2
    mov ax, 1450
    push ax
    mov ax, rule2
    push ax
    mov ax, 63              
    push ax
    call printstr

    ; Rule 3
    mov ax, 1610
    push ax
    mov ax, rule3
    push ax
    mov ax, 52             
    push ax
    call printstr

    ; Rule 4
    mov ax, 1770
    push ax
    mov ax, rule4
    push ax
    mov ax, 53              
    push ax
    call printstr

    ; "MEET THE DEV CREW:"
    mov ax, 2090
    push ax
    mov ax, dev_crew_title
    push ax
    mov ax, 19              
    push ax
    call printstr_B

    ; Dev 1
    mov ax, 2250
    push ax
    mov ax, dev1
    push ax
    mov ax, 43             
    push ax
    call printstr

    ; Dev 2
    mov ax, 2410
    push ax
    mov ax, dev2
    push ax
    mov ax, 50             
    push ax
    call printstr

    ; Footer message
    mov ax, 2730
    push ax
    mov ax, dev_footer
    push ax
    mov ax, 56              ; 56 characters
    push ax
    call printstr

    ; "PRESS E TO EXIT"
    mov ax, 3370
    push ax
    mov ax, exit_str
    push ax
    mov ax, 15              
    push ax
    call printstr

    pop ax
    ret
kbisr: 
	push ax
	push es
	
	mov word[cs:right_] , 0
	mov word[cs:left_] , 0
	mov ax, 0xb800
	mov es, ax 
	
	in al, 0x60
	
	cmp byte[start_game] , 0
	jne main_game
	
	cmp al , 0x1c
	jne cmp_instruction
	mov byte[start_game] , 1
	jmp exit
	
cmp_instruction:
	cmp al , 0x1E
	jne exit
	mov byte[call_instruction_menu] , 1
	
	cmp byte[start_game] , 1
	jne exit
main_game:
	cmp al, 0x4b
	jne nextcmp
		mov word[cs:left_] , 1
		call stacker
		jmp exit
	nextcmp: 
		cmp al, 0x4d
		jne nextcmp2
			mov word[cs:right_] , 1
			call stacker
			jmp exit
	nextcmp2: 
		cmp al, 0xad
		jne nextcmp3
		jmp exit
	nextcmp3: 
		cmp al, 0xab
		jne nextcmp4
		jmp exit 
	nextcmp4:
		cmp al,0x39
		jne nextcmp5
			mov byte[cs:StayOnStacker],0
		jmp exit
	nextcmp5:
		cmp al,0xb9
		jne exitcmp
		jmp exit
		
	exitcmp: 
		cmp al,0x12
		jne quitcmp
		mov byte[cs:end_game] , 1
		jmp exit
	quitcmp:
		cmp al , 0x10
		jne restartcmp
		mov byte[cs:quit] , 1
		jmp exit
	restartcmp:
		cmp al , 0x13
		jne nomatch
		mov byte[cs:restart] , 1
		jmp exit
	nomatch: 
		pop es
		pop ax
		jmp far [cs:oldisr] 
	exit:
		mov al, 0x20
		out 0x20, al 
	pop es
	pop ax 
iret 

timer: 
	cmp byte[cs:start_game],1
	jne pp
	cmp byte[cs:countdown_active],1
	je timer_skip
		inc byte[cs:clock]
		cmp byte[cs:clock],18
		jne ppp
			add word[cs:second],1
			mov byte[cs:clock],0
		ppp:
		cmp byte[cs:solid],1
		jne po
			inc byte[cs:solid1]
			cmp byte[cs:solid1],180
			jne po
				mov byte[cs:solid],0
		po:
		inc word[cs:bonus]
		cmp word[cs:bonus],2160
		jnbe pk
			cmp word[cs:total_bricks],0
			jne pk
				add word[cs:score],50
		pk:
		push ax
		mov ax , 402
		push ax
		mov ax , word[cs:second]
		push ax
		call printnum
		pop ax
		
	timer_skip:
	pp:
	cmp byte[cs:StayOnStacker],0
	jne endof
	cmp byte[cs:start_game] , 1
	jne endof
		inc byte[cs:tickcount]
		cmp byte[cs:tickcount], 2
		jne endof
			call ball
			call boader
			mov byte[cs:tickcount],0
		endof:
		mov al, 0x20
		out 0x20, al
iret

print_lives:
	push ax
	push es
	push cx
	push di
	push si
	
	mov ax , 0xb800
	mov es , ax
	
	; Clear the lives area 
	mov cx , 9
	mov ax , 0x0720
	mov di , 292
	rep stosw
	
	; Get number of lives
	mov cl , byte[cs:live]
	mov ch , 0
	mov di , 292
	
	; Loop to print each heart
	print_heart_loop:
		cmp cx, 0
		je print_heart_done
		
		; Print '<'
		mov ah , 0x0C
		mov al , '<'
		mov word[es:di], ax
		add di, 2
		
		; Print '3'
		mov al , '3'
		mov word[es:di], ax
		add di, 2
		
		; Add space between hearts
		mov al , ' '
		mov word[es:di], ax
		add di, 2
		
		dec cx
		jmp print_heart_loop
	
	print_heart_done:
	pop si
	pop di
	pop cx
	pop es
	pop ax
ret

oldtmr: dd 0
end_game: db 0
start:
	
	xor ax, ax
	mov es, ax
	
	mov ax, [es:9*4]
	mov [oldisr], ax
	mov ax, [es:9*4+2]
	mov [oldisr+2], ax
	
	mov ax, [es:8*4]
	mov [oldtmr], ax
	mov ax, [es:8*4+2]
	mov [oldtmr+2], ax
	
	cli
		mov word [es:9*4], kbisr 
		mov [es:9*4+2], cs 
		mov word [es:8*4],timer
		mov [es:8*4+2],cs
	sti
	
	call start_menu
menu_loop:
	cmp byte[call_instruction_menu] , 1
	jne check_start_game
	jmp instruction
	
check_start_game:
	cmp byte[start_game] , 0
	jne check_end_game
	jmp menu_loop
	
check_end_game:
	cmp byte[end_game] , 1
	jne start_game_here
	jmp endgame
start_game_here:
	mov byte[restart] , 0
	mov byte[quit] , 0
	mov byte[countdown_active] , 1
	call clrscr
	
	; Show "GET READY!" message (centered)
	mov ax, 1680
	push ax
	mov ax, ready_str
	push ax
	mov ax, 10
	push ax
	call printstr_B
	
	call delay_countdown
	
; Show "3" (centered - multi-line)
	call clrscr
	mov ax, 1680
	push ax
	mov ax, countdown_3_line1
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 1840
	push ax
	mov ax, countdown_3_line2
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2000
	push ax
	mov ax, countdown_3_line3
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2160
	push ax
	mov ax, countdown_3_line4
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2320
	push ax
	mov ax, countdown_3_line5
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	call delay_countdown
	
	; Show "2" (centered - multi-line)
	call clrscr
	mov ax, 1680
	push ax
	mov ax, countdown_2_line1
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 1840
	push ax
	mov ax, countdown_2_line2
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2000
	push ax
	mov ax, countdown_2_line3
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2160
	push ax
	mov ax, countdown_2_line4
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2320
	push ax
	mov ax, countdown_2_line5
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	call delay_countdown
	
	; Show "1" (centered - multi-line)
	call clrscr
	mov ax, 1680
	push ax
	mov ax, countdown_1_line1
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 1840
	push ax
	mov ax, countdown_1_line2
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2000
	push ax
	mov ax, countdown_1_line3
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2160
	push ax
	mov ax, countdown_1_line4
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	mov ax, 2320
	push ax
	mov ax, countdown_1_line5
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	call delay_countdown
	
	; Show "GO!" (centered)
	call clrscr
	mov ax, 1680
	push ax
	mov ax, countdown_go
	push ax
	mov ax, 9
	push ax
	call printstr_B
	
call delay_countdown
	
	; Countdown finished, now start real game
	mov byte[countdown_active] , 0
	
	; Now start the actual game
	call clrscr
	
	; Reset timer variables
	mov word[second] , 0
	mov byte[clock] , 0
	mov word[bonus] , 0
	
	call printStrings
	call print_lives
	mov ax , 174
	push ax
	push word[score]
	call printnum
	call boader
	call bricks
	mov byte[StayOnStacker],1
	call stacker
game_inner_loop:
	cmp word[total_bricks] , 0
	je endgame
	cmp byte[end_game] , 1
	je endgame
	cmp byte[live] , 0
	je endgame
	jmp game_inner_loop
instruction:
    call instruction_menu
again_ins:
    cmp byte[start_game] , 1
    je exit_instruction   
    jne again_ins
    
exit_instruction:         
    call stop_music       
    jmp start_game_here   
	
endgame:
mov byte[start_game] , 0
call last_menu
cmp byte[restart] , 1
je start_game_here
call clrscr
mov ax , [oldisr]
mov bx , [oldisr+2]
mov cx , [oldtmr]
mov dx , [oldtmr+2]
cli 
mov [es:9*4] , ax
mov [es:9*4+2], bx
mov [es:8*4] , cx
mov [es:8*4+2], dx
sti

mov ax , 0x4c00
int 0x21


restart: db 0
quit: db 0
;variable: dw 0


last_menu:
	push ax
	call clrscr
	
	cmp byte[live] , 0
	jbe display_lose
	
	cmp word[total_bricks] , 0
	je display_win
	
	jmp display_quit

display_lose:
	call sound_lose
	
	; Show "OOPS YOU LOSE"
	mov ax, 330
	push ax
	mov ax, lose_msg_title
	push ax
	mov ax, 13
	push ax
	call printstr_B
	
	; Delay
	mov cx, 0xFFFF
delay_lose_msg:
	loop delay_lose_msg
	
	; Show game over screen
	call show_game_over_screen
	
	; Show lose flavor text
	mov ax, 1962
	push ax
	mov ax, lose_flavor
	push ax
	mov ax, 37
	push ax
	call printstr
	
	jmp show_menu_options

display_win:
	call sound_win
	
	; Show "CONGO U WON"
	mov ax, 330
	push ax
	mov ax, win_msg_title
	push ax
	mov ax, 11
	push ax
	call printstr_B
	
	; Delay
	mov cx, 0xFFFF
delay_win_msg:
	loop delay_win_msg
	
	; Show game over screen
	call show_game_over_screen
	
	; Show win flavor text
	mov ax, 1960
	push ax
	mov ax, win_flavor
	push ax
	mov ax, 38
	push ax
	call printstr
	
	jmp show_menu_options

display_quit:
	; Show "YOU QUIT"
	mov ax, 330
	push ax
	mov ax, quit_msg_title
	push ax
	mov ax, 8
	push ax
	call printstr_B
	
	; Delay
	mov cx, 0xFFFF
delay_quit_msg:
	loop delay_quit_msg
	
	; Show game over screen
	call show_game_over_screen
	
	; Show quit flavor text
	mov ax, 1938
	push ax
	mov ax, quit_flavor
	push ax
	mov ax, 44
	push ax
	call printstr
show_menu_options:
	; Separator line (top) - row 14, col 19
	mov ax, 2278
	push ax
	mov ax, menu_separator
	push ax
	mov ax, 41
	push ax
	call printstr
	
	; Restart option - row 15, col 19
	mov ax, 2438
	push ax
	mov ax, restart_option
	push ax
	mov ax, 41
	push ax
	call printstr
	
	; Quit option - row 16, col 19
	mov ax, 2598
	push ax
	mov ax, quit_option
	push ax
	mov ax, 42
	push ax
	call printstr
	
	; Separator line (bottom) - row 17, col 19
	mov ax, 2758
	push ax
	mov ax, menu_separator
	push ax
	mov ax, 41
	push ax
	call printstr
what_nxt:
	cmp byte[cs:restart] , 1
	je do_restart
	cmp byte[cs:quit] , 1
	je go_quit
	jmp what_nxt

go_quit:
	pop ax
	ret
		
do_restart:
	pop ax
	mov word[second] , 0
	mov byte[clock] , 0
	mov byte[start_game] , 1
	mov word[total_bricks] , 32
	mov byte[live] , 3
	mov word[score] , 0
	mov byte[end_game] , 0
	mov word[bonus] , 0
	mov byte[solid] , 0
	mov byte[solid1] , 0
	mov word[pre_stack_pos] , 3580
	mov byte[red_brick_hits] , 0
	ret

show_game_over_screen:
	; This is called by all three endings
	push ax
	
	call clrscr
	
	; Top border (centered - row 5, col 24)
	mov ax, 848
	push ax
	mov ax, game_over_line1
	push ax
	mov ax, 31
	push ax
	call printstr_B
	
	; "### GAME OVER ###" (centered - row 6, col 31)
	mov ax, 1022
	push ax
	mov ax, game_over_title
	push ax
	mov ax, 17
	push ax
	call printstr_B
	
	; Bottom border (centered - row 7, col 24)
	mov ax, 1168
	push ax
	mov ax, game_over_line2
	push ax
	mov ax, 31
	push ax
	call printstr_B
	
	; YOUR TOTAL SCORE : (row 9, col 28)
	mov ax, 1496
	push ax
	mov ax, total_score_str
	push ax
	mov ax, 19
	push ax
	call printstr
	
	; Print score value
	mov ax, 1534
	push ax
	push word[score]
	call printnum
	
	; LIVES REMAINING : (row 10, col 29)
	mov ax, 1658
	push ax
	mov ax, lives_remain_str
	push ax
	mov ax, 17
	push ax
	call printstr
	
	; Print lives value
	mov ax, 1692
	push ax
	xor ax, ax
	mov al, byte[live]
	push ax
	call printnum
	
	pop ax
	ret