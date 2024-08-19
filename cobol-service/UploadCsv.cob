       IDENTIFICATION DIVISION.
       PROGRAM-ID. UploadCsv.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT UPLOAD-FILE ASSIGN TO "UploadCsv.csv"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  UPLOAD-FILE.
       01  UPLOAD-RECORD  PIC X(80).
       
       WORKING-STORAGE SECTION.
       01  WS-COMMAND           PIC X(500) VALUE SPACES.
       01  WS-RETURN-CODE       PIC 9(4) COMP.
       01  WS-FILE-STATUS       PIC 9(2).

       PROCEDURE DIVISION.
        OPEN INPUT UPLOAD-FILE
        IF WS-FILE-STATUS NOT = 00
            DISPLAY "Error: UploadCsv.csv no existe o no es accesible."
            STOP RUN
        END-IF
        CLOSE UPLOAD-FILE
        
        STRING
            "curl -X POST http://csv-uploader-container:3000/upload "
            DELIMITED BY SIZE
            "-H 'Content-Type: multipart/form-data' "
            DELIMITED BY SIZE
            "-F 'file=@/workspace/UploadCsv.csv;type=text/csv' "
            DELIMITED BY SIZE
            INTO WS-COMMAND
        
        DISPLAY "Command: " 
            WS-COMMAND
        
        CALL 'SYSTEM' USING WS-COMMAND 
            RETURNING WS-RETURN-CODE
        DISPLAY "Return Code: " WS-RETURN-CODE
        STOP RUN.
        
