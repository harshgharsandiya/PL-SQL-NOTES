CREATE TABLE superheroes (
    sh_name VARCHAR(20)
);

--Example 1
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE INSERT ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user superheroes.sh_name%;
BEGIN
    SELECT user INTO v_user FROM dual;
    DBMS_OUTPUT.PUT_LINE('You Just Inserted A Line Mr. ' || v_user);
END;
/

INSERT INTO superheroes VALUES('Ironman');


--Example 2
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER bu_superheroes
BEFORE UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user superheroes.sh_name%;
BEGIN
    SELECT user INTO v_user FROM dual;
    DBMS_OUTPUT.PUT_LINE('You Just Updated A Line Mr. ' || v_user);
END;
/

UPDATE superheroes SET sh_name = 'Supername' WHERE sh_name = 'Ironman';

--Example 3
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER bd_superheroes
    BEFORE DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user superheroes.sh_name%;
BEGIN
    SELECT user INTO v_user FROM dual;
    DBMS_OUTPUT.PUT_LINE('You Just Deleted A Line Mr. ' || v_user);
END;
/

--Example 4

SET SEREROUTPUT ON;

CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user superheroes.sh_name%;
BEGIN
    SELECT user INTO v_user FROM dual;
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('You Just Inserted A Line Mr. ' || v_user);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('You Just Deleted A Line Mr. ' || v_user);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('YOU JUST Updated A Line Mr. ' || v_user);
    END IF;
END;

INSERT INTO superheroes VALUES('BATMAN');
UPDATE superheroes SET sh_name = 'SUPERMAN' WHERE sh_name = 'BATMAN';
DELETE FROM superheroes WHERE sh_name = 'SUPERMAN';
