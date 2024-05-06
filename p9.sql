SET SERVEROUTPUT ON;


DECLARE
    v_counter NUMBER :=1;
    v_result NUMBER;

BEGIN
    WHILE v_counter <= 10 LOOP
        v_result := 19 * v_counter;
        DBMS_OUTPUT.PUT_LINE('19' || ' x ' || v_counter || ' = ' || v_result);
        v_counter := v_counter + 1;

    END LOOP;
    DBMS_OUTPUT.PUT_LINE('OUTSIDE THE LOOP');

END;
/

DECLARE 
    v_test BOOLEAN := TRUE;
    v_counter NUMBER := 0;

BEGIN
    WHILE v_test LOOP
        v_counter := v_counter + 1;
        DBMS_OUTPUT.PUT_LINE(v_counter);
        IF v_counter = 10 THEN
            v_test := FALSE;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE("OUTSIDE THE LOOP");
END;
/


DECLARE
    v_counter NUMBER := 1;
    v_result NUMBER;
    v_test BOOLEAN := TRUE;

BEGIN
    WHILE v_test LOOP
        v_result := 19 * v_counter;
        DBMS_OUTPUT.PUT_LINE('19' ||'x'|| v_counter ||'='|| v_result);        
        v_counter := v_counter + 1;
        If v_counter >= 10 THEN
            v_test := FALSE;
        END IF;
    END LOOP;
END;
/
