--Disparadores update a nivel de campo
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
-- tablas a manipular


/*
Creamos un desencadenador a nivel de fila que se dispare cada vez que se actualiza el campo "precio";
el trigger debe ingresar en la tabla "control", el nombre del usuario, la fecha y la hora en la cual
se realizó un "update" sobre "precio" de "libros":
*/
create or replace trigger tr_libros_update_precio
    before update of precio on libros
    for each row
    begin
        insert into control values (user,sysdate);
    end tr_libros_update_precio;
/

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_LIBROS_UPDATE_PRECIO';

UPDATE  libros set precio = precio *1.1
where editorial like '%Nuevo siglo%';

select * from control;

 update libros set autor='Lewis Carroll' where autor='Carroll';

--ejercicio 2
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

--sentencias
create or replace trigger TR_libros_update_precioeditorial
    before update of precio, editorial on libros

    begin
        insert into control values (user, SYSDATE);
    end;

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_LIBROS_UPDATE_PRECIOEDITORIAL';

update libros set precio = precio * 1.1
where EDITORIAL like '%Nuevo siglo%';

select * from control;

update libros set EDITORIAL = 'Sudamericana'
where EDITORIAL like '%Planeta%';

update libros set TITULO = 'Dos'
where TITULO like '%Uno%';

