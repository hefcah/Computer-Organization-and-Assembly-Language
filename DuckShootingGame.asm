.model small
.stack 0100h
.data

	endgame db 0
	
	stats_array db 5 dup(10 dup('='),0Ah)
	dollar db '$'
    file_handle dw ?
    file_name db "stats.txt",0
    temp_stats_array1 db 10 dup('='),0Ah
    temp_stats_array2 db 10 dup('='),0Ah
	A0 db 0
    A1 db 0
    A2 db 0
    A3 db 0
	
	y_iterator dw 0
	x_iterator dw 0
	z_iterator dw 0
	
	options_play db "P L A Y $"
	options_help db "H E L P $"
	options_quit db "Q U I T $"
	options_selected db 1
	
	boxcolor db 0
	box_x dw 0
	box_y dw 0
	sprite_x db 0
	sprite_y db 0
	
	helpa db 'AIM WITH WASD AND SHOOT WITH ENTER$'
	helpb db 'SHOOT THE DUCKS TO EARN SCORE$'
	helpc db 'FINISH IN THE TIME ON SCREEN !$'
	helpd db 'PRESS P TO PAUSE AND X TO GO BACK$'
	
	entername db 'ENTER NAME : $'
	playername db 5,0,5 dup('^')
	
	gamescreen_timer db 'TIME : $'
	timer db '0000$'
	timer_n db 0
	gamescreen_shots db 'SHOTS : $'
	shots db '00$'
	shots_n db 0
	shots_round db 0
	gamescreen_ducks db 'DUCKS : $'
	ducks db '00$'
	ducks_n db 0
	gamescreen_round db 'ROUND : $'
	round db '00$'
	round_n db 0
	gamescreen_score db 'SCORE : $'
	score db '0000$'
	score_n dw 0
	gamescreen_paused db 'PAUSED !!$'
	unpaused db '         $'
	gamescreen_gameover db 'GAME OVER$'
	
	tree	DB 06h,06h,06h,06h,06h,06h,06h,06h     ;  0
			DB 06h,06h,06h,06h,06h,06h,06h,06h     ;  1
			DB 06h,06h,06h,06h,06h,06h,06h,06h     ;  2
			DB 06h,08h,06h,06h,06h,06h,06h,06h     ;  3
			DB 06h,08h,06h,06h,06h,06h,06h,06h     ;  4
			DB 06h,06h,06h,08h,08h,06h,06h,06h     ;  5
			DB 06h,06h,06h,08h,06h,06h,06h,06h     ;  6
			DB 06h,06h,06h,06h,06h,06h,06h,06h     ;  7
			
	grass	DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  0
			DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  1
			DB 09h,09h,09h,09h,09h,09h,09h,09h     ;  2
			DB 09h,02h,0Ah,09h,02h,0Ah,10h,09h     ;  3
			DB 02h,0Ah,0Ah,02h,0Ah,0Ah,0Ah,02h     ;  4
			DB 02h,0Ah,0Ah,0Ah,0Ah,02h,0Ah,0Ah     ;  5
			DB 0Ah,0Ah,02h,0Ah,0Ah,02h,0Ah,0Ah     ;  6
			DB 0Ah,0Ah,02h,0Ah,0Ah,0Ah,0Ah,0Ah     ;  7
			
	leaves  DB 02h,0Ah,02h,02h,02h,0Ah,02h,02h     ;  0
			DB 02h,02h,02h,0Ah,02h,02h,0Ah,02h     ;  1
			DB 0Ah,0Ah,02h,0Ah,0Ah,02h,02h,0Ah     ;  2
			DB 02h,0Ah,02h,0Ah,02h,0Ah,02h,0Ah     ;  3
			DB 0Ah,02h,02h,02h,0Ah,0Ah,02h,02h     ;  4
			DB 02h,02h,02h,0Ah,02h,02h,02h,02h     ;  5
			DB 0Ah,02h,02h,02h,02h,0Ah,0Ah,02h     ;  6
			DB 02h,0Ah,02h,02h,02h,02h,02h,0Ah     ;  7
			
	duck DB 09h,09h,09h,09h,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h     ;  0
        DB 09h,09h,09h,09h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Ah,0Ah     ;  1
        DB 0Ah,0Ah,09h,09h,09h,09h,0Ah,0Ah,0Ah,0Fh,0Fh,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,0Ah,0Ah,0Ah,0Ah     ;  2
        DB 0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,0Ah,0Ah,0Fh,10h,10h,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,0Ah,0Ah,0Ah     ;  3
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,0Ah,0Ah,0Fh,10h,10h,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,0Ah,0Ah     ;  4
        DB 0Ah,0Ah,02h,02h,02h,02h,02h,09h,09h,09h,09h,04h,04h,04h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h     ;  5
        DB 0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,09h,09h,09h,09h,04h,01h,04h,04h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h     ;  6
        DB 0Ah,0Ah,0Ah,0Ah,02h,02h,02h,02h,0Ah,0Ah,09h,09h,09h,09h,04h,04h,04h,04h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;  7
        DB 09h,0Ah,0Ah,0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Ah,0Ah,0Ah,0Ah,0Ah     ;  8
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,02h,02h,02h,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Ah     ;  9
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,02h,02h,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h     ; 10
        DB 09h,09h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,02h,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h     ; 11
        DB 09h,09h,09h,09h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h     ; 12
        DB 09h,09h,09h,09h,09h,09h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h     ; 13
        DB 09h,09h,09h,09h,09h,09h,09h,09h,0Ah,02h,02h,02h,02h,02h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h     ; 14
        DB 09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,02h,02h,02h,02h,02h,02h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Fh,0Ah     ; 15
        DB 0Ah,0Fh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,02h,02h,02h,02h,02h,02h,0Ah,0Ah,0Ah,0Ah,0Ah     ; 16
        DB 0Ah,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,02h,02h,02h,02h,02h,0Ah,0Ah,0Ah     ; 17
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Fh,0Fh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,02h,02h,02h,02h,0Ah,0Ah     ; 18
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Fh,0Fh,0Fh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Eh,02h,02h,02h,02h     ; 19
        DB 02h,0Ah,0Ah,0Ah,0Ah,0Ah,0Fh,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Eh,09h,09h,02h     ; 20
        DB 02h,02h,02h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Eh,0Eh,09h,0Eh,09h,09h     ; 21
        DB 09h,0Eh,02h,02h,02h,0Ah,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Eh,09h,0Eh,0Eh     ; 22
        DB 09h,09h,09h,0Eh,09h,09h,0Ah,0Ah,0Ah,0Ah,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Eh     ; 23
        DB 09h,0Eh,09h,09h,09h,0Eh,0Eh,0Eh,0Eh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h     ; 24
        DB 0Eh,09h,09h,0Eh,09h,09h,09h,09h,0Eh,0Eh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h     ; 25
        DB 09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,0Eh,0Eh,0Eh,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h     ; 26

crosshair   DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ;  0
			DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ;  1
			DB 0Fh,00h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,00h,0Fh     ;  2
			DB 0Fh,00h,00h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,00h,00h,0Fh     ;  3
			DB 0Fh,00h,00h,00h,0Fh,00h,00h,00h,00h,00h,00h,0Fh,00h,00h,00h,0Fh     ;  4
			DB 0Fh,00h,00h,00h,00h,0Fh,00h,00h,00h,00h,0Fh,00h,00h,00h,00h,0Fh     ;  5
			DB 0Fh,00h,00h,00h,00h,00h,0Fh,00h,00h,0Fh,00h,00h,00h,00h,00h,0Fh     ;  6
			DB 0Fh,00h,00h,00h,00h,00h,00h,0Fh,0Fh,00h,00h,00h,00h,00h,00h,0Fh     ;  7
			DB 0Fh,00h,00h,00h,00h,00h,00h,0Fh,0Fh,00h,00h,00h,00h,00h,00h,0Fh     ;  8
			DB 0Fh,00h,00h,00h,00h,00h,0Fh,00h,00h,0Fh,00h,00h,00h,00h,00h,0Fh     ;  9
			DB 0Fh,00h,00h,00h,00h,0Fh,00h,00h,00h,00h,0Fh,00h,00h,00h,00h,0Fh     ; 10
			DB 0Fh,00h,00h,00h,0Fh,00h,00h,00h,00h,00h,00h,0Fh,00h,00h,00h,0Fh     ; 11
			DB 0Fh,00h,00h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,00h,00h,0Fh     ; 12
			DB 0Fh,00h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,00h,0Fh     ; 13
			DB 0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh     ; 14
			DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ; 15
			
aimer_backup db 16 dup(16 dup(0))
duck_backup db 25 dup(27 dup(0))

aimx dw 152
aimy dw 92
duckx dw 280
ducky dw 30
lasttime db 0
duckx2 dw 280
ducky2 dw 70
lasttime2 db 0
duckx3 dw 70
ducky3 dw 110
lasttime3 db 0
secondcheck db 0
timecheck_n db 0

randomarray dw 10,0,70,0,30,0,110,0,90,0,20,0,70,0,50,0,10,0,100
randomarrayindex dw 0


.code
main proc

	mov ax,@data
	mov ds,ax
	
	mov al, 2
	mov dx, offset file_name
	mov ah, 3dh
	int 21h
	jc make_file
	mov file_handle, ax
	jmp exist
	
	make_file:
		mov ah, 3ch
		mov cx, 0
		mov dx, offset file_name
		mov ah, 3ch
		int 21h
		mov file_handle, ax

	exist:
	
	mov  bx,file_handle
    mov  dx,offset stats_array
    mov  cx,50
    mov ah,3Fh
	mov al,0
	int 21h
	
	mov bx,file_handle
	mov ah,3Eh
	int 21h
	
	menu:
	mov round,0
	call DrawLogo
	call DrawOptions
	call OptionSelector
	
	cmp endgame,1
	jne notquit
	
	mov al, 13h            
	mov ah, 00h
	int 10H
	mov ah, 4ch
	int 21h
	
	notquit:
	
	call DrawName
	call next_round
	call DrawGame
	call DrawBoard
	call backup_crosshair
	call backup_duck
	call draw_crosshair
	
	gameloop:
		call move_ducks_round
		call DrawBoard
	
		mov ah, 6
		mov dl, 255
		int 21h
		jz gameloop
		
		cmp al,"w"
		je moveup
		cmp al,"a"
		je moveleft
		cmp al,"s"
		je movedown
		cmp al,"d"
		je moveright
		cmp al,"p"
		je paused_loop
		cmp al,"l"
		jne gameloop
		call shoot_aim_round
		jmp gameloop
		
		
		paused_loop:
		
			mov dl,14
			mov dh,23
			mov bh,0
			mov ah,2
			int 10h
			mov dx,offset gamescreen_paused
			mov ah,9
			int 21h
		
			mov ah, 6
			mov dl, 255
			int 21h
			
			cmp al,"p"
			je unpause
			
			cmp al,"x"
			je menu
			
			jmp paused_loop
			
			unpause:
				mov dl,14
				mov dh,23
				mov bh,0
				mov ah,2
				int 10h
				mov dx,offset unpaused
				mov ah,9
				int 21h
				jmp gameloop
				
		moveup:
			mov al,1
			jmp callmove
		movedown:
			mov al,3
			jmp callmove
		moveleft:
			mov al,4
			jmp callmove
		moveright:
			mov al,2
			jmp callmove
		callmove:
			call aim
			jmp gameloop
				
	jmp gameloop
	
	gameloop_exit:
	
	mov al, 13h            
	mov ah, 00h
	int 10H
	mov ah, 4ch
	int 21h
main endp

OptionSelector proc
	mov boxcolor,1011b
	CALL DrawSelectorBox
	options_loop:
		mov ah, 6
		mov dl, 255
		int 21h
		jz options_loop

        cmp al,"w"
        je select_up

        cmp al,"s"
        je select_down

        cmp al,13
        je select_enter 
		
		jmp options_loop
		
		select_up:
			mov boxcolor,0000b
			CALL DrawSelectorBox
			cmp options_selected,1
			jne selectup
			mov options_selected,3
			jmp selection_change
			selectup:
				mov al,options_selected
				sub al,1
				mov options_selected,al
				jmp selection_change
		select_down:
			mov boxcolor,0000b
			CALL DrawSelectorBox
			cmp options_selected,3
			jne selectdown
			mov options_selected,1
			jmp selection_change
			selectdown:
				mov al,options_selected
				add al,1
				mov options_selected,al
				jmp selection_change
			jmp selection_change
		select_enter:
			cmp options_selected,1
			je OptionSelector_exit
			cmp options_selected,2
			jne opt3
			CALL DrawHelp
			CALL DrawLogo
			CALL DrawOptions
			jmp selection_change
			opt3:
			mov endgame,1
			jmp OptionSelector_exit
			
		selection_change:
			mov boxcolor,1011b
			CALL DrawSelectorBox
			jmp options_loop
			
	
OptionSelector_exit:
ret
OptionSelector endp

DrawSelectorBox proc

	cmp options_selected,1
	jne twobox
	mov box_x,120
	mov box_y,112
	jmp donebox
	twobox:
	cmp options_selected,2
	jne threebox
	mov box_x,120
	mov box_y,136
	jmp donebox
	threebox:
	mov box_x,120
	mov box_y,160
	
	donebox:

	mov cx,box_x
	mov al, boxcolor
	mov ah, 0ch
	mov x_iterator,0
	boxer1a:
		mov dx,box_y
		int 10h
		add dx,22
		int 10h
		inc cx
		inc x_iterator
		cmp x_iterator,71
		jl boxer1a
		
	mov dx,box_y
	mov al, boxcolor
	mov ah, 0ch
	mov y_iterator,0
	boxer1b:
		mov cx,box_x
		int 10h
		add cx,70
		int 10h
		inc dx
		inc y_iterator
		cmp y_iterator,22
		jl boxer1b

ret
DrawSelectorBox endp

DrawGame proc
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov cx,0
	mov dx,0
	mov y_iterator,0
	mov x_iterator,0
	gamescreenloopo1:
		gamescreenloopi1:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,320
			jl gamescreenloopi1
			
		mov x_iterator,0
		mov cx,0
		inc dx
		inc y_iterator
		cmp y_iterator,184
		jl gamescreenloopo1
	
	mov cx,0
	mov dx,152
	mov y_iterator,0
	mov x_iterator,0
	gamescreenloopo2:
		gamescreenloopi2:
			mov al, 0110b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,320
			jl gamescreenloopi2
			
		mov x_iterator,0
		mov cx,0
		inc dx
		inc y_iterator
		cmp y_iterator,32
		jl gamescreenloopo2
		
	mov cx,0
	mov dx,140
	mov y_iterator,0
	mov x_iterator,0
	gamescreenloopo3:
		gamescreenloopi3:
			mov al, 1010b
			mov ah, 0ch
			int 10h
			inc cx
			inc x_iterator
			cmp x_iterator,320
			jl gamescreenloopi3
			
		mov x_iterator,0
		mov cx,0
		inc dx
		inc y_iterator
		cmp y_iterator,32
		jl gamescreenloopo3
		
	
	mov box_x,0
	mov sprite_y,0
	mov x_iterator,0
	mov y_iterator,0
	mov z_iterator,0
	grassloop:
		mov si,0
		mov y_iterator,0
		mov cx,box_x
		mov dx,140
		outerloop:
			innerloop:
				mov ah,0ch
				mov al,grass[si]
				int 10h
				inc cx
				inc x_iterator
				inc si
				cmp x_iterator,8
				jl innerloop
				
			mov x_iterator,0
			mov cx,box_x
			inc dx
			inc y_iterator
			cmp y_iterator,8
			jl outerloop
	
	inc z_iterator
	add box_x,8
	cmp z_iterator,40
	jl grassloop
	
	
	mov box_x,40
	mov x_iterator,0
	mov y_iterator,0
	mov z_iterator,0
	treeloop:
		mov si,0
		mov y_iterator,0
		mov cx,22
		mov dx,box_x
		treeout:
			treein:
				mov ah,0ch
				mov al,tree[si]
				int 10h
				inc cx
				inc x_iterator
				inc si
				cmp x_iterator,8
				jl treein
				
			mov x_iterator,0
			mov cx,22
			inc dx
			inc y_iterator
			cmp y_iterator,8
			jl treeout
	
	inc z_iterator
	add box_x,8
	cmp z_iterator,14
	jl treeloop
	
	mov box_y,0
	leaferlooper:
		mov box_x,40
		mov x_iterator,0
		mov y_iterator,0
		mov z_iterator,0
		leavesloop:
			mov si,0
			mov y_iterator,0
			mov cx,box_y
			mov dx,box_x
			leavesout:
				leavesin:
					mov ah,0ch
					mov al,leaves[si]
					int 10h
					inc cx
					inc x_iterator
					inc si
					cmp x_iterator,8
					jl leavesin
					
				mov x_iterator,0
				mov cx,box_y
				inc dx
				inc y_iterator
				cmp y_iterator,8
				jl leavesout
		
		inc z_iterator
		add box_x,8
		cmp z_iterator,7
		jl leavesloop
		
	add box_y,8
	cmp box_y,56
	jl leaferlooper
	
	mov box_x,48
	mov x_iterator,0
	mov y_iterator,0
	mov z_iterator,0
	leavesloop1:
		mov si,0
		mov y_iterator,0
		mov cx,56
		mov dx,box_x
		leavesout1:
			leavesin1:
				mov ah,0ch
				mov al,leaves[si]
				int 10h
				inc cx
				inc x_iterator
				inc si
				cmp x_iterator,8
				jl leavesin1
				
			mov x_iterator,0
			mov cx,56
			inc dx
			inc y_iterator
			cmp y_iterator,8
			jl leavesout1
	
	inc z_iterator
	add box_x,8
	cmp z_iterator,2
	jl leavesloop1
	
	mov box_x,10
	mov x_iterator,0
	mov y_iterator,0
	mov z_iterator,0
	leavesloop2:
		mov si,0
		mov y_iterator,0
		mov cx,box_x
		mov dx,92
		leavesout2:
			leavesin2:
				mov ah,0ch
				mov al,leaves[si]
				int 10h
				inc cx
				inc x_iterator
				inc si
				cmp x_iterator,8
				jl leavesin2
				
			mov x_iterator,0
			mov cx,box_x
			inc dx
			inc y_iterator
			cmp y_iterator,8
			jl leavesout2
	
	inc z_iterator
	add box_x,8
	cmp z_iterator,4
	jl leavesloop2
	
ret
DrawGame endp

DrawBoard proc
	
	call timecheck
	call duckcheck
	call update_score
	call update_timer
	mov si,offset ducks
	call update_two
	mov si,offset shots
	call update_two
	mov si,offset round
	call update_two
		
	mov dl,0
	mov dh,24
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset gamescreen_round
	mov ah,9
	int 21h
	mov dx,offset round
	mov ah,9
	int 21h
	
	mov dl,28
	mov dh,24
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset gamescreen_shots
	mov ah,9
	int 21h
	mov dx,offset shots
	mov ah,9
	int 21h
	
	mov dl,15
	mov dh,24
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset gamescreen_ducks
	mov ah,9
	int 21h
	mov dx,offset ducks
	mov ah,9
	int 21h
	
	mov dl,0
	mov dh,23
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset gamescreen_timer
	mov ah,9
	int 21h
	mov dx,offset timer
	mov ah,9
	int 21h
	
	mov dl,28
	mov dh,23
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset gamescreen_score
	mov ah,9
	int 21h
	mov dx,offset SCORE
	mov ah,9
	int 21h

ret
DrawBoard endp

DrawName proc

	call DrawLogo
	
	mov dl,8
	mov dh,15
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset entername
	mov ah,9
	int 21h
	
	mov dx, offset playername
	mov ah, 0ah
	int 21h
	mov bx,0
	mov bl, playername[1]
	mov playername[6], '$'
	mov dx, offset playername + 2
	mov ah, 9
	int 21h 
	
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov dl,0
	mov dh,0
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset stats_array
	mov ah,9
	int 21h
	
	mov ah,2Ch
	int 21h
	mov secondcheck,dh
	
	statsdelayer:
		mov ah,2Ch
		int 21h
		
		cmp dh,secondcheck
		jl DrawName_exit
		add secondcheck,5
		cmp dh,secondcheck
		jg DrawName_exit
		sub secondcheck,5
		jmp statsdelayer
		
DrawName_exit:

ret
DrawName endp

DrawHelp proc

	CALL DrawLogo
	
	mov dl, 2
	mov dh, 15
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset helpa
	mov ah,9
	int 21h
	mov dl, 2
	mov dh, 17
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset helpb
	mov ah,9
	int 21h
	mov dl, 2
	mov dh, 19
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset helpc
	mov ah,9
	int 21h
	mov dl, 2
	mov dh, 21
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset helpd
	mov ah,9
	int 21h
	
	help_looper:
		mov ah, 6
		mov dl, 255
		int 21h
		jz help_looper
		cmp al,"x"
		jne help_looper

ret
DrawHelp endp

DrawOptions proc

	mov dl,16
	mov dh,15
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset options_play
	mov ah,9
	int 21h
	
	mov dl,16
	mov dh,18
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset options_help
	mov ah,9
	int 21h
	
	mov dl,16
	mov dh,21
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset options_quit
	mov ah,9
	int 21h
	

ret
DrawOptions endp

DrawLogo proc
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	; drawing letter D
	
	mov cx,40  ;-20
	mov dx,10  ;-5
	mov y_iterator,0
	mov x_iterator,0
	outerloop1:
		innerloop1:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloop1
			
		mov x_iterator,0
		mov cx,40
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerloop1
		
	mov cx,55
	mov dx,15
	mov y_iterator,0
	mov x_iterator,0
	outerloop2:
		innerloop2:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloop2
			
		mov x_iterator,0
		mov cx,55
		inc dx
		inc y_iterator
		cmp y_iterator,20
		jl outerloop2

		
	; drawing letter U
	
	mov cx,80
	mov dx,10
	mov y_iterator,0
	mov x_iterator,0
	outerloop3:
		innerloop3:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloop3
			
		mov x_iterator,0
		mov cx,80
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerloop3
		
	mov cx,90
	mov dx,10
	mov y_iterator,0
	mov x_iterator,0
	outerloop4:
		innerloop4:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloop4
			
		mov x_iterator,0
		mov cx,90
		inc dx
		inc y_iterator
		cmp y_iterator,25
		jl outerloop4
		
	; drawing letter C
	
	mov cx,120
	mov dx,10
	mov y_iterator,0
	mov x_iterator,0
	outerloop5:
		innerloop5:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloop5
			
		mov x_iterator,0
		mov cx,120
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerloop5
		
	mov cx,135
	mov dx,16
	mov y_iterator,0
	mov x_iterator,0
	outerloop6:
		innerloop6:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,15
			jl innerloop6
			
		mov x_iterator,0
		mov cx,135
		inc dx
		inc y_iterator
		cmp y_iterator,17
		jl outerloop6
		
	; drawing letter K
	
	mov cx,160
	mov dx,10
	mov y_iterator,0
	mov x_iterator,0
	outerloop7:
		innerloop7:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloop7
			
		mov x_iterator,0
		mov cx,160
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerloop7
		
	mov cx,170
	mov dx,10
	mov y_iterator,0
	mov x_iterator,0
	outerloop8:
		innerloop8:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloop8
			
		mov x_iterator,0
		mov cx,170
		inc dx
		inc y_iterator
		cmp y_iterator,5
		jl outerloop8
		
	mov cx,170
	mov dx,40
	mov y_iterator,0
	mov x_iterator,0
	outerloop9:
		innerloop9:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloop9
			
		mov x_iterator,0
		mov cx,170
		inc dx
		inc y_iterator
		cmp y_iterator,5
		jl outerloop9
		
		
	mov cx,185
	mov dx,25
	mov y_iterator,0
	mov x_iterator,0
	outerloopa:
		innerloopa:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,5
			jl innerloopa
			
		mov x_iterator,0
		mov cx,185
		inc dx
		inc y_iterator
		cmp y_iterator,5
		jl outerloopa
		
	; draw line 
	
	mov cx,30
	mov dx,50
	mov al, 1011b
	mov ah, 0ch
	mov x_iterator,0
	liner:
		int 10h ; set pixel. 
		inc cx
		inc x_iterator
		cmp x_iterator,270
		jl liner
		
	; drawing letter S
	
	mov cx,140  
	mov dx,55  
	mov y_iterator,0
	mov x_iterator,0
	outerloopb:
		innerloopb:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloopb
			
		mov x_iterator,0
		mov cx,140
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerloopb
		
	mov cx,155
	mov dx,65
	mov y_iterator,0
	mov x_iterator,0
	outerloopc:
		innerloopc:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,15
			jl innerloopc
			
		mov x_iterator,0
		mov cx,155
		inc dx
		inc y_iterator
		cmp y_iterator,5
		jl outerloopc
		
	mov cx,140
	mov dx,75
	mov y_iterator,0
	mov x_iterator,0
	outerloopd:
		innerloopd:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,15
			jl innerloopd
			
		mov x_iterator,0
		mov cx,140
		inc dx
		inc y_iterator
		cmp y_iterator,5
		jl outerloopd
		
	; drawing letter H
	
	mov cx,180  
	mov dx,55  
	mov y_iterator,0
	mov x_iterator,0
	outerloope:
		innerloope:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloope
			
		mov x_iterator,0
		mov cx,180
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerloope
		
	mov cx,190
	mov dx,55
	mov y_iterator,0
	mov x_iterator,0
	outerloopf:
		innerloopf:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloopf
			
		mov x_iterator,0
		mov cx,190
		inc dx
		inc y_iterator
		cmp y_iterator,15
		jl outerloopf
		
	mov cx,190
	mov dx,75
	mov y_iterator,0
	mov x_iterator,0
	outerloopg:
		innerloopg:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloopg
			
		mov x_iterator,0
		mov cx,190
		inc dx
		inc y_iterator
		cmp y_iterator,15
		jl outerloopg
	
	; drawing letter O
	
	mov cx,220  
	mov dx,55  
	mov y_iterator,0
	mov x_iterator,0
	outerlooph:
		innerlooph:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerlooph
			
		mov x_iterator,0
		mov cx,220
		inc dx
		inc y_iterator
		cmp y_iterator,35
		jl outerlooph
		
	mov cx,230
	mov dx,60
	mov y_iterator,0
	mov x_iterator,0
	outerloopi:
		innerloopi:
			mov al, 0000b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloopi
			
		mov x_iterator,0
		mov cx,230
		inc dx
		inc y_iterator
		cmp y_iterator,25
		jl outerloopi
		
	; drawing letter T
	
	mov cx,260  
	mov dx,55  
	mov y_iterator,0
	mov x_iterator,0
	outerloopj:
		innerloopj:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,30
			jl innerloopj
			
		mov x_iterator,0
		mov cx,260
		inc dx
		inc y_iterator
		cmp y_iterator,10
		jl outerloopj
		
	mov cx,270
	mov dx,65
	mov y_iterator,0
	mov x_iterator,0
	outerloopk:
		innerloopk:
			mov al, 1001b
			mov ah, 0ch
			int 10h ; set pixel. 
			inc cx
			inc x_iterator
			cmp x_iterator,10
			jl innerloopk
			
		mov x_iterator,0
		mov cx,270
		inc dx
		inc y_iterator
		cmp y_iterator,25
		jl outerloopk

ret
DrawLogo endp


move_ducks_round proc

	call move_duck
	cmp round_n,4
	jne move_ducks_round_exit
	
	call move_duck2
	call move_duck3
	
move_ducks_round_exit:
ret
move_ducks_round endp

move_duck proc

	mov ah,2Ch
	int 21h
	
	cmp dl,lasttime
	jl canmove
	add lasttime,8
	cmp dl,lasttime
	jl inclasttime
	
	canmove:
	mov lasttime,dl
	mov cx,duckx
	mov dx,ducky
	call erase_duck
	dec duckx
	mov cx,duckx
	mov dx,ducky
	call backup_duck
	
	mov cx,duckx
	cmp cx,70
	je despawn
	
	mov cx,duckx
	mov dx,ducky
	call draw_duck
	jmp move_duck_exit
	
	killed:
	add score_n,50
	dec ducks_n
	
	despawn:
	mov duckx,280
	mov si,randomarrayindex
	mov ax,word ptr randomarray[si]
	mov ducky,ax
	inc randomarrayindex
	jmp move_duck_exit
	
inclasttime:
sub lasttime,8
move_duck_exit:
ret
move_duck endp

move_duck2 proc

	mov ah,2Ch
	int 21h
	
	cmp dl,lasttime2
	jl canmove2
	add lasttime2,8
	cmp dl,lasttime2
	jl inclasttime2
	
	canmove2:
	mov lasttime2,dl
	mov cx,duckx2
	mov dx,ducky2
	call erase_duck
	dec duckx2
	mov cx,duckx2
	mov dx,ducky2
	call backup_duck
	
	mov cx,duckx2
	cmp cx,70
	je despawn2
	
	mov cx,duckx2
	mov dx,ducky2
	call draw_duck
	jmp move_duck_exit2
	
	killed2:
	add score_n,50
	dec ducks_n
	
	despawn2:
	mov duckx2,280
	mov si,randomarrayindex
	mov ax,word ptr randomarray[si]
	mov ducky2,ax
	inc randomarrayindex
	jmp move_duck_exit2
	
inclasttime2:
sub lasttime2,8
move_duck_exit2:
ret
move_duck2 endp

move_duck3 proc

	mov ah,2Ch
	int 21h
	
	cmp dl,lasttime3
	jl canmove3
	add lasttime3,8
	cmp dl,lasttime3
	jl inclasttime3
	
	canmove3:
	mov lasttime3,dl
	mov cx,duckx3
	mov dx,ducky3
	call erase_duck
	inc duckx3
	mov cx,duckx3
	mov dx,ducky3
	call backup_duck
	
	mov cx,duckx3
	cmp cx,70
	je despawn3
	
	mov cx,duckx3
	mov dx,ducky3
	call draw_duck
	jmp move_duck_exit3
	
	killed3:
	add score_n,50
	dec ducks_n
	
	despawn3:
	mov duckx3,70
	mov si,randomarrayindex
	mov ax,word ptr randomarray[si]
	mov ducky3,ax
	inc randomarrayindex
	jmp move_duck_exit3
	
inclasttime3:
sub lasttime3,8
move_duck_exit3:
ret
move_duck3 endp
	
draw_duck proc
	
	mov si,0
	mov y_iterator,0
	mov x_iterator,0
	mov z_iterator,cx
	spriteloopo:
		spriteloopi:
			mov ah,0ch
			mov al,duck[si]
			int 10h
			inc cx
			inc x_iterator
			inc si
			cmp x_iterator,27
			jl spriteloopi
			
		mov x_iterator,0
		mov cx,z_iterator
		inc dx
		inc y_iterator
		cmp y_iterator,25
		jl spriteloopo
		
ret
draw_duck endp

backup_duck proc
	
	mov si,0
	mov y_iterator,0
	mov x_iterator,0
	mov z_iterator,cx
	duckbackup1:
		duckbackup2:
			mov ah,0dh
			int 10h
			mov duck_backup[si],1001b
			inc cx
			inc x_iterator
			inc si
			cmp x_iterator,27
			jl duckbackup2
			
		mov x_iterator,0
		mov cx,z_iterator
		inc dx
		inc y_iterator
		cmp y_iterator,25
		jl duckbackup1
		
ret
backup_duck endp

erase_duck proc
		
	mov si,0	
	mov y_iterator,0
	mov x_iterator,0
	mov z_iterator,cx
	clearloopo:
		clearloopi:
			mov ah,0ch
			mov al,duck_backup[si]
			int 10h
			inc cx
			inc x_iterator
			inc si
			cmp x_iterator,27
			jl clearloopi
			
		mov x_iterator,0
		mov cx,z_iterator
		inc dx
		inc y_iterator
		cmp y_iterator,25
		jl clearloopo
		
ret
erase_duck endp
	
aim proc

	cmp al,1
	je upjaana
	cmp al,2
	je rightjaana
	cmp al,3
	je downjaana
	cmp al,4
	je leftjaana
	jmp aim_exit
	
	upjaana:
		call erase_crosshair
		dec aimy
		call backup_crosshair
		call draw_crosshair
		jmp aim_exit
	rightjaana:
		call erase_crosshair
		inc aimx
		call backup_crosshair
		call draw_crosshair
		jmp aim_exit
	downjaana:
		call erase_crosshair
		inc aimy
		call backup_crosshair
		call draw_crosshair
		jmp aim_exit
	leftjaana:
		call erase_crosshair
		dec aimx
		call backup_crosshair
		call draw_crosshair
		jmp aim_exit

aim_exit:
ret
aim endp

draw_crosshair proc
	
	mov si,0
	mov y_iterator,0
	mov x_iterator,0
	mov cx,aimx
	mov dx,aimy
	mov z_iterator,cx
	crossdraw1:
		crossdraw2:
			mov ah,0ch
			mov al,crosshair[si]
			int 10h
			inc cx
			inc x_iterator
			inc si
			cmp x_iterator,16
			jl crossdraw2
			
		mov x_iterator,0
		mov cx,z_iterator
		inc dx
		inc y_iterator
		cmp y_iterator,16
		jl crossdraw1
		
ret
draw_crosshair endp

backup_crosshair proc
	
	mov si,0
	mov y_iterator,0
	mov x_iterator,0
	mov cx,aimx
	mov dx,aimy
	mov z_iterator,cx
	crossbackup1:
		crossbackup2:
			mov ah,0dh
			int 10h
			mov aimer_backup[si],al
			inc cx
			inc x_iterator
			inc si
			cmp x_iterator,16
			jl crossbackup2
			
		mov x_iterator,0
		mov cx,z_iterator
		inc dx
		inc y_iterator
		cmp y_iterator,16
		jl crossbackup1
		
ret
backup_crosshair endp

erase_crosshair proc
		
	mov si,0
	mov y_iterator,0
	mov x_iterator,0
	mov cx,aimx
	mov dx,aimy
	mov z_iterator,cx
	crosserase1:
		crosserase2:
			mov ah,0ch
			mov al,aimer_backup[si]
			int 10h
			inc cx
			inc x_iterator
			inc si
			cmp x_iterator,16
			jl crosserase2
			
		mov x_iterator,0
		mov cx,z_iterator
		inc dx
		inc y_iterator
		cmp y_iterator,16
		jl crosserase1
		
ret
erase_crosshair endp	

shoot_aim_round proc

	call shoot_aim
	cmp round_n,4
	jne shoot_aim_round_exit
	
	call shoot_aim2
	call shoot_aim3

shoot_aim_round_exit:
	dec shots_n

	mov cx,0
	mov dx,1000
	mov ax,2000h

	mov bx, ax       
	mov al, 182       
	out 43H, AL       
	mov ax, bx       
	out 42h, al        
	mov al, ah          
	out 42h, al         
	in al, 61h          
	OR al, 03h          
	out 61h, al         
	mov ah, 86h         
	int 15h             
	in al, 61h          
	and al, 0FCh        
	out 61h, al      

ret
shoot_aim_round endp

shoot_aim proc

	cmp shots_n,0
	jne shots_available
	
	call gameover      
	mov al, 13h            
	mov ah, 00h
	int 10H
	mov ah, 4ch
	int 21h	

	shots_available:

	mov cx,aimx
	add cx,8
	mov dx,aimy
	add dx,8
	
	cmp cx,duckx
	jl yeshit
	add duckx,27
	cmp cx,duckx
	jg maybehit
	cmp dx,ducky
	jl maybehit
	add ducky,25
	cmp dx,ducky
	jg nohit
	
	dec ducks_n
	add score_n,10
	sub duckx,27
	sub ducky,25
	call erase_duck
	mov duckx,280
	mov si,randomarrayindex
	mov ax,word ptr randomarray[si]
	mov ducky,ax
	inc randomarrayindex
	jmp yeshit

maybehit:
sub duckx,27
jmp yeshit
nohit:
sub ducky,25
sub duckx,27
yeshit:
ret
shoot_aim endp

shoot_aim2 proc

	cmp shots_n,0
	jne shots_available2
	
	call gameover      
	mov al, 13h            
	mov ah, 00h
	int 10H
	mov ah, 4ch
	int 21h	

	shots_available2:

	mov cx,aimx
	add cx,8
	mov dx,aimy
	add dx,8
	
	cmp cx,duckx2
	jl yeshit2
	add duckx2,27
	cmp cx,duckx2
	jg maybehit2
	cmp dx,ducky2
	jl maybehit2
	add ducky2,25
	cmp dx,ducky2
	jg nohit2
	
	dec ducks_n
	add score_n,10
	sub duckx2,27
	sub ducky2,25
	mov cx,duckx2
	mov dx,ducky2
	call erase_duck
	mov duckx2,280
	mov si,randomarrayindex
	mov ax,word ptr randomarray[si]
	mov ducky2,ax
	inc randomarrayindex
	jmp yeshit2

maybehit2:
sub duckx2,27
jmp yeshit2
nohit2:
sub ducky2,25
sub duckx2,27
yeshit2:
ret
shoot_aim2 endp

shoot_aim3 proc

	cmp shots_n,0
	jne shots_available3
	
	call gameover      
	mov al, 13h            
	mov ah, 00h
	int 10H
	mov ah, 4ch
	int 21h	

	shots_available3:

	mov cx,aimx
	add cx,8
	mov dx,aimy
	add dx,8
	
	cmp cx,duckx3
	jl yeshit3
	add duckx3,27
	cmp cx,duckx3
	jg maybehit3
	cmp dx,ducky3
	jl maybehit3
	add ducky3,25
	cmp dx,ducky3
	jg nohit3
	
	dec ducks_n
	add score_n,10
	sub duckx3,27
	sub ducky3,25
	call erase_duck
	mov duckx3,70
	mov si,randomarrayindex
	mov ax,word ptr randomarray[si]
	mov ducky3,ax
	inc randomarrayindex
	jmp yeshit3

maybehit3:
sub duckx3,27
jmp yeshit3
nohit3:
sub ducky3,25
sub duckx3,27
yeshit3:
ret
shoot_aim3 endp

next_round proc

	cmp round_n,0
		jne next_round_1
		mov shots[0],'0'
		mov shots[1],'5'
		mov shots_n,5
		
		mov ducks[0],'0'
		mov ducks[1],'1'
		mov ducks_n,1
		
		mov score[0],'0'
		mov score[1],'0'
		mov score[2],'0'
		mov score[3],'0'
		mov score_n,0
		
		mov timer[0],'0'
		mov timer[1],'5'
		mov timer[2],'0'
		mov timer_n,50
		mov round_n,1
		jmp next_round_exit
		
	next_round_1:
	cmp round_n,1
		jne next_round_2
		mov shots[0],'0'
		mov shots[1],'5'
		mov shots_n,5
		
		mov ducks[0],'0'
		mov ducks[1],'1'
		mov ducks_n,1
		
		mov timer[0],'0'
		mov timer[1],'5'
		mov timer[2],'0'
		mov timer_n,50
		mov round_n,2
		jmp next_round_exit
		
	next_round_2:
		cmp round_n,2
		jne next_round_3
		mov shots[0],'0'
		mov shots[1],'5'
		mov shots_n,5
		
		mov ducks[0],'0'
		mov ducks[1],'1'
		mov ducks_n,1
		
		mov timer[0],'0'
		mov timer[1],'5'
		mov timer[2],'0'
		mov timer_n,50
		mov round_n,3
		jmp next_round_exit
		
		next_round_3:
		cmp round_n,3
		jne next_round_4
		mov shots[0],'0'
		mov shots[1],'9'
		mov shots_n,9
		
		mov ducks[0],'0'
		mov ducks[1],'5'
		mov ducks_n,5
		
		mov timer[0],'0'
		mov timer[1],'5'
		mov timer[2],'0'
		mov timer_n,50
		mov round_n,4
		jmp next_round_exit
	
	next_round_4:
	call gameover      
	mov al, 13h            
	mov ah, 00h
	int 10H	
	mov ah, 4ch
	int 21h	
	jmp next_round_exit

next_round_exit:
mov al,shots_n
mov shots_round,al
ret
next_round endp

update_two proc

	mov dx,0
	mov ah,0
	mov al,[si+3]
	mov bx,10
	div bx
	
	add al,'0'
	mov [si],al
	add dl,'0'
	mov [si+1],dl
	
ret
update_two endp

update_score proc

	mov dx,0
	mov ax,score_n
	mov bx,10
	div bx
	add dl,'0'
	mov score[3],dl
	mov dx,0
	div bx
	add dl,'0'
	mov score[2],dl
	mov dx,0
	div bx
	add dl,'0'
	mov score[1],dl
	mov dx,0
	div bx
	add dl,'0'
	mov score[0],dl
	
ret
update_score endp

update_timer proc

	mov dx,0
	mov ah,0
	mov al,timer_n
	mov bx,10
	div bx
	add dl,'0'
	mov timer[3],dl
	mov dx,0
	div bx
	add dl,'0'
	mov timer[2],dl
	mov dx,0
	div bx
	add dl,'0'
	mov timer[1],dl
	mov dx,0
	
ret
update_timer endp

timecheck proc

	cmp timer_n,0
	jne check_time
	
	call gameover      
	mov al, 13h            
	mov ah, 00h
	int 10H
	mov ah, 4ch
	int 21h	
	
	check_time:

	mov ah,2Ch
	int 21h
	
	cmp dh,timecheck_n
	jl secondpassed
	add timecheck_n,1
	cmp dh,timecheck_n
	jl dec_secs_2
	
	secondpassed: 
		mov timecheck_n,dh
		dec timer_n
		jmp timecheck_exit
	dec_secs_2:
		sub timecheck_n,1
	
timecheck_exit:
ret
timecheck endp

gameover proc
                      
	mov al, 13h            
	mov ah, 00h
	int 10H
	
	mov dl, 14
	mov dh, 9
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset gamescreen_gameover
	mov ah, 9
	int 21h 
	
	mov dl, 14
	mov dh, 11
	mov bh,0
	mov ah,2
	int 10h
	mov dx, offset playername + 2
	mov ah, 9
	int 21h 
	
	mov dl, 24
	mov dh, 11
	mov bh,0
	mov ah,2
	int 10h
	mov dx,offset score
	mov ah, 9
	int 21h 
		

		;;;;;;;;;;;;;;;;;; FILE HANDLING

	mov al, 2
	mov dx, offset file_name
	mov ah, 3dh
	int 21h

		mov si,offset stats_array
		mov cx,5
		mov bx,0
		p_l:
			mov al,'='
			cmp [si],al
			je p_h

			mov al,score[0]
			cmp [si+5],al
			jb p_h
			ja p_l_skip
			mov al,score[1]
			cmp [si+6],al
			jb p_h
			ja p_l_skip
			mov al,score[2]
			cmp [si+7],al
			jb p_h
			ja p_l_skip
			mov al,score[3]
			cmp [si+8],al
			jb p_h

			p_l_skip:
			add si,10
			inc bx
		LOOP p_l


		mov bx,file_handle
		mov ah,3Eh
		int 21h


		p_h:

			mov bp,0
			mov cx,9
			temp_loop_1:
				mov al,[si+bp]
				mov temp_stats_array2[bp],al
				inc bp
			LOOP temp_loop_1

			mov al,byte ptr playername[2]
			mov [si],al
			mov al,byte ptr playername[3]
			mov [si+1],al
			mov al,byte ptr playername[4]
			mov [si+2],al
			mov al,score[0]
			mov byte ptr [si+5],al
			mov al,score[1]
			mov byte ptr [si+6],al
			mov al,score[2]
			mov byte ptr [si+7],al
			mov al,score[3]
			mov byte ptr [si+8],al
			mov al,'0'
			add al,round_n
			mov byte ptr [si+9],al

			add si,9

			mov cx,4
			sub cx,bx
			s_l:

				mov bx,cx
				mov bp,0
				mov cx,9
				temp_loop_2:
					mov al,[si+bp]
					mov temp_stats_array1[bp],al
					inc bp
				LOOP temp_loop_2
				
				mov bp,0
				mov cx,9
				temp_loop_3:
					mov al,temp_stats_array2[bp]
					mov [si+bp],al
					inc bp
				LOOP temp_loop_3
				
				mov bp,0
				mov cx,9
				temp_loop_4:
					mov al,temp_stats_array1[bp]
					mov temp_stats_array2[bp],al
					inc bp
				LOOP temp_loop_4

			mov cx,bx
			add si,9
			LOOP s_l


		mov bx,file_handle
		mov dx,offset stats_array
		mov cx,45
		mov ah,40h
		mov al,0
		int 21h

		mov bx,file_handle
		mov ah,3Eh
		int 21h
	;;;;;;;;;;;;;;;;;; FILE HANDLING END

		
	mov ah,2Ch
	int 21h
	mov secondcheck,dh
	
	gameoverdelayer:
		mov ah,2Ch
		int 21h
		
		cmp dh,secondcheck
		jl gameover_exit
		add secondcheck,5
		cmp dh,secondcheck
		jg gameover_exit
		sub secondcheck,5
		jmp gameoverdelayer
		
gameover_exit:
ret
gameover endp

duckcheck proc

	cmp ducks_n,0
	jne duckcheck_exit
	
	call next_round
	
duckcheck_exit:
ret
duckcheck endp

mov ah, 4ch
int 21h
end