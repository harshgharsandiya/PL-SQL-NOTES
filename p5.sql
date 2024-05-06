--IF-THEN Statement

SET SERVEROUTPUT ON;
DECLARE
    v_num NUMBER := 9;

BEGIN
    IF v_num < 10 THEN
        DBMS_OUTPUT.PUT_LINE("INSIDE THE IF");
    END IF;
        DBMS_OUTPUT.PUT_LINE("OUTSIDE THE IF");
END;
/

DECLARE 
    v_website VARCHAR(30) := 'RebellionRider.com';
    v_author VARCHAR(30) := 'Manish';

BEGIN
    IF v_website = ' RebellionRider.com' AND v_author = 'Manish' THEN
        DBMS_OUTPUT.PUT_LINE("ASWESOM");
    END IF;

    DBMS_OUTPUT.PUT_LINE("OUTSIDE THE IF");
END;
/