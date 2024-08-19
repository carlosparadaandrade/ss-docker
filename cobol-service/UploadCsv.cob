       IDENTIFICATION DIVISION.
       PROGRAM-ID. UploadCsv.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT UPLOAD-FILE ASSIGN TO DYNAMIC-FILE
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  UPLOAD-FILE.
       01  UPLOAD-RECORD  PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-FILE-NAME            PIC X(100) VALUE SPACES.
       01  WS-COMMAND              PIC X(500) VALUE SPACES.
       01  WS-RETURN-CODE          PIC 9(4) COMP.
       01  WS-FILE-STATUS          PIC 9(2) VALUE 0.
       01  WS-DYNAMIC-FILE-NAME    PIC X(100) VALUE SPACES.
       01  DYNAMIC-FILE            PIC X(100) VALUE SPACES.
       
       PROCEDURE DIVISION.
           DISPLAY "Enter the name of the CSV file: "
           ACCEPT WS-FILE-NAME
           MOVE WS-FILE-NAME TO DYNAMIC-FILE 
           MOVE WS-FILE-NAME TO WS-DYNAMIC-FILE-NAME
           OPEN INPUT UPLOAD-FILE
           IF WS-FILE-STATUS NOT = 00
               DISPLAY "Error: " WS-FILE-NAME 
                  " does not exist or is not accessible."
               STOP RUN
           END-IF
           
           CLOSE UPLOAD-FILE
           
           STRING
               "curl -X POST http://csv-uploader-container:3000/upload "
               DELIMITED BY SIZE
               "-H 'Content-Type: multipart/form-data' "
               DELIMITED BY SIZE
               "-F 'file=@/workspace/" WS-FILE-NAME ";type=text/csv' "
               DELIMITED BY SIZE
               INTO WS-COMMAND
           
           DISPLAY "Command: " WS-COMMAND
           
           CALL 'SYSTEM' USING WS-COMMAND
               RETURNING WS-RETURN-CODE
           DISPLAY "Return Code: " WS-RETURN-CODE
           STOP RUN.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UploadCsv.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT UPLOAD-FILE ASSIGN TO DYNAMIC-FILE
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  UPLOAD-FILE.
       01  UPLOAD-RECORD  PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-FILE-NAME            PIC X(100) VALUE SPACES.
       01  WS-COMMAND              PIC X(500) VALUE SPACES.
       01  WS-RETURN-CODE          PIC 9(4) COMP.
       01  WS-FILE-STATUS          PIC 9(2) VALUE 0.
       01  WS-DYNAMIC-FILE-NAME    PIC X(100) VALUE SPACES.
       01  DYNAMIC-FILE            PIC X(100) VALUE SPACES.
       
       PROCEDURE DIVISION.
           DISPLAY "Enter the name of the CSV file: "
           ACCEPT WS-FILE-NAME
           MOVE WS-FILE-NAME TO DYNAMIC-FILE 
           MOVE WS-FILE-NAME TO WS-DYNAMIC-FILE-NAME
           OPEN INPUT UPLOAD-FILE
           IF WS-FILE-STATUS NOT = 00
               DISPLAY "Error: " WS-FILE-NAME 
                  " does not exist or is not accessible."
               STOP RUN
           END-IF
           
           CLOSE UPLOAD-FILE
           
           STRING
               "curl -X POST http://csv-uploader-container:3000/upload "
               DELIMITED BY SIZE
               "-H 'Content-Type: multipart/form-data' "
               DELIMITED BY SIZE
               "-F 'file=@/workspace/" WS-FILE-NAME ";type=text/csv' "
               DELIMITED BY SIZE
               INTO WS-COMMAND
           
           DISPLAY "Command: " WS-COMMAND
           
           CALL 'SYSTEM' USING WS-COMMAND
               RETURNING WS-RETURN-CODE
           DISPLAY "Return Code: " WS-RETURN-CODE
           STOP RUN.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UploadCsv.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT UPLOAD-FILE ASSIGN TO DYNAMIC-FILE
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  UPLOAD-FILE.
       01  UPLOAD-RECORD  PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-FILE-NAME            PIC X(100) VALUE SPACES.
       01  WS-COMMAND              PIC X(500) VALUE SPACES.
       01  WS-RETURN-CODE          PIC 9(4) COMP.
       01  WS-FILE-STATUS          PIC 9(2) VALUE 0.
       01  WS-DYNAMIC-FILE-NAME    PIC X(100) VALUE SPACES.
       01  DYNAMIC-FILE            PIC X(100) VALUE SPACES.
       
       PROCEDURE DIVISION.
           DISPLAY "Enter the name of the CSV file: "
           ACCEPT WS-FILE-NAME
           MOVE WS-FILE-NAME TO DYNAMIC-FILE 
           MOVE WS-FILE-NAME TO WS-DYNAMIC-FILE-NAME
           OPEN INPUT UPLOAD-FILE
           IF WS-FILE-STATUS NOT = 00
               DISPLAY "Error: " WS-FILE-NAME 
                  " does not exist or is not accessible."
               STOP RUN
           END-IF
           
           CLOSE UPLOAD-FILE
           
           STRING
               "curl -X POST http://csv-uploader-container:3000/upload "
               DELIMITED BY SIZE
               "-H 'Content-Type: multipart/form-data' "
               DELIMITED BY SIZE
               "-F 'file=@/workspace/" WS-FILE-NAME ";type=text/csv' "
               DELIMITED BY SIZE
               INTO WS-COMMAND
           
           DISPLAY "Command: " WS-COMMAND
           
           CALL 'SYSTEM' USING WS-COMMAND
               RETURNING WS-RETURN-CODE
           DISPLAY "Return Code: " WS-RETURN-CODE
           STOP RUN.
