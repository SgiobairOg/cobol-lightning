      ******************************************************************
      * Author: Jason Wilson <jason@wilsons.io> @wilsonuponsea
      * Date: 2017/04/17
      * Purpose: Introducing NorfolkJS to the world of COBOL
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-NORFOLK.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01  kind-name-ws PIC X(54) VALUE SPACES.
           01  welcome-ws PIC X(54) VALUE SPACES.
           01  decoration-ws.
               05  decoration1-ws PIC A(32) VALUE
      -                   'NNNNNNNNNNNNNNNNNNNNNNNNNNNNNN'.
               05  decoration2-ws PIC A(32) VALUE
      -                   'NNNNNNNNNNNNNNNN  NNN      NNN'.
               05  decoration3-ws PIC A(32) VALUE
      -                    'NNNNNNNNNNNNNNNN  NN  NNNN  NN'.
               05  decoration4-ws PIC A(32) VALUE
      -                    'NNNNNNNNNNNNNNNN  NN  NNNNNNNN'.
               05  decoration5-ws PIC A(32) VALUE
      -                    'NNNNNNNNNN  NNNN  NNNNNNNN  NN'.
               05  decoration6-ws PIC A(32) VALUE
      -                    'NNNNNNNNNN  NNNN  NN  NNNN  NN'.
               05  decoration7-ws PIC A(32) VALUE
      -                    'NNNNNNNNNNN      NNNN      NNN'.
           01  datestring-ws PIC X(54) VALUE SPACES.
           01  date-ws PIC X(54) VALUE SPACES.
           77  time-ws PIC 99B99B99B99.
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           DISPLAY "Hello, who am I talking to? " AT 0205 WITH
               FOREGROUND-COLOR 3

           ACCEPT kind-name-ws AT 0234

           PERFORM DISPLAY-GREETING.

      * Display a greeting over the old prompt
       DISPLAY-GREETING.
           STRING
               "Hello, " DELIMITED BY SIZE kind-name-ws DELIMITED BY " "
               ", welcome to COBOL!"
               INTO welcome-ws
           END-STRING.
           DISPLAY welcome-ws AT 0205 WITH BLANK LINE FOREGROUND-COLOR 2
           END-DISPLAY
           .

       DISPLAY-TIMESTAMP.
           MOVE FUNCTION MODULE-FORMATTED-DATE TO datestring-ws
           STRING
               "Today is " datestring-ws "."
               INTO date-ws
           DISPLAY date-ws AT 0505 FOREGROUND-COLOR 4
           END-DISPLAY

           DISPLAY "The time is " AT 0705
           END-DISPLAY
           .

       DISPLAY-DECORATION.
           DISPLAY decoration1-ws AT 0945 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration1-ws AT 1045 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration1-ws AT 1145 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration1-ws AT 1245 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration1-ws AT 1345 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration2-ws AT 1445 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration3-ws AT 1545 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration4-ws AT 1645 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration2-ws AT 1745 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration5-ws AT 1845 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration6-ws AT 1945 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration7-ws AT 2045 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration1-ws AT 2145 FOREGROUND-COLOR 6
           END-DISPLAY
           DISPLAY decoration1-ws AT 2245 FOREGROUND-COLOR 6
           END-DISPLAY
           .

       UPDATE-TIME.
           ACCEPT time-ws FROM TIME
           INSPECT time-ws REPLACING ALL " " BY ":"
           DISPLAY time-ws AT 0717
           GO TO UPDATE-TIME
           .
