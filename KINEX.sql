 /*
Quinto Perito en Informatica
Nombre: Diego Suarez, 
Código Técnico: IN5BV
Carnét: 2022233
Fecha de creación: 	06/07/2023
Fecha de Modificaión: 
	06/07/2023 23:49 - samuel rodriguez
 */

Drop database if exists DBKinEx; 
Create database DBKinEx; 

Use  DBKinEx;

create table Empresas (
    codigoEmpresa        int auto_increment not null,
    nombreEmpresa         varchar(150) not null,
    direccion             varchar(150) not null,
    telefono              varchar(10) not null,
    primary key PK_codigoEmpresa (codigoEmpresa)

);

create table TipoEmpleado(
    codigoTipoEmpleado int not null auto_increment,
    descripcion        varchar(50) not null,
    primary key PK_codigoTipoEmpleado (codigoTipoEmpleado)
);


Create table Usuario(
	codigoUsuario int not null auto_increment,
    nombreUsuario varchar (100) not null,
    apellidoUsuario varchar (100) not null,
    usuarioLogin varchar (50) not null,
    contrasena varchar (50) not null,
    primary key  Pk_codigoUsuario (codigoUsuario)
);



Create table Login(
	usuarioMaster varchar(50) not null,
    passwordLogin varchar(50) not null,
    primary key PK_usuarioMaster (usuarioMaster)
);

-- ---------------------------------AGREGAR EMPRESA--------------------------------
Delimiter $$
	create procedure sp_AgregarEmpresa (in nombreEmpresa varchar(150), in direccion varchar(150), in telefono varchar(10))
		Begin
			Insert into Empresas (nombreEmpresa, direccion, telefono)
				values (nombreEmpresa, direccion, telefono);
        End$$
Delimiter ;

Call sp_AgregarEmpresa('Mac', '2av 12-12 zona 21', '1526-2635');
Call sp_AgregarEmpresa('Campero', '3av 16-99 zona 12', '3652-6654');
Call sp_AgregarEmpresa ('Walmart', 'Ciudad de Guatemala', '3541-5542');
Call sp_AgregarEmpresa ('Cemaco', 'Zona 4 de Mixco', '3325-5521');
Call sp_AgregarEmpresa ('PriceSmart', 'Zona 1 de VillaNueva', '6540-5512');

-- ---------------------------- Listar Empresas ------------------------------------
Delimiter $$
	Create procedure sp_ListarEmpresas ()
		Begin
			Select
            E.codigoEmpresa, 
            E.nombreEmpresa, 
            E.direccion, 
            E.telefono
            from Empresas E;
        End$$
Delimiter ;

Call sp_ListarEmpresas ();

-- ---------------------------- Buscar Empresa -----------------------------
Delimiter $$
	Create procedure sp_BuscarEmpresa (in codEmpresa int)
		Begin
			Select 
            E.codigoEmpresa, 
            E.nombreEmpresa, 
            E.direccion, 
            E.telefono
            from Empresas E
            where codigoEmpresa = codEmpresa;
        End$$
Delimiter ;

call sp_BuscarEmpresa (1);

-- ---------------------------- Eliminar Empresa -----------------------------
Delimiter $$
	Create procedure sp_EliminarEmpresa (in codEmpresa int)
    Begin
		Delete from Empresas
        where codigoEmpresa = codEmpresa;
    End$$
Delimiter ;

 Call sp_EliminarEmpresa(3);
 
 -- --------------------------- CRUD TIPOEMPLEADO -----------------------------
 -- ---------------- Agregar TipoEmpleado ------------------------
Delimiter $$
	create procedure sp_AgregarTipoEmpleado (in descripcion varchar(50))
		Begin
			Insert into TipoEmpleado (descripcion)
				values (descripcion);
        End$$
Delimiter ;

Call sp_AgregarTipoEmpleado ('Mensajero');
Call sp_AgregarTipoEmpleado ('Gerente');
Call sp_AgregarTipoEmpleado ('Contador');
Call sp_AgregarTipoEmpleado ('Empaquetador');
Call sp_AgregarTipoEmpleado ('Conserje');

-- --------------------------- Listar TipoEmpleado -----------------------------
Delimiter $$
	Create procedure sp_ListarTipoEmpleado()
		Begin
			Select 
            T.codigoTipoEmpleado, 
            T.descripcion
            from TipoEmpleado T;  
        End$$
Delimiter ;

Call sp_ListarTipoEmpleado();
-- ------------------------------ Buscar TipoEmpleado -----------------------------
Delimiter $$
	Create procedure sp_BuscarTipoEmpleado (in codTipoEmpleado int)
		Begin
			Select 
            T.codigoTipoEmpleado,
            T.descripcion
            from TipoEmpleado T
            where codigoTipoEmpleado = codTipoEmpleado;
        End$$
Delimiter ;

call sp_BuscarTipoEmpleado (2);

-- ------------------------------- Eliminar TipoEmpleado -----------------------------
Delimiter $$
	Create procedure sp_EliminarTipoEmpleado (in codTipoEmpleado int)
		Begin
			Delete from TipoEmpleado
            where codigoTipoEmpleado = codTipoEmpleado;
        End$$
Delimiter ;

Call sp_EliminarTipoEmpleado(3);

-- ---------------------------------- Agregar Usuarios ------------------------------------- --

Delimiter  $$
	Create procedure sp_AgregarUsuario(in nombreUsuario varchar (100) , in apellidoUsuario varchar (100), 
    in usuarioLogin varchar(50), in contrasena varchar (50))
		Begin
        Insert into Usuario(nombreUsuario,apellidoUsuario,usuarioLogin,contrasena)
			values (nombreUsuario,apellidoUsuario,usuarioLogin,contrasena);
        End$$
Delimiter ;

call sp_AgregarUsuario('Samuel','rodriguez','Samuel','165');
call sp_AgregarUsuario('Diego','Suarez','suarez','56');
call sp_AgregarUsuario('Victor','Alvarez','victor','924');
call sp_AgregarUsuario('Lester','Texajum','Lwester','625');


-- ----------------------------- Listar Usuarios --------------------------------- --
Delimiter $$
    create procedure sp_ListarUsuarios()
        Begin 
            Select 
            U.codigoUsuario, 
            U.nombreUsuario, 
            U.apellidoUsuario, 
            U.usuarioLogin, 
            U.contrasena
            from Usuario U;
        End$$
Delimiter ;

call sp_ListarUsuarios();
