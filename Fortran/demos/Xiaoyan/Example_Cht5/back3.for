      SUBROUTINE BACK3(ACTITER)
C
C  *******************************************************************
C  S T I F F N E S S   D A T A   P R E P A R A T I O N
C  *******************************************************************
C
C  GENERAL STIFFNESS DATA PREPARATION
C
	COMMON / BOUND / NBCNT,NBTOT,NBSTAT,NBEND,EBOUND,KONTEM	! XIANG NOV. 5, 2000
C  IDA - FILE - SECTOR 1
	COMMON /BUFF/ BUFF(128)
	DIMENSION ICONTA(6),NELTA(20),NFREED(60),COTA(3,20)
	LOGICAL ACTITER		! XIANG
	EQUIVALENCE  (BUFF(1),ICONTA(1)),
     1			    (BUFF(9),NELTA(1)),
     2				 (BUFF(21),NFREED(1)),
     3				 (BUFF(57),COTA(1,1)),
     4				 (BUFF(127),RKOEL)
C
	DIMENSION VEC1(5186),AK(144),VEC2(144),T(6,6),BUFM3(128),D(3,3)
	EQUIVALENCE  (B(1),VEC1(1)),
     1				 (B(5187),AK(1)),
     2				 (B(5331),VEC2(1)),
     3			  	 (B(5475),T(1,1)),
     4				 (B(5511),BUFM3(1))

C	IF(ISYS(1).NE.1)  WRITE(IPR,1000)
	WRITE(IPR,1000)
C  GET DAMAGE, BOLT GROUT Stiffness
C	CALL IN (IDA,0,3,BUFM3,1,128)
	
C
C  ---------------------------------------------------------------------
C  LOOP OVER ALL ELEMENTS
C  ---------------------------------------------------------------------
C
10	JUMCON	= 0

	DO 500 NEL = 1,NELCNT
	CALL IN (IDA,1,NEL,BUFF,1,128)
C
C  WHICH ELEMENT TYP?
C
	KTYP	= ICONTA(3)
C
C  STIFFNESS MATRIX EXISTS?
C
	IF(ICONTA(6).GT.0) GOTO 400
	GOTO(100,110, 120,130, 140,150, 160,170, 180,190,
     1     200,210, 220,220, 230,240, 240,240, 250,260,
     2	  260,270, 280,260, 260,260, 260,285, 285,290,
     3     300,305, 310,320, 330,340, 350,360)   ,KTYP
	STOP 'FIBACK-F-BACK3, element not specified'
C
C  ** CST **  
C
100     CONTINUE
	GOTO 400
C
C  ** LST ** 
C
110     CONTINUE
	IF(IDPROG.EQ.0) THEN
         CALL LSTD(D)      
         CALL LST (VEC1(1),D)	
	ELSE
        	CALL LSTDD(D)      
         CALL LST (VEC1(1),D)
	ENDIF
	GOTO 400
C
C  ** LSTA **
C
120     CONTINUE
	CALL LSTAD(BUFF,D)      ! D - el. anisotr. matrix
      CALL LSTA (VEC1(1),D)
	GOTO 400
C
C  ** LFR **
C
130     CONTINUE
	GOTO 400
C
C  ** JOINT **
C
140     CONTINUE
	CALL JOIN (VEC1(1))
	GOTO 400
C
C  ** SD3H **
C
150     CONTINUE
	GOTO 400
C
C  ** TUBA3 **
C
160     CONTINUE
	GOTO 400
C
C  ** TUBA6 (NOT IN LIBRARY) **
C
170	STOP '%FIBACK-F-BACK3, KTYP=8 NOT IN LIBRARY'
C
C  ** BEAM 2 **
C
180	CALL BEAM2 (VEC1(1))
	GOTO 400
C
C  ** BEAM 3 **
C
190     CONTINUE
	GOTO 400
C
C  ** BEAM 6 **
C
200     CONTINUE
	CALL BEAM6A (VEC1(1))
	CALL BEAM6B (VEC1(1))
	GOTO 400
C
C  ** BEAM 1 **
C
210     CONTINUE
*T210	CALL BEAM1 (VEC1(3))
	GOTO 400
C
C  ** IPLS,IPQS,IPMS **
C
220	IF (IDPROG .EQ. 0 .OR. RKOEL .EQ. 1.) THEN
	   NED = BUFF(6)
	   IF(NED.EQ.8 .OR. NED.EQ.20) THEN
             CALL ISO (KTYP,NEL,VEC1(1))
	   ELSE
CT	       CALL IPMS (NEL,VEC1(3))
	   ENDIF
      ELSE
C  DAMAGE PROPAGATION
         CALL SUBISO (KTYP,NEL,VEC1(1))
      ENDIF
	GOTO 400
C
C  ** GRID **
C
230     CONTINUE
	GOTO 400
C
C  ** ISPL, ISPQ, ISPC **
C
240     CONTINUE
	GOTO 400
C
C  ** SHELL **  
C
250     CALL SHELL (VEC1(1))
	GOTO 400
C
C  ** PLB, PQB, PQI, SLB, SQB, SQI **    BOUNDARY + INFINITE ELEMENTS
C
260	GOTO 500
C
C  ** COJO **
C
270     CONTINUE
*T270	IF(KSYSTP .NE. 10) CALL COJO  (VEC1(3))
*T	IF(KSYSTP .EQ. 10) CALL COJOF (VEC1(3))
	GOTO 400
C
C  ** SR3H **
C
280     CONTINUE
	GOTO 400
C
C  ** ISSQ  ISSC **
C
285	CALL ISSSTM (NEL,VEC1(1),JUMCON)
	IF(BUFF(19).LT.0.) THEN
	  BUFF(19) = -BUFF(19)
	  CALL OUT (IDA,1,NEL,BUFF,1,128)
	ENDIF
	GOTO 400
C
C  ** BOLT 2D, 3D (AYDAN) **
C
290     CONTINUE
	CALL BOLT (VEC1(1))
	GOTO 400
C
C  ** IPQP ** 
C
300   IF(IDPROG.EQ.0.OR.RKOEL.EQ.1.) THEN
	    CALL IPQP (NEL,VEC1(1))      
	ELSE
	    CALL DIPQP (NEL,VEC1(1))
	ENDIF
        GOTO 400
C
C  ** IPQT ** 
C
305     CALL IPQT (VEC1(1)) 
        GOTO 400
C
C  ** BCJ **
C
310     CONTINUE
*T310	CALL BCJ (NEL,VEC1(3),BUFM3)
	GOTO 400
C
C  ** FLUID **
C
320     CONTINUE
	GOTO 400
C 
C  ** COJ2 **
C
330     CONTINUE
	GOTO 400
C 
C  ** COJ3 **
C
340     CONTINUE
	GOTO 400
C 
C  ** CSH1 **
C
350     CONTINUE
	GOTO 400
C 
C  ** CSH2 **
C
360     CONTINUE
	GOTO 400
C
C  ***********************************************************************
C  SAVE STIFFNESS DATA, LOAD DATA AND SUPPORT CONDITIONS
C  ***********************************************************************
C
400	GOTO (410,410, 420,410, 410,420, 420,420, 420,420,
     1      420),  KSYSTP
	STOP '%FIBACK-F-BACK3, KSYSTP (system type) not specified'
410	CALL SAVE (NEL,VEC1,AK,VEC2)
	GOTO 500
C
C  SAVE THREEDIMENSIONAL * SANDWICH * SHELL * SANDWICH-SHELL
C       * PLANE STRAIN FLUID *   * PLANE STRAIN/STRESS UNSYM *
C
420	CALL THREE (NEL,VEC1,AK)
500	CONTINUE
C

c	XIANG Nov. 5, 2000
C************************************************************************
C  BOUNDARY ELEMENT STIFFNESSMATRIX OF SUPERELEMENT
C************************************************************************
C
	IF(NBCNT.NE.0 .AND. .NOT. ACTITER) CALL INFBOU(ISYM)	

	RETURN
C
C
1000	FORMAT(20X,'BACK3')
	END
