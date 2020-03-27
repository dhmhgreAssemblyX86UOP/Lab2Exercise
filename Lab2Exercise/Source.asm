TITLE 2D array addressing
INCLUDE Irvine32.inc

.data

mCalculating	BYTE "Calculating...",0dh,0ah,0
mAccessElement	BYTE "The value of the element a[2,2] is : ",0
mResultSum		BYTE "The sum a[2,2]+z= :",0
mResultDiff		BYTE "The sum a[2,2]-z= :",0

array1 SDWORD 00d, 10d, 20d, 30d
ElementsPerRow = ($-array1)/TYPE array1
	   SDWORD 01d, 11d, 21d, 31d
	   SDWORD 02d, 12d, 22d, 32d
	   SDWORD 03d, 13d, 23d, 33d

x BYTE 2d
y BYTE 2d

z SWORD -30d

.code
main PROC
	; *** ASKISI 1 ***
	mov edx, OFFSET mCalculating	; Load EDX with the mCalculating string OFFSET
	call WriteString				; Show the message on screen

	; Calculating address of array1(2,2).
	; The result will be 32bit hence the arithmetic operations 
	; are performed on 32bit registers
	movzx ebx, x					; move the row number into ebx register 
	shl   ebx, 2					; EBX = row * 4 
	movzx ecx, y					; move the row number into ecx register 
	add   ebx,ecx					; EBX = row * 4 + column
	shl   ebx,2						; EBX = (row * 4 + column) * 4

	mov eax,[array1+ebx]			; mov designated array element to ECX using INDIRECT ADDRESSING
	mov edx, OFFSET mAccessElement  ; Load EDX with the mAccessElement string OFFSET
	call WriteString				; Show the message on screen
	call WriteInt					; Show the element value on screen
	call Crlf						; Go to next line

	movsx ecx,z						; move the value of z into ECX
	add	  eax,ecx					; EAX = 22 + ECX = -8
	mov edx, OFFSET mResultSum		; Load EDX with the mResultSum string OFFSET
	call WriteString				; Show the message on screen
	call WriteInt					; Show the element value on screen
	call Crlf						; Go to next line

	mov eax,[array1+ebx]			; move the value of z into EBX
	sub	 eax,ECX					; EAX = 22 - ECX = 52
	mov edx, OFFSET mResultDiff		; Load EDX with the mResultSum string OFFSET
	call WriteString				; Show the message on screen
	call WriteInt					; Show the element value on screen
	call Crlf						; Go to next line

	; *** ASKISI 2 ***


	exit
main ENDP
END main