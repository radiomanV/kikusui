;
;  D48 V3.4.1 8048 Disassembly of kikusui_fco_1120_nmc27c64q.bin
;  2023/05/29 11:31
;

; Cold entry point
ORG	0
	JMP	L0286		    ; 0000 - 44 86

; External interrupt vector
ORG 3
	JMP	L0131		    ; 0003 - 24 31

; Timer/counter interrupt vector handling routine
ORG	7
	SEL	RB1		        ; 0007 - d5
	STOP	TCNT	    ; 0008 - 65
	MOV	R5,A		    ; 0009 - ad
	MOV	R0,#7CH		    ; 000a - b8 7c
	MOV	A,@R0		    ; 000c - f0
	MOV	R2,A		    ; 000d - aa
	MOV	R0,#7FH		    ; 000e - b8 7f
	MOV	A,@R0		    ; 0010 - f0
	MOV	R1,A		    ; 0011 - a9
	MOV	A,#0FAH		    ; 0012 - 23 fa
	MOV	T,A		        ; 0014 - 62
	MOV	A,@R1		    ; 0015 - f1
	JF1	L001A		    ; 0016 - 76 1a
	JMP	L001C		    ; 0018 - 04 1c
L001A:	DEC	R1		    ; 001a - c9
	SWAP	A		    ; 001b - 47
L001C:	ANL	A,#0F0H	    ; 001c - 53 f0
	ORL	A,R2		    ; 001e - 4a
	SWAP	A		    ; 001f - 47
	OUTL	P1,A	    ; 0020 - 39
	DEC	R2		        ; 0021 - ca
	CPL	F1		        ; 0022 - b5
	CLR	C		        ; 0023 - 97
	MOV	A,R1		    ; 0024 - f9
	ADD	A,#0A0H		    ; 0025 - 03 a0
	JC	L0037		    ; 0027 - f6 37
	MOV	R2,#9		    ; 0029 - ba 09
	IN	A,P1		    ; 002b - 09
	MOV	R3,A		    ; 002c - ab
	MOV	R0,#5FH		    ; 002d - b8 5f
	MOV	A,@R0		    ; 002f - f0
	OUTL	P1,A	    ; 0030 - 39
	ORL	P1,#0A0H	    ; 0031 - 89 a0
	MOV	A,R3		    ; 0033 - fb
	OUTL	P1,A	    ; 0034 - 39
	MOV	R1,#64H		    ; 0035 - b9 64
L0037:	MOV	R0,#7CH	    ; 0037 - b8 7c
	MOV	A,R2		    ; 0039 - fa
	MOV	@R0,A		    ; 003a - a0	 
	MOV	R0,#7FH		    ; 003b - b8 7f
	MOV	A,R1		    ; 003d - f9
	MOV	@R0,A		    ; 003e - a0
	MOV	A,R5		    ; 003f - fd
	STRT	T		    ; 0040 - 55
	SEL	RB0		        ; 0041 - c5
	RETR			    ; 0042 - 93

; Startup routine. Initialize timer interrupts for display multiplexing,
; perform a display test and initialize display buffer. 
L0043:	MOV	A,#0FAH	    ; 0043 - 23 fa
	MOV	T,A		        ; 0045 - 62
	STRT	T		    ; 0046 - 55
	EN	TCNTI		    ; 0047 - 25
	CLR	F1		        ; 0048 - a5
	MOV	R0,#7CH		    ; 0049 - b8 7c
	MOV	@R0,#9		    ; 004b - b0 09
	MOV	R0,#7FH		    ; 004d - b8 7f
	MOV	@R0,#64H	    ; 004f - b0 64
	MOV	R0,#7DH		    ; 0051 - b8 7d
	MOV	A,@R0		    ; 0053 - f0	
	XRL	A,#0FH		    ; 0054 - d3 0f
	JZ	L0073		    ; 0056 - c6 73
	MOV	A,#0FH		    ; 0058 - 23 0f
	MOV	@R0,A		    ; 005a - a0	 
	MOV	R0,#5FH		    ; 005b - b8 5f
	MOV	@R0,#0FH	    ; 005d - b0 0f
	MOV	R5,#0AH		    ; 005f - bd 0a
	MOV	R7,#0		    ; 0061 - bf 00
L0063:	MOV	R3,#5	    ; 0063 - bb 05
	MOV	R0,#64H		    ; 0065 - b8 64
	MOV	A,R7		    ; 0067 - ff
L0068:	MOV	@R0,A	    ; 0068 - a0	 
	DEC	R0		        ; 0069 - c8
	DJNZ	R3,L0068    ; 006a - eb 68
	ADD	A,#11H		    ; 006c - 03 11
	MOV	R7,A		    ; 006e - af
	CALL	L048F		; 006f - 94 8f
	DJNZ	R5,L0063	; 0071 - ed 63
L0073:	CALL	L0484	; 0073 - 94 84
	MOV	R0,#64H		    ; 0075 - b8 64
	MOV	@R0,#0AH	    ; 0077 - b0 0a
	MOV	R0,#60H		    ; 0079 - b8 60
	MOV	@R0,#0A0H	    ; 007b - b0 a0
	DEC	R0		        ; 007d - c8
	MOV	@R0,#1		    ; 007e - b0 01
	MOV	R0,#5EH		    ; 0080 - b8 5e
	MOV	@R0,#0		    ; 0082 - b0 00
	RET			        ; 0084 - 83

L0085:	MOV	R5,#3		; 0085 - bd 03
L0087:	MOV	R6,#37H		; 0087 - be 37
L0089:	MOV	R4,#0C8H	; 0089 - bc c8
L008B:	MOV	R1,#10H		; 008b - b9 10
	MOVX	A,@R1		; 008d - 81
	JB3	L0097		    ; 008e - 72 97
	DJNZ	R4,L008B	; 0090 - ec 8b
	DJNZ	R6,L0089	; 0092 - ee 89
	DJNZ	R5,L0087	; 0094 - ed 87
	MOV	A,R5		    ; 0096 - fd
L0097:	RET			    ; 0097 - 83

L0098:	MOV	R3,#5		; 0098 - bb 05
	MOV	R0,#64H		    ; 009a - b8 64
	MOV	R1,#6EH		    ; 009c - b9 6e
L009E:	MOV	A,@R0		; 009e - f0
	MOV	R2,A		    ; 009f - aa
	MOV	A,#0F0H		    ; 00a0 - 23 f0
	ANL	A,R2		    ; 00a2 - 5a
	MOV	R4,A		    ; 00a3 - ac
	MOV	A,#3		    ; 00a4 - 23 03
	ORL	A,R4		    ; 00a6 - 4c
	SWAP	A		    ; 00a7 - 47
	MOV	R5,A		    ; 00a8 - ad
	XRL	A,#3AH		    ; 00a9 - d3 3a
	JNZ	L00B0		    ; 00ab - 96 b0
	ORL	A,#20H		    ; 00ad - 43 20
	MOV	R5,A		    ; 00af - ad
L00B0:	MOV	A,R5		; 00b0 - fd
	MOV	@R1,A		    ; 00b1 - a1
	MOV	A,#0FH		    ; 00b2 - 23 0f
	ANL	A,R2		    ; 00b4 - 5a
	MOV	R2,A		    ; 00b5 - aa
	MOV	A,#30H		    ; 00b6 - 23 30
	ORL	A,R2		    ; 00b8 - 4a
	INC	R1		        ; 00b9 - 19
	MOV	R5,A		    ; 00ba - ad
	XRL	A,#3AH		    ; 00bb - d3 3a
	JNZ	L00C2		    ; 00bd - 96 c2
	ORL	A,#20H		    ; 00bf - 43 20
	MOV	R5,A		    ; 00c1 - ad
L00C2:	MOV	A,R5		; 00c2 - fd
	MOV	@R1,A		    ; 00c3 - a1
	DEC	R0		        ; 00c4 - c8
	INC	R1		        ; 00c5 - 19
	DJNZ	R3,L009E	; 00c6 - eb 9e
	RET			        ; 00c8 - 83

L00C9:	MOV	R0,#6EH		; 00c9 - b8 6e
	MOV	R2,#0AH		    ; 00cb - ba 0a
L00CD:	MOV	A,@R0		; 00cd - f0
	MOV	R5,A		    ; 00ce - ad
	MOV	R3,#8		    ; 00cf - bb 08
L00D1:	MOV	A,R5		; 00d1 - fd
	RLC	A		        ; 00d2 - f7
	MOV	R5,A		    ; 00d3 - ad
	MOV	A,R6		    ; 00d4 - fe
	RRC	A		        ; 00d5 - 67
	MOV	R6,A		    ; 00d6 - ae
	DJNZ	R3,L00D1	; 00d7 - eb d1
	MOV	A,R6		    ; 00d9 - fe
	MOV	@R0,A		    ; 00da - a0	 
	INC	R0		        ; 00db - 18
	DJNZ	R2,L00CD	; 00dc - ea cd
	RET			        ; 00de - 83


ORG	0102H
L0102:	ANL	P2,#0BFH	; 0102 - 9a bf // pulse bit 6 port 2 (/scan_load)
	ORL	P2,#40H		    ; 0104 - 8a 40 
	MOV	R0,#13H		    ; 0106 - b8 13
	MOV	A,#1		    ; 0108 - 23 01
	MOVX	@R0,A		; 010a - 90
	MOV	A,#0		    ; 010b - 23 00
	MOVX	@R0,A		; 010d - 90
	MOV	R0,#0		    ; 010e - b8 00
	MOVX	A,@R0		; 0110 - 80
	MOV	R3,#8		    ; 0111 - bb 08
L0113:	RLC	A		    ; 0113 - f7
	MOV	R2,A		    ; 0114 - aa
	MOV	A,R6		    ; 0115 - fe
	RRC	A		        ; 0116 - 67
	MOV	R6,A		    ; 0117 - ae
	MOV	A,R2		    ; 0118 - fa
	DJNZ	R3,L0113	; 0119 - eb 13
	MOV	R0,#14H		    ; 011b - b8 14
	MOV	A,R6		    ; 011d - fe
	ANL	A,#0F8H		    ; 011e - 53 f8
	MOVX	@R0,A		; 0120 - 90
	MOV	R0,#13H		    ; 0121 - b8 13
	MOV	A,#0E0H		    ; 0123 - 23 e0
	MOVX	@R0,A		; 0125 - 90
	MOV	R0,#10H		    ; 0126 - b8 10
	MOV	A,#5CH		    ; 0128 - 23 5c
	MOVX	@R0,A		; 012a - 90
	MOV	R0,#11H		    ; 012b - b8 11
	MOV	A,#0B1H		    ; 012d - 23 b1
	MOVX	@R0,A		; 012f - 90
	RET			        ; 0130 - 83

; External interrupt handling routine 
L0131:	MOV	R7,A		; 0131 - af
	SEL	RB1				; 0132 - d5
	CALL	L013A		; 0133 - 34 3a
	SEL	RB0				; 0135 - c5
	MOV	A,R7			; 0136 - ff
	EN	TCNTI		    ; 0137 - 25
	EN	I		        ; 0138 - 05
	RETR			    ; 0139 - 93

L013A:	MOV	R0,#10H		; 013a - b8 10
	MOVX	A,@R0		; 013c - 80
	MOV	R0,#7EH		    ; 013d - b8 7e
	MOV	@R0,A		    ; 013f - a0	 
	CPL	A		        ; 0140 - 37
	MOV	R4,A		    ; 0141 - ac
	JB2	L0182		    ; 0142 - 52 82
	MOV	R0,#13H		    ; 0144 - b8 13
	MOV	A,#0C1H		    ; 0146 - 23 c1
	MOVX	@R0,A	    ; 0148 - 90
	MOV	R0,#17H		    ; 0149 - b8 17
	MOVX	A,@R0		; 014b - 80
	MOV	R1,A		    ; 014c - a9
	MOV	R0,#13H		    ; 014d - b8 13
	MOV	A,#0C0H		    ; 014f - 23 c0
	MOVX	@R0,A		; 0151 - 90
	MOV	A,#40H		    ; 0152 - 23 40
	MOVX	@R0,A		; 0154 - 90
	MOV	A,R4		    ; 0155 - fc
	JB4	L016B		    ; 0156 - 92 6b
	MOV	A,R1		    ; 0158 - f9
	XRL	A,#0B0H		    ; 0159 - d3 b0
	JZ	L01DC		    ; 015b - c6 dc
	MOV	A,R1		    ; 015d - f9
	XRL	A,#50H		    ; 015e - d3 50
	JZ	L01DC		    ; 0160 - c6 dc
	MOV	R0,#65H		    ; 0162 - b8 65
	MOV	A,R1		    ; 0164 - f9	y
	MOV	@R0,A		    ; 0165 - a0	 
	MOV	R0,#2BH		    ; 0166 - b8 2b
	INC	@R0		        ; 0168 - 10	
	JMP	L01DC		    ; 0169 - 24 dc

L016B:	MOV	A,R1		; 016b - f9
	XRL	A,#0B0H		    ; 016c - d3 b0
	JZ	L01DC		    ; 016e - c6 dc
	MOV	A,R1		    ; 0170 - f9
	XRL	A,#50H		    ; 0171 - d3 50
	JZ	L01DC		    ; 0173 - c6 dc
	MOV	A,R1		    ; 0175 - f9
	XRL	A,#4		    ; 0176 - d3 04
	JZ	L0181		    ; 0178 - c6 81
	MOV	A,R1		    ; 017a - f9
	MOV	R0,#65H		    ; 017b - b8 65
	MOV	@R0,A		    ; 017d - a0	 
	MOV	R0,#2BH		    ; 017e - b8 2b
	INC	@R0		        ; 0180 - 10	
L0181:	RET			    ; 0181 - 83	

L0182:	JB6	L01AE		; 0182 - d2 ae
	MOV	R0,#12H		    ; 0184 - b8 12
	MOVX	A,@R0		; 0186 - 80	
	ANL	A,#1		    ; 0187 - 53 01
	MOV	R0,#6CH		    ; 0189 - b8 6c
	MOV	@R0,A		    ; 018b - a0	 
	JB0	L0199		    ; 018c - 12 99
	MOV	R0,#66H		    ; 018e - b8 66
	MOV	@R0,#0		    ; 0190 - b0 00
	MOV	R0,#2BH		    ; 0192 - b8 2b
	MOV	@R0,#0		    ; 0194 - b0 00
	ANL	P2,#0EFH	    ; 0196 - 9a ef
	RET			        ; 0198 - 83	

L0199:	ORL	P2,#10H		; 0199 - 8a 10
	MOV	R0,#52H		    ; 019b - b8 52
	MOV	A,@R0		    ; 019d - f0
	JB1	L01A7		    ; 019e - 32 a7
	MOV	R0,#66H		    ; 01a0 - b8 66
	MOV	@R0,#0AH	    ; 01a2 - b0 0a
	CALL	L0340		; 01a4 - 74 40
	RET			        ; 01a6 - 83	

L01A7:	MOV	R0,#66H		; 01a7 - b8 66
	MOV	@R0,#62H	    ; 01a9 - b0 62
	CALL	L034A		; 01ab - 74 4a
	RET			        ; 01ad - 83	

L01AE:	MOV	R0,#11H		; 01ae - b8 11
	MOVX	A,@R0		; 01b0 - 80	
	MOV	R4,A		    ; 01b1 - ac
	JB5	L01D6		    ; 01b2 - b2 d6
	ANL	A,#10H		    ; 01b4 - 53 10
	JZ	L01CC		    ; 01b6 - c6 cc
	CALL	L0043		; 01b8 - 14 43
	MOV	R0,#13H		    ; 01ba - b8 13
	MOV	A,#80H		    ; 01bc - 23 80
	MOVX	@R0,A		; 01be - 90	
	MOV	R0,#66H		    ; 01bf - b8 66
	MOV	@R0,#62H	    ; 01c1 - b0 62
	MOV	R0,#6CH		    ; 01c3 - b8 6c
	MOV	A,@R0		    ; 01c5 - f0	
	CPL	A		        ; 01c6 - 37
	JB0	L01CB		    ; 01c7 - 12 cb
	CALL	L034A		; 01c9 - 74 4a
L01CB:	RET			    ; 01cb - 83	

L01CC:	MOV	A,R4		; 01cc - fc
	JB0	L01D2		    ; 01cd - 12 d2
	JB7	L01CB		    ; 01cf - f2 cb
	RET			        ; 01d1 - 83	

L01D2:	CALL	L0477	; 01d2 - 94 77
	CALL	L0073		; 01d4 - 14 73
L01D6:	MOV	R0,#13H		; 01d6 - b8 13
	MOV	A,#80H		    ; 01d8 - 23 80
	MOVX	@R0,A		; 01da - 90	
	RET			        ; 01db - 83	

L01DC:	MOV	R0,#2BH		; 01dc - b8 2b
	MOV	A,@R0		    ; 01de - f0
	XRL	A,#1		    ; 01df - d3 01
	JNZ	L01E5		    ; 01e1 - 96 e5
	CALL	L0496		; 01e3 - 94 96
L01E5:	MOV	R0,#2BH		; 01e5 - b8 2b
	MOV	@R0,#0		    ; 01e7 - b0 00
	RET			        ; 01e9 - 83	


ORG	0200H
L0200:	MOV	R0,#13H		; 0200 - b8 13
	MOVX	A,@R0		; 0202 - 80	
	JB0	L0280		    ; 0203 - 12 80
	MOV	R0,#6CH		    ; 0205 - b8 6c
	MOV	A,@R0		    ; 0207 - f0
	JB0	L0213		    ; 0208 - 12 13
	MOV	R0,#52H		    ; 020a - b8 52
	MOV	A,@R0		    ; 020c - f0
	JB1	L021A		    ; 020d - 32 1a
L020F:	CALL	L078B	; 020f - f4 8b
	JMP	L021C		    ; 0211 - 44 1c
L0213:	MOV	R0,#66H		; 0213 - b8 66
	MOV	A,@R0		    ; 0215 - f0
	XRL	A,#0AH		    ; 0216 - d3 0a
	JZ	L020F		    ; 0218 - c6 0f
L021A:	CALL	L0770	; 021a - f4 70
L021C:	CALL	L0098	; 021c - 14 98
	CALL	L00C9		; 021e - 14 c9
	MOV	R0,#78H		    ; 0220 - b8 78
	MOV	R1,#77H		    ; 0222 - b9 77
	MOV	A,@R1		    ; 0224 - f1
	MOV	@R0,A		    ; 0225 - a0	 
	MOV	R0,#76H		    ; 0226 - b8 76
	MOV	A,#0A2H		    ; 0228 - 23 a2
	MOV	@R0,A		    ; 022a - a0	 
	MOV	R0,#77H		    ; 022b - b8 77
	MOV	A,#0B4H		    ; 022d - 23 b4
	MOV	@R0,A		    ; 022f - a0	 
	MOV	R0,#5FH		    ; 0230 - b8 5f
	MOV	A,@R0		    ; 0232 - f0
	JB0	L0239		    ; 0233 - 12 39
	JB1	L023D		    ; 0235 - 32 3d
	JB2	L0241		    ; 0237 - 52 41
L0239:	MOV	R7,#1		; 0239 - bf 01
	JMP	L0243		    ; 023b - 44 43
L023D:	MOV	R7,#2		; 023d - bf 02
	JMP	L0243		    ; 023f - 44 43
L0241:	MOV	R7,#3		; 0241 - bf 03
L0243:	JB3	L024A		; 0243 - 72 4a
	MOV	R0,#77H		    ; 0245 - b8 77
	MOV	A,#0D4H		    ; 0247 - 23 d4
	MOV	@R0,A		    ; 0249 - a0	 
L024A:	MOV	R3,#0BH		; 024a - bb 0b
	MOV	R0,#6EH		    ; 024c - b8 6e
L024E:	MOV	R1,#17H		; 024e - b9 17
	MOV	A,@R0		    ; 0250 - f0	
	MOVX	@R1,A		; 0251 - 91	
	CALL	L0085		; 0252 - 14 85
	ORL	A,#0		    ; 0254 - 43 00
	JZ	L0280		    ; 0256 - c6 80
	DEC	R7		        ; 0258 - cf
	MOV	A,R7		    ; 0259 - ff	
	JNZ	L0261		    ; 025a - 96 61
	MOV	A,#74H		    ; 025c - 23 74
	MOV	@R0,A		    ; 025e - a0	 
	JMP	L024E		    ; 025f - 44 4e
L0261:	INC	R0		    ; 0261 - 18	
	DJNZ	R3,L024E	; 0262 - eb 4e
	MOV	R0,#17H		    ; 0264 - b8 17
	MOV	A,#0B0H		    ; 0266 - 23 b0
	MOVX	@R0,A		; 0268 - 90	
	CALL	L0085		; 0269 - 14 85
	ORL	A,#0		    ; 026b - 43 00
	JZ	L0280		    ; 026d - c6 80
	MOV	R0,#13H		    ; 026f - b8 13
	MOV	A,#10H		    ; 0271 - 23 10
	MOVX	@R0,A		; 0273 - 90	
	MOV	R0,#17H		    ; 0274 - b8 17
	MOV	A,#50H		    ; 0276 - 23 50
	MOVX	@R0,A		; 0278 - 90	
	CALL	L0085		; 0279 - 14 85
	ORL	A,#0		    ; 027b - 43 00
	JZ	L0280		    ; 027d - c6 80
	RET			        ; 027f - 83	
L0280:	MOV	R0,#13H		; 0280 - b8 13
	MOV	A,#0A0H		    ; 0282 - 23 a0
	MOVX	@R0,A		; 0284 - 90	
	RET			        ; 0285 - 83	

; Cold start entry point routine
L0286:	ANL	P2,#0EFH	; 0286 - 9a ef
	MOV	R0,#7EH		    ; 0288 - b8 7e
	MOV	@R0,#0		    ; 028a - b0 00
	MOV	R0,#6CH		    ; 028c - b8 6c
	MOV	@R0,#0		    ; 028e - b0 00
	MOV	R0,#2BH		    ; 0290 - b8 2b
	MOV	@R0,#0		    ; 0292 - b0 00
	MOV	R0,#66H		    ; 0294 - b8 66
	MOV	@R0,#0		    ; 0296 - b0 00
	CALL	L048F		; 0298 - 94 8f // startup delay
	CALL	L0043		; 029a - 14 43 // display test
	CALL	L0102		; 029c - 34 02
L029E:	CALL	L0300	; 029e - 74 00 // main loop
	MOV	R0,#7EH		    ; 02a0 - b8 7e
	MOV	A,@R0		    ; 02a2 - f0	
	JB3	L02A7		    ; 02a3 - 72 a7
	JMP	L029E		    ; 02a5 - 44 9e

L02A7:	MOV	@R0,#0		; 02a7 - b0 00
	CALL	L0200		; 02a9 - 54 00
	JMP	L029E		    ; 02ab - 44 9e


ORG	0300H
L0300:	EN	I		    ; 0300 - 05	
	CALL	L035B		; 0301 - 74 5b
	JF0	L030C		    ; 0303 - b6 0c
	MOV	R0,#52H		    ; 0305 - b8 52
	MOV	A,@R0		    ; 0307 - f0	
	JB5	L030C		    ; 0308 - b2 0c
	JMP	L0310		    ; 030a - 64 10

L030C:	CALL	L0073	; 030c - 14 73
	JMP	L0300		    ; 030e - 64 00

L0310:	MOV	R0,#51H		; 0310 - b8 51
	MOV	@R0,#19H	    ; 0312 - b0 19
	MOV	R0,#6CH		    ; 0314 - b8 6c
	MOV	A,@R0		    ; 0316 - f0	
	JB0	L0337		    ; 0317 - 12 37
	ANL	P2,#0EFH	    ; 0319 - 9a ef
	MOV	R0,#52H		    ; 031b - b8 52
	MOV	A,@R0		    ; 031d - f0	
	JB1	L032F		    ; 031e - 32 2f
L0320:	CALL	L0600	; 0320 - d4 00
	CALL	L071A		; 0322 - f4 1a
	CALL	L0741		; 0324 - f4 41
L0326:	MOV	R0,#3FH		; 0326 - b8 3f
	MOV	R1,#60H		    ; 0328 - b9 60
	MOV	R2,#5		    ; 032a - ba 05
	CALL	L0354		; 032c - 74 54
	RET			        ; 032e - 83	

L032F:	CALL	L0500	; 032f - b4 00
	CALL	L071A		; 0331 - f4 1a
	CALL	L072C		; 0333 - f4 2c
	JMP	L0326		    ; 0335 - 64 26

L0337:	MOV	R0,#66H		; 0337 - b8 66
	MOV	A,@R0		    ; 0339 - f0	
	XRL	A,#0AH		    ; 033a - d3 0a
	JNZ	L032F		    ; 033c - 96 2f
	JMP	L0320		    ; 033e - 64 20

L0340:	DIS	TCNTI		; 0340 - 35
	MOV	A,#0D0H		    ; 0341 - 23 d0
	OUTL	P1,A		; 0343 - 39
	ANL	P2,#0EFH	    ; 0344 - 9a ef
	ORL	P2,#10H		    ; 0346 - 8a 10
	EN	TCNTI		    ; 0348 - 25	
	RET			        ; 0349 - 83	

L034A:	DIS	TCNTI		; 034a - 35
	MOV	A,#0D2H		    ; 034b - 23 d2
	OUTL	P1,A		; 034d - 39
	ANL	P2,#0EFH	    ; 034e - 9a ef
	ORL	P2,#10H		    ; 0350 - 8a 10
	EN	TCNTI		    ; 0352 - 25	
	RET			        ; 0353 - 83	

L0354:	MOV	A,@R0		; 0354 - f0	
	MOV	@R1,A		    ; 0355 - a1	
	INC	R0		        ; 0356 - 18	
	INC	R1		        ; 0357 - 19	
	DJNZ	R2,L0354	; 0358 - ea 54
	RET			        ; 035a - 83	

L035B:	MOV	R0,#52H		; 035b - b8 52
	MOV	A,@R0		    ; 035d - f0	
	ANL	A,#0DFH		    ; 035e - 53 df
	MOV	@R0,A		    ; 0360 - a0	 
L0361:	CALL	L0477	; 0361 - 94 77
L0363:	JT0	L039B		; 0363 - 36 9b
	JNT1	L0361		; 0365 - 46 61
	ANL	P2,#0BFH	    ; 0367 - 9a bf
	ORL	P2,#40H		    ; 0369 - 8a 40
	MOV	R2,#6		    ; 036b - ba 06
	MOV	R0,#0		    ; 036d - b8 00
L036F:	MOVX	A,@R0	; 036f - 80	
	DJNZ	R2,L036F	; 0370 - ea 6f
	MOV	R1,A		    ; 0372 - a9	
	MOV	R2,#4		    ; 0373 - ba 04
L0375:	MOVX	A,@R0	; 0375 - 80	
	DJNZ	R2,L0375	; 0376 - ea 75
	MOV	R0,#52H		    ; 0378 - b8 52
	MOV	A,@R0		    ; 037a - f0	
	XRL	A,R1		    ; 037b - d9
	MOV	R2,A		    ; 037c - aa
	JB2	L0389		    ; 037d - 52 89
	MOV	R0,#6CH		    ; 037f - b8 6c
	MOV	A,@R0		    ; 0381 - f0	
	JB0	L0363		    ; 0382 - 12 63
	MOV	A,R2		    ; 0384 - fa	z
	JB1	L0389		    ; 0385 - 32 89
	JMP	L0363		    ; 0387 - 64 63

L0389:	MOV	R2,#40H		; 0389 - ba 40
L038B:	MOV	 R3,#0FFH	; 038b - bb ff
L038D:	DJNZ R3,L038D   ; 038d - eb 8d
	DJNZ	R2,L038B	; 038f - ea 8b
	MOV	R0,#52H		    ; 0391 - b8 52
	MOV	A,@R0		    ; 0393 - f0	
	ANL	A,#0F8H		    ; 0394 - 53 f8
	ORL	A,R1		    ; 0396 - 49
	ORL	A,#20H		    ; 0397 - 43 20
	MOV	@R0,A		    ; 0399 - a0	 
	RET			        ; 039a - 83	

L039B:	JT0	L039F		; 039b - 36 9f
	JMP	L0400		    ; 039d - 84 00

L039F:	ANL	P2,#0BFH	; 039f - 9a bf
	ORL	P2,#40H		    ; 03a1 - 8a 40
	MOV	R2,#6		    ; 03a3 - ba 06
	MOV	R0,#0		    ; 03a5 - b8 00
L03A7:	MOVX	A,@R0	; 03a7 - 80	
	DJNZ	R2,L03A7	; 03a8 - ea a7
	MOV	R1,A		    ; 03aa - a9	
	MOV	R2,#4		    ; 03ab - ba 04
L03AD:	MOVX	A,@R0	; 03ad - 80	
	DJNZ	R2,L03AD	; 03ae - ea ad
	MOV	R0,#52H		    ; 03b0 - b8 52
	MOV	A,@R0	    	; 03b2 - f0	
	XRL	A,R1		    ; 03b3 - d9
	MOV	R2,A	    	; 03b4 - aa
	JB2	L03C1		    ; 03b5 - 52 c1
	MOV	R0,#6CH		    ; 03b7 - b8 6c
	MOV	A,@R0		    ; 03b9 - f0	
	JB0	L039B		    ; 03ba - 12 9b
	MOV	A,R2		    ; 03bc - fa
	JB1	L03C1		    ; 03bd - 32 c1
	JMP	L039B		    ; 03bf - 64 9b

L03C1:	MOV	R2,#40H		; 03c1 - ba 40
L03C3:	MOV	R3,#0FFH	; 03c3 - bb ff
L03C5:	DJNZ R3,L03C5	; 03c5 - eb c5
	DJNZ	R2,L03C3	; 03c7 - ea c3
	MOV	R0,#52H		    ; 03c9 - b8 52
	MOV	A,@R0		    ; 03cb - f0	
	ANL	A,#0F8H		    ; 03cc - 53 f8
	ORL	A,R1		    ; 03ce - 49
	ORL	A,#20H		    ; 03cf - 43 20
	MOV	@R0,A		    ; 03d1 - a0	 
	RET			        ; 03d2 - 83	


ORG	0400H
L0400:	DIS	I		    ; 0400 - 15	
	ANL	P2,#0BFH	    ; 0401 - 9a bf
	ORL	P2,#40H		    ; 0403 - 8a 40
	MOV	R0,#53H		    ; 0405 - b8 53
	MOV	R2,#0AH		    ; 0407 - ba 0a
	MOV	R1,#0		    ; 0409 - b9 00
L040B:	MOVX	A,@R1	; 040b - 81	
	MOV	@R0,A		    ; 040c - a0	 
	INC	R0		        ; 040d - 18	
	DJNZ	R2,L040B	; 040e - ea 0b
	MOV	R0,#58H		    ; 0410 - b8 58
	MOV	R1,#52H		    ; 0412 - b9 52
	MOV	A,@R0		    ; 0414 - f0	
	MOV	@R1,A		    ; 0415 - a1	
	CALL	L0468		; 0416 - 94 68
	MOV	R0,#5DH		    ; 0418 - b8 5d
	MOV	@R0,#0		    ; 041a - b0 00
	MOV	R0,#53H		    ; 041c - b8 53
	MOV	@R0,#0		    ; 041e - b0 00
	MOV	R0,#58H		    ; 0420 - b8 58
	MOV	@R0,#0		    ; 0422 - b0 00
	MOV	R7,#54H		    ; 0424 - bf 54
	MOV	R0,#52H		    ; 0426 - b8 52
	MOV	A,@R0		    ; 0428 - f0	
	JB0	L042C		    ; 0429 - 12 2c
	DEC	R7		        ; 042b - cf
L042C:	MOV	R2,#4AH		; 042c - ba 4a
	CALL	L0444		; 042e - 94 44
	CLR	F0		        ; 0430 - 85	
	MOV	R7,#6		    ; 0431 - bf 06
	MOV	R0,#4AH		    ; 0433 - b8 4a
L0435:	MOV	A,@R0		; 0435 - f0	
	JNZ	L043D		    ; 0436 - 96 3d
	INC	R0		        ; 0438 - 18	
	DJNZ	R7,L0435	; 0439 - ef 35
	CPL	F0		        ; 043b - 95	
	RET			        ; 043c - 83	

L043D:	MOV	R7,#59H		; 043d - bf 59
	MOV	R2,#44H		    ; 043f - ba 44
	CALL	L0444		; 0441 - 94 44
	RET			        ; 0443 - 83	

L0444:	MOV	A,R2		; 0444 - fa
	MOV	R1,A		    ; 0445 - a9
	MOV	R3,#6		    ; 0446 - bb 06
L0448:	MOV	@R1,#0		; 0448 - b1 00
	INC	R1		        ; 044a - 19
	DJNZ	R3,L0448	; 044b - eb 48
	MOV	R5,#28H		    ; 044d - bd 28
	CLR	C		        ; 044f - 97
L0450:	MOV	R3,#5		; 0450 - bb 05
	MOV	A,R7		    ; 0452 - ff
	MOV	R1,A		    ; 0453 - a9
L0454:	MOV	A,@R1		; 0454 - f1
	RLC	A		        ; 0455 - f7
	MOV	@R1,A		    ; 0456 - a1
	INC	R1		        ; 0457 - 19
	DJNZ	R3,L0454	; 0458 - eb 54
	MOV	R3,#6		    ; 045a - bb 06
	MOV	A,R2		    ; 045c - fa
	MOV	R1,A		    ; 045d - a9
L045E:	MOV	A,@R1		; 045e - f1
	ADDC	A,@R1		; 045f - 71
	DA	A		        ; 0460 - 57
	MOV	@R1,A		    ; 0461 - a1
	INC	R1		        ; 0462 - 19
	DJNZ	R3,L045E	; 0463 - eb 5e
	DJNZ	R5,L0450	; 0465 - ed 50
	RET			        ; 0467 - 83

L0468:	MOV	R2,#2		; 0468 - ba 02
L046A:	MOV	R0,#53H		; 046a - b8 53
	MOV	R3,#0AH		    ; 046c - bb 0a
L046E:	MOV	A,@R0		; 046e - f0
	RLC	A		        ; 046f - f7
	MOV	@R0,A		    ; 0470 - a0	 
	INC	R0		        ; 0471 - 18
	DJNZ	R3,L046E	; 0472 - eb 6e
	DJNZ	R2,L046A	; 0474 - ea 6a
	RET			        ; 0476 - 83

L0477:	ANL	P2,#9FH		; 0477 - 9a 9f
	ORL	P2,#60H		    ; 0479 - 8a 60
	ANL	P2,#7FH		    ; 047b - 9a 7f
	ORL	P2,#80H		    ; 047d - 8a 80
	NOP			        ; 047f - 00
	NOP			        ; 0480 - 00
	ANL	P2,#7FH		    ; 0481 - 9a 7f
	RET			        ; 0483 - 83

; Initialize the display buffer with blank character (0Ah)
L0484:	MOV	R2,#5		; 0484 - ba 05
	MOV	R0,#64H		    ; 0486 - b8 64
	MOV	A,#0AAH		    ; 0488 - 23 aa
L048A:	MOV	@R0,A		; 048a - a0	 
	DEC	R0		        ; 048b - c8
	DJNZ	R2,L048A	; 048c - ea 8a
	RET			        ; 048e - 83

; Wait routine. Used as startup delay.
L048F:	MOV	R6,#88H		; 048f - be 88
L0491:	DJNZ R2,L0491	; 0491 - ea 91
	DJNZ	R6,L0491	; 0493 - ee 91
	RET			        ; 0495 - 83

L0496:	MOV	R0,#65H		; 0496 - b8 65
	MOV	A,@R0		    ; 0498 - f0
	XRL	A,#62H		    ; 0499 - d3 62
	JNZ	L04AC		    ; 049b - 96 ac
	MOV	R0,#66H		    ; 049d - b8 66
	MOV	@R0,#62H	    ; 049f - b0 62
	MOV	R0,#6CH		    ; 04a1 - b8 6c
	MOV	A,@R0		    ; 04a3 - f0
	CPL	A		        ; 04a4 - 37
	JB0	L04C1		    ; 04a5 - 12 c1
	CALL	L034A		; 04a7 - 74 4a
	CALL	L0073		; 04a9 - 14 73
	RET			        ; 04ab - 83

L04AC:	MOV	R0,#65H		; 04ac - b8 65
	MOV	A,@R0		    ; 04ae - f0
	XRL	A,#0AH		    ; 04af - d3 0a
	JNZ	L04C1		    ; 04b1 - 96 c1
	MOV	R0,#66H		    ; 04b3 - b8 66
	MOV	@R0,#0AH	    ; 04b5 - b0 0a
	MOV	R0,#6CH		    ; 04b7 - b8 6c
	MOV	A,@R0		    ; 04b9 - f0
	CPL	A		        ; 04ba - 37
	JB0	L04C1		    ; 04bb - 12 c1
	CALL	L0340		; 04bd - 74 40
	CALL	L0073		; 04bf - 14 73
L04C1:	RET			    ; 04c1 - 83


ORG	0500H
L0500:	MOV	R0,#4AH		; 0500 - b8 4a
	MOV	R1,#38H		    ; 0502 - b9 38
	MOV	R2,#6		    ; 0504 - ba 06
	CALL	L0354		; 0506 - 74 54
	CLR	F0		        ; 0508 - 85
	MOV	R0,#3EH		    ; 0509 - b8 3e
	CLR	A		        ; 050b - 27
	MOV	R2,#6		    ; 050c - ba 06
L050E:	MOV	@R0,A		; 050e - a0	 
	INC	R0		        ; 050f - 18
	DJNZ	R2,L050E	; 0510 - ea 0e
	MOV	R6,A		    ; 0512 - ae
	MOV	R5,A		    ; 0513 - ad
	MOV	R0,#50H		    ; 0514 - b8 50
	MOV	@R0,A		    ; 0516 - a0	 
L0517:	MOV	R0,#4AH		; 0517 - b8 4a
	MOV	R1,#32H		    ; 0519 - b9 32
	MOV	R2,#6		    ; 051b - ba 06
	CALL	L0354		; 051d - 74 54
	MOV	R1,#4AH		    ; 051f - b9 4a
	MOV	R0,#44H		    ; 0521 - b8 44
	MOV	R3,#6		    ; 0523 - bb 06
	CLR	C		        ; 0525 - 97
	CPL	C		        ; 0526 - a7
L0527:	CALL L05B2		; 0527 - b4 b2
	MOV	@R1,A		    ; 0529 - a1
	MOV	A,R7		    ; 052a - ff
	MOV	@R0,A		    ; 052b - a0	 
	INC	R0		        ; 052c - 18
	INC	R1		        ; 052d - 19
	DJNZ	R3,L0527	; 052e - eb 27
	JNC	L0556		    ; 0530 - e6 56
	JF0	L0535		    ; 0532 - b6 35
	CPL	F0		        ; 0534 - 95
L0535:	INC	R6		    ; 0535 - 1e
	MOV	A,R6		    ; 0536 - fe
	XRL	A,#0AH		    ; 0537 - d3 0a
	JNZ	L0517		    ; 0539 - 96 17
	MOV	R0,#52H		    ; 053b - b8 52
	MOV	A,@R0		    ; 053d - f0
	JB0	L059D		    ; 053e - 12 9d
	MOV	R0,#50H		    ; 0540 - b8 50
	MOV	A,@R0		    ; 0542 - f0
	JNZ	L0546		    ; 0543 - 96 46
	DEC	R5		        ; 0545 - cd
L0546:	MOV	R0,#3DH		; 0546 - b8 3d
	CALL	L05CE		; 0548 - b4 ce
	MOV	R0,#38H		    ; 054a - b8 38
	MOV	R1,#4AH		    ; 054c - b9 4a
	MOV	R2,#6		    ; 054e - ba 06
	CALL	L0354		; 0550 - 74 54
L0552:	CLR	A		    ; 0552 - 27
	MOV	R6,A		    ; 0553 - ae
	JMP	L0517		    ; 0554 - a4 17

L0556:	MOV	R0,#32H		; 0556 - b8 32
	MOV	R1,#4AH		    ; 0558 - b9 4a
	MOV	R2,#6		    ; 055a - ba 06
	CALL	L0354		; 055c - 74 54
	MOV	R0,#50H		    ; 055e - b8 50
	INC	@R0		        ; 0560 - 10
	NOP			        ; 0561 - 00
	MOV	R0,#4AH		    ; 0562 - b8 4a
	CALL	L05C0		; 0564 - b4 c0
	MOV	R0,#51H		    ; 0566 - b8 51
	MOV	A,@R0		    ; 0568 - f0
	DEC	A		        ; 0569 - 07
	MOV	@R0,A		    ; 056a - a0	 
	JZ	L0588		    ; 056b - c6 88
	JF0	L0572		    ; 056d - b6 72
	INC	R5		        ; 056f - 1d
	JMP	L0517		    ; 0570 - a4 17

L0572:	MOV	R3,#6		; 0572 - bb 06
	MOV	R0,#44H		    ; 0574 - b8 44
	MOV	R1,#3EH		    ; 0576 - b9 3e
	CLR	C		        ; 0578 - 97
	CPL	C		        ; 0579 - a7
L057A:	CALL L05B2	    ; 057a - b4 b2
	MOV	A,R7		    ; 057c - ff
	MOV	@R0,A		    ; 057d - a0	 
	INC	R0		        ; 057e - 18
	INC	R1		        ; 057f - 19
	DJNZ	R3,L057A	; 0580 - eb 7a
	JNC	L0589		    ; 0582 - e6 89
	MOV	R0,#43H		    ; 0584 - b8 43
	CALL	L05CE		; 0586 - b4 ce
L0588:	RET			    ; 0588 - 83

L0589:	MOV	R0,#3EH		; 0589 - b8 3e
	CALL	L05C0		; 058b - b4 c0
	MOV	R0,#51H		    ; 058d - b8 51
	MOV	A,@R0		    ; 058f - f0	
	DEC	A		        ; 0590 - 07
	MOV	@R0,A		    ; 0591 - a0	 
	JZ	L0588		    ; 0592 - c6 88
	MOV	R0,#3EH		    ; 0594 - b8 3e
	MOV	A,@R0		    ; 0596 - f0	
	ORL	A,R6		    ; 0597 - 4e
	MOV	@R0,A		    ; 0598 - a0	 
	CLR	A		        ; 0599 - 27
	MOV	R6,A		    ; 059a - ae	
	JMP	L0517		    ; 059b - a4 17

L059D:	MOV	R0,#38H		; 059d - b8 38
	MOV	R1,#4AH		    ; 059f - b9 4a
	MOV	R2,#6		    ; 05a1 - ba 06
	CALL	L0354		; 05a3 - 74 54
	MOV	R0,#44H		    ; 05a5 - b8 44
	CALL	L05C0		; 05a7 - b4 c0
	MOV	R0,#51H		    ; 05a9 - b8 51
	MOV	A,@R0		    ; 05ab - f0	
	DEC	A		        ; 05ac - 07	
	MOV	@R0,A		    ; 05ad - a0	 
	JZ	L0588		    ; 05ae - c6 88
	JMP	L0552		    ; 05b0 - a4 52

L05B2:	MOV	A,#99H		; 05b2 - 23 99
	ADDC	A,#0		; 05b4 - 13 00
	CLR	C		        ; 05b6 - 97	
	XCH	A,@R0		    ; 05b7 - 20	 
	MOV	R7,A		    ; 05b8 - af
	CPL	A		        ; 05b9 - 37
	ADD	A,#1		    ; 05ba - 03 01
	ADD	A,@R0		    ; 05bc - 60	`
	ADD	A,@R1		    ; 05bd - 61
	DA	A		        ; 05be - 57
	RET			        ; 05bf - 83	

L05C0:	MOV	R2,#6		; 05c0 - ba 06
	MOV	R1,#0		    ; 05c2 - b9 00
L05C4:	MOV	A,@R0		; 05c4 - f0	
	SWAP	A		    ; 05c5 - 47
	MOV	@R0,A		    ; 05c6 - a0	 
	MOV	A,R1		    ; 05c7 - f9
	XCHD	A,@R0		; 05c8 - 30
	MOV	R1,A		    ; 05c9 - a9	
	INC	R0		        ; 05ca - 18	
	DJNZ	R2,L05C4	; 05cb - ea c4
	RET			        ; 05cd - 83	

L05CE:	MOV	R2,#6		; 05ce - ba 06
	MOV	R1,#0		    ; 05d0 - b9 00
L05D2:	MOV	A,R1		; 05d2 - f9
	XCHD	A,@R0		; 05d3 - 30
	MOV	R1,A		    ; 05d4 - a9	
	MOV	A,@R0		    ; 05d5 - f0	
	SWAP	A		    ; 05d6 - 47
	MOV	@R0,A		    ; 05d7 - a0	 
	DEC	R0		        ; 05d8 - c8
	DJNZ	R2,L05D2	; 05d9 - ea d2
	RET			        ; 05db - 83	


ORG	0600H
L0600:	MOV	R0,#44H		; 0600 - b8 44
	MOV	R1,#2CH		    ; 0602 - b9 2c
	MOV	R2,#6		    ; 0604 - ba 06
	CALL	L0354		; 0606 - 74 54
	MOV	R0,#44H		    ; 0608 - b8 44
	MOV	R1,#38H		    ; 060a - b9 38
	MOV	R2,#6		    ; 060c - ba 06
	CALL	L0354		; 060e - 74 54
	CLR	F0		        ; 0610 - 85	
	MOV	R0,#3EH		    ; 0611 - b8 3e
	CLR	A		        ; 0613 - 27
	MOV	R2,#6		    ; 0614 - ba 06
L0616:	MOV	@R0,A		; 0616 - a0	 
	INC	R0		        ; 0617 - 18	
	DJNZ	R2,L0616	; 0618 - ea 16
	MOV	R6,A		    ; 061a - ae	
	MOV	R5,A		    ; 061b - ad
	MOV	R0,#50H		    ; 061c - b8 50
	MOV	@R0,A		    ; 061e - a0	 
L061F:	MOV	R0,#2CH		; 061f - b8 2c
	MOV	R1,#32H		    ; 0621 - b9 32
	MOV	R2,#6		    ; 0623 - ba 06
	CALL	L0354		; 0625 - 74 54
	MOV	R1,#2CH		    ; 0627 - b9 2c
	MOV	R0,#4AH		    ; 0629 - b8 4a
	MOV	R3,#6		    ; 062b - bb 06
	CLR	C		        ; 062d - 97	
	CPL	C		        ; 062e - a7
	NOP			        ; 062f - 00	
L0630:	CALL	L05B2	; 0630 - b4 b2
	MOV	@R1,A		    ; 0632 - a1	
	MOV	A,R7		    ; 0633 - ff	
	MOV	@R0,A		    ; 0634 - a0	 
	INC	R0		        ; 0635 - 18	
	INC	R1		        ; 0636 - 19	
	DJNZ	R3,L0630	; 0637 - eb 30
	JNC	L0660		    ; 0639 - e6 60
	JF0	L063F		    ; 063b - b6 3f
	INC	R5		        ; 063d - 1d	
	CPL	F0		        ; 063e - 95	
L063F:	INC	R6		    ; 063f - 1e	
	MOV	A,R6		    ; 0640 - fe
	XRL	A,#0AH		    ; 0641 - d3 0a
	JNZ	L061F		    ; 0643 - 96 1f
	MOV	R0,#50H		    ; 0645 - b8 50
	MOV	A,@R0		    ; 0647 - f0	
	JNZ	L064B		    ; 0648 - 96 4b
	INC	R5		        ; 064a - 1d	
L064B:	MOV	R0,#52H		; 064b - b8 52
	MOV	A,@R0		    ; 064d - f0	
	JB0	L06AC		    ; 064e - 12 ac
	MOV	R0,#3EH		    ; 0650 - b8 3e
	CALL	L05CE		; 0652 - b4 ce
	MOV	R0,#38H		    ; 0654 - b8 38
	MOV	R1,#2CH		    ; 0656 - b9 2c
	MOV	R2,#6		    ; 0658 - ba 06
	CALL	L0354		; 065a - 74 54
L065C:	CLR	A		    ; 065c - 27
	MOV	R6,A		    ; 065d - ae	
	JMP	L061F		    ; 065e - c4 1f

L0660:	MOV	R0,#32H		; 0660 - b8 32
	MOV	R1,#2CH		    ; 0662 - b9 2c
	MOV	R2,#6		    ; 0664 - ba 06
	CALL	L0354		; 0666 - 74 54
	MOV	R0,#2CH		    ; 0668 - b8 2c
	CALL	L05C0		; 066a - b4 c0
	MOV	R0,#51H		    ; 066c - b8 51
	MOV	A,@R0		    ; 066e - f0	
	DEC	A		        ; 066f - 07	
	MOV	@R0,A		    ; 0670 - a0	 
	JZ	L0697		    ; 0671 - c6 97
	JF0	L0681		    ; 0673 - b6 81
	MOV	R0,#50H		    ; 0675 - b8 50
	MOV	A,@R0		    ; 0677 - f0	
	JZ	L067E		    ; 0678 - c6 7e
	INC	R5		        ; 067a - 1d	
L067B:	INC	@R0		    ; 067b - 10	
	JMP	L061F		    ; 067c - c4 1f

L067E:	DEC	R5		    ; 067e - cd
	JMP	L067B		    ; 067f - c4 7b

L0681:	MOV	R3,#6		; 0681 - bb 06
	MOV	R0,#44H		    ; 0683 - b8 44
	MOV	R1,#3EH		    ; 0685 - b9 3e
	CLR	C		        ; 0687 - 97	
	CPL	C		        ; 0688 - a7
L0689:	CALL	L05B2	; 0689 - b4 b2
	MOV	A,R7		    ; 068b - ff	
	MOV	@R0,A		    ; 068c - a0	 
	INC	R0		        ; 068d - 18	
	INC	R1		        ; 068e - 19	
	DJNZ	R3,L0689	; 068f - eb 89
	JNC	L0698		    ; 0691 - e6 98
	MOV	R0,#43H		    ; 0693 - b8 43
	CALL	L05CE		; 0695 - b4 ce
L0697:	RET			    ; 0697 - 83	

L0698:	MOV	R0,#3EH		; 0698 - b8 3e
	CALL	L05C0		; 069a - b4 c0
	MOV	R0,#51H		    ; 069c - b8 51
	MOV	A,@R0		    ; 069e - f0	
	DEC	A		        ; 069f - 07	
	MOV	@R0,A		    ; 06a0 - a0	 
	JZ	L0697		    ; 06a1 - c6 97
	MOV	R0,#3EH		    ; 06a3 - b8 3e
	MOV	A,@R0		    ; 06a5 - f0	
	ORL	A,R6		    ; 06a6 - 4e
	MOV	@R0,A		    ; 06a7 - a0	 
	CLR	A		        ; 06a8 - 27
	MOV	R6,A		    ; 06a9 - ae	
	JMP	L061F		    ; 06aa - c4 1f

L06AC:	MOV	R0,#38H		; 06ac - b8 38
	MOV	R1,#2CH		    ; 06ae - b9 2c
	MOV	R2,#6		    ; 06b0 - ba 06
	CALL	L0354		; 06b2 - 74 54
	MOV	R0,#4AH		    ; 06b4 - b8 4a
	CALL	L05C0		; 06b6 - b4 c0
	MOV	R0,#51H		    ; 06b8 - b8 51
	MOV	A,@R0		    ; 06ba - f0	
	DEC	A		        ; 06bb - 07	
	MOV	@R0,A		    ; 06bc - a0	 
	JZ	L0697		    ; 06bd - c6 97
	JMP	L065C		    ; 06bf - c4 5c


ORG	0700H
db 09H, 06H, 06H, 06H, 03H, 03H, 03H, 00H, 00H, 00H,  03H, 03H, 03H
db 01H, 04H, 02H, 01H, 04H, 02H, 01H, 04H, 02H, 01H, 0cH, 0aH, 09H

	
L071A:	MOV	R0,#43H		; 071a - b8 43
	MOV	A,@R0		    ; 071c - f0	
	ANL	A,#0F0H		    ; 071d - 53 f0
	JZ	L0722		    ; 071f - c6 22
	RET			        ; 0721 - 83	

L0722:	MOV	R0,#3EH		; 0722 - b8 3e
	MOV	R1,#0AH		    ; 0724 - b9 0a
	MOV	R2,#6		    ; 0726 - ba 06
	CALL	L05C4		; 0728 - b4 c4
	JMP	L071A		    ; 072a - e4 1a

L072C:	MOV	R0,#52H		; 072c - b8 52
	MOV	A,@R0		    ; 072e - f0	
	JB0	L0732		    ; 072f - 12 32
	INC	R5		        ; 0731 - 1d	
L0732:	MOV	A,R5		; 0732 - fd	
	ADD	A,#1		    ; 0733 - 03 01
	MOVP	A,@A		; 0735 - a3
	MOV	R1,#3FH		    ; 0736 - b9 3f
	XCHD	A,@R1		; 0738 - 31
	MOV	A,R5		    ; 0739 - fd	
	ADD	A,#0EH		    ; 073a - 03 0e
	MOVP	A,@A		; 073c - a3
	MOV	R1,#5FH		    ; 073d - b9 5f
	MOV	@R1,A		    ; 073f - a1	
	RET			        ; 0740 - 83	

L0741:	MOV	R0,#52H		; 0741 - b8 52
	MOV	A,@R0		    ; 0743 - f0	
	CPL	A		        ; 0744 - 37	7
	JB0	L0757		    ; 0745 - 12 57
	MOV	A,#0B0H		    ; 0747 - 23 b0
	ADD	A,R5		    ; 0749 - 6d	
	MOV	R1,A		    ; 074a - a9	
	MOVP	A,@A		; 074b - a3
	MOV	R0,#3FH		    ; 074c - b8 3f
	XCHD	A,@R0		; 074e - 30
	MOV	A,R1		    ; 074f - f9
	ADD	A,#0CH		    ; 0750 - 03 0c
	MOVP	A,@A		; 0752 - a3
	MOV	R0,#5FH		    ; 0753 - b8 5f
	MOV	@R0,A		    ; 0755 - a0	 
	RET			        ; 0756 - 83	

L0757:	MOV	A,R5		; 0757 - fd	
	ADD	A,#0FEH		    ; 0758 - 03 fe
	JNZ	L0760		    ; 075a - 96 60
	MOV	R0,#43H		    ; 075c - b8 43
	CALL	L05CE		; 075e - b4 ce
L0760:	MOV	A,#0C8H		; 0760 - 23 c8
	ADD	A,R5		    ; 0762 - 6d	
	MOV	R1,A		    ; 0763 - a9	
	MOVP	A,@A		; 0764 - a3
	MOV	R0,#3FH		    ; 0765 - b8 3f
	XCHD	A,@R0		; 0767 - 30
	MOV	A,R1		    ; 0768 - f9
	ADD	A,#3		    ; 0769 - 03 03
	MOVP	A,@A		; 076b - a3
	MOV	R0,#5FH		    ; 076c - b8 5f
	MOV	@R0,A		    ; 076e - a0	 
	RET			        ; 076f - 83	

L0770:	MOV	R3,#2		; 0770 - bb 02
	MOV	R0,#89H		    ; 0772 - b8 89
L0774:	MOV	R1,#17H		; 0774 - b9 17
	MOV	A,R0		    ; 0776 - f8
	MOVP	A,@A		; 0777 - a3
	MOVX	@R1,A		; 0778 - 91	
	CALL	L0085		; 0779 - 14 85
	ORL	A,#0		    ; 077b - 43 00
	JZ	L0783		    ; 077d - c6 83
	INC	R0		        ; 077f - 18	
	DJNZ	R3,L0774	; 0780 - eb 74
	RET			        ; 0782 - 83	

L0783:	MOV	R0,#13H		; 0783 - b8 13
	MOV	A,#0A0H		    ; 0785 - 23 a0
	MOVX	@R0,A		; 0787 - 90	
	RET			        ; 0788 - 83	

	MOV	T,A		        ; 0789 - 62
	MOV	R4,#0BBH	    ; 078a - bc bb
	OUTL	BUS,A		; 078c - 02	
	MOV	R0,#0A4H	    ; 078d - b8 a4
L078F:	MOV	R1,#17H		; 078f - b9 17
	MOV	A,R0		    ; 0791 - f8
	MOVP	A,@A		; 0792 - a3
	MOVX	@R1,A		; 0793 - 91	
	CALL	L0085		; 0794 - 14 85
	ORL	A,#0		    ; 0796 - 43 00
	JZ	L079E		    ; 0798 - c6 9e
	INC	R0		        ; 079a - 18	
	DJNZ	R3,L078F	; 079b - eb 8f
	RET			        ; 079d - 83	

L079E:	MOV	R0,#13H		; 079e - b8 13
	MOV	A,#0A0H		    ; 07a0 - 23 a0
	MOVX	@R0,A		; 07a2 - 90	
	RET			        ; 07a3 - 83	

	IN	A,P2		    ; 07a4 - 0a	
	MOV	R4,#9AH		    ; 07a5 - bc 9a
	RLC	A		        ; 07a7 - f7
	MOV	R0,#5		    ; 07a8 - b8 05
	MOV	A,#2		    ; 07aa - 23 02
	MOVX	@R0,A		; 07ac - 90	
	ORL	P2,#8		    ; 07ad - 8a 08
	RET			        ; 07af - 83	


ORG	07B0H
db 09H, 09H, 09H, 06H, 06H, 06H, 03H, 03H, 03H, 00H, 00H, 00H
db 09H, 0aH, 0cH, 09H, 0aH, 0cH, 09H, 0aH, 0cH, 09H, 0aH, 0cH
db 09H, 09H, 09H, 0aH, 09H, 09H, ffH


;
;	Miscellaneous equates
;
;  These are addresses referenced in the code but
;  which are in the middle of a multibyte instruction
;  or are addresses outside the initialized space
;
L078B	EQU	078BH
;
	END
;

