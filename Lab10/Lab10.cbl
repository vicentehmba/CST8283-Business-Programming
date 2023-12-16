	******************************************************************
      	* Author:    VICENTE MBA ENGUNG
      	* Date:      DECEMBER 2, 2023
      	* Purpose:   LAB 10 - SHOE INVENTORY
      	* Tectonics: cobc
      	******************************************************************
	IDENTIFICATION DIVISION.
	PROGRAM-ID. ShoeInventory.

	DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 WS-SHOE-STYLE        PIC X(5).
	01 WS-SHOE-SIZE         PIC X(4).

	PROCEDURE DIVISION.
    		DISPLAY "Enter Shoe Style at Line 5 column 5:".
    		ACCEPT WS-SHOE-STYLE LINE 5 COLUMN 25.

    		DISPLAY "Enter Shoe Size at Line 7 column 5:".
    		ACCEPT WS-SHOE-SIZE LINE 7 COLUMN 25.

    		DISPLAY "Shoe Style: " WS-SHOE-STYLE.
    		DISPLAY "Shoe Size : " WS-SHOE-SIZE.

    		STOP RUN.
