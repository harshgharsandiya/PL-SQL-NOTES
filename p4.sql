VARIABLE v_bind1 VARCHAR2(10);

-- 1st way to Initalize bind variables
EXEC :v_bind1 := 'Hello World';

-- 2nd way to Initalize bind variables
SET SERVEROUTPUT ON;
BEGIN 
    :v_bind1 := 'Hello World';
    DBMS_OUTPUT.PUT_LINE(:v_bind1);
END;
/

PRINT :v_bind1;


SET AUTOPRINT ON;
VARIABLE v_bind2 VARCHAR2(30);
EXEC :v_bind2 := 'Hello World';


