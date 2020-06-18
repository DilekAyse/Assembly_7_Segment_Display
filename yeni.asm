Org 0000h
Sjmp ana
Org 0030h

ANA:	

BAS:
JB P1.0, BAS   /* P1.0 portu 1 ise BAS sat1r1na geri dönüyor (Yani üst sat1ra) */

TEKRAR:	
MOV p2,#05Eh    /*   Birinci displaye atilacak deger "d"  */
CPL p3.0         ;,#0FEh     /*   Birinci displayi seçme degeri        */
CPL p3.0

MOV p2,#3Dh    /*   Ikinci displaye atilacak deger "G"   */
CPL p3.1 ;,#0FDh     /*   Ikinci siplayi seçme degeri          */
CPL p3.1

MOV p2, #5Bh   /*   Üçüncü displaye atilacak deger "2"   */
CPL p3.2   ;, #0FBh    /*   Üçüncü displayi seçme degeri         */
CPL p3.2

MOV p2,#58h    /*   Dördüncü displaye atilacak deger "c"  */
CPL p3.3   ;,#0F7h     /*   Dördüncü displayi seçme degeri        */
CPL p3.3
JNB P1.0, TEKRAR
SJMP ANA


SN:
MOV R0,#20					; TEKRAR ICIN SAYAC TANIMLADIK
MOV TMOD,#01H				; GATE=0 C/T=0 M1M0	01 MOD 1 16 BIT TIMER (TIMER 0'i MOD 1'e KURDUK)
SAY:
MOV TH0,#HIGH(15536)		; 5000 SAYMAK ICIN 15536 DAN BASLA
MOV TL0,#LOW(15536)
SETB TR0
KONTROL:
JNB TF0,KONTROL
DJNZ R0,SAY
SJMP ANA	

end	