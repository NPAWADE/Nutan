set serveroutput on;

CREATE or replace DIRECTORY USER_DIR AS '/home/oracle';

GRANT READ ON DIRECTORY USER_DIR TO PUBLIC;

DECLARE
V1 VARCHAR2(200); --32767
F1 UTL_FILE.FILE_TYPE;
BEGIN
F1 := UTL_FILE.FOPEN('USER_DIR','Account.txt','R');
Loop
BEGIN
UTL_FILE.GET_LINE(F1,V1);
dbms_output.put_line(V1);
EXCEPTION WHEN No_Data_Found THEN EXIT; END;
end loop;

IF UTL_FILE.IS_OPEN(F1) THEN
dbms_output.put_line('File is Open');
end if;

UTL_FILE.FCLOSE(F1);
END;
/
set serveroutput off;