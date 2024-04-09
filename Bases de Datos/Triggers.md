# Triggers

```sql
CREATE OR REPLACE FUNCTION assert_max_asignaciones()
RETURNS trigger as
$BODY$
declare total_asignacion numeric;
-- declare tupla_dentro_de_tabla record;
-- declare conjunto_de_tuplas recordset;
begin
    SELECT COUNT(*) INTO total_asignacion
    FROM asignacion WHERE estudiante_id = new.estudiante_id;

    -- raise exception 'Log total_asignacion: %', total_asignacion;

    if total_asignacion >= 6
        raise exception 'El alumno no se puede insertar a más de 6 cursos';
    end if
end
$BODY$
LANGUAGE 'plpgsql';

-- Luego el trigger se asigna a una operación
CREATE OR REPLACE TRIGGER max_asignacion
BEFORE DELETE
-- AFTER INSERT
ON asignacion
FOR EACH ROW
-- FOR EACH STATEMENT
EXECUTE PROCEDURE assert_max_asignaciones();
```
