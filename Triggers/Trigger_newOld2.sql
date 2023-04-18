drop table libros;


 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar2(20),
  precio number(6,2)
 );


 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Planeta',40);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);


create or replace trigger tr_libros_insert_precio
    before insert or update of precio on libros
    for each row
    begin
        dbms_output.PUT_LINE('Trigger activado');
        if :new.precio>50 then
            :new.precio := round(:NEW.precio );
            DBMS_OUTPUT.PUT_LINE('Precio redondeado');
        end if;

    end;

 insert into libros values(250,'El experto en laberintos','Gaskin','Emece',30.80);

select * from libros;


 insert into libros values(300,'Alicia en el pais de las maravillas','Carroll','Emece',55.6);

update libros set precio = 40.30 where codigo=105;

 update libros set precio=50.30 where codigo=105;

 update libros set precio=50.30 where editorial='Nuevo siglo';

 update libros set precio=precio+15.8 where editorial='Planeta';

 insert into libros values(350,'Ilusiones','Bach','Planeta',20.35);

delete libros where codigo = 350;

------------------------------------------------------------------------------------------------
 drop table libros;
 drop table ofertas;

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6,2)
 );

 create table ofertas(
  codigo number(6),
  titulo varchar2(40)
 );
 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);

create or replace trigger tr_libros_insert
    before insert on libros
    for each row when ( new.precio<30 )
    begin
        insert into ofertas values (:new.codigo,:new.titulo);
    end;

insert into libros values (146,'Un mundo feliz','Aldous','Planeta',20);

select * from libros;
select * from ofertas;

insert into libros values (147, 'Un cafe', 'Edu','Nuevo siglo', 34);

create or replace trigger tr_libros_borrado
    before delete on libros
    for each row when ( old.precio<30 )
    begin
        delete ofertas where codigo = :old.codigo;
    end;

delete libros where CODIGO = 146;

