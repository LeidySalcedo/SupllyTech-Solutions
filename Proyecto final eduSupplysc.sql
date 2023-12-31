USE [master]
GO
/****** Object:  Database [Educational Supplysc]    Script Date: 25/8/2023 4:22:00 a. m. ******/
CREATE DATABASE [Educational Supplysc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Educational Supplysc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Educational Supplysc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Educational Supplysc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Educational Supplysc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Educational Supplysc] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Educational Supplysc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Educational Supplysc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Educational Supplysc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Educational Supplysc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Educational Supplysc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Educational Supplysc] SET ARITHABORT OFF 
GO
ALTER DATABASE [Educational Supplysc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Educational Supplysc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Educational Supplysc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Educational Supplysc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Educational Supplysc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Educational Supplysc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Educational Supplysc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Educational Supplysc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Educational Supplysc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Educational Supplysc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Educational Supplysc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Educational Supplysc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Educational Supplysc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Educational Supplysc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Educational Supplysc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Educational Supplysc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Educational Supplysc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Educational Supplysc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Educational Supplysc] SET  MULTI_USER 
GO
ALTER DATABASE [Educational Supplysc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Educational Supplysc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Educational Supplysc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Educational Supplysc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Educational Supplysc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Educational Supplysc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Educational Supplysc] SET QUERY_STORE = ON
GO
ALTER DATABASE [Educational Supplysc] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Educational Supplysc]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 25/8/2023 4:22:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idClientes] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Telefono] [nchar](10) NOT NULL,
	[idVendedor] [int] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 25/8/2023 4:22:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleados] [int] NOT NULL,
	[Identificacion] [varchar](15) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Genero] [varchar](12) NOT NULL,
	[Ocupacion] [varchar](15) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 25/8/2023 4:22:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[idPedidos] [int] NOT NULL,
	[Fechapedidos] [date] NOT NULL,
	[idClientes] [int] NOT NULL,
	[TotalPedidos] [int] NOT NULL,
	[EstadoPedidos] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[idPedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/8/2023 4:22:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Vendidos] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 25/8/2023 4:22:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[idProveedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Telefono] [char](10) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 25/8/2023 4:22:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[idVendedor] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [char](10) NULL,
	[VentaMensual] [int] NULL,
	[idEmpleados] [int] NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[idVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (1085, N'Julio', N'Soto', N'Santo Domingo ', N'juansoto@gmail.com', N'8093584868', 1)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (1096, N'Martha', N'Geronimo', N'San Pedro', N'Geronimom@gmail.com', N'8293592050', 3)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2050, N'Juan', N'Perez', N'Santiago', N'PerezS@gmail.com', N'8498856425', 2)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2051, N'Oniel', N'Hernandez', N'Santo Domingo', N'Hernandez@gmail.com', N'8096359741', 4)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2154, N'Yudelka ', N'Ortiz', N'Santo Dpmingo Este ', N'Ortizyud@gmail.com', N'8295369021', 1)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2156, N'Omar', N'Fernandez', N'Puerto Plata ', N'Fernandezsd@gmail.com', N'8491592036', 2)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2268, N'Gabriel', N'Gomez', N'Samana', N'Gabygomez@gmail.com', N'8093662788', 3)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2269, N'Osiris', N'Jimenez', N'Santo Domingo Norte', N'OsiJimenez@gmail.com', N'8096547585', 3)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2370, N'Maria ', N'Rojas', N'Santiago', N'MariaRojas@gmail.com', N'8435962103', 4)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2371, N'Josefina', N'Martinez', N'San Cristobal', N'Josefinam@gmail.com', N'8096547836', 1)
INSERT [dbo].[Clientes] ([idClientes], [Nombre], [Apellido], [Dirección], [Correo], [Telefono], [idVendedor]) VALUES (2372, N'Maria', N'Brujan', N'Santiago', N'Matiabjn@gmail.com', N'8294867210', 1)
GO
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (184, N'00103959537', N'Helena', N'Montero', N'F', N'Gerente ', CAST(N'1989-08-25' AS Date), N'Helenamtr@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (253, N'00104252538', N'Pedro', N'Jimenez', N'M', N'Supervisor', CAST(N'1990-07-26' AS Date), N'JimenesPe@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (310, N'40211808036', N'Juana ', N'Rosario', N'F', N'Encargado Venta', CAST(N'1996-10-05' AS Date), N'Rosariojna@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (473, N'40220205638', N'Jesus', N'Casals', N'M', N'Enc. Almacen', CAST(N'1983-12-20' AS Date), N'Calsalsju@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (570, N'40230256315', N'Miguel', N'Alcantara ', N'M', N'Almacen', CAST(N'1994-03-16' AS Date), N'Alcantaram@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (672, N'40212125496', N'Laura', N'Mora', N'F', N'Cajera', CAST(N'1997-02-15' AS Date), N'Lauramora@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (785, N'00105056329', N' Josue', N'Martinez', N'M', N'Vendedor ', CAST(N'1990-11-01' AS Date), N'Josuemtz@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (786, N'40223236348', N'Altagracia', N'Moreno', N'F', N'Vendedor ', CAST(N'1996-07-31' AS Date), N'MorenoAlt@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (787, N'40285365479', N'Alexander', N'Rodriguez', N'M', N'Vendedor', CAST(N'1995-06-30' AS Date), N'Alexrdgz@gmail.com')
INSERT [dbo].[Empleados] ([idEmpleados], [Identificacion], [Nombre], [Apellido], [Genero], [Ocupacion], [FechaNacimiento], [Correo]) VALUES (865, N'40296348521', N'Hilary', N'Ogando', N'F', N'Vendedor', CAST(N'1998-12-12' AS Date), N'Hilargan@gmail.com')
GO
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (5, CAST(N'2023-07-25' AS Date), 1085, 52000, N'Enviado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (6, CAST(N'2023-05-20' AS Date), 1096, 150600, N'Entregado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (7, CAST(N'2023-04-02' AS Date), 2050, 260450, N'Entregado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (8, CAST(N'2023-07-28' AS Date), 2051, 120200, N'En proceso')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (9, CAST(N'2023-08-10' AS Date), 2154, 500900, N'En Proceso')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (10, CAST(N'2023-06-01' AS Date), 2156, 650500, N'Enviado ')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (11, CAST(N'2023-03-22' AS Date), 2268, 80000, N'Entregado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (12, CAST(N'2023-02-20' AS Date), 2269, 90800, N'Entregado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (13, CAST(N'2023-07-30' AS Date), 2370, 350000, N'Enviado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (14, CAST(N'2023-01-16' AS Date), 2371, 250600, N'Enviado')
INSERT [dbo].[Pedidos] ([idPedidos], [Fechapedidos], [idClientes], [TotalPedidos], [EstadoPedidos]) VALUES (15, CAST(N'2023-08-05' AS Date), 2372, 75000, N'En proceso')
GO
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (20702, N'Mochila', N'Reistente y Versatil', 300, 930, 250, 59612)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (20703, N'Lonchera', N'Material durarero y resistente ', 235, 325, 200, 59748)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (21701, N'Lapices', N'Carbon', 480, 12, 520, 60801)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (21702, N'Lapiceros', N'Puntas Finas', 525, 15, 435, 60801)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (21703, N'Marcadores', N'Gruesos', 322, 180, 148, 59748)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (21704, N'Colores', N'Punta Fina', 104, 235, 96, 62746)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (22705, N'Cuadernos', N'200 paginas', 1020, 85, 580, 60802)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (22706, N'Catedras', N'Diseño personalizado ', 207, 365, 73, 60804)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (23780, N'Estuche', N'Diseño personalizado', 335, 280, 215, 59741)
INSERT [dbo].[Productos] ([idProducto], [Nombre], [Descripcion], [Vendidos], [Precio], [Stock], [idProveedor]) VALUES (23781, N'Borras', N'Blancas y animadas', 820, 18, 480, 62745)
GO
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (59612, N'Miguel', N'Jansport', N'8294835647')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (59741, N'Almando', N'Totto', N'8496312584')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (59748, N'Miguelina', N'Crayola', N'8096458631')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (60801, N'Sthephany', N'Bic', N'8295810203')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (60802, N'Antonio', N'Apolo', N'8499046400')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (60803, N'Raquell', N'Eco', N'8096367420')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (60804, N'Bernando', N'Durable', N'8094589625')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (62745, N'Fanny', N'Astesco', N'8496531084')
INSERT [dbo].[Proveedor] ([idProveedor], [Nombre], [Marca], [Telefono]) VALUES (62746, N'Enmanuel', N'Pelikan', N'8295413029')
GO
INSERT [dbo].[Vendedor] ([idVendedor], [Nombre], [Correo], [Telefono], [VentaMensual], [idEmpleados]) VALUES (1, N'Josue', N'Josuemtz', N'8096338080', 250500, 785)
INSERT [dbo].[Vendedor] ([idVendedor], [Nombre], [Correo], [Telefono], [VentaMensual], [idEmpleados]) VALUES (2, N'Altagracia', N'MorenoAtl@gmail.com', N'8494996847', 115000, 786)
INSERT [dbo].[Vendedor] ([idVendedor], [Nombre], [Correo], [Telefono], [VentaMensual], [idEmpleados]) VALUES (3, N'Alexander', N'Alexrdz@gmail.com', N'8094686954', 110000, 787)
INSERT [dbo].[Vendedor] ([idVendedor], [Nombre], [Correo], [Telefono], [VentaMensual], [idEmpleados]) VALUES (4, N'Hilary', N'Hilargan@gmail.com', N'8294836954', 108950, 865)
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Vendedor] FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedor] ([idVendedor])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Vendedor]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([idClientes])
REFERENCES [dbo].[Clientes] ([idClientes])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedor1] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedor1]
GO
ALTER TABLE [dbo].[Vendedor]  WITH CHECK ADD  CONSTRAINT [FK_Vendedor_Empleados] FOREIGN KEY([idEmpleados])
REFERENCES [dbo].[Empleados] ([idEmpleados])
GO
ALTER TABLE [dbo].[Vendedor] CHECK CONSTRAINT [FK_Vendedor_Empleados]
GO
USE [master]
GO
ALTER DATABASE [Educational Supplysc] SET  READ_WRITE 
GO
