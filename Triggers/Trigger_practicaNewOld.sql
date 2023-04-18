-- esto solo lo podremos hacer a nivel de fila

-- insert solo new
--update new y old
--delete solo old


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
  fecha date,
  codigo number(6),
  precioanterior number(6,2),
  precionuevo number(6,2)
 );


 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35)

create or replace trigger TR_libros_update
    before update of precio on LIBROS
    for each row
    begin
        insert into control values (user, sysdate, :new.codigo,:OLD.precio, :NEW.precio );
    end;

update libros set precio = 30 where codigo =100;

select * from control;

update libros set precio = precio *1.1
where editorial like '%Planeta%';

---------
 drop table control;
 drop table articulos;


 create table articulos(
  codigo number(6),
  descripcion varchar2(40),
  precio number (6,2),
  stock number(4)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  codigo number(6)
 );


 insert into articulos values(100,'regla 20 cm.',5.4,100);
 insert into articulos values(102,'regla 40 cm.',15,80);
 insert into articulos values(109,'lapices color x12',6,150);
 insert into articulos values(130,'lapices color x6',4.5,100);
 insert into articulos values(200,'compas metal',21.8,50);


drop trigger tr_articulo_insert;

create or replace trigger tr_articulo_insert
    before insert on articulos
        for each row
    begin
        insert into control values (user,sysdate,:new.codigo);
    end;

insert into articulos values (103,'borrador', 2, 400);
delete articulos where codigo = 103;
select * from control;

create or replace trigger tr_articulos_controlcod
    before insert on articulos
    for each row
    begin
    select max(codigo)+1 into :new.codigo from articulos;

   if :new.codigo is null then
    :new.codigo:=1;
   end if;
    end;

insert into articulos values (104,'raton', 50, 30);

select * from articulos;

select * from control;
insert into articulos(descripcion, precio, stock) values ('teclado', 50, 30);
