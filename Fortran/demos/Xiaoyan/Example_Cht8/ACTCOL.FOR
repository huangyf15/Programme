	SUBROUTINE ACTCOL (A,B,JDIAG,NEQ,AFAC,BACK)
C
C.......................................................................
C
C     ACTIVE COLUMN PROFILE SYMMETRIC EQUATION SOLVER
C
C     FACTOR A TO RT*D*R, REDUCE B
C
C.......................................................................
C
      INCLUDE 'COMMONB'
C
	LOGICAL AFAC,BACK
	DIMENSION A(1),B(1),JDIAG(1)

! XIANG
C***  FOR DELETED NODES ***
	DO I = 1, NEQ
		IPOS	= JDIAG(I)
		IF(A(IPOS) .EQ. 0.0D0) A(IPOS) = 1.0D-20
	ENDDO

C
	JR = 0
	DO 600 J=1,NEQ
	JD = JDIAG(J)
	JH = JD - JR
	IS = J - JH + 2
	IF(JH-2) 600,300,100
100	IF(.NOT.AFAC) GO TO 500
	IE = J - 1
	K = JR + 2
	ID = JDIAG(IS-1)
C.... REDUCE ALL EQUATIONS EXCEPT DIAGONAL
	DO 200 I=IS,IE
	IR = ID
	ID = JDIAG(I)
	IH = MIN0(ID-IR-1,I-IS+1)
	IF(IH.GT.0) A(K) = A(K) - DOT(A(K-IH),A(ID-IH),IH)
200	K = K + 1
C.... REDUCE DIAGONAL TERM
300	IF(.NOT.AFAC) GO TO 500
	IR = JR + 1
	IE = JD - 1
	K = J - JD
	DO 400 I=IR,IE
	ID = JDIAG(K+I)
	IF(A(ID).EQ.0.0D0) THEN
          WRITE(IPR,*) '******ZERO DIAGNAL TERM IN FACTORIZING'     !T
          STOP                                                !T
CT          GO TO 400
      ENDIF
	D = A(I)
	A(I) = A(I)/A(ID)
	A(JD) = A(JD) - D*A(I)
400	CONTINUE
C.... REDUCE RHS
500	IF(BACK) B(J) = B(J) - DOT(A(JR+1),B(IS-1),JH-1)
600	JR = JD
	IF(.NOT.BACK) RETURN
C.... DIVIDE BY DIAGONAL PIVOTS
	DO 700 I=1,NEQ
	ID = JDIAG(I)	
	IF(A(ID).EQ.0.0) THEN                                     !T
          WRITE(*,*) '******ZERO DIAGNAL TERM IN BACK SUBSTITUTION'   !T
		 WRITE(IPR,*) '******ZERO DIAGNAL TERM IN BACK SUBSTITUTION'   !T
         STOP                                                    !T
      ENDIF                                                     !T
	B(I) = B(I)/A(ID)                                         !T
700	CONTINUE
C.... BACKSUBSTITUTE
	J = NEQ
	JD = JDIAG(J)
800	D = B(J)
	J = J-1
	IF(J.LE.0) RETURN
	JR = JDIAG(J)
	IF(JD-JR.LE.1) GO TO 1000
	IF(D.EQ.0.0) GO TO 1000
	IS = J - JD + JR + 2
	K = JR - IS + 1
	DO 900 I=IS,J
900	B(I) = B(I) - A(I+K)*D
1000	JD = JR
	GO TO 800
	END
	FUNCTION  DOT (A,B,NM)
C
C-------------------------------------------------------------------------
C	DATA PRODUCT A(I)*B(I)
C-------------------------------------------------------------------------
C
      INCLUDE 'COMMONB'
	DIMENSION A(1),B(1)
	DOT=0.0
	DO  100  J=1,NM
100	DOT=DOT+A(J)*B(J)
	RETURN
	END
