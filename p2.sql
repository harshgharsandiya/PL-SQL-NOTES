SET SERVEROUTPUT ON;

DECLARE
    v_fname student.fname%TYPE;

BEGIN
    SELECT fname INTO v_fname FROM student 
    WHERE student.id = 1;

    DBMS_OUTPUT.PUT_LINE(v_fname);

END;
/