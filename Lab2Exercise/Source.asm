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
	

	exit
main ENDP
END main