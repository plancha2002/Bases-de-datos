-- trigger por cada insert

create or replace trigger TR_ingresar_libros
before insert on LIBROS
begin
    insert into control values (user,sysdate);
    -- la funcion user nos va devolver el usuario que esta en la sesion
end TR_ingresar_libros;
/
-- este trigger se ejecutar por cada insert, como si este ingresara varios registros
--esto se podra alterar incando que sea FOR EACH ROW

select * from USER_TRIGGERS;

--aqui veremos toda la infromacion sobre los trigger podemos filtralos por tabla con
--TABLE_NAME o el nombre del trigger

--los trigger no se pueden llamar solo se ejecutaran cuando suceda lo indicado
 alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';

 insert into libros values(100,'Uno','Richard Bach',25);


 insert into libros values(150,'Matematica estas ahi','Paenza',12);
 insert into libros values(185,'El aleph','Borges',42);

select * from LIBROS;
select * from CONTROL;
 -- ejercicio practico

  drop table libros;
 drop table ofertas;
 drop table control;


 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );

 create table ofertas(
  titulo varchar2(40),
  autor varchar2(30),
  precio number(6,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date
 );


alter session SET NLS_date_format = 'DD/MM/YYYY HH24:MI';

create or replace trigger tr_ofertas_ingresar
before insert on ofertas
    begin
        insert into control values (user,sysdate);
    end tr_ofertas_ingresar;
/

select * from USER_TRIGGERS where TRIGGER_NAME = 'TR_OFERTAS_INGRESAR';

insert into libros values(100,'Uno','Richard Bach','Planeta',25);
insert into libros values(102,'Matematica estas ahi','Paenza','Nuevo siglo',12);
insert into libros values(105,'El aleph','Borges','Emece',32);
insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);

insert into ofertas
select titulo, autor, precio from libros
where precio <= 30;

select * from control;