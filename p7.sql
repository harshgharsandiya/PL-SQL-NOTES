SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR(30) := &enter_name;

BEGIN

    IF v_name = 'Harsh' THEN
        DBMS_OUTPUT.PUT_LINE('Name is Harsh');
    ELSIF v_name = 'Het' THEN
        DBMS_OUTPUT.PUT_LINE('Name is Het');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOT Match Any name');
    END IF;
    DBMS_OUTPUT.PUT_LINE('COMPLETE IF ELSIF ELSE ');
    

END;
/