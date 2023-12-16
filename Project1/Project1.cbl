      ******************************************************************
      * Author: Vicente Mba Engung
      * Date: October 22, 2023
      * Purpose: Project 1 - Write student records to a file
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITE-STUDENT-RECORDS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT STUDENT-RECORDS-FILE ASSIGN TO "STUDENT_RECORDS.DAT"
       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-RECORDS-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-NUMBER PIC 9(7).
           05 TUITION-OWED PIC 9(5).
           05 STUDENT-NAME PIC X(40).

       WORKING-STORAGE SECTION.
       01 RECORD-COUNT PIC 9(4) VALUE ZERO.   *> Initialize record to 0
       01 WS-ANSWER PIC X.     *> Used to store user input.

       PROCEDURE DIVISION.
       MAIN-PROCESS.
           *> Open the file for writing.
           OPEN OUTPUT STUDENT-RECORDS-FILE.

           *> Loop until 10 records are entered
           PERFORM UNTIL RECORD-COUNT = 10

               *> Prompt user to input a record
               DISPLAY "Do you want to enter a record? (Y/N)"
               ACCEPT WS-ANSWER    *> Get user's response
               IF WS-ANSWER = "N" OR WS-ANSWER = "n" THEN
                   EXIT PERFORM    *> Exit the loop if 'N' or 'n'
               END-IF

               *> Prompt for student information
               DISPLAY "Enter student number:"
               ACCEPT STUDENT-NUMBER

               DISPLAY "Enter tuition owed:"
               ACCEPT TUITION-OWED

               DISPLAY "Enter student name:"
               ACCEPT STUDENT-NAME

               *> Write the student information to the file
               WRITE STUDENT-RECORD

               ADD 1 TO RECORD-COUNT   *> Increment the record count
           END-PERFORM.

           CLOSE STUDENT-RECORDS-FILE. *> Close the file when done.

           STOP RUN.   *> Terminate the program.
