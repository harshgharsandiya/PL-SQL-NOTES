SET SERVEROUPUT ON;

DECLARE
    v_salary NUMBER(10);

BEGIN
    SELECT salary INTO v_salary FROM employee WHERE employee.id = 100;

    DBMS_OUTPUT.PUT_LINE(v_salary);
END;
/

DECLARE 
    v_salary NUMBER(10);
    v_fname VARCHAR2(50);

BEGIN
    SELECT salary, fname INTO v_salary, v_fname FROM employee
    WHERE employee.id = 100;

    DBMS_OUTPUT.PUT_LINE(fname || ' has salary: ' || v_salary);
END;
/

