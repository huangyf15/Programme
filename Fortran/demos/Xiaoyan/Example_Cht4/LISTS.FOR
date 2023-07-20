	SUBROUTINE LISTS (WORD,LISTN,LISPOS)
C
C  *********************************************************************
C  **  L I S T S  **
C  *********************************************************************
C
C  PURPOSE: Program to finad a word in a list
C
C  ------------------------/ INPUT PARAMETER/---------------------------
C  WORD ..... 4 CHARAKTER WORD TO BE FOUND
C  LISTN .... NUMBER OF LIST
C
C  ------------------------/ OUTPUT PARAMETER/--------------------------
C  LISPOS ... POSITION IN THE LIST ( 0 ... WORD NOT FOUND )
C
C  REMARK
C  NUM(I) .... NUMBER OF ELEMENTS IN A LIST
C  .           I = NUMBER OF LISTS
C  LIST(J) ... ALL 4 CHARAKTER WORDS
C  .           J = NUMBER OF WORDS
C
C  *********************************************************************
C
C  PROGRAMMING: WOLFGANG MERTZ
C  DECEMBER 1979
C
	IMPLICIT DOUBLEPRECISION (A-H,O-Z)
	DIMENSION NUM(11)
	CHARACTER*4 WORD,LIST(362)
C
	DATA NUM / 22,13,12,65,62,32,65,17,7,36,31 /
	DATA LIST/
     1	'FINA','JOIN','COOR','RELE','CONS','LOAD','MACR','PRIN',
     1	'SOLV','STOP','TYPE','ELEM','PROP','INCI','END ','PLOT',
     1	'STRU','TABL','COUP','SOLU','REST','ACCE',
     2	'X   ','Y   ','Z   ','S   ','SUPP','TO  ','INCR','DX  ',
     2	'DY  ','DZ  ','LOOP','T   ','DT  ',
     3	'X   ','Y   ','Z   ','FORC','MOME','TO  ','INCR','JOIN',
     3    'AND ','STAR','END ','P   ',
     4	'COHE','PHI ','E   ','POIS','TO  ','DAMA','COTE','GAMM',
     4	'INCR','E1  ','E2  ','G2  ','NUE1','NUE2','ALFA','EB  ',
     4	'D   ','SIGZ','SGR ','MATE','ORIE','SM  ','ETA ','N   ',
     4	'EBT ','CREE','PLAS','ELAS','DECO','    ','MC  ','DP  ',
     4    'HM  ','TR  ','VISC','DESA','DAMP','SLIP','FC1 ','FC2 ',
     4    'FC3 ','SHOT','CONC','TAUG','SIGB','DB  ','DH  ','GG  ',
     4    'CHEN','HARD','SIGY','HOEK','DP1 ','DP2 ','COMP','AEC ',
     4    'EHM ','CS1 ','CS2 ','LAD1','LAD2','CAP ','DAM2','KX  ',
     4    'KY  ',
     5	'FORC','MOME','X   ','Y   ','Z   ','JOIN','UNIF','LOAD',
     5	'CONC','STRA','TO  ','INIT','STRE','SIGM','WA  ','WB  ',
     5	'YA  ','YB  ','ELIM','XY  ','INCR','TAU ','TEMP','T1  ',
     5	'T2  ','T3  ','LINE','SIDE','DEAD','XL  ','YL  ','COMB',
     5	'UNSA','EX  ','EY  ','EXY ','T13 ','T5  ','SINU','SURF',
     5	'YZ  ','ZX  ','XA  ','XB  ','ZA  ','ZB  ','SUPP','LAYE',
     5	'TB  ','TT  ','T   ','LOCA','GLOB','STAR','TIME','FUNC',
     5    'DELE','ACCE','PRES','EXCA','P   ','PORE',
     6	'PLAN','STRE','PLAT','BEND','TRID','STRA','AXIS','SAND',
     6    'SHEL','HALF','ALFA','SYMM','X   ','XY  ','XYZ ','STAT',
     6    'DYNA','CENT','NEWM','WILS','THET','EIGE','IMAS','DAMP',
     6    'UNSY','DIFF','DAMA','FLUI','LARG','XZ  ','CONS','EFFE',
     7	'TYPE','THIC','TO  ','CST ','LST ','LSTA','LFR ','JOIN',
     7	'SD3H','TUBA','SAME','AS  ','BEAM','AREA','INCR','IZ  ',
     7	'D1  ','D2  ','D3  ','IX  ','IY  ','ALFA','IPLS','IPQS',
     7	'GRID','ISPL','ISPQ','ISPC','LAYE','SHEL','D4  ','C1  ',
     7    'C2  ','C3  ','PLB ','PQB ','COJO','SR3H','PQI ','SLB ',
     7	'SQB ','SQI ','ISSQ','ISSC','A   ','B   ','BOLT','IPQP',
     7    'IPQT','BCJ ','FLUI','COJ2','COJ3','H   ','H2  ','H3  ',
     7    'AST ','ASB ','CT  ','CB  ','CSH1','CSH2','SURF','LSTC',
     7    'IPQC',
     8	'DATA','STRU','LOAD','STIF','EQUA','DISP','SYST','SOLU',
     8	'STRE','TO  ','AVER','SUPP','STEP','ITER','RBM ','FORC',
     8	'MASS',
     9	'MODI','TO  ','INCR','INSE','DELE','XXXX','ACTI',
     O	'MATE','ORIE','E11 ','NUE1','E22 ','NUE2','G12 ','C   ',
     O	'ES  ','THET','PSI ','PHI ','PHI1','PHI2','PHI3','ALF1',
     O	'ALF2','ALF3','ALFA','ALFV','GAMM','ETA ','EBT ','DAMA',
     O    'OMEG','CT  ','CN  ','CLX ','CLY ','CREE','A   ','B   ',
     O    'K   ','M   ','N   ','GROU',
     1	'ITER','STEP','LOOP','STAR','END ','LOAD','STIF','DATA',
     1	'EQUA','MODI','FORC','CONS','FRON','CORE','OPTI','SAVE',
     1	'SUPP','TIME','TO  ','DELT','DYNA','NOBO','MASS','UNSA',
     1	'BOUN','MATR','WRIT','INIT','STRE','ERRO','PCGM' /
C
C
	L	= LISTN-1
	K	= 0
	IF(L.EQ.0) GOTO 100
	DO 1 I	= 1,L
1	K	= K+NUM(I)
100	N	= NUM(LISTN)
	LISPOS	= 0
	DO 2 I	= 1,N
	IF(WORD.NE.LIST(I+K)) GOTO 2
	LISPOS	= I
	GOTO 999
2	CONTINUE
C
999	RETURN
	END
