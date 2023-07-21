C**********************************************************************
C       FUNCTION:                                                     *
C            COMPUTE [K]                                              *
C       PARAMETERS:                                                   *
C            K(1830)       [K]                                        *
C            B(3,20,27)    [B]                                        *
C            H(27)         [H]                                        *
C            JACOBI(27)    [J]                                        *
C**********************************************************************
      SUBROUTINE STIFFMAIN_c(K,B,H,JACOBI,dmat_t,NIG,NED,NND)

      REAL*8  K(3*NND,3*NND)        ! [K] =[B]row [D] [B]col
      REAL*8  B(3,NND,27)           ! [B]row
      REAL*8  H(27)                 ! WEIGHT FUNCTION [H]
      REAL*8  JACOBI(27)            ! |[J]| OF GAUSS POINT
      REAL*8  Br,Cr,Dr,Bs,Cs,Ds
      REAL*8  aa 
      REAL*8  KK(3,3)               ! [KK]=[B]r[D][B]s
	real*8  dmat_t(6,6,27)        ! [D]
	real*8  t11, t12, t13, t14, t15, t16
      real*8  t21, t22, t23, t24, t25, t26
	real*8  t31, t32, t33, t34, t35, t36

      
      DO 100 I=1,3*NED             ! INITIALIZE [K]
      DO 100 J=1,3*NED
100   K(I,J)=0.0

      DO 10 I=1,NED     ! 1<I<NPNT
      DO 10 J=1,NED     ! I<J<NPNT

      DO 20 IG=1,NIG
         Br=B(1,I,IG)
         Cr=B(2,I,IG)
         Dr=B(3,I,IG)
         Bs=B(1,J,IG)
         Cs=B(2,J,IG)
         Ds=B(3,J,IG)

	   t11 = dmat_t(1,1,ig) * br + dmat_t(4,1,ig) * cr + 
     &         dmat_t(6,1,ig) * dr
	   t12 = dmat_t(1,2,ig) * br + dmat_t(4,2,ig) * cr + 
     &         dmat_t(6,2,ig) * dr
	   t13 = dmat_t(1,3,ig) * br + dmat_t(4,3,ig) * cr + 
     &         dmat_t(6,3,ig) * dr
	   t14 = dmat_t(1,4,ig) * br + dmat_t(4,4,ig) * cr + 
     &         dmat_t(6,4,ig) * dr
	   t15 = dmat_t(1,5,ig) * br + dmat_t(4,5,ig) * cr + 
     &         dmat_t(6,5,ig) * dr
	   t16 = dmat_t(1,6,ig) * br + dmat_t(4,6,ig) * cr + 
     &         dmat_t(6,6,ig) * dr
	   
         t21 = dmat_t(2,1,ig) * cr + dmat_t(4,1,ig) * br + 
     &         dmat_t(5,1,ig) * dr
	   t22 = dmat_t(2,2,ig) * cr + dmat_t(4,2,ig) * br + 
     &         dmat_t(5,2,ig) * dr
	   t23 = dmat_t(2,3,ig) * cr + dmat_t(4,3,ig) * br + 
     &         dmat_t(5,3,ig) * dr
	   t24 = dmat_t(2,4,ig) * cr + dmat_t(4,4,ig) * br + 
     &         dmat_t(5,4,ig) * dr
	   t25 = dmat_t(2,5,ig) * cr + dmat_t(4,5,ig) * br + 
     &         dmat_t(5,5,ig) * dr
	   t26 = dmat_t(2,6,ig) * cr + dmat_t(4,6,ig) * br + 
     &         dmat_t(5,6,ig) * dr
	   
         t31 = dmat_t(3,1,ig) * dr + dmat_t(5,1,ig) * cr + 
     &         dmat_t(6,1,ig) * br
	   t32 = dmat_t(3,2,ig) * dr + dmat_t(5,2,ig) * cr + 
     &         dmat_t(6,2,ig) * br
	   t33 = dmat_t(3,3,ig) * dr + dmat_t(5,3,ig) * cr + 
     &         dmat_t(6,3,ig) * br
	   t34 = dmat_t(3,4,ig) * dr + dmat_t(5,4,ig) * cr + 
     &         dmat_t(6,4,ig) * br
	   t35 = dmat_t(3,5,ig) * dr + dmat_t(5,5,ig) * cr + 
     &         dmat_t(6,5,ig) * br
	   t36 = dmat_t(3,6,ig) * dr + dmat_t(5,6,ig) * cr + 
     &         dmat_t(6,6,ig) * br

         KK(1,1) = t11 * Bs + t14 * Cs + t16 * Ds
         KK(1,2) = t12 * cs + t14 * bs + t15 * Ds
         KK(1,3) = t13 * ds + t15 * Cs + t16 * bs
         KK(2,1) = t21 * Bs + t24 * Cs + t26 * ds
         KK(2,2) = t22 * cs + t24 * bs + t25 * Ds
         KK(2,3) = t23 * ds + t25 * Cs + t26 * bs
         KK(3,1) = t31 * Bs + t34 * Cs + t36 * Ds
         KK(3,2) = t32 * cs + t34 * bs + t35 * Ds
         KK(3,3) = t33 * ds + t35 * Cs + t36 * bs

         I0=3*(I-1)
         J0=3*(J-1)
         AA=JACOBI(IG)*H(IG)

         DO 30 IROW=1,3
         DO 30 ICOL=1,3
30       K(I0+IROW,J0+ICOL)=K(I0+IROW,J0+ICOL)+AA*KK(IROW,ICOL)

20    CONTINUE    !ENDDO OF 1<IG<NGAU
10    CONTINUE    !EDNDO OF 1<I,J<NPNT
      END