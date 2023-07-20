!****************************************************************************
!
!  PROGRAM: STIFFNESS
!
!  PURPOSE: Call subroutines to generate element stiffness for each element.
!  
!  PROGRAMMER: Zhihai Xiang
!
!  DATE: Jan 24, 2006
!****************************************************************************

SUBROUTINE STIFFNESS(OPTION)

USE SOLUTION_DATA, ONLY: INT_KIND, NUM_ELEMENT, ELEMENTS

IMPLICIT NONE
CHARACTER(*), INTENT(IN):: OPTION    ! LARGE OR SMALL DISPLACEMENT
INTEGER(INT_KIND) I_ELEMENT           ! LOOP INDEX

! FOR EACH ELEMENT
DO I_ELEMENT = 1, NUM_ELEMENT
   SELECT CASE(TRIM(ELEMENTS(I_ELEMENT)%ELEMENT_TYPE))
      CASE ('BEAM2')
         CALL STIFFNESS_BEAM2(I_ELEMENT, OPTION)
         
      CASE ('SHELL8')
      
      CASE ('BRICK20')
      
   END SELECT
ENDDO

END