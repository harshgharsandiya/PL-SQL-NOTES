DESC superheroes;

CREATE TABLE superheroes_backup AS
SELECT * FROM superheroes WHERE 1=2;

CREATE OR REPLACE TRIGGER sh_backup
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
BEGIN
    IF INSERTING THEN
        INSERT INTO superheroes_backup (s_name) VALUES (:NEW.sh_name);

    ELSIF DELETING THEN
        DELETE FROM superheroes_backup WHERE sh_name = :OLD.sh_name;

    ELSIF UPDATING THEN
        UPDATE superheroes_backup SET sh_name = :NEW.sh_name WHERE sh_name = :OLD.sh_name;
    END IF;
END;
/

INSERT INTO superheroes VALUES ('BATMAN');
INSERT INTO superheroes VALUES ('SUPERMAN');

UPDATE superheroes SET sh_name = 'IRONMAN' WHERE  sh_name = 'BATMAN';

DELETE FROM superheroes WHERE sh_name = 'SUPERMAN';
