      ******************************************************************
      * Author: Vicente Mba Engung
      * Date: October 8, 2023.
      * Purpose: Read car records from a text file
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Lab3.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CAR-FILE-IN
            ASSIGN TO "N:\CARFILE.TXT"
            ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD CAR-FILE-IN.
       01 CAR-RECORD-IN.
           05 CAR-MODEL           PIC X(15).
           05 CAR-DATA.
            10 ENGINE          PIC X(25).
            10 TOWING-CAPACITY PIC 9(8).
            10 OWNER-NAME      PIC X(30).

       WORKING-STORAGE SECTION.
       01 CONTROL-FIELDS.
          05 EOF-FLG              PIC X VALUE 'N'.

       PROCEDURE DIVISION.
           OPEN INPUT CAR-FILE-IN
           DISPLAY "CAR-MODEL"

           PERFORM UNTIL EOF-FLG = 'Y'
            READ CAR-FILE-IN
                AT END
                    SET EOF-FLG TO 'Y'
                NOT AT END
                    DISPLAY CAR-MODEL
            END-READ
           END-PERFORM

           CLOSE CAR-FILE-IN
           STOP RUN.
