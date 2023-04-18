 drop table control;
 drop table libros;


 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );


 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);

 alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
--------------------------------------------------------
create or replace trigger tr_libros_update
    before update on libros
    for each row
    begin
        insert into control values (user, sysdate);
    end tr_libros_update;
/

update libros set precio = precio + (precio * 0.1)
where editorial = 'Nuevo siglo';

select * from control;

-- ejercicio
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

create or replace trigger TR_empleados_update
    before update on empleados
    for each row
    begin
        insert into control values (user, sysdate);
    end TR_empleados_update;
/

update empleados set sueldo = sueldo + (sueldo*0.1)
where seccion like '%Secretaria%';

select * from control;

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_EMPLEADOS_UPDATE';

