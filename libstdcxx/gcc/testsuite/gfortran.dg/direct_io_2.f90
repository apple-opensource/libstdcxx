! { dg-do run }
!
! this testcase derived from NIST test FM413.FOR
! tests writing direct access files in ascending and descending
! REC's.
      PROGRAM FM413
      IMPLICIT LOGICAL (L)
      IMPLICIT CHARACTER*14 (C)
      OPEN (7, ACCESS = 'DIRECT', RECL = 80, STATUS='REPLACE', FILE="FOO" )
      IRECN = 13
      IREC = 13
      DO 4132 I = 1,100
      IREC = IREC + 2
      IRECN = IRECN + 2
      WRITE(7, REC = IREC) IPROG, IFILE, ITOTR, IRLGN, IRECN, IEOF,ICON21, ICON22, ICON31, ICON32, ICON33, ICON34, ICON55, ICON56
 4132 CONTINUE
      IRECN = 216
      IREC = 216
      DO 4133 I=1,100
      IREC = IREC - 2
      IRECN = IRECN - 2
      WRITE(7, REC = IREC) IPROG, IFILE, ITOTR, IRLGN, IRECN, IEOF,ICON21, ICON22, ICON31, ICON32, ICON33, ICON34, ICON55, ICON56
 4133 CONTINUE
      IRECCK = 13
      IRECN = 0
      IREC = 13
      IVCOMP = 0
      DO 4134 I = 1,100
      IREC = IREC + 2
      IRECCK = IRECCK + 2
      READ(7, REC = IREC) IPROG, IFILE, ITOTR, IRLGN, IRECN, IEOF,IVON21, IVON22, IVON31, IVON32, IVON33, IVON34, IVON55, IVON56
      IF (IRECN .NE. IRECCK) CALL ABORT
 4134 CONTINUE
      IRECCK = 216
      IRECN = 0
      IREC = 216
      DO 4135 I = 1,100
      IREC = IREC - 2
      IRECCK = IRECCK - 2
      READ(7, REC = IREC)  IPROG, IFILE, ITOTR, IRLGN, IRECN, IEOF,IVON21, IVON22, IVON31, IVON32, IVON33, IVON34, IVON55, IVON56
      IF (IRECN .NE. IRECCK) CALL ABORT
 4135 CONTINUE
      CLOSE(7, STATUS='DELETE')
      STOP
      END
