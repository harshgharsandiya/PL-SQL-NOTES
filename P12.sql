CREATE TABLE sh_audit (
    new_name VARCHAR(30),
    old_name VARCHAR(30),
    user_name VARCHAR(30),
    entry_date VARCHAR(30),
    operation VARCHAR(30)
);


CREATE OR REPLACE trigger superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR(30);
    v_date VARCHAR(30);
BEGIN
SELECT user, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') INTO v_user, v_date FROM dual;

IF INSERTING THEN 
INSERT INTO sh_audit (new_name, old_name, user_name, entry_date, operation)
VALUES(:NEW.sh_name, NULL, v_user, v_date, 'Insert');

ELSIF DELETING THEN
INSERT INTO v_audit (new_name, old_name, user_name, entry_date, operation)
VALUES(NULL, :OLD.sh_name, v_user, v_date, 'Delete');

ELSIF UPDATING THEN
INSERT INTO v_audit (new_name, old_name, user_name, entry_date, operation)
VALUES(:NEW.sh_name, :OLD.sh_name, v_user, v_date, 'Update');


INSERT INTO superheroes VALUES('SUPERMAN');

UPDATE superhereos SET sh_name = 'IRONMAN' 
WHERE sh_name = 'SUPERMAN';

DELETE FROM superheroes WHERE sh_name = 'IRONMAN';
