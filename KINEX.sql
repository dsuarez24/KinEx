 /*
Quinto Perito en Informatica
Nombre: Diego Suarez, 
Código Técnico: IN5BV
Carnét: 2022233
Fecha de creación: 	06/07/2023
Fecha de Modificaión: 
	06/07/2023 23:49 - samuel rodriguez
//   06/07/2023 10:50 - Manuel Suarez
 */

Drop database if exists DBKinEx; 
Create database DBKinEx; 

Use  DBKinEx;

create table Empresas (
    codigoEmpresa int auto_increment not null,
    nombreEmpresa varchar(150) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_codigoEmpresa (codigoEmpresa)

);

create table TipoEmpleado(
    codigoTipoEmpleado int not null auto_increment,
    descripcion        varchar(50) not null,
    primary key PK_codigoTipoEmpleado (codigoTipoEmpleado)
);

Create table Empleados(
	codigoEmpleado int auto_increment not null,
    carnetEmpleado int not null,
    apellidoEmpleado varchar(150) not null,
    nombresEmpleado varchar(150) not null,
    direccionEmpleado varchar(150) not null,
    telefonoContacto varchar(10) not null,
    codigoTipoEmpleado int not null,
    primary key PK_codigoEmpleado (codigoEmpleado),
    constraint FK_Empleados_TipoEmpleado foreign key 
		(codigoTipoEmpleado) references TipoEmpleado(codigoTipoEmpleado)
);

Create table TipoProducto(
    codigoTipoProducto int auto_increment not null,
    descripcionTipoProducto       varchar(100) not null,
    primary key PK_TipoProducto (codigoTipoProducto)
);

create table MetodoDePago(
    codigoMetodoDePago int auto_increment not null,
    descripcion       varchar(100) not null,
    primary key PK_codigoMetodoDePago (codigoMetodoDePago)
);


Create table Producto(
    codigoProducto int not null,
    nombreProducto varchar(150) not null,
    cantidad int not null,
    precio varchar(100) not null,
    codigoTipoProducto int not null,
    primary key PK_codigoProducto (codigoProducto),
    constraint FK_Producto_TipoProducto foreign key
		(codigoTipoProducto) references TipoProducto(codigoTipoProducto)
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

create table TipoUbicacion(
	codigoTipoUbicacion int auto_increment not  null,
	direccion varchar (100) not null,
	primary key PK_codigoTipoUbicacion(codigoTipoUbicacion)
);

create table Ubicacion(
    codigoUbicacion int auto_increment not null,
    codigoTipoUbicacion int not null,
    departamento varchar(100) not null,
    municipio  varchar(100) not null,
    aldeaColonia varchar (100) not null,
    primary key PK_codigoUbicacion(codigoUbicacion),
    constraint FK_Ubicacion_TipoUbicacion foreign key (codigoTipoUbicacion)
        references TipoUbicacion (codigoTipoUbicacion)
        on delete cascade
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

-- ------------------------------------- Procedimientos almacenados Entidad Empleados -----------------------------------
-- describe Empleados
-- ------------------------------------- AGREGAR Empleados ----------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_AgregarEmpleado(in carnetEmpleado int, apellidoEmpleado varchar(150), nombresEmpleado varchar(150), in direccionEmpleado varchar(150), in telefonoContacto varchar(10), in codigoTipoEmpleado int)
		Begin
			Insert into Empleados (carnetEmpleado, apellidoEmpleado, nombresEmpleado, direccionEmpleado, telefonoContacto, codigoTipoEmpleado)
				Values (carnetEmpleado, apellidoEmpleado, nombresEmpleado, direccionEmpleado, telefonoContacto, codigoTipoEmpleado);
        End$$	
Delimiter ;

call sp_AgregarEmpleado('2023001', 'Ramirez ', 'Sebastián', 'Zona 7', '23658974', 3);
call sp_AgregarEmpleado('2023002', 'Palacios', 'Daniel', 'Zona 5', '12365485', 1);
call sp_AgregarEmpleado('2023003', 'Rosales', 'Nancy', 'Zona 8', '30210369', 2);

-- --------------------------------------------------LISTAR Empleados ----------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_ListarEmpleados()
		Begin
			Select 
			E.codigoEmpleado, 
            E.carnetEmpleado, 
            E.apellidoEmpleado, 
            E.nombresEmpleado, 
            E.direccionEmpleado, 
            E.telefonoContacto, 
            E.codigoTipoEmpleado
            from Empleados E;
        End$$	
Delimiter ;

call sp_ListarEmpleados();

-- ------------------------- BUSCAR Empleados---------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_BuscarEmpleados(in codEmp int)
		Begin
			Select 
            E.codigoEmpleado, 
            E.carnetEmpleado, 
            E.apellidoEmpleado, 
            E.nombresEmpleado, 
            E.direccionEmpleado, 
            E.telefonoContacto, 
            E.codigoTipoEmpleado
            from Empleados E where codigoEmpleado = codEmp;
        End$$
Delimiter ;

-- ---------------------------ELIMINAR Empleados---------------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_EliminarEmpleados(in codEmp int)
		Begin
			Delete from Empleados
				where codigoEmpleado = codEmp;
		End$$
Delimiter ;

-- --------------------- EDITAR Empleados -----------------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_EditarEmpleado(in codEmp int, in carnEmp int, in apeEmp varchar(150), in nomEmp varchar(150), in direcEmp varchar(150), in telCon varchar(10), in codTipEmp int)
		Begin
			Update Empleados E
				set E.carnetEmpleado = carnEmp, 
					E.apellidoEmpleado = apeEmp, 
					E.nombresEmpleado =nomEmp, 
					E.direccionEmpleado = direcEmp, 
					E.telefonoContacto = telCon,
					E.codigoTipoEmpleado = codTipEmp
                where codigoEmpleado = codEmp;
        End$$
Delimiter ;

-- ------------------------------------- Procedimientos almacenados Tipo Empleado -----------------------------------
-- codigoTipoProducto     descripcionTipoProducto  

Delimiter $$
	Create procedure sp_AgregarTipoProducto(in descripcionTipoProducto varchar(100))
		Begin
			Insert into TipoProducto (descripcionTipoProducto)
				values (descripcionTipoProducto);
        End$$	
Delimiter ;
call sp_AgregarTipoProducto("Mesa");
call sp_AgregarTipoProducto("Florero");
call sp_AgregarTipoProducto("Balon ");
call sp_AgregarTipoProducto("Caja");
call sp_AgregarTipoProducto("Escritorio");


-- listar 

Delimiter $$
	Create procedure sp_ListarTipoProducto()
		Begin
			Select 
            TP.codigoTipoProducto,
            TP.descripcionTipoProducto
            from TipoProducto = TP;
		End$$
Delimiter ;


call sp_ListarTipoProducto();

-- buscar 

Delimiter $$
	Create procedure sp_BuscarTipoProducto(in codTipoProducto int)
		Begin
			Select
			TP.codigoTipoProducto,
            TP.descripcionTipoProducto
            from TipoProducto = TP where codigoTipoProducto = codTipoProducto;
        End$$
Delimiter ;
-- eliminar
Delimiter $$
	Create procedure sp_EliminarTipoProducto(in codTipoProducto int)
		Begin
			Delete from TipoProducto
				where codigoTipoProducto = codTipoProducto;
        End$$
Delimiter ;
-- editar 
Delimiter $$
	Create procedure sp_EditarTipoProducto(in codProducto int, in codTipProduc int)
		Begin
			Update TipoProducto TP
				set TP.codigoTipoProducto = codTipProduc
                where P.codigoProducto = codProducto;
        End$$
Delimiter ;
-- ------------------------------------- Procedimientos almacenados Entidad Producto -----------------------------------
-- describe Producto
-- ------------------------------------- AGREGAR Producto -------------------------------------------------------------
Delimiter $$
	Create procedure sp_AgregarProducto(in codigoProducto int, in nombreProducto varchar(150), in cantidad int, in precio varchar(100), in codigoTipoProducto int)
		Begin
			Insert into Producto (codigoProducto, nombreProducto, cantidad, precio, codigoTipoProducto)
				values (codigoProducto, nombreProducto, cantidad, precio, codigoTipoProducto);
        End$$	
Delimiter ;
call sp_AgregarProducto(1, 'Abarrotes', 6, 'Q.3000', 3);
call sp_AgregarProducto(2, 'Art. de libreria', 56, 'Q.10000', 1);
call sp_AgregarProducto(3, 'Articulos de computación', 15, 'Q.25000', 2);

-- --------------------------------------------------LISTAR Productos ----------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_ListarProductos()
		Begin
			Select 
            P.codigoProducto, 
            P.nombreProducto, 
            P.cantidad,
            P.precio,
            P.codigoTipoProducto
            from Producto = P;
		End$$
Delimiter ;

call sp_ListarProductos;

-- ------------------------- BUSCAR Producto ---------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_BuscarProducto(in codProducto int)
		Begin
			Select
			P.codigoProducto, 
            P.nombreProducto, 
            P.cantidad,
            P.precio,
            P.codigoTipoProducto
            from Producto = P where codigoProducto = codProducto;
        End$$
Delimiter ;

-- ---------------------------ELIMINAR Producto ---------------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_EliminarProducto(in codProducto int)
		Begin
			Delete from Producto
				where codigoProducto = codProducto;
        End$$
Delimiter ;

-- --------------------- EDITAR Producto -----------------------------------------------------------------------------------------------------------------------------------------------
Delimiter $$
	Create procedure sp_EditarProducto(in codProducto int, in nombProduc varchar(150), in cant int, in pre varchar(100), in codTipProduc int)
		Begin
			Update Producto P
				set P.nombreProducto = nombProduc,
					P.cantidad = cant,
                    P.precio = pre,
                    P.codigoTipoProducto = codTipProduc
                where P.codigoProducto = codProducto;
        End$$
Delimiter ;

-- ------------------------------------- Procedimientos almacenados Metodo de pago  -----------------------------------
-- MetodoDePago codigoMetodoDePago  descripcion  


Delimiter $$
	Create procedure sp_AgregarMetodoDePago(in descripcion varchar(100))
		Begin
			Insert into MetodoDePago (descripcion)
				values (descripcion);
        End$$	
Delimiter ;
call sp_AgregarMetodoDePago("Targeta de credito");
call sp_AgregarMetodoDePago("Efectivo");
call sp_AgregarMetodoDePago("Efectivo");
call sp_AgregarMetodoDePago("Efectivo");
call sp_AgregarMetodoDePago("Targeta de credito");


-- listar 

Delimiter $$
	Create procedure sp_ListarMetodoDePago()
		Begin
			Select 
            MDP.codigoMetodoDePago,
            MDP.descripcion
            from MetodoDePago = MDP;
		End$$
Delimiter ;


call sp_ListarMetodoDePago();

-- buscar 

Delimiter $$
	Create procedure sp_BuscarMetodoDePago(in codMetodoDePago int)
		Begin
			Select
			MDP.codigoMetodoDePago,
            MDP.descripcion
            from MetodoDePago = MDP where codigoMetodoDePago = codMetodoDePago;
        End$$
Delimiter ;
-- eliminar
Delimiter $$
	Create procedure sp_EliminarMetodoDePago(in codTipoProducto int)
		Begin
			Delete from TipoProducto
				where codigoTipoProducto = codMetodoDePago;
        End$$
Delimiter ;
-- editar 
Delimiter $$
	Create procedure sp_EditarMetodoDePago(in codMetodoDePago int, in codTipProduc int)
		Begin
			Update TipoMetodoDePago MDP
				set MDP.codigoTipoProducto = codTipProduc
                where P.codigoProducto = codProducto;
        End$$
Delimiter ;
-- _________________________ Crud De tipoUbicacion ________________________________________ 
-- _________________________ agregar tipoUbicacion

 

Delimiter $$

 

    create procedure sp_AgregarTipoUbicacion(in direccion varchar(100))

    Begin

        Insert into TipoUbicacion(direccion)
            values(direccion);


    End$$

 

Delimiter ;

 

Call sp_AgregarTipoUbicacion('zona 1');
Call sp_AgregarTipoUbicacion('zona 2');
Call sp_AgregarTipoUbicacion('zona 3');
Call sp_AgregarTipoUbicacion('zona 4');

 

-- _________________________ Listar tipoUbicacion

 

Delimiter $$

    create procedure sp_ListarTipoUbicacion()

    Begin

        Select
            TU.codigoTipoUbicacion,
            TU.direccion
                from TipoUbicacion TU;

    End$$

Delimiter ;

Call sp_ListarTipoUbicacion();

 


-- _________________________ Buscar tipoUbicacion

 

Delimiter $$

 

    create procedure sp_BuscarTipoUbicacion(in codigoTipoUbicacion int)

    Begin 

        Select
            TU.codigoTipoUbicacion,
            TU.direccion
                from TipoUbicacion TU
                    where codigoTipoUbicacion = codigoTipoUbicacion;
    End$$

 

Delimiter ;

 

Call sp_BuscarTipoUbicacion(2);

 

-- _________________________ Eliminar tipoUbicacion

 

Delimiter $$

 

    create procedure sp_EliminartipoUbicacion(in codigoTipoUbicacion int)

        Begin

        Delete from tipoUbicacion
        where codigoTipoUbicacion = codigoTipoUbicacion;

        End$$

 

Delimiter ;

 


-- _________________________ Crud De Ubicacion ________________________________________ 
-- _________________________ agregar Ubicacion

 

Delimiter $$
    create procedure sp_AgregarUbicacion (in codigoTipoUbicacion int,in departamento varchar(100), in municipio varchar(100), in aldeaColonia varchar(100))
        Begin
            Insert into Ubicacion (codigoTipoUbicacion,departamento, municipio, aldeaColonia)
                values (codigoTipoUbicacion,departamento, municipio, aldeaColonia);
        End$$
Delimiter ;

 

Call sp_AgregarUbicacion('1','Alta Verapaz','Coban','1');
Call sp_AgregarUbicacion('2','Baja Verapaz','Rabinal','2');
Call sp_AgregarUbicacion('3','Chimaltenango','Tejar','3');
Call sp_AgregarUbicacion('4','Peten','Jocotan','4');

 


-- _________________________ Listar Ubicacion

 

Delimiter $$

 

    create procedure sp_ListarUbicacion()

        Begin
            Select
                U.codigoUbicacion,
                U.codigoTipoUbicacion,
                U.departamento,
                U.municipio,
                U.aldeaColonia

                from Ubicacion U;
        End$$

Delimiter ;

 

Call sp_ListarUbicacion();

 

-- _________________________ Buscar Ubicacion

 

Delimiter $$

 

    create procedure sp_BuscarUbicacion(in codigoUbicacion int)

        Begin
            Select
                U.codigoUbicacion,
                U.codigoTipoUbicacion,
                U.departamento,
                U.municipio,
                U.aldeaColonia

                from Ubicacion U
                    where codigoUbicacion = codigoUbicacion;
        End$$

 

Call sp_BuscarUbicacion(1);

 

-- _________________________ Eliminar Ubicacion

 

Delimiter $$

 

    create procedure sp_EliminarUbicacion(in codigoUbicacion int)

    Begin
        Delete from Ubicacion
        where codigoUbicacion = codigoUbicacion;
    End$$

 

Delimiter ;


 














