alter session set nls_date_format = 'DD/MM/YYYY HH24/MI';

create or replace trigger TR_libros_actualizacion
    before update on libros
    begin
        insert into control values (user,sysdate);
    end TR_libros_actualizacion;
/

SELECT * FROM CONTROL;

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_LIBROS_ACTUALIZACION';

 update libros set codigo=99 where codigo=100;

 update libros set precio=precio+precio*0.1 where editorial='Nuevo siglo';


---

 drop table empleados;
 drop table control;


 create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );


 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);


-- ejercicio

create or replace trigger TR_empleados_update
    before  update  on empleados
    for each row
    begin
        insert into control values (user,sysdate);
    end TR_empleados_update;
/

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_EMPLEADOS_UPDATE';

SELECT * FROM EMPLEADOS;

 update empleados set nombre='Graciela' where documento='23444555';

SELECT * FROM CONTROL;

UPDATE EMPLEADOS SET SUELDO = SUELDO + (SUELDO*0.1)
WHERE SECCION LIKE '%Secretaria%';
