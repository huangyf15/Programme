	SUBROUTINE OUTDE1(ITRAN,VRGL)
C
C  *********************************************************************
C  **  O U T D E 1  **
C  *********************************************************************
C
C  PURPOSE:
C  D E F O R M A T I O N    O U T P U T   P L A N E   S T R E S S
C
C  FOR   KSYSTP :
C                 1 = PLANE STRESS
C                 4 = PLANE STRAIN
C                 5 = AXISYMMETRIC
C                 9 = PLANE STRAIN UNSYMMETRIC
C                10 = PLANE STRAIN FLUID
C
C  *********************************************************************
C
	INCLUDE 'FCOMMON'
	INCLUDE 'FCOMMOV6'
	COMMON /SKYLIN/ NEQ,NDMAX,NAD
	INTEGER*2 ITRAN
	DIMENSION ITRAN(1),VRGL(1)
C
	IF(KSYSTP.EQ.1 .OR. KSYSTP.EQ.4 .OR. KSYSTP.EQ.5 .OR.
     1     KSYSTP.EQ.9 .OR. KSYSTP.EQ.10)  GOTO 100
	GOTO 300
C
100	NL	= 1
	NTOFR	= NFRESY*NCOOR
	DO 250 NL= 1,NLOAD
	IF(IPRIX(6).EQ.0)  GOTO 240
	CALL PAGE
	WRITE(IPR,1007)
	IF(NLOAD.EQ.1)  GOTO 105
	WRITE(IPR,1028)  NL
	NZEIZ	= NZEIZ-3
105	KONT	= 1
	NZEIZ	= NZEIZ-5
	NA	= 1+NTOFR*(NL-1)
	NE	= NA+9*NFRESY
	IF(NE.GT.(NTOFR*NL))  NE = (NTOFR*NL)
C
	DO 220 IV= 1,12
	IS	= 0
	KONOUT	= 0
110	IF(IV.GT.2)  GOTO 230
	IF(KONT.EQ.0)   CALL PAGE
	KONT	= 1
	IF(IV.NE.1)  GOTO 130
	WRITE(IPR,1008)
	GOTO 170
130	WRITE(IPR,1009)
	IF(KONOUT.EQ.1)  GOTO 170
	NA	= 2+NTOFR*(NL-1)
	NE	= NA+9*NFRESY
	IF(NE.GT.(NTOFR*NL))  NE = NTOFR*NL+IV-NFRESY
C
C
170	WRITE(IPR,1025)
	WRITE(IPR,1026)
	NZEIZ	= NZEIZ-9
	KONT	= 0
190	DO 191 J= NA,NE,NFRESY

	IF(ABS(VRGL(IABS(ITRAN(J)))).GT.1.) then
     		VRGL(IABS(ITRAN(J))) = 0.99999999
	endif
191	VRGL(IABS(ITRAN(J)))	= VRGL(IABS(ITRAN(J)))*1000.
C
	KOPRI	= 0
	DO 192 J= NA,NE,NFRESY
	IF(VRGL(IABS(ITRAN(J))).NE.0.0)  KOPRI = 1
192	CONTINUE
	IF(KOPRI.EQ.0)  GOTO 193
C
	WRITE(IPR,1027)  IS,(VRGL(IABS(ITRAN(J))),J=NA,NE,NFRESY)
	NZEIZ	= NZEIZ-1
193	IF(NE.GE.(NTOFR*NL)+IV-NFRESY)  GOTO 200
	IS	= IS+10
	NA	= NA+10*NFRESY
	NE	= NE+10*NFRESY
	IF(NE.GT.(NTOFR*NL))  NE = (NTOFR*NL) +IV-NFRESY
	IF(NZEIZ.GE.0)  GOTO 190
	KONOUT	= 1
	GOTO 110
200	IF(NZEIZ-20.LE.0)  GOTO 210
	IS	= 0
	KONT	= 1
	GOTO 220
210	IS	= 0
	KONT	= 0
	NZEIZ	= NZEIZ-8
220	CONTINUE
230	CONTINUE
C
C  P L O T   O U T P U T
C
240	IF(IPRIX(7).EQ.0)  GOTO 250
C
C  X DISPLACEMENTS
	NA	= 1
	NE	= NTOFR*NL-1
	IF(IPRIX(6).NE.0)  WRITE(ITAP3)  
     1         (SNGL(VRGL(IABS(ITRAN(J)))/1000.),J = NA,NE,NFRESY)
	IF(IPRIX(6).EQ.0)  WRITE(ITAP3)  
     1         (SNGL(VRGL(IABS(ITRAN(J)))),J = NA,NE,NFRESY)
C
C  Y DISPLACEMENTS
	NA	= 2
	NE	= NE + 1
	IF(IPRIX(6).NE.0)  WRITE(ITAP3)  
     1         (SNGL(VRGL(IABS(ITRAN(J)))/1000.),J = NA,NE,NFRESY)
	IF(IPRIX(6).EQ.0)  WRITE(ITAP3)  
     1         (SNGL(VRGL(IABS(ITRAN(J)))),J = NA,NE,NFRESY)
	IF(NL.EQ.NLOAD) WRITE(IPR,1029)
250	CONTINUE
300	RETURN
C
C  F O R M A T
C
1007	 FORMAT (//28X,'<',55(1H-),'>'/27X,'<   D  E  F  O  R  M  A  T',
     1 '  I  O  N   O  U  T  P  U  T    >'/28X,'<',55(1H-),'>')
1008	FORMAT (//3X,'X  -  D I S P L A C E M E N T   (*1000)'/3X,
     129(1H-)/)
1009	FORMAT (//3X,'Y  -  D I S P L A C E M E N T   (*1000)'/3X,
     129(1H-)/)
1025	FORMAT (1X,'/----//----------//----------//----------//',
     1		'----------//----------//----------//----------//',
     2		'----------//----------//----------/')
1026	FORMAT(13X,'1',11X,'2',11X,'3',11X,'4',11X,'5',11X,'6',11X,'7'
     1,11X,'8',11X,'9',10X,'10'/)
C  1027 FORMAT(A1,I4,G13.4,9G12.4)
1027	FORMAT(I5,F13.6,9F12.6)
1028	FORMAT(//3X,'LOADING',I4)
1029	FORMAT(//' ******* PLOT SECTION COMPLETED')
	END
