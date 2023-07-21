!****************************************************************************
!
!  PROGRAM: ASSEM_FORCE
!
!  PURPOSE: Assembly the element force vector to global force vector
!  
!  PROGRAMMER: Zhihai Xiang
!
!  DATE: Jan 24, 2006
!****************************************************************************

SUBROUTINE ASSEM_FORCE

USE SOLUTION_DATA, ONLY: INT_KIND, REAL_KIND, NUM_ELEMENT, NUM_NODAL_FORCE, ELEMENTS,&
                          NODE_DISP_DOF, FORCE, ELEMENT_FORCE, NODAL_FORCE

IMPLICIT NONE
INTEGER(INT_KIND)   I        ! LOOP INDEX
INTEGER(INT_KIND)   J        ! LOOP INDEX
INTEGER(INT_KIND)   NODE     ! NODE NUMBER
INTEGER(INT_KIND)   DOFS     ! THE NUMBER OF DOFS OF AN ELEMENT NODE

FORCE = 0.0

DO I = 1, NUM_NODAL_FORCE
   NODE = NODAL_FORCE(I)%NODE
   WHERE(NODAL_FORCE(I)%GIVEN) FORCE(NODE_DISP_DOF(NODE)%DOFS) = NODAL_FORCE(I)%VALUE   
ENDDO

DO I = 1, NUM_ELEMENT
   DO J = 1, ELEMENTS(I)%NUM_NODE
      NODE = ELEMENTS(I)%NODE(J)
      DOFS = ELEMENTS(I)%DISP_DOF
      FORCE(NODE_DISP_DOF(NODE)%DOFS) = FORCE(NODE_DISP_DOF(NODE)%DOFS) +&
                                        ELEMENT_FORCE(I)%VALUE((J - 1) * DOFS + 1:J * DOFS)
   ENDDO
ENDDO

END