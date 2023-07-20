!****************************************************************************
!
!  PROGRAM: exam_6_4
!
!  PURPOSE: ×Ö·û´®±à¼­·ûÊ¾Àý 
!  
!  PROGRAMMER: ÏòÖ¾º£
!
!  DATE: March 12, 2006
!****************************************************************************

	program exam_6_4

	implicit none

      WRITE(6,900)
900   FORMAT(1H0,5X,13HDISPLACEMENTS)

	write(*,1000)
	write(*,1002)
	write(*,1003)
	write(*,1004)
	write(*,1005)
	write(*,1006)
	write(*,1007)
	write(*,1008)
C
C  F O R M A T
C
1000	FORMAT(//38X,'<',56(1H-),'>'/37X,'<  D  E  F  O  R  M  A  T',
     1	'  I  O  N  S - O  U  T  P  U  T   >'/38X,'<',56(1H-),'>')
1002	FORMAT(//2X,'X  -  D I S P L A C E M E N T'/2X,29(1H-)/)
1003	FORMAT(//2X,'Y  -  D I S P L A C E M E N T'/2X,29(1H-)/)
1004	FORMAT(//2X,'Z  -  D I S P L A C E M E N T'/2X,29(1H-)/)
1005	FORMAT(//2X,'X  -  R O T A T I O N'/2X,21(1H-)/)
1006	FORMAT(//2X,'Y  -  R O T A T I O N'/2X,21(1H-)/)
1007	FORMAT(1X,'/----//',10(1H-),'//',10(1H-),'//',10(1H-),'//',
     1	10(1H-),'//',10(1H-),'//',10(1H-),'//',10(1H-),'//',10(1H-),
     2	'//',10(1H-),'//',10(1H-),'/')
1008	FORMAT(13X,'1',11X,'2',11X,'3',11X,'4',11X,'5',11X,'6',11X,'7',
     1	11X,'8',11X,'9',10X,'10'/)

	end program exam_6_4

