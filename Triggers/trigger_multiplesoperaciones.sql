 drop table libros;
 drop table control;


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
  operacion varchar2(20)
 );


 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);

------------------------------------------------------------------------------------------------------------------------------
create or replace trigger tr_libros_insert_update_delete
    before insert or update or delete on libros
    begin
        if inserting then
            insert into control values (user, sysdate, 'Insertado');
        end if;
        if updating then
            insert into control values (user, sysdate, 'actualizacion');
        end if;
        if deleting then
            insert into control values (user, sysdate, 'borrado');
        end if;
    end;

select * from USER_TRIGGERS where TABLE_NAME = 'LIBROS';

 insert into libros values(150,'El experto en laberintos','Gaskin','Planeta',23);

 update libros set precio=precio+precio*0.1 where editorial='Planeta';

     delete from libros where codigo=145;

select * from control;



