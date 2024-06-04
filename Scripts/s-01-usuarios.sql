--@Autor(es): Francisco Hernandez Arturo 
--            Toldedo Valencia Jesus Antonio   
--@Fecha creación: 01/06/2024
--@Descripción: Creación de usuarios y roles

Prompt Indicar el password de sys
connect sys/system as sysdba
prompt Limpiando
declare
  cursor cur_usuarios is
    select username from dba_users where username like 'AFJT_PROY_%';
  cursor cur_roles is
    select role from dba_roles where role like 'AFJT_PROY_%';
begin

  for r in cur_usuarios loop
    execute immediate 'drop user '||r.username||' cascade';
end loop;
	
  for r in cur_roles loop
    execute immediate 'drop role '||r.role;
  end loop;
end;
/

--------------------------------------------------------------
Prompt Creando usuarios 

prompt Creando usuario admin
create user afjt_proy_admin identified by proyecto
	quota unlimited on users;
Prompt Usuario admin creado
-------------------------------------------------------------
-------------------------------------------------------------
prompt Creando usuario invitado
create user afjt_proy_invitado identified by proyecto;
Prompt Rol invitado creado
--------------------------------------------------------------
Prompt creando roles

prompt Creando rol admin
create role afjt_proy_admin_rol;
grant create session, create table, create view, create synonym, create procedure, create sequence, create trigger,
  create index to afjt_proy_admin_rol;
Prompt Rol admin creado
--------------------------------------------------------------
prompt Creando rol admin
create role afjt_proy_invitado_rol;
grant create session to afjt_proy_invitado_rol;
Prompt Rol invitado creado
--------------------------------------------------------------
Prompt Asignando roles
Prompt rol admin asignado
grant afjt_proy_admin_rol to afjt_proy_admin;
Prompt rol invitado asignado
grant afjt_proy_invitado_rol to afjt_proy_invitado;

prompt listo!

