create or replace trigger TR_ofertas_ingresar
before insert on OFERTAS
    for each row
    begin
        insert into CONTROL values (user, sysdate);
    end TR_ofertas_ingresar;
/

-- creamos un trigger que controle la insercion por cada fila ingresada y no por cada insert hecho

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_OFERTAS_INGRESAR';

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(102,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(105,'El aleph','Borges','Emece',32);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);

select * from libros;
select * from OFERTAS;
select * from CONTROL;

insert into OFERTAS
select TITULO, AUTOR, PRECIO
from LIBROS
where precio <= 30;

-- ejercicios

 drop table empleados;
 drop table control;


 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  seccion varchar2(20)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );

--trigger
create or replace trigger TR_empleados_ingresar
    before insert on empleados
    for each row
    begin
        insert into control values (user,SYSDATE);
    end TR_empleados_ingresar;
/
--fin trigger
--consulta trigger
select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_EMPLEADOS_INGRESAR';

--inserts


insert into empleados
select DOCUMENTO,NOMBRE,APELLIDO,null from EMPLEADOS_TEMP;

select * from empleados;
select * from control;

delete control;
delete empleados;
