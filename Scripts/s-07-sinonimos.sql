
--Sinónimos públicos para las tablas del usuario admin
CREATE PUBLIC SYNONYM PUESTO_PUB FOR afjt_proy_admin.PUESTO;
CREATE PUBLIC SYNONYM ROL_EMPLEADO_PUB FOR afjt_proy_admin.ROL_EMPLEADO;
CREATE PUBLIC SYNONYM PASAJERO_PUB FOR afjt_proy_admin.PASAJERO;

--Permisos de lectura al usuario invitado
GRANT SELECT ON afjt_proy_admin.PUESTO TO afjt_proy_invitado;
GRANT SELECT ON afjt_proy_admin.ROL_EMPLEADO TO afjt_proy_invitado;
GRANT SELECT ON afjt_proy_admin.PASAJERO TO afjt_proy_invitado;

--Sinónimos para el usuario invitado
CREATE SYNONYM afjt_proy_invitado.PUESTO_INV FOR afjt_proy_admin.PUESTO;
CREATE SYNONYM afjt_proy_invitado.ROL_EMPLEADO_INV FOR afjt_proy_admin.ROL_EMPLEADO;
CREATE SYNONYM afjt_proy_invitado.PASAJERO_INV FOR afjt_proy_admin.PASAJERO;

--Sinónimos privados con el prefijo de iniciales
DECLARE
    v_sql VARCHAR2(1000);
BEGIN
    FOR rec IN (SELECT table_name FROM all_tables WHERE owner = 'AFJT_PROY_ADMIN') LOOP
        v_sql := 'CREATE SYNONYM AFJT_PROY_ADMIN.HA_' || rec.table_name || ' FOR AFJT_PROY_ADMIN.' || rec.table_name;
        EXECUTE IMMEDIATE v_sql;
    END LOOP;
END;
/
