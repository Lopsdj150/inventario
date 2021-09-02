create table Forma_Adquision(
'id' integer not null primary key AUTOINCREMENT,
'nombre' varchar (12) 
)

create table Area
(
'id' integer not null primary key autoincrement,
'nombre' varchar(35)
),

create table Marca
(
'id' integer not null primary key autoincrement,
'nombre' varchar(30)
),

create table Rol(
'id' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'nombre' varchar(30),
);


create table CentroTrabajo
(
'id' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'nombre' varchar(30),
'domicilio' varchar (60),
'nombre_area_trabajo' varchar(35)
),

create table Piso
(
'id' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'nombre' text,
'id_centro_trabajo' integer
),

create table Persona (
'id' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'nombre' varchar(20),
'nombre_seg' varchar(20),
'ap_Paterno' varchar(30),
'ap_Materno' varchar(30),
'id_piso' integer,
'id_rol' integer
),

create table Articulo(
'num_sep' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'SAME' varchar(20),
'Estado' text,
'Modelo' varchar(20),
'Serie' varchar(20),
'Valor' decimal,
'fecha_alta' datetime(timestamp,'localtime'),
 'fecha_adquision' datetime(),
 'observaciones' text,
 'id_Marca' integer,
'id_persona' integer
),

create table Pedido (
'numSep' INTEGER NOT null PRIMARY KEY 
'numInvetario' integer,
'docSop' varchar(15),
'fecha_lalta' integer,
'fecha_adquision' datetime(timestamp,'localtime'),
'observacion' text,
'id_area' integer,
'id_articulo' integer,
'id_forma_adquisicion' integer,
'id_persona' integer
),
/*
create table papeleria(
'id' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'nombre' varchar(32),
'cantidad' integer,
'fecha_alta' datetime(timestamp,'localtime'),
'id_persona' integer
),

create table solicitudPapeleria(
'id' INTEGER NOT null PRIMARY KEY AUTOINCREMENT,
'cantidad' integer,
'fecha_alta' datetime(timestamp,'localtime'),
'id_persona' integer,
'id_persona_solicitud' integer,
'id_papeleria' integer 
),





*/
