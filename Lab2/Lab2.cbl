      ******************************************************************
      * Author: Vicente Mba Engung
      * Date: October 2, 2023
      * Purpose: Handle a sequential file name
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Lab2.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE ASSIGN TO "STUDENT.TXT"
           ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD STUDENT-FILE.
           01 STUDENT-RECORD.
               05 STUDENT-NUMBER           PIC X(10).
               05 STUDENT-PROGRAM          PIC X(8).
               05 STUDENT-YEAR             PIC 9(6).
               05 STUDENT-DATA.
                   10 STUDENT-NAME.
                       15 TITLE            PIC X(6).
                       15 FIRST-NAME       PIC X(15).
                       15 MIDDLE-INIT      PIC X(2).
                       15 SURNAME          PIC X(28).
                   10 STUDENT-ADDRESS.
                       15 STREET-ADDRESS   PIC X(25).
                       15 CITY             PIC X(15).
                       15 STATE-PROVINCE   PIC X(15).
                       15 POSTAL-CODE      PIC X(7).

       WORKING-STORAGE SECTION.
       01 WS-EOF       PIC X VALUE 'N'.
       01 WS-RECORD-COUNT  PIC 9(5) VALUE 0.

       PROCEDURE DIVISION.
           OPEN INPUT STUDENT-FILE.
           PERFORM UNTIL WS-EOF = 'Y'
               READ STUDENT-FILE
                   AT END MOVE 'Y' TO WS-EOF
               NOT AT END
                   ADD 1 TO WS-RECORD-COUNT
                   DISPLAY "Student Record #" WS-RECORD-COUNT
                   DISPLAY "Student Number: " STUDENT-NUMBER
                   DISPLAY "Student Program: " STUDENT-PROGRAM
                   DISPLAY "Student Year: " STUDENT-YEAR
                   DISPLAY "Student Name: " TITLE " " FIRST-NAME " "
                   MIDDLE-INIT " " SURNAME
                   DISPLAY "Address: " STREET-ADDRESS
                   DISPLAY "City: " CITY
                   DISPLAY "State/Province: " STATE-PROVINCE
                   DISPLAY "Postal Code: " POSTAL-CODE
                   DISPLAY "----------------------------------------"
               END-READ
           END-PERFORM.
               CLOSE STUDENT-FILE.
               STOP RUN.
