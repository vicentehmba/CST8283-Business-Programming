      ******************************************************************
      * Author: VICENTE MBA ENGUNG
      * Date: NOVEMBER 21, 2023
      * Purpose: PROJECT 2 ASSIGNMENT
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVERT-TO-INDEXED.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE-IN ASSIGN TO "../STUFILE.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT INDEXED-STUDENT-FILE-OUT ASSIGN
           TO "../STUFILE-INDEXED.TXT"
               ORGANIZATION IS INDEXED
               ACCESS IS SEQUENTIAL
               RECORD KEY IS IND-STUDENT-NUMBER.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-FILE-IN.
       01 STUDENT-RECORD-IN.
           05 STUDENT-NUMBER  PIC 9(6).
           05 TUITION-OWED    PIC 9(4)V99.
           05 STUDENT-NAME    PIC X(40).
           05 PROGRAM-OF-STUDY    PIC X(6).
           05 COURSE-CODE-1   PIC X(7).
           05 AVERAGE-1       PIC 9(3).
           05 COURSE-CODE-2   PIC X(7).
           05 AVERAGE-2       PIC 9(3).
           05 COURSE-CODE-3   PIC X(7).
           05 AVERAGE-3       PIC 9(3).
           05 COURSE-CODE-4   PIC X(7).
           05 AVERAGE-4       PIC 9(3).
           05 COURSE-CODE-5   PIC X(7).
           05 AVERAGE-5       PIC 9(3).

       FD INDEXED-STUDENT-FILE-OUT.
       01 INDEXED-FILE-RECORD.
           05 IND-STUDENT-NUMBER  PIC 9(6).
           05 IND-TUITION-OWED    PIC 9(6)V99.
           05 IND-STUDENT-NAME    PIC X(40).
           05 IND-PROGRAM-OF-STUDY    PIC X(6).
           05 IND-COURSE-CODE-1   PIC X(7).
           05 IND-AVERAGE-1       PIC 9(3).
           05 IND-COURSE-CODE-2   PIC X(7).
           05 IND-AVERAGE-2       PIC 9(3).
           05 IND-COURSE-CODE-3   PIC X(7).
           05 IND-AVERAGE-3       PIC 9(3).
           05 IND-COURSE-CODE-4   PIC X(7).
           05 IND-AVERAGE-4       PIC 9(3).
           05 IND-COURSE-CODE-5   PIC X(7).
           05 IND-AVERAGE-5       PIC 9(3).

       WORKING-STORAGE SECTION.
       01 EOF-FLAG PIC X(3) VALUE "NO".
       01 WRITE-COUNTER PIC 9(3) VALUE ZERO.

       PROCEDURE DIVISION.
       100-CONVERT-STUDENT-FILE.
           PERFORM 201-INITIAL-STUDENT-FILE.
           PERFORM 202-CONVERT-STUDENT-FILE UNTIL EOF-FLAG = "YES".
           PERFORM 203-TERMINATE-CONVERT-FILE.
           STOP RUN.

       201-INITIAL-STUDENT-FILE.
           PERFORM 301-OPEN-STUDENT-FILE.
           PERFORM 302-READ-STUDENT-FILE.

       202-CONVERT-STUDENT-FILE.
           PERFORM 303-WRITE-INDEXED-RECORD.
           PERFORM 302-READ-STUDENT-FILE.

       203-TERMINATE-CONVERT-FILE.
           PERFORM 304-CLOSE-STUDENT-FILE.

       301-OPEN-STUDENT-FILE.
           OPEN INPUT  STUDENT-FILE-IN
                OUTPUT INDEXED-STUDENT-FILE-OUT.

           DISPLAY "STUDENT FILE OPENED!".

       302-READ-STUDENT-FILE.
           READ STUDENT-FILE-IN
               AT END MOVE "YES" TO EOF-FLAG
               NOT AT END
                   MOVE STUDENT-NUMBER TO IND-STUDENT-NUMBER
                   MOVE TUITION-OWED TO IND-TUITION-OWED
                   MOVE STUDENT-NAME TO IND-STUDENT-NAME
                   MOVE PROGRAM-OF-STUDY TO IND-PROGRAM-OF-STUDY
                   MOVE COURSE-CODE-1 TO IND-COURSE-CODE-1
                   MOVE AVERAGE-1 TO IND-AVERAGE-1
                   MOVE COURSE-CODE-2 TO IND-COURSE-CODE-2
                   MOVE AVERAGE-2 TO IND-AVERAGE-2
                   MOVE COURSE-CODE-3 TO IND-COURSE-CODE-3
                   MOVE AVERAGE-3 TO IND-AVERAGE-3
                   MOVE COURSE-CODE-4 TO IND-COURSE-CODE-4
                   MOVE AVERAGE-4 TO IND-AVERAGE-4
                   MOVE COURSE-CODE-5 TO IND-COURSE-CODE-5
                   MOVE AVERAGE-5 TO IND-AVERAGE-5
             END-READ.

       303-WRITE-INDEXED-RECORD.
           WRITE INDEXED-FILE-RECORD
               INVALID KEY PERFORM 700-RECORD-ERROR-RTN
                           NOT INVALID KEY DISPLAY
                           "WRITE STATEMENT EXECUTED FOR "
                           STUDENT-RECORD-IN
                           DISPLAY " "
                           ADD 1 TO WRITE-COUNTER
           END-WRITE.

       304-CLOSE-STUDENT-FILE.
           CLOSE STUDENT-FILE-IN
                 INDEXED-STUDENT-FILE-OUT.

           DISPLAY WRITE-COUNTER.

       700-RECORD-ERROR-RTN.
           DISPLAY "RECORD ERROR".

       END PROGRAM CONVERT-TO-INDEXED.
