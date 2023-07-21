	SUBROUTINE ASFIL (KONT1,KONT2)
C
C  *********************************************************************
C  **  A S F I L **
C  *********************************************************************
C
C  PURPOSE:
C  F I N A L   --   FILE HANDLING PROGRAM
C
C  ------------------------/ INPUT PARAMETER/---------------------------
C  KONT1 ... Overlay number 
C            2 = FINAL1
C  KONT2 ... CONTROL VARIABLE
C
C  ------------------------/ OUTPUT PARAMETER/--------------------------
C
C  *********************************************************************
C
	INCLUDE 'COMMON'
	INCLUDE 'SYSDAT'
	INCLUDE	'COMFIL'
	COMMON / RESTAR / KONRST,IFIRST,NRESTA
	COMMON / BOUND / NBCNT,NBTOT,NBSTAT,NBEND,EBOUND,KONTEM
	COMMON /BUFF/ BUFF(128)
	DIMENSION BUFF2(160),BUFF3(160),COTA(3,42)
	DIMENSION BSTIFF(20301),LVABL(402)
	EQUIVALENCE (B(31),COTA(1,1)),
     -		    (B(4532),BUFF2(1)),
     -            (B(4692),BUFF3(1)),
     -            (B(62501),BSTIFF(1)),
     -            (B(82802),LVABL(1))
	COMMON / MAX / MAELJO,MACOTA,MASUTA,MAELEM,MALOAD,MACOBL,MAEREL,
     -		       MAEADD
	CHARACTER LICHLD*20,CHKSUM*19, PFILE*80
	INTEGER	  CHKERR
	INTEGER*2 STAT,NARG
	CHARACTER*10 DATUM
	LOGICAL EXIST
	CHARACTER	DSKNAM(10),LICDSK*1
	DATA		DSKNAM /'C','D','E','F','G',
     -				'H','I','J','K','L'/
	CHARACTER*10 SCRNAM(3)
	DATA  SCRNAM /'FINAL_SCR1','FINAL_SCR2','FINAL_SCR3'/
C  Look for disk with DIR: FINAL_SCR1, FINAL_SCR2, FINAL_SCR3
	DO  L = 1,3
	DO  IDSK = 1,10
	    INQUIRE	(
     -		FILE	= DSKNAM(IDSK)//':\'//SCRNAM(L)(1:10),
     -		EXIST	= EXIST)
	    IF (EXIST) THEN
		  DISK(L)(1:1) = DSKNAM(IDSK)
	      DISK(L)(2:2) = ':'
		  GO TO 90 
		ENDIF
	END DO
90	IF (IDSK .EQ. 11)  THEN
		    STOP '%FINAL-F-ASFIL, No scratch FINAL_SCRi'
	ENDIF
	END DO
C
C
	GOTO (100,200,300,400,500,600),KONT1
C
C  F I N A L  -  1  (INPUT TRANSLATOR + SYSTEM DATA PREPARATION)
C  -------------------------------------------------------------
C
100	GOTO (120,130,160,110,170,180,195,196),KONT2
C
C  TERMINAL START
C
110	DO 10 L	= 1,6
10	TIMETA(L) = 0.0
C
	ISYS(1)	= 1
	CALL TIMES(SEC)
	IPAGE	= 0
	ITI	= 5
	ITO	= 6
C-----------------------------------------------------------
C	! license check routine
	LUN = 30
	CHKSUM(1:19) = ' '
c	CALL CHKLIC(CHKERR,LUN,'FINAL','7.1',LICHLD,CHKSUM,LICDSK)
c	IF (CHKERR.NE.0) THEN
c	    STOP '%FINAL-F-NOINF, No or wrong license'
c	END IF
	! license check routine
C------------------------------------------------------------
C
C INPUT
	NARG=1
	CALL GETARG (NARG,IFILE,STAT)
	IF(STAT.LE.0) THEN
	  WRITE(ITO,6000)
	  READ (ITI,5000,END=190) IFILE
	ENDIF
	  INQUIRE	(
     -		FILE	= IFILE,
     -		EXIST	= EXIST)
	IF(.NOT.EXIST) STOP '%FINAL-F-NOINF, inputfile does not exist'
	OPEN	(
     -		UNIT	= ICD,
     -		FILE	= IFILE,
     -		STATUS	= 'OLD')
C
C OUTPUT
	OFILE=' '
	NARG=2
	CALL GETARG (NARG,OFILE,STAT)
	IF(STAT.LE.0) THEN
	  WRITE(ITO,6001)
	  READ (ITI,5000,END=190) OFILE
	ENDIF
C Check if it is a *.PS  *.ps  or  *.Ps  (Postscript File)
	IPOST=0
	DO   I = 1,78
	IF( OFILE(I:I) .EQ. '.')  THEN
	    IF(OFILE(I+1:I+2) .EQ. 'PS' .OR.	
     -       OFILE(I+1:I+2) .EQ. 'ps' .OR.
     -       OFILE(I+1:I+2) .EQ. 'Ps')  IPOST=1
      ENDIF
	ENDDO
C
	IF(IPOST .EQ. 0)  THEN	
	   OPEN	(
     -		UNIT	= IPR,
     -		FILE	= OFILE,
     -		STATUS	= 'UNKNOWN')
	ENDIF
C
	IF(IPOST .EQ. 1)  THEN
	   OPEN	(
     -		UNIT	= IPR,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINALOUT.TMP',
     -		STATUS	= 'UNKNOWN')
	   INQUIRE	(
     -		FILE = LICDSK//':\LICENSE\PS.HEADER',
     -		EXIST = EXIST)
	   IF(.NOT.EXIST) 
     -		STOP '%ASFIL-F-NOFIL, no PS.HEADER file existing'
	   OPEN	(
     -		UNIT	= IPSHEAD,
     -		FILE	= LICDSK//':\LICENSE\PS.HEADER',
     -		STATUS	= 'OLD',
     -		FORM	= 'FORMATTED',
     -		IOSTAT  = IOS)
	   OPEN	(
     -		UNIT	= IPSS,
     -		FILE	= OFILE,
     -		STATUS	= 'UNKNOWN')
	ENDIF	
C PLOTFILE
	NARG=3
	CALL GETARG (NARG,PFILE,STAT)
	IF(STAT.LE.0) THEN
	  WRITE(ITO,6002)
	  READ (ITI,5000,END=190) PFILE
	ENDIF
C
	OPEN	(
     -		UNIT	= ITAP3,
     -		FILE	= PFILE,
     -		ACCESS	= 'SEQUENTIAL',
*     -		ACCESS	= 'APPEND',     !DEC Alpha
     -		FORM	= 'UNFORMATTED',
*     -		FORM	= 'BINARY',
     -		STATUS	= 'UNKNOWN')
C
*	CALL ASYMB
	OPEN	(
     -		UNIT	= IDAU1,
     -		FILE	=  DISK(1)//'\FINAL_SCR1\FINAL1.TMP',
     -		ACCESS	= 'DIRECT',
     -		FORM	= 'UNFORMATTED',
     -		RECL	=  256,
     -		STATUS	= 'UNKNOWN')
	OPEN	(
     -		UNIT	= IDAU2,
     -		FILE	= DISK(2)//'\FINAL_SCR2\FINAL2.TMP',
     -		ACCESS	= 'DIRECT',
     -		FORM	= 'UNFORMATTED',
     -		RECL	=  256,
     -		STATUS	= 'UNKNOWN')
	  OPEN	(
     -		UNIT	= IDC,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINA12.TMP',
     -		ACCESS	= 'DIRECT',
     -		FORM	= 'UNFORMATTED',
     -		RECL	=  400,
     -		STATUS	= 'UNKNOWN')
	CALL OPGTPT ()
	CALL PAGE
	CALL DATE_FIN (DATUM)
	WRITE(IPR,1000) DATUM
	WRITE(IPR,1001) IFILE
	WRITE(IPR,1002) OFILE
	WRITE(IPR,1003)
	NZEIZ	= NZEIZ-5
C  DATA
	ITER(3)	= 0
	DO 11 I	= 21,128
11	BUFF(I)	= 0.0
	IPRIX(14) = 0
	NAB	= 0
C  .....................................................................
	DO 12 I	= 1,128
	BUFF3(I) = 0.0
12	CONTINUE
	CALL OUT (IDA,0,1,BUFF3,1,128)
	CALL OUT (IDA,0,2,BUFF3,1,128)
	CALL OUT (IDA,0,3,BUFF3,1,128)
C  .....................................................................
	GOTO 999
C
C  INPUT TRANSLATOR
C
120	GOTO 999
C
C  BEFORE SYSTEM DATA PREPARATION
C
130	CALL TIMES (SEC)
	TIMETA(1) = TIMETA(1)+SEC
C  I D B   LOAD DATA
	NELCN	= NELTOT
C  for RESTART IDBL1,IDBL2 is known
	IF (KONRST .NE. 2)  THEN
	  GO TO (131,131,132,131,131, 132,133,132,131,134,
     -         132), KSYSTP
	  STOP '%FINAL-F-ASFIL, system type not specified'
131	    IDBL1	= 21
	    IDBL2	= 21
	  GOTO 139
132	    IDBL1	= 82
	    IDBL2	= 160
	  GOTO 139
133	    IDBL1	= 31
	    IDBL2	= 21
	  GOTO 139
134	    IDBL1	= 22
	    IDBL2	= 22
	  GOTO 139
	ENDIF
C  INITIAL STRESS UNSAVE
139	GOTO (150,140,153),INUNSA+1
C  READ INITIAL STRESS
140	INQUIRE	(
     -		FILE	= STFILE,
     -		EXIST	= EXIST)
	IF(.NOT.EXIST) STOP '%FINAL-F-NOSTF, stressfile does not exist'
	OPEN	(
     -		UNIT	= ITAP6,
     -		FILE	= STFILE,
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
C
	IDBLMX  = MAX(IDBL1,IDBL2)
	CALL PZERO (BUFF3,IDBLMX)
	REWIND ITAP6
	DO 149 NEL = 1,NELCN
C  IDB,4
	   READ (ITAP6) (BUFF2(J),J=1,IDBL2)
	   IF (KSOTYP.EQ.1) THEN
C             STATIC SOLUTION
	      CALL OUT (IDB,3,NEL,BUFF3,1,IDBL1)
	      IF (LTYPSY.LT.0) THEN
	         CALL IN (IDB,4,NEL,BUFF3,1,IDBL2)
	         DO 141 K = 1, IDBL2
	            BUFF2(K) = BUFF2(K) + BUFF3(K)
	            BUFF3(K) = 0.0
141	            CONTINUE
	      ENDIF
	      CALL OUT (IDB,4,NEL,BUFF2,1,IDBL2)
C  IDB,5
	      READ (ITAP6) (BUFF2(J),J=1,IDBL2)
	      IF (LTYPSY.LT.0) THEN
	         CALL IN (IDB,5,NEL,BUFF3,1,IDBL2)
	         DO 142 K = 1, IDBL2
	            BUFF2(K) = BUFF2(K) + BUFF3(K)
	            BUFF3(K) = 0.0
142	            CONTINUE
	      CALL OUT (IDB,5,NEL,BUFF2,1,IDBL2)
	      ENDIF
	   ENDIF
C   DYNAMIC SOLUTION
	   IF (KSOTYP.EQ.2) THEN
	      CALL OUT (IDB,6,NEL,BUFF3,1,IDBL2)
	      IF (LTYPSY.LT.0) THEN
	         CALL IN (IDB,5,NEL,BUFF3,1,IDBL2)
	         DO 143 K = 1, IDBL2
	            BUFF2(K) = BUFF2(K) + BUFF3(K)
143	           CONTINUE
	      ENDIF
	      CALL OUT (IDB,5,NEL,BUFF2,1,IDBL2)
	   ENDIF
149	CONTINUE
	CLOSE	(
     -		UNIT	= ITAP6,
     -		STATUS	= 'KEEP')
	INUNSA	= 2
	GOTO 153
C  CLEARE INITIAL STRESS
150	CALL PZERO (BUFF3,IDBL2)
	DO 151 NEL = 1,NELCN
C  STATIC SOLUTION
	IF(KSOTYP.EQ.1) CALL OUT (IDB,4,NEL,BUFF3,1,IDBL2)
C  DYNAMIC SOLUTION
	IF(KSOTYP.EQ.2) CALL OUT (IDB,5,NEL,BUFF3,1,IDBL2)
151	CONTINUE
C  CLEAR INITIAL STRESS FOR TRIDIMENSIONAL
	IF(KSYSTP.EQ.3 .OR. KSYSTP.EQ.11) THEN
	  DO 152 NEL = 1,NELCN
C  STATIC SOLUTION
	  IF(KSOTYP.EQ.1) CALL OUT (IDB,5,NEL,BUFF3,1,IDBL2)
C  DYNAMIC SOLUTION
	  IF(KSOTYP.EQ.2) CALL OUT (IDB,6,NEL,BUFF3,1,IDBL2)
152	  CONTINUE
	ENDIF
	INUNSA	= 2
	GO TO 153
C
C  I D C L  SCRATCH DATA
C
153	IF(KONIDC .EQ. 1) THEN
	  GO TO (999,999,157,999,999, 999,999,157,999,999,
     -         157), KSYSTP
	  STOP '%FINAL-F-ASFIL, system type (KSYSTP) not specified'
C  OPEN IDCL 
157	  OPEN	(
     -		UNIT	= IDCL,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINAL8.TMP',
     -		ACCESS	= 'DIRECT',	
     -		RECL	=  IBLS(5),
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	GO TO 999
	ENDIF
C
C
C  END OF SYSTEM DATA PREPARATION
C
C
160	CALL TIMES (SEC)
	TIMETA(2) = TIMETA(2)+SEC
	GOTO 185
C
C  START OF SYSTEM DATA CHECK OUTPUT
C
170	GOTO 999
C
C  END OF SYSTEM DATA CHECK OUTPUT
C
180	CALL TIMES (SEC)
	TIMETA(2) = TIMETA(2)+SEC
C  SAVE LOW/HIGH COORDINATE BLOCK
185	K	= NCOOR
	IF(K.LE.42) K = 43
	CALL COORBL(K,K,COTA)
	K	= 1
	CALL COORBL(K,K,COTA)
	NAB	= -1
	GOTO 999
C
190	STOP '%FINAL-I-ENDFIL, end of file detected during read.'
C
C  OPEN RESTART FILE
C
195		OPEN	(
     -		UNIT	= ITAP5,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINALR.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	GOTO 999
C
C  CLOSE RESTART FILE
C
196		CLOSE	(
     -		UNIT	= ITAP5,
     -		STATUS	= 'KEEP')
	GOTO 999
C
C  F I N A L  -  2   (LOAD DATA)
C  -----------------------------
C
200	GOTO (210,220),KONT2
C
C  BEFORE FINAL2
C
210	IF(KONJLU.EQ.0) GOTO 999
	OPEN	(
     -		UNIT	= ITAP6,
     -		FILE	= JLFILE,
     -		STATUS	= 'UNKNOWN',
     -		FORM	= 'UNFORMATTED',
     -		ACCESS	= 'SEQUENTIAL')
	GOTO 999
C
C  AFTER FINAL2
C
220	CALL TIMES (SEC)
	TIMETA(3) = TIMETA(3)+SEC
	IF(KONJLU.EQ.0) GOTO 999
	CLOSE	(
     -		UNIT	= ITAP6,
     -		STATUS	= 'KEEP')
	GOTO 999
C
C  F I N A L  -  3   (STIFFNESS MATRICES)
C  --------------------------------------
C
300	GOTO (310,320),KONT2
C
C  BEFORE FINAL3
C
310	IF(NBCNT.EQ.0) GOTO 999
C  STIFFNESS MATRIX <BOUNDARY SUPERELEMENT>
	OPEN	(
     -		UNIT	= ITAP4,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINAL7.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
C  UNSAVE BOUNDERY MATRIX
	IF(KSTIFF(2).EQ.1) THEN
	  INQUIRE	(
     -		FILE	= BNDFIL(2),
     -		EXIST	= EXIST)
	  IF(.NOT.EXIST)
     -		STOP '%FINAL-F-NOBND, boundaryfile does not exist'
	  OPEN	(
     -		UNIT	= 20,
     -		FILE	= BNDFIL(2),
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	  READ (20)    KUREL,(LVABL(I),I=1,KUREL)
	  WRITE(ITAP4) KUREL,(LVABL(I),I=1,KUREL)
	  READ (20)    LZ,(BSTIFF(I),I=1,LZ)
	  WRITE(ITAP4) LZ,(BSTIFF(I),I=1,LZ)
	  IF(LZ.GT.20301) 
     -      STOP '%FINAL-F-ASFIL, boundary buffer too small'
C  Dynamic superelement damping matrix
	  IF(KSOTYP.EQ.2)  THEN
	    READ (20)    LZ,(BSTIFF(I),I=1,LZ)
	    WRITE(ITAP4) LZ,(BSTIFF(I),I=1,LZ)
	    IF(LZ.GT.20301) 
     -        STOP '%FINAL-F-ASFIL, boundary buffer too small'
	    READ(20) IBNODES,(LVABL(I),I=1,IBNODES)
	    WRITE(ITAP4) IBNODES,(LVABL(I),I=1,IBNODES)
	    READ(20) IBNODES,(LVABL(I),I=1,IBNODES)
	    WRITE(ITAP4) IBNODES,(LVABL(I),I=1,IBNODES)
	  ENDIF
	  REWIND ITAP4
	  CLOSE	(
     -		UNIT	= 20,
     -		STATUS	= 'KEEP')
	ENDIF
C  SCRATCH FILE FOR <TRID>  AND  <TRID UNSYM> 
	IF(KSYSTP.EQ.3 .OR. KSYSTP.EQ.11)  THEN
	  OPEN	(
     -		UNIT	= ITAP7,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINAL9.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	  OPEN	(
     -		UNIT	= ITAP8,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINA10.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	  OPEN	(
     -		UNIT	= ITAP9,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINA11.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	ENDIF
	GOTO 999
C
C  AFTER FINAL3
C
320	CALL TIMES (SEC)
	TIMETA(4) = TIMETA(4)+SEC
	IF(NBCNT.EQ.0) GOTO 999
C  SAVE BOUNDERY MATRIX
	IF(KSTIFF(1).EQ.1) THEN
	  OPEN	(
     -		UNIT	= 20,
     -		FILE	= BNDFIL(1),
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	  REWIND ITAP4
	  READ (ITAP4) KUREL,(LVABL(I),I=1,KUREL)
	  WRITE(20)    KUREL,(LVABL(I),I=1,KUREL)
	  READ (ITAP4) LZ,(BSTIFF(I),I=1,LZ)
	  WRITE(20)    LZ,(BSTIFF(I),I=1,LZ)
	  IF(LZ.GT.20301) STOP '%FINAL-F-ASFIL, boundary buffer too small'
	  CLOSE	(
     -		UNIT	= 20,
     -		STATUS	= 'KEEP')
	ENDIF
	CLOSE	(
     -		UNIT	= ITAP4,
     -		STATUS	= 'KEEP')
C  SCRATCH FILE FOR <TRID>  AND  <TRID UNSYM> 
	IF(KSYSTP.EQ.3 .OR. KSYSTP.EQ.11)  THEN
	   CLOSE	(
     -		UNIT	= ITAP9,
     -		STATUS	= 'DELETE')
	ENDIF
	GOTO 999
C
C  F I N A L  -  4   (MASSSS MATRICES)
C  -----------------------------------
C
400	GOTO (410,420),KONT2
C
C  BEFORE FINAL4
C
410	IF(NBCNT.NE.0 .AND. KSOTYP.EQ.2) THEN
	OPEN	(
     -		UNIT	= ITAP4,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINAL7.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	ENDIF
	GOTO 999
C
C  AFTER FINAL4
C
420	CALL TIMES (SEC)
	TIMETA(5) = TIMETA(5)+SEC
	GOTO 999
C
C  F I N A L  -  5   (EQUATION SOLVER)
C  -----------------------------------
C
500	GOTO (510,520),KONT2
C
C  BEFORE FINAL5
C
510	IF(NBCNT.NE.0) THEN
C  STIFFNESS MATRIX <BOUNDARY SUPERELEMENT>
	  OPEN	(
     -		UNIT	= ITAP4,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINAL7.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	ENDIF
C
C  PCGM  open needed files:
C
	IF (ISYS(3).EQ.4) THEN
   	  OPEN	(
     -		UNIT	= ITAP20,
     -		FILE	= DISK(2)//'\FINAL_SCR2\FINA20.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
 	  OPEN	(
     -		UNIT	= ITAP21,
     -		FILE	= DISK(2)//'\FINAL_SCR2\FINA21.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
 	  OPEN	(
     -		UNIT	=  ITAP22,
     -		FILE	= DISK(2)//'\FINAL_SCR2\FINA22.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	ENDIF
	GOTO 999
C
C  AFTER FINAL5
C
520	CALL TIMES (SEC)
	TIMETA(6) = TIMETA(6)+SEC
	IF(NBCNT.NE.0 .AND. KSOTYP.EQ.1) THEN
 	  CLOSE	(
     -		UNIT	= ITAP4,
     -		STATUS	= 'KEEP')
	ENDIF
	GOTO 999
C
C  F I N A L  -  6   (RESULTS)
C  ---------------------------
C
600	GOTO (610,620,630),KONT2
C
C  BEFORE FINAL6
C
610	IF (KONINI.EQ.0) GOTO 999
C  SAVE INITIAL STRESS
	OPEN	(
     -		UNIT	= ITAP6,
     -		FILE	= STFILE,
     -		FORM	= 'UNFORMATTED',
     -		ACCESS	= 'SEQUENTIAL',
     -		STATUS	= 'UNKNOWN')
	GOTO 999
C
C  AFTER FINAL6
C
620	CALL TIMES (SEC)
	TIMETA(7) = TIMETA(7)+SEC
	IF (KONINI.EQ.0) GOTO 999
	REWIND ITAP6
	CLOSE	(
     -		UNIT	= ITAP6,
     -		STATUS	= 'KEEP')
	GOTO 999
C
C  OPEN RESTART FILE
C
630		OPEN	(
     -		UNIT	= ITAP5,
     -		FILE	= DISK(1)//'\FINAL_SCR1\FINALR.TMP',
     -		ACCESS	= 'SEQUENTIAL',
     -		FORM	= 'UNFORMATTED',
     -		STATUS	= 'UNKNOWN')
	GOTO 999
C
999	RETURN
C
5000	FORMAT(A)
6000	FORMAT(' $'/' $ Program  F I N A L  Windows/NT'/' $ ',30(1H-)/
     -	' $'/' $ Please enter Inputfile',T36,': ',$)
6001	FORMAT(' $ Please enter Outputfile',T36,': ',$)
6002	FORMAT(' $ Please enter Plottfile',T36,': ',$)
1000	FORMAT(/10X,'DATE        : ',A)
1001	FORMAT( 10X,'INPUT-FILE  : ',A)
1002	FORMAT( 10X,'OUTPUT-FILE : ',A)
1003	FORMAT()
	END
	SUBROUTINE CHKLIC(ERROR,LUN,PROD,VERS,LICHLD,CHKSUM,LICDSK)   
C
C  -----------------------------------------------------------------------
C
C  C H K L I C
C
C  PROGRAM EXECUTES LICENSE CHECK    (Microsoft Powerstation)
C
C  INPUT PARAMETERS :
C
C  ERROR ............ error number  0 = no error
C  LUN .............. number of units
C  PROD ............. programname  (FINAL)
C  VERS ............. version number (7.1)
C  LICHLD ........... code
C  CHKSUM ........... code
C  LICDSK ........... Disk name (C/D/E  ...) for PS.HEADER
C
C  -----------------------------------------------------------------------
C
C  PROGRAMMING: Gerhard LANG
C
      Include 'flib.fi'
      Include 'flib.fd'
C      
	CHARACTER	PROD*(*),VERS*3,LICHLD*(*),CHKSUM*19
	CHARACTER	SERNR*9,LINE*40
	CHARACTER	INAME*60,CVERS*3
	INTEGER		ERROR,LUN,ICHK(19),BINARY(8)
	CHARACTER	LICVOL(10),LICDSK
	LOGICAL		EXIST
	DATA		LICVOL /'C','D','E','F','G',
     -				'H','I','J','K','L'/
C
	ERROR = 0
	NCP = LEN(PROD)
	IF (CHKSUM(1:1).EQ.' ') THEN
	    IDSK = 1
	    LICDSK = ' '
	    DO WHILE (IDSK.LE.10.AND.LICDSK.EQ.' ')
		INQUIRE	(
     -		     FILE = LICVOL(IDSK)//':\LICENSE\LICENSE.DAT',
     -		     EXIST = EXIST)
		IF (EXIST) LICDSK = LICVOL(IDSK)
		IDSK = IDSK + 1
	    END DO
	    IF(.NOT.EXIST) 
     -		STOP '%LICENSE-F-NOFIL, no license data base'
	    OPEN (
     -		UNIT	= LUN,
     -		FILE	= LICDSK//':\LICENSE\LICENSE.DAT',
     -		STATUS	= 'OLD',
     -		FORM	= 'FORMATTED',
     -		IOSTAT  = IOS)
	    READ (LUN,'(A)',IOSTAT=IOS) INAME
	    READ (LUN,'(A)',IOSTAT=IOS) CVERS
	    DO WHILE((INAME(1:NCP).NE.PROD.OR.VERS.NE.CVERS).AND.
     -		IOS.EQ.0)
		READ (LUN,*)
		READ (LUN,*)
		READ (LUN,*)
		READ (LUN,'(A)',IOSTAT=IOS) INAME
		READ (LUN,'(A)',IOSTAT=IOS) CVERS
	    END DO
	    IF (IOS.EQ.0) THEN
		READ (LUN,*)
		READ (LUN,'(A)') LICHLD
		READ (LUN,'(A)') CHKSUM
	    ELSE
		ERROR = 1
		WRITE(*,'(A)') 
     -		' %LICENSE-F-NOREC, no record stored for '//PROD
		GOTO 999
	    END IF
	    CLOSE (UNIT = LUN,STATUS='KEEP')
	END IF
C
	IF( .NOT. SYSTEMQQ('VOL '//LICDSK//': >SERIAL.NR') ) THEN  
C	IF( .NOT. SYSTEMQQ('VOL > SERIAL.NR') ) THEN     
	  WRITE(*,*)' SYSTEMQQ failed'
	  STOP
	ENDIF    
C
	OPEN (
     -	    UNIT = LUN,
     -	    FILE = 'SERIAL.NR',
     -	    STATUS = 'OLD',
     -	    FORM = 'FORMATTED')

	SERNR = '         '
	READ (LUN,'(A)',IOSTAT=IOS) LINE
	READ (LUN,'(A)',IOSTAT=IOS) LINE
	DO WHILE (SERNR.EQ.'         ' .AND. IOS.EQ.0)
	    I = 0
	    LH=LEN(LINE)
	    IF(LH.GT.40) LH=40
		DO I = 1,LH
		IF (LINE(I:I).EQ.'-') THEN
			SERNR = LINE(I-4:I+4)
	        GO TO 100
		END IF
	    ENDDO
	    READ (LUN,'(A)',IOSTAT=IOS) LINE
	END DO
C
100	CLOSE (UNIT=LUN,STATUS='DELETE')
	IF (SERNR.EQ.'         ') THEN
	    ERROR = 1
	    GOTO 999
	END IF

	DO I = 1, 4
	    ICHK(I) = ICHAR(SERNR(I:I))
	END DO
	DO I = 6, 9
	    ICHK(I) = ICHAR(SERNR(I-5:I-5))
	END DO
	DO I = 11, 14
	    ICHK(I) = ICHAR(SERNR(I-5:I-5))
	END DO
	DO I = 16, 19
	    ICHK(I) = ICHAR(SERNR(I-11:I-11))
	END DO
	I = NCP
	DO WHILE (PROD(I:I).EQ.' ')
	    I = I -1
	END DO
	I1 = ICHAR(PROD(I:I))
	I2 = ICHAR(PROD(I-1:I-1))
	DO I = 1,4
	   ICHK(I) = ICHK(I)/2+I1
	END DO
	DO I = 11,14
	   ICHK(I) = ICHK(I)/2+I1
	END DO
	DO I = 6,9
	   ICHK(I) = ICHK(I)/2+I2
	END DO
	DO I = 16,19
	   ICHK(I) = ICHK(I)/2+I2
	END DO
	DO I = 1, 19
	   IF (ICHK(I).GT.127) ICHK(I) = ICHK(I)/2
	END DO
	READ(VERS,'(F3.1)') RVERS
	KE = INT(RVERS*10./3.)
	DO I = 1,19
	    IF (I.NE.5.AND.I.NE.10.AND.I.NE.15) THEN
		DO J = 8,1,-1
		    IEX = INT(2**(J-1))
		    IF (IEX.LE.ICHK(I)) THEN
			BINARY(J) = 1
			ICHK(I) = ICHK(I) - IEX
		    ELSE
			BINARY(J) = 0
		    END IF
		END DO
		DO K = 1, KE+I
		    IH = BINARY(1)
		    DO J = 1,7
			BINARY(J) = BINARY(J+1)
		    END DO
		    BINARY(8) = IH
		END DO
		BINARY(8) = 0
		BINARY(7) = 1
		BINARY(6) = 0
		DO J = 1, 8
		    IEX = INT(2**(J-1))
		    ICHK(I) = ICHK(I)+BINARY(J)*IEX
		END DO
		IF (ICHK(I).LT.65) ICHK(I) = 65
		IF (ICHK(I).GT.90) ICHK(I) = ICHK(I) - 5
		IF (CHKSUM(I:I).NE.CHAR(ICHK(I))) THEN
		    ERROR = 1
		    GOTO 999
		END IF
	    END IF
	END DO
999	RETURN
	END

	SUBROUTINE DATE_FIN(DATUM)
	character datum*(*),datum1*8
	CALL DATE_AND_TIME(DATE = datum1 )
	IF(LEN(datum).lt.10)THEN
	  STOP ' DATE_FINAL: no. of characters for current date < 10'
	ELSE
	  datum(1:2) = datum1(7:8)
	  datum(3:3) = '-'
	  datum(4:5) = datum1(5:6)
	  datum(6:6) = '-'
	  datum(7:10) = datum1(1:4)
	END IF
	END   !  SUBROUTINE DATE_FIN

