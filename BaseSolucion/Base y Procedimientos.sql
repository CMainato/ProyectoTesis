USE [master]
GO
/****** Object:  Database [DBINVENTARIO1_WEB]    Script Date: 11-Oct-21 12:48:28 PM ******/
CREATE DATABASE [DBINVENTARIO1_WEB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBINVENTARIO1_WEB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBINVENTARIO1_WEB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBINVENTARIO1_WEB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBINVENTARIO1_WEB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBINVENTARIO1_WEB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET RECOVERY FULL 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET  MULTI_USER 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBINVENTARIO1_WEB', N'ON'
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET QUERY_STORE = OFF
GO
USE [DBINVENTARIO1_WEB]
GO
/****** Object:  Table [dbo].[AGENCIA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGENCIA](
	[IdAgencia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAgencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](40) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProveedor] [int] NULL,
	[IdAgencia] [int] NULL,
	[TotalCosto] [decimal](18, 2) NULL,
	[TipoComprobante] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[NumeroFactura] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitarioCompra] [decimal](18, 2) NULL,
	[PrecioUnitarioVenta] [decimal](18, 2) NULL,
	[TotalCosto] [decimal](18, 2) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[NumeroFactura] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnidad] [decimal](18, 2) NULL,
	[ImporteTotal] [decimal](18, 2) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[Observacion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Icono] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[IdPermisos] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdSubMenu] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[CodigoValle] [varchar](100) NULL,
	[Serie] [varchar](100) NULL,
	[EstadoEquipo] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO_AGENCIA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_AGENCIA](
	[IdProductoAgencia] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdAgencia] [int] NULL,
	[PrecioUnidadCompra] [decimal](18, 2) NULL,
	[PrecioUnidadVenta] [decimal](18, 2) NULL,
	[Stock] [bigint] NULL,
	[Activo] [bit] NULL,
	[Iniciado] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoAgencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](50) NULL,
	[RazonSocial] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBMENU]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMENU](
	[IdSubMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[Nombre] [varchar](60) NULL,
	[Controlador] [varchar](60) NULL,
	[Vista] [varchar](50) NULL,
	[Icono] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](60) NULL,
	[Apellidos] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Clave] [varchar](100) NULL,
	[IdAgencia] [int] NULL,
	[IdRol] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[token_recovery] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[IdAgencia] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdCliente] [int] NULL,
	[TipoDocumento] [varchar](50) NULL,
	[CantidadProducto] [int] NULL,
	[CantidadTotal] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AGENCIA] ON 
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1, N'MATRIZ', N'Huancavilca SN y Duchicela', N'01108', 1, CAST(N'2021-06-21T12:23:26.107' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (5, N'SANGOLQUI', N'Av. General Enríquez 2943 y Río Chinchipe', N'04101', 1, CAST(N'2021-06-21T16:11:09.843' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (6, N'GUAMANI', N'Av. Maldonado S52-148 y Calle La Perla', N'11101', 1, CAST(N'2021-06-21T18:29:58.810' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (7, N'CONOCOTO', N'Av. Mariscal Sucre y Polit Lasso Esq.', N'01110', 0, CAST(N'2021-06-23T19:23:18.950' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1002, N'AMAGUAÑA', N'García Moreno E12-15 y Colón', N'05101', 1, CAST(N'2021-08-05T17:02:19.787' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3003, N'TUMBACO', N'Av.Oswaldo Guayasamín y Gonzalo Pizarro Esq.', N'12101', 1, CAST(N'2021-09-13T19:47:02.693' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3004, N'MACHACHI', N'Av. Colón y Av. Gran Colombia esq.', N'06101', 1, CAST(N'2021-09-13T19:47:15.430' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3005, N'VILLAFLORA', N'Rodrigo de Chávez OE1-148 y Francisco Gómez', N'2998 600', 0, CAST(N'2021-09-13T19:47:33.757' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3006, N'CHILLOGALLO', N'Antonio José de Sucre OE-720 y Luis López', N'03101', 1, CAST(N'2021-09-13T19:47:47.780' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3007, N'LA CAROLINA', N'Av. Amazonas N34 – 311 y Atahualpa,', N'10101', 1, CAST(N'2021-09-13T19:48:04.900' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3008, N'BICENTENARIO', N'Av. la Prensa N53 - 153 y Gonzalo Gallo', N'13101', 0, CAST(N'2021-09-13T19:48:17.600' AS DateTime))
GO
INSERT [dbo].[AGENCIA] ([IdAgencia], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (3009, N'EL INCA', N'Los Nogales 47-161 y Av. el Inca', N'02101', 1, CAST(N'2021-09-13T19:48:30.400' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[AGENCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'COMPUTADORA PORTATIL', 1, CAST(N'2021-06-21T12:23:26.240' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'MOUSE', 1, CAST(N'2021-06-21T12:23:26.240' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'COMPUTADORA ESCRITORIO', 1, CAST(N'2021-06-21T12:23:26.240' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'IRIS', 1, CAST(N'2021-06-21T12:23:26.240' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2003, N'HAMSTER', 1, CAST(N'2021-09-24T19:52:37.803' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2004, N'IMPRESORA', 1, CAST(N'2021-09-25T19:14:51.890' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2005, N'SCANNER', 1, CAST(N'2021-09-25T19:14:57.463' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2006, N'MOCHILA', 1, CAST(N'2021-09-25T19:15:08.213' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2007, N'MODEM', 1, CAST(N'2021-09-25T19:15:15.750' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1025, N'AMAGUAÑA', N'LEGAL', N'Luis', N'Sislema', N'0989876787', 1, CAST(N'2021-10-09T20:33:51.467' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1026, N'CONOCOTO', N'CAJAS', N'Ernesto', N'Teran', N'0987876567', 1, CAST(N'2021-10-09T20:34:32.387' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1027, N'MATRIZ', N'OFICIAL DE CRÉDITO', N'Veronica', N'Moreira', N'0987872223', 1, CAST(N'2021-10-09T20:35:02.877' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1028, N'AMAGUAÑA', N'OFICIAL DE CRÉDITO', N'Jema', N'Moreira', N'0982123432', 1, CAST(N'2021-10-09T20:35:50.900' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1029, N'SANGOLQUI', N'SISTEMAS', N'Fernando', N'Cuevas', N'098766544', 1, CAST(N'2021-10-09T20:36:08.787' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1030, N'CONOCOTO', N'OFICIAL DE CRÉDITO MÓVIL', N'Erika', N'Sarmiento', N'0987875543', 1, CAST(N'2021-10-09T20:36:36.777' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1031, N'MATRIZ', N'OFICIAL DE CRÉDITO MÓVIL', N'Rosa', N'Melina', N'0987443433', 1, CAST(N'2021-10-09T20:37:03.023' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1032, N'SANGOLQUI', N'OFICIAL DE CRÉDITO MÓVIL', N'Marco', N'Vamencia', N'0946374565', 1, CAST(N'2021-10-09T20:37:36.793' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1033, N'EL_INCA	', N'CAJAS', N'Dilan', N'Segovia', N'0987889833', 1, CAST(N'2021-10-09T20:37:59.460' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1034, N'MATRIZ', N'CONTABILIDAD', N'Monica', N'Quintiliano', N'0987773433', 1, CAST(N'2021-10-09T20:38:35.980' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1035, N'MATRIZ', N'CONTABILIDAD', N'Soledad', N'Cruz', N'0987773442', 1, CAST(N'2021-10-09T20:38:55.843' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1036, N'GUAMANI', N'CONTABILIDAD', N'Viviana', N'Perez', N'0998744323', 1, CAST(N'2021-10-09T20:39:16.547' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1037, N'AMAGUAÑA', N'OFICIA ', N'Jema', N'Moreira', N'0982123432', 1, CAST(N'2021-10-09T20:44:33.683' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1038, N'TUMBACO', N'OFICIAL DE CREDITO MOVIL', N'Sebastian ', N'Cardenas', N'0987876444', 1, CAST(N'2021-10-09T20:51:12.110' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRA] ON 
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5054, 5041, 3, 5, CAST(2.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T19:25:49.467' AS DateTime), N'2343')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5055, 5041, 1003, 1, CAST(2.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T19:39:08.417' AS DateTime), N'123')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5056, 5041, 3, 1, CAST(14.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T19:44:07.873' AS DateTime), N'123123')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5057, 5041, 1003, 1, CAST(234.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T21:19:43.500' AS DateTime), N'23452345')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5058, 5041, 1003, 1, CAST(6.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T21:24:38.397' AS DateTime), N'2234234')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5059, 5041, 3, 1, CAST(12.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T21:29:41.167' AS DateTime), N'324234')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5060, 5041, 3, 1002, CAST(9.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-06T21:35:55.023' AS DateTime), N'43434')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5061, 5041, 1003, 1, CAST(1.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T15:21:14.407' AS DateTime), N'0123123')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5062, 5041, 1003, 1, CAST(2.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T15:22:11.417' AS DateTime), N'12')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5063, 5041, 1003, 1, CAST(9.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T15:29:12.170' AS DateTime), N'54645')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5064, 5041, 1003, 1, CAST(6.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T15:37:07.267' AS DateTime), N'0234')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5065, 5041, 1003, 1, CAST(12.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T15:37:56.980' AS DateTime), N'345435')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5066, 5041, 1003, 3003, CAST(16.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T17:00:29.047' AS DateTime), N'03434344')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5067, 5041, 1003, 1, CAST(1725.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T17:08:02.693' AS DateTime), N'342342343')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5068, 5041, 1007, 1, CAST(136.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T17:11:58.123' AS DateTime), N'434')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5069, 5041, 1007, 1, CAST(12.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-07T17:24:57.490' AS DateTime), N'4343434')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5070, 5043, 1, 3004, CAST(780.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T16:08:31.390' AS DateTime), N'19282736473')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5071, 5043, 1002, 3004, CAST(290.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T17:09:51.400' AS DateTime), N'1231233132')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5072, 5043, 1004, 1, CAST(46.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T17:18:25.410' AS DateTime), N'2ededed333')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5073, 5043, 1, 1, CAST(136.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T17:35:06.417' AS DateTime), N'34343')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5074, 5043, 1, 1002, CAST(10302.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T17:36:49.260' AS DateTime), N'333232')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5075, 5043, 1004, 3009, CAST(1120.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T18:39:55.277' AS DateTime), N'12312312')
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdAgencia], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5076, 5043, 1, 3003, CAST(220.00 AS Decimal(18, 2)), N'Boleta', 1, CAST(N'2021-10-09T20:45:16.107' AS DateTime), N'54545455')
GO
SET IDENTITY_INSERT [dbo].[COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] ON 
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5045, 5058, 1007, 2, CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-06T21:24:38.403' AS DateTime), N'2234234')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5046, 5059, 6, 3, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-06T21:29:41.170' AS DateTime), N'324234')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5047, 5060, 6, 3, CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-06T21:35:55.027' AS DateTime), N'43434')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5048, 5061, 1006, 1, CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T15:21:14.410' AS DateTime), N'0123123')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5049, 5062, 1003, 1, CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T15:22:11.420' AS DateTime), N'12')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5050, 5063, 1006, 3, CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T15:29:12.173' AS DateTime), N'54645')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5051, 5064, 1003, 2, CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T15:37:07.270' AS DateTime), N'0234')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5052, 5065, 1007, 3, CAST(4.00 AS Decimal(18, 2)), NULL, CAST(12.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T15:37:56.983' AS DateTime), N'345435')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5053, 5066, 1010, 4, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T17:00:29.050' AS DateTime), N'03434344')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5054, 5067, 1003, 5, CAST(345.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1725.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T17:08:02.697' AS DateTime), N'342342343')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5055, 5068, 1003, 34, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(136.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T17:11:58.123' AS DateTime), N'434')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5056, 5069, 1003, 3, CAST(4.00 AS Decimal(18, 2)), NULL, CAST(12.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-07T17:24:57.493' AS DateTime), N'4343434')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5057, 5070, 1014, 1, CAST(780.00 AS Decimal(18, 2)), NULL, CAST(780.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T16:08:31.393' AS DateTime), N'19282736473')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5058, 5071, 1015, 1, CAST(290.00 AS Decimal(18, 2)), NULL, CAST(290.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T17:09:51.400' AS DateTime), N'1231233132')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5059, 5072, 1003, 2, CAST(23.00 AS Decimal(18, 2)), NULL, CAST(46.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T17:18:25.410' AS DateTime), N'2ededed333')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5060, 5073, 1003, 4, CAST(34.00 AS Decimal(18, 2)), NULL, CAST(136.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T17:35:06.417' AS DateTime), N'34343')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5061, 5074, 1007, 3, CAST(3434.00 AS Decimal(18, 2)), NULL, CAST(10302.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T17:36:49.263' AS DateTime), N'333232')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5062, 5075, 1016, 2, CAST(560.00 AS Decimal(18, 2)), NULL, CAST(1120.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T18:39:55.280' AS DateTime), N'12312312')
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro], [NumeroFactura]) VALUES (5063, 5076, 1003, 55, CAST(4.00 AS Decimal(18, 2)), NULL, CAST(220.00 AS Decimal(18, 2)), 1, CAST(N'2021-10-09T20:45:16.110' AS DateTime), N'54545455')
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] ON 
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3066, 3065, 1003, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:34:05.137' AS DateTime), N'N/A.
')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3067, 3066, 1007, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:35:26.000' AS DateTime), N'N/A.
')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3068, 3067, 1007, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:44:33.693' AS DateTime), N'N/A.
')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3069, 3068, 1003, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:49:09.463' AS DateTime), N'N/A.
')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3070, 3069, 1003, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:49:43.980' AS DateTime), N'N/A.
')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3071, 3070, 1003, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:50:14.410' AS DateTime), N'')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3072, 3071, 1003, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-09T20:51:30.077' AS DateTime), N'N/A.
')
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro], [Observacion]) VALUES (3073, 3072, 1003, 1, CAST(0.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2021-10-11T10:36:37.423' AS DateTime), N'N/A.
')
GO
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] OFF
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (1, N'Herramientas', N'fas fa-tools', 1, CAST(N'2021-06-21T12:23:25.900' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (2, N'Personal', N'fas fa-user-friends', 1, CAST(N'2021-06-21T12:23:25.900' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (3, N'Compras', N'fas fa-cart-arrow-down', 1, CAST(N'2021-06-21T12:23:25.900' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (4, N'Asignar', N'fas fa-cash-register', 1, CAST(N'2021-06-21T12:23:25.900' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (5, N'Reportes', N'far fa-clipboard', 1, CAST(N'2021-06-21T12:23:25.900' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[PERMISOS] ON 
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (16, 2, 1, 0, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (17, 2, 2, 0, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (18, 2, 3, 0, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (19, 2, 4, 0, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (20, 2, 5, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (21, 2, 6, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (22, 2, 7, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (23, 2, 8, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (24, 2, 9, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (25, 2, 10, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (26, 2, 11, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (27, 2, 12, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (28, 2, 13, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (29, 2, 14, 1, CAST(N'2021-06-21T12:23:26.233' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2082, 2007, 1, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2083, 2007, 2, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2084, 2007, 3, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2085, 2007, 4, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2086, 2007, 5, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2087, 2007, 6, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2088, 2007, 7, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2089, 2007, 8, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2090, 2007, 9, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2091, 2007, 10, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2092, 2007, 11, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2093, 2007, 12, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2094, 2007, 13, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2095, 2007, 14, 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2098, 2008, 1, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2099, 2008, 2, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2100, 2008, 3, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2101, 2008, 4, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2102, 2008, 5, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2103, 2008, 6, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2104, 2008, 7, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2105, 2008, 8, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2106, 2008, 9, 1, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2107, 2008, 10, 1, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2108, 2008, 11, 0, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2109, 2008, 12, 1, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2110, 2008, 13, 1, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2111, 2008, 14, 1, CAST(N'2021-09-25T19:10:47.830' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PERMISOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (2, N'000002', 2, N'Laptop HP', N'Intel Core i7 16GB RAM 500SSD', N'8456789 012342', N'34534T34T34T234', N'Nuevo', 1, 1, CAST(N'2021-06-21T12:23:26.330' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (6, N'000005', 5, N'All in One HP', N'Intel Core i7 16GB RAM 500SSD', N'8456789 012432', N'EWRGERG1234122', N'Nuevo', 3, 1, CAST(N'2021-06-21T16:40:27.907' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (7, N'000006', 6, N'Hamsters', N'Sistema de activación automática (auto-on) y tecno', N'8456789 012311', N'sdvsdvsdvW2324', N'Nuevo', 2003, 1, CAST(N'2021-06-22T12:46:08.753' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (8, N'000007', 7, N'Scanner HP', N'Documentos de Odoo', N'8456789 012908', N'34r34r232rer242qw', N'Nuevo', 2005, 1, CAST(N'2021-06-23T19:55:44.697' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1003, N'000008', 8, N'All in One HP', N'Intel Core i7 16GB RAM 500SSD', N'8456789 012457', N'4t34t3tert1232', N'Nuevo', 3, 1, CAST(N'2021-09-24T19:37:48.567' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1006, N'000009', 9, N'Scanner HP', N'Documentos de Odoo', N'8456789 012327', N'4t34t34534twwddc', N'Nuevo', 2005, 1, CAST(N'2021-09-24T20:00:35.300' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1007, N'000010', 10, N'Impresora RICOH', N'RICOH MPC4504', N'8456789 012112', N'34534T34T34T34T', N'Nueva', 2004, 1, CAST(N'2021-09-24T20:00:51.380' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1008, N'000011', 11, N'Impresora RICOH', N'RICOH MPC4504', N'8456789 012115	', N'8456789 012115', N'Nuevo', 2004, 1, CAST(N'2021-09-24T20:02:35.310' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1009, N'000012', 12, N'Laptop HP', N'Intel Core i5 16GB RAM 500SSD', N'8456789 012119', N'345y345y345y4', N'Mantenimiento', 1, 0, CAST(N'2021-09-24T20:02:47.440' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1010, N'000013', 13, N'All in One HP', N'Intel Core i7 16GB RAM 500SSD', N'8456789 012121', N'435trgtgrthr22112', N'Nuevo', 3, 1, CAST(N'2021-09-24T20:03:03.917' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1011, N'000014', 14, N'Biometrico', N'IriTech IriShield BK 2121U', N'8456789 012122', N'34t34t234r234r', N'Nuevo', 4, 1, CAST(N'2021-09-25T19:28:42.950' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1012, N'000015', 15, N'Biometrico', N'IriTech IriShield BK 2121U', N'8456789 012124', N'345t345t45t', N'Nuevo', 4, 1, CAST(N'2021-09-25T19:41:34.817' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1013, N'000016', 16, N'Laptop HP', N'IntelCore i7 16GB RAM 500 HDD', N'8456789 012127', N'234R234R3RR3', N'Sin Repuestos', 1, 0, CAST(N'2021-09-25T19:48:59.520' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1014, N'000017', 17, N'Laptop HP', N'Intel Core i7 16GB RAM 500SSD', N'8456789 012130', N'T34TWDFSDF', N'Nuevo', 1, 1, CAST(N'2021-09-25T19:55:53.893' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1015, N'000018', 18, N'Biometrico', N'IriTech IriShield BK 2121U', N'8456789 012129', N'1221312123fg', N'Nuevo', 4, 1, CAST(N'2021-09-28T20:45:23.537' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [CodigoValle], [Serie], [EstadoEquipo], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1016, N'000019', 19, N'Biometrico', N'IriTech IriShield BK 2121U', N'8456789 012131', N'2323223444ds', N'Nuevo', 4, 1, CAST(N'2021-10-07T16:35:47.937' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO_AGENCIA] ON 
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3033, 1010, 3003, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, CAST(N'2021-10-07T16:59:35.063' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3035, 1003, 1, CAST(34.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, CAST(N'2021-10-07T17:05:10.583' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3036, 1014, 3004, CAST(780.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, CAST(N'2021-10-09T16:07:43.053' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3045, 1015, 3004, CAST(290.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, CAST(N'2021-10-09T17:09:27.813' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3046, 1007, 1002, CAST(3434.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, 1, CAST(N'2021-10-09T17:35:37.787' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3047, 1016, 3009, CAST(560.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 1, CAST(N'2021-10-09T18:39:30.543' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_AGENCIA] ([IdProductoAgencia], [IdProducto], [IdAgencia], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3048, 1003, 3003, CAST(4.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50, 1, 1, CAST(N'2021-10-09T20:44:53.340' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO_AGENCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVEEDOR] ON 
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1, N'0920178964001', N'BIOMETRIKA', N' 099872 6848', N'biometrikaventas@hotmail.com', N'Shyris N34-328 y Portugal Edif. Smerald, Piso 14, ', 1, CAST(N'2021-06-21T12:23:26.387' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (2, N'0945623412001', N'COMPUEC', N'04532-715', N'info@compuec.com', N'Av. 6 de Diciembre N34-360 y Portugal, esquina SE,', 0, CAST(N'2021-06-21T12:23:26.387' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (3, N'098765432001', N'COMPUMASTER', N'099 112 720', N'compumasterdj@hotmail.com', N'Mercadillo 156-35 entre Sucre y Bolívar', 1, CAST(N'2021-06-21T17:08:13.503' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1002, N'1720792418001', N'TECNOSMART', N'04-6042287 ', N'tecnosmart@gerencia.com', N' Av. Luis Plaza Dañin 820 y Miguel H. Alcivar', 1, CAST(N'2021-09-14T22:14:53.303' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1003, N'0923487654001', N'COMPUTRON', N'04-501-7700', N'info@compurton.com', N'Centro Comercial River Mall, Local 26, Planta Baja', 1, CAST(N'2021-09-24T19:38:01.733' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1004, N'0912987653001', N'NOVICOMPU', N'0999116640', N'novicompu01ventsa@gmail.com', N'KENNEDY NORTE AV. FRANCISCO DE ORELLANA N.30 Y NAH', 1, CAST(N'2021-09-25T19:31:44.800' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1005, N'1720791213001', N'PICOMPUTERS', N'0997755244 ', N'ventas1@pinsoft.ec', N'Fray Jodoco Rique N14-102 e Itchimbía', 1, CAST(N'2021-09-28T20:18:14.333' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1006, N'1721234376001', N'EASYCOMPU', N'0984584914', N'ventas1@easycompu.ec', N'Sucre EO-19 y Rocafuerte, Cayambe', 0, CAST(N'2021-09-29T18:21:04.983' AS DateTime))
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1007, N'091234333001', N'SUPERPACO', N'041234 567', N'compumasterdj@hotmail.com', N'Av. Colón E4-81 Y 9 de Octubre. Edificio PA-CO', 1, CAST(N'2021-10-07T16:36:27.520' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PROVEEDOR] OFF
GO
SET IDENTITY_INSERT [dbo].[ROL] ON 
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'EMPLEADO', 1, CAST(N'2021-06-21T12:23:25.800' AS DateTime))
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (2007, N'ADMINISTRADOR', 1, CAST(N'2021-09-25T19:10:38.797' AS DateTime))
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (2008, N'PASANTE', 1, CAST(N'2021-09-25T19:10:47.820' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[SUBMENU] ON 
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (1, 1, N'Rol', N'Rol', N'Crear', N'fas fa-user-tag', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (2, 1, N'Asignar Permisos', N'Permisos', N'Crear', N'fas fa-user-lock', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (3, 1, N'Usuarios', N'Usuario', N'Crear', N'fas fa-users-cog', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (4, 1, N'Categorias', N'Categoria', N'Crear', N'fab fa-wpforms', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (5, 1, N'Equipos', N'Producto', N'Crear', N'fas fa-box-open', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (6, 2, N'Personal', N'Cliente', N'Crear', N'fas fa-user-shield', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (7, 3, N'Proveedores', N'Proveedor', N'Crear', N'fas fa-shipping-fast', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (8, 3, N'Asignar equipo a Agencia', N'Producto', N'Asignar', N'fas fa-dolly', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (9, 3, N'Registrar Compra', N'Compra', N'Crear', N'fas fa-cart-arrow-down', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (10, 3, N'Consultar Compra', N'Compra', N'Consultar', N'far fa-list-alt', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (11, 4, N'Agencias', N'Agencia', N'Crear', N'fas fa-store-alt', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (12, 4, N'Asignar Equipo', N'Venta', N'Crear', N'fas fa-cash-register', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (13, 4, N'Consultar Equipo', N'Venta', N'Consultar', N'far fa-clipboard', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [Controlador], [Vista], [Icono], [Activo], [FechaRegistro]) VALUES (14, 5, N'Productos por agencia', N'Reporte', N'Producto', N'fas fa-boxes', 1, CAST(N'2021-06-21T12:23:26.020' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SUBMENU] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdAgencia], [IdRol], [Activo], [FechaRegistro], [token_recovery]) VALUES (5033, N'Geovanni', N'Guanotuna', N'geo1987g@gmail.com', N'ac7e94bfc098fa4c7fa828c8a73563a75fd4c7d7ce4ea579e6', 1, 2008, 1, CAST(N'2021-09-27T18:15:17.073' AS DateTime), NULL)
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdAgencia], [IdRol], [Activo], [FechaRegistro], [token_recovery]) VALUES (5040, N'Cesar', N'Obando', N'obandocesar1998@gmail.com', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e', 1, 2007, 1, CAST(N'2021-10-05T14:53:42.550' AS DateTime), NULL)
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdAgencia], [IdRol], [Activo], [FechaRegistro], [token_recovery]) VALUES (5041, N'Alfredo', N'Ona', N'aonafree@gmail.com', N'48a08d9a98b2d0cf1d1f769161f4d08cfafe3d34ba23660769', 1, 2, 1, CAST(N'2021-10-05T15:56:03.040' AS DateTime), NULL)
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [IdAgencia], [IdRol], [Activo], [FechaRegistro], [token_recovery]) VALUES (5043, N'Christian ', N'Mainato', N'fermainato1720@gmail.com', N'ab6d256901314f08b9ab7bf37698279a0b0335ae8a9faef5c9ae20860a88422c', 1, 2007, 1, CAST(N'2021-10-08T21:26:27.510' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[VENTA] ON 
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3065, N'000001', 1, 1, 5043, 1025, N'Boleta', 1, 1, 1, CAST(N'2021-10-09T20:34:05.133' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3066, N'000002', 2, 1002, 5043, 1027, N'Boleta', 1, 1, 1, CAST(N'2021-10-09T20:35:26.000' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3067, N'000003', 3, 1002, 5043, 1037, N'Factura', 1, 1, 1, CAST(N'2021-10-09T20:44:33.690' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3068, N'000004', 4, 3003, 5043, 1025, N'Boleta', 1, 1, 1, CAST(N'2021-10-09T20:49:09.463' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3069, N'000005', 5, 3003, 5043, 1029, N'Boleta', 1, 1, 1, CAST(N'2021-10-09T20:49:43.980' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3070, N'000006', 6, 3003, 5043, 1029, N'Boleta', 1, 1, 1, CAST(N'2021-10-09T20:50:14.407' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3071, N'000007', 7, 3003, 5043, 1038, N'Boleta', 1, 1, 1, CAST(N'2021-10-09T20:51:30.073' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdAgencia], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [Activo], [FechaRegistro]) VALUES (3072, N'000008', 8, 3003, 5043, 1038, N'Nota de entrega', 1, 1, 1, CAST(N'2021-10-11T10:36:37.417' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[VENTA] OFF
GO
ALTER TABLE [dbo].[AGENCIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[AGENCIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ((0)) FOR [TotalCosto]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ('Boleta') FOR [TipoComprobante]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA] ADD  DEFAULT ((0)) FOR [PrecioUnidadCompra]
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA] ADD  DEFAULT ((0)) FOR [PrecioUnidadVenta]
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA] ADD  DEFAULT ((0)) FOR [Iniciado]
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdAgencia])
REFERENCES [dbo].[AGENCIA] ([IdAgencia])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[PROVEEDOR] ([IdProveedor])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdSubMenu])
REFERENCES [dbo].[SUBMENU] ([IdSubMenu])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA]  WITH CHECK ADD FOREIGN KEY([IdAgencia])
REFERENCES [dbo].[AGENCIA] ([IdAgencia])
GO
ALTER TABLE [dbo].[PRODUCTO_AGENCIA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[SUBMENU]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MENU] ([IdMenu])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdAgencia])
REFERENCES [dbo].[AGENCIA] ([IdAgencia])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdAgencia])
REFERENCES [dbo].[AGENCIA] ([IdAgencia])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPermisos]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ACTUALIZAR PERMISOS
create procedure [dbo].[usp_ActualizarPermisos](
@Detalle xml,
@Resultado bit output
)
as
begin
begin try

	BEGIN TRANSACTION
	declare @permisos table(idpermisos int,activo bit)

	insert into @permisos(idpermisos,activo)
	select 
	idpermisos = Node.Data.value('(IdPermisos)[1]','int'),
	activo = Node.Data.value('(Activo)[1]','bit')
	FROM @Detalle.nodes('/DETALLE/PERMISO') Node(Data)

	select * from @permisos

	update p set p.Activo = pe.activo from PERMISOS p
	inner join @permisos pe on pe.idpermisos = p.IdPermisos

	COMMIT
	set @Resultado = 1

end try
begin catch
	ROLLBACK
	set @Resultado = 0
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ControlarStock]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA STOCK PRODUCTO_AGENCIA

CREATE PROCEDURE [dbo].[usp_ControlarStock](
@IdProducto int,
@IdAgencia int,
@Cantidad int,
@Restar bit,
@Resultado bit output)
as
begin
	set @Resultado = 1
	begin try
		if(@Restar = 1)
			update PRODUCTO_AGENCIA set Stock = Stock - @Cantidad where IdProducto = @IdProducto and IdAgencia = @IdAgencia and Iniciado = 1
		else
			update PRODUCTO_AGENCIA set Stock = Stock + @Cantidad where IdProducto = @IdProducto and IdAgencia = @IdAgencia and Iniciado = 1
	end try
	begin catch
		set @Resultado = 0
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA ELIMINAR AGENCIA
create procedure [dbo].[usp_EliminarAgencia](
@IdAgencia int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que la Agencia no se encuentre asignada a un usuario y una venta
	IF not EXISTS (select * from USUARIO u
	inner join AGENCIA t on t.IdAgencia = u.IdAgencia
	where t.IdAgencia = @IdAgencia)

		delete from AGENCIA where IdAgencia = @IdAgencia

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCategoria]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR CATEGORIA
create procedure [dbo].[usp_EliminarCategoria](
@IdCategoria int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from CATEGORIA c
	inner join PRODUCTO p on c.IdCategoria  = p.IdCategoria
	where c.IdCategoria = @IdCategoria)

		delete from CATEGORIA where IdCategoria = @IdCategoria

	ELSE
		SET @Resultado = 0

end



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCliente]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR CLIENTE
create procedure [dbo].[usp_EliminarCliente](
@IdCliente int,
@Resultado bit output
)
as
begin
	set @Resultado = 1
	begin try
		delete from CLIENTE where IdCliente = @IdCliente

	end try
	begin catch
		set @Resultado = 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProducto]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO
create procedure [dbo].[usp_EliminarProducto](
@IdProducto int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun producto se encuentre relacionado a una AGENCIA
	IF not EXISTS (select top 1 * from PRODUCTO_AGENCIA PT
INNER JOIN PRODUCTO P ON P.IdProducto = PT.IdProducto
WHERE P.IdProducto = @IdProducto)
		delete from PRODUCTO where IdProducto = @IdProducto

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProductoAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO_AGENCIA
create procedure [dbo].[usp_EliminarProductoAgencia](
@IdProductoAgencia int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	IF NOT EXISTS (SELECT * FROM PRODUCTO_AGENCIA WHERE IdProductoAgencia = @IdProductoAgencia and Iniciado = 1 )

		delete from PRODUCTO_AGENCIA where IdProductoAgencia = @IdProductoAgencia

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProveedor]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PROVEEDOR
create procedure [dbo].[usp_EliminarProveedor](
@IdProveedor int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	--validamos que ningun proveedor se encuentre asignado a una compra
	IF not EXISTS (select top 1 * from COMPRA c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
where p.IdProveedor = @IdProveedor)

		delete from PROVEEDOR where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarRol]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR ROL
create procedure [dbo].[usp_EliminarRol](
@IdRol int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que el rol no se encuentre asignado a algun usuario
	IF not EXISTS (select * from USUARIO u
	inner join ROL r on r.IdRol  = u.IdRol
	where r.IdRol = @IdRol)
	begin	
		delete from PERMISOS where IdRol = @IdRol
		delete from ROL where IdRol = @IdRol
	end
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarUsuario]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR USUARIO
create procedure [dbo].[usp_EliminarUsuario](
@IdUsuario int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun usuario se encuentre relacionado a una Agencia
	IF (not EXISTS (select c.* from COMPRA c 
		inner join USUARIO u on u.IdUsuario = c.IdUsuario 
		where u.IdUsuario = @IdUsuario
		) and 
		not EXISTS (select v.* from VENTA v 
		inner join USUARIO u on u.IdUsuario = v.IdUsuario 
		where u.IdUsuario = @IdUsuario
		)
	)
		delete from USUARIO where IdUsuario = @IdUsuario
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_LoginUsuario]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIO

CREATE procedure [dbo].[usp_LoginUsuario](
@Correo varchar(60),
@Clave varchar(100),
@IdUsuario int output
)
as
begin
	set @IdUsuario = 0
	if exists(select * from USUARIO where Correo COLLATE Latin1_General_CS_AS = @Correo and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
		set @IdUsuario = (select top 1 IdUsuario from USUARIO where Correo  COLLATE Latin1_General_CS_AS = @Correo and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificaPass]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificaPass](
 @IdUsuario int,

@Clave varchar(50),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE IdUsuario != @IdUsuario)
		
		update USUARIO set 
		
	    Clave = @Clave
		where IdUsuario = @IdUsuario

	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR AGENCIA
create procedure [dbo].[usp_ModificarAgencia](
@IdAgencia int,
@Nombre varchar(60),
 
@Direccion varchar(60),
@Telefono varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM AGENCIA WHERE Nombre =@Nombre and IdAgencia != @IdAgencia)
		
		update AGENCIA set 
		Nombre = @Nombre,
		 
		Direccion = @Direccion,
		Telefono = @Telefono,
		Activo = @Activo
		where IdAgencia = @IdAgencia

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCategoria]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[usp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCliente]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR CLIENTE
CREATE PROC [dbo].[usp_ModificarCliente](
@IdCliente int,
@TipoDocumento varchar(100),
@NumeroDocumento varchar(100),
@Nombre varchar(100),
@Direccion varchar(100),
@Telefono varchar(100),
@Activo bit,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE Telefono = @Telefono and IdCliente != @IdCliente)
	begin
		update CLIENTE set 
		TipoDocumento = @TipoDocumento,
		NumeroDocumento = @NumeroDocumento,
		Nombre = @Nombre,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Activo = @Activo
		where IdCliente = @IdCliente
	end
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProducto]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ModificarProducto](
@IdProducto int,
@Nombre varchar(50),
@Descripcion varchar(50),
@CodigoValle varchar(50),
@Serie varchar(50),
@EstadoEquipo varchar(50),
@IdCategoria int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(CodigoValle)) = rtrim(ltrim(@CodigoValle)) and IdProducto != @IdProducto)
		
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		CodigoValle = @CodigoValle,
		Serie = @Serie,
		EstadoEquipo = @EstadoEquipo,
		IdCategoria = @IdCategoria,
		Activo = @Activo
		where IdProducto = @IdProducto
	ELSE
		SET @Resultado = 0

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProductoAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO_AGENCIA
create procedure [dbo].[usp_ModificarProductoAgencia](
@IdProductoAgencia int,
@IdProducto varchar(60),
@IdAgencia varchar(60),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_AGENCIA WHERE @IdProductoAgencia = @IdProductoAgencia and Iniciado = 1 )
		
		update PRODUCTO_AGENCIA set 
		IdProducto = @IdProducto,
		IdAgencia = @IdAgencia
		where IdProductoAgencia = @IdProductoAgencia
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProveedor]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA MODIFICAR PROVEEDOR
create procedure [dbo].[usp_ModificarProveedor](
@IdProveedor int,
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc and IdProveedor != @IdProveedor)
		
		update PROVEEDOR set 
		RUC = @Ruc,
		RazonSocial = @RazonSocial,
		Telefono = @Telefono,
		Correo = @Correo,
		Direccion = @Direccion,
		Activo = @Activo
		where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarRol]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR ROLES
create procedure [dbo].[usp_ModificarRol](
@IdRol int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion =@Descripcion and IdRol != @IdRol)
		
		update ROL set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdRol = @IdRol
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarUsuario]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR USUARIO
CREATE procedure [dbo].[usp_ModificarUsuario](
@IdUsuario int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Clave varchar(50),
@IdAgencia int,
@IdRol int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
		
		update USUARIO set 
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		
		IdAgencia = @IdAgencia,
		IdRol = @IdRol,
		Activo = @Activo
		where IdUsuario = @IdUsuario

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER AGENCIAS
CREATE PROC [dbo].[usp_ObtenerAgencia]
as
begin
 select IdAgencia,Nombre,Direccion,Telefono,Activo from AGENCIA
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCategorias]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER CATEGORIA
CREATE PROC [dbo].[usp_ObtenerCategorias]
as
begin
 select IdCategoria,Descripcion,Activo from CATEGORIA
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCliente]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerCliente]
as
begin
  select IdCliente,TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono,Activo from CLIENTE
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleCompra]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_ObtenerDetalleCompra](
@IdCompra int
)
as
begin


select  RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[Codigo],
CONVERT(char(10),c.FechaRegistro,103)[FechaCompra],
 CONVERT(decimal(10,2), c.TotalCosto)[TotalCosto],

(select p.RUC,p.RazonSocial from PROVEEDOR P
 where p.IdProveedor = c.IdProveedor
FOR XML PATH (''),TYPE) AS 'DETALLE_PROVEEDOR',

(select  T.Nombre, T.Direccion from AGENCIA T
 where T.IdAgencia = c.IdAgencia
FOR XML PATH (''),TYPE) AS 'DETALLE_AGENCIA',

(select convert(int, dc.Cantidad)[Cantidad],concat(p.Nombre,' - ',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dc.PrecioUnitarioCompra)PrecioUnitarioCompra,
 CONVERT(decimal(10,2),dc.TotalCosto)[TotalCosto],
 dc.NumeroFactura
from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from COMPRA c
where c.IdCompra =@IdCompra
FOR XML PATH(''), ROOT('DETALLE_COMPRA') 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleUsuario]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE USUARIO
create proc [dbo].[usp_ObtenerDetalleUsuario](
@IdUsuario int
)
as
begin

 select 
*,
(select * from AGENCIA t
 where t.IdAgencia = up.IdAgencia
FOR XML PATH (''),TYPE) AS 'DetalleAgencia'
,
(select * from ROL r
 where r.IdRol = up.IdRol
FOR XML PATH (''),TYPE) AS 'DetalleRol'
,
 (
 select t.NombreMenu,t.Icono,
 (select sm.Nombre[NombreSubMenu],sm.Controlador,sm.Vista,sm.Icono,p.Activo
	 from PERMISOS p
	 inner join ROL r on r.IdRol = p.IdRol
	 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
	 inner join MENU m on m.IdMenu = sm.IdMenu
	 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
	where sm.IdMenu = t.IdMenu
  FOR XML PATH ('SubMenu'),TYPE) AS 'DetalleSubMenu' 

 from (
 select distinct m.Nombre[NombreMenu],m.IdMenu,m.Icono
 from PERMISOS p
 inner join ROL r on r.IdRol = p.IdRol
 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
 inner join MENU m on m.IdMenu = sm.IdMenu
 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
 where p.Activo = 1) t
 FOR XML PATH ('Menu'),TYPE) AS 'DetalleMenu'  
 from USUARIO up
 where UP.IdUsuario = @IdUsuario
 FOR XML PATH(''), ROOT('Usuario')  

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleVenta]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE VENTA
CREATE proc [dbo].[usp_ObtenerDetalleVenta](
@IdVenta int
)
as
begin


select V.TipoDocumento, V.Codigo,
 
 
 
convert(char(10),v.fechaRegistro,103)[FechaRegistro],
(select u.Nombres,u.Apellidos from USUARIO U
 where U.IdUsuario = v.IdUsuario
FOR XML PATH (''),TYPE) AS 'DETALLE_USUARIO',

(select  T.Nombre, T.Direccion from AGENCIA T
 where T.IdAgencia = V.IdAgencia
FOR XML PATH (''),TYPE) AS 'DETALLE_AGENCIA',

(select C.Nombre,C.Direccion,C.NumeroDocumento,C.Telefono from CLIENTE c
 where c.IdCliente = V.IdCliente
FOR XML PATH (''),TYPE) AS 'DETALLE_CLIENTE',

(select dv.Cantidad,concat(p.Nombre,'-',p.Descripcion)[NombreProducto],
p.Serie,p.CodigoValle,p.EstadoEquipo,
CONVERT(decimal(10,2),dv.PrecioUnidad)[PrecioUnidad],
CONVERT(decimal(10,2),dv.ImporteTotal)[ImporteTotal],
dv.Observacion
from DETALLE_VENTA dv
inner join PRODUCTO p on p.IdProducto = dv.IdProducto
where dv.IdVenta = v.IdVenta
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from VENTA v
where v.IdVenta = @IdVenta
FOR XML PATH(''), ROOT('DETALLE_VENTA') 

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaCompra]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ObtenerListaCompra](
@FechaInicio date,
@FechaFin date,
@IdProveedor int = 0 ,
@IdAgencia int = 0
)
as
begin
SET DATEFORMAT dmy;
select c.IdCompra,RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[NumeroCompra], p.RazonSocial,t.Nombre,
convert(char(10),c.FechaRegistro,103)[FechaCompra],c.TotalCosto,c.NumeroFactura  from COMPRA c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
inner join AGENCIA t on t.IdAgencia = c.IdAgencia
where 
CONVERT(date,c.FechaRegistro) between @FechaInicio and @FechaFin and
p.IdProveedor = iif(@IdProveedor = 0,p.IdProveedor,@IdProveedor) and
t.IdAgencia =iif(@IdAgencia = 0,t.IdAgencia,@IdAgencia) 

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaVenta]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER LISTA VENTA

CREATE procedure [dbo].[usp_ObtenerListaVenta](
@Codigo varchar(50) = '',
@FechaInicio date,
@FechaFin date,
@NumeroDocumento varchar(100) = '',
@Nombre varchar(100) = ''
)
as
begin
SET DATEFORMAT dmy;
select v.IdVenta, v.TipoDocumento,v.Codigo,v.FechaRegistro,c.NumeroDocumento,c.Nombre from VENTA v 
inner join CLIENTE c on c.IdCliente = v.IdCliente
where 
v.Codigo = iif(@Codigo='',v.Codigo,@Codigo) and
CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin and
c.NumeroDocumento like CONCAT('%',@NumeroDocumento,'%') and
c.Nombre like CONCAT('%',@Nombre,'%')

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPermisos]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER PERMISOS
create procedure [dbo].[usp_ObtenerPermisos](
@IdRol int)
as
begin
select p.IdPermisos,m.Nombre[Menu],sm.Nombre[SubMenu],p.Activo from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
inner join MENU m on m.IdMenu = sm.IdMenu
where p.IdRol = @IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductoAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ObtenerProductoAgencia]
as
begin
 select pt.IdProductoAgencia,p.IdProducto,p.Codigo[CodigoProducto], p.Nombre[NombreProducto],p.Descripcion[DescripcionProducto],p.CodigoValle[CodigoValleProducto],p.Serie[SerieProducto],p.EstadoEquipo[EstadoEquipoProducto],
 t.IdAgencia,t.Nombre[NombreAgencia] ,t.Direccion[DireccionAgencia],pt.PrecioUnidadCompra,pt.PrecioUnidadVenta,pt.Stock,pt.Iniciado
 from PRODUCTO_AGENCIA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join AGENCIA t on t.IdAgencia = pt.IdAgencia
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductos]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEMIENTO PARA OBTENER PRODUCTO
CREATE PROC [dbo].[usp_ObtenerProductos]
as
begin
 select IdProducto,Codigo,ValorCodigo,Nombre,p.Descripcion[DescripcionProducto],CodigoValle,Serie,EstadoEquipo,p.IdCategoria,p.Activo,c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end
GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProveedores]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER PROVEEDORES
CREATE PROC [dbo].[usp_ObtenerProveedores]
as
begin
 select IdProveedor,RUC,RazonSocial,Telefono,Correo,Direccion,Activo from PROVEEDOR
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerRoles]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER ROLES
CREATE PROC [dbo].[usp_ObtenerRoles]
as
begin
 select IdRol, Descripcion,Activo from ROL
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerUsuario]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerUsuario]
as
begin
 select u.IdUsuario,u.Nombres,u.Apellidos,u.Correo,u.Clave,u.IdAgencia,u.IdRol,u.Activo,u.FechaRegistro,r.Descripcion[DescripcionRol],u.Activo from USUARIO u
 inner join ROL r on r.IdRol = u.IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA GUARDAR AGENCIA
CREATE PROC [dbo].[usp_RegistrarAgencia](
@Nombre varchar(50),
 
@Direccion varchar(50),
@Telefono varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM AGENCIA WHERE Direccion = @Direccion)

		insert into AGENCIA(Nombre,Direccion,Telefono) values (
		@Nombre ,@Direccion,@Telefono
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCategoria]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[usp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCliente]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CLIENTE
CREATE PROC [dbo].[usp_RegistrarCliente](
@TipoDocumento varchar(100),
@NumeroDocumento varchar(100),
@Nombre varchar(100),
@Direccion varchar(100),
@Telefono varchar(100),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CLIENTE WHERE Telefono = @Telefono)
	begin
		insert into cliente(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono) values
		(@TipoDocumento,@NumeroDocumento,@Nombre,@Direccion,@Telefono)
	end
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCompra]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_RegistrarCompra](
@Detalle xml,
@Resultado bit output
)
as
begin


begin try

	BEGIN TRANSACTION

	declare @compra table(idusuario int,idproveedor int,IdAgencia int,totalcosto decimal(18,2) ,numerofactura varchar(50))
	declare @detallecompra table(idcompra int,idproducto int,cantidad int,preciounidadcompra decimal(18,2) ,totalcosto decimal(18,2),numerofactura varchar(50))
	declare @agenciaproducto table(IdAgencia int,idproducto int,cantidad int,preciounidadcompra decimal(18,2),totalcosto decimal(18,2) )

	 insert into @compra(idusuario,idproveedor,IdAgencia,totalcosto,numerofactura )
	 select 
	 IdUsuario = Node.Data.value('(IdUsuario)[1]','int'),
	 IdProveedor = Node.Data.value('(IdProveedor)[1]','int'),
	 IdAgencia = Node.Data.value('(IdAgencia)[1]','int'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','decimal(18,2)'),
	 NumeroFactura = Node.Data.value('(NumeroFactura)[1]','varchar(50)')
	 FROM @Detalle.nodes('/DETALLE/COMPRA') Node(Data)
 
	 insert into @detallecompra(idcompra,idproducto,cantidad,preciounidadcompra,totalcosto,numerofactura )
	 select 
	 IdCompra = Node.Data.value('(IdCompra)[1]','int'),
	 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
	 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
	 PrecioUnidadCompra = Node.Data.value('(PrecioUnidadCompra)[1]','decimal(18,2)'),
	
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','decimal(18,2)'),
	 NumeroFactura = Node.Data.value('(NumeroFactura)[1]','varchar(50)')
	 FROM @Detalle.nodes('/DETALLE/DETALLE_COMPRA/DETALLE') Node(Data)

	 insert into @agenciaproducto(IdAgencia,idproducto,cantidad,preciounidadcompra )
	 select
	 (select top 1 IdAgencia from @compra),
	 idproducto,cantidad,preciounidadcompra 
	 from @detallecompra


	 --******************* AREA DE TRABAJO *************************
	 declare @IdCompra int = 0

	 insert into COMPRA(IdUsuario,IdProveedor,IdAgencia ,TotalCosto,NumeroFactura)
	 select idusuario,idproveedor,IdAgencia,totalcosto,numerofactura  from @compra

	 set @IdCompra = Scope_identity()
	 update @detallecompra set idcompra = @IdCompra

	 insert into DETALLE_COMPRA(IdCompra,IdProducto,Cantidad,PrecioUnitarioCompra ,TotalCosto, NumeroFactura)
	 select idcompra,idproducto,cantidad,preciounidadcompra,totalcosto,numerofactura  from @detallecompra

	 update pt set 
	 pt.PrecioUnidadCompra = tp.preciounidadcompra, 
	
	 pt.Stock = pt.Stock + tp.cantidad,
	 pt.Iniciado = 1
	 from PRODUCTO_AGENCIA pt
	 inner join @agenciaproducto tp on tp.IdAgencia = pt.IdAgencia and tp.idproducto = pt.IdProducto

	 COMMIT
	 set @Resultado = 1

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProducto]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_RegistrarProducto](
@Nombre varchar(50),
@Descripcion varchar(50),
@CodigoValle varchar(50),
@Serie varchar(50),
@EstadoEquipo varchar(50),
@IdCategoria int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(CodigoValle)) = rtrim(ltrim(@CodigoValle)))

		insert into PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,CodigoValle,Serie,EstadoEquipo,IdCategoria) values (
		RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),@Nombre,@Descripcion,@CodigoValle,@Serie,@EstadoEquipo,@IdCategoria
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProductoAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PRODUCTO_AGENCIA
CREATE PROC [dbo].[usp_RegistrarProductoAgencia](
@IdProducto int,
@IdAgencia int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_AGENCIA WHERE IdProducto = @IdProducto and IdAgencia = @IdAgencia)

		insert into PRODUCTO_AGENCIA(IdProducto,IdAgencia) values (
		@IdProducto,@IdAgencia
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProveedor]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PROVEEDOR
CREATE PROC [dbo].[usp_RegistrarProveedor](
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc)

		insert into PROVEEDOR(RUC,RazonSocial,Telefono,Correo,Direccion)
		values(@Ruc,@RazonSocial,@Telefono,@Correo,@Direccion)

	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarRol]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR ROL
CREATE PROC [dbo].[usp_RegistrarRol](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion = @Descripcion)
	begin
		declare @idrol int = 0
		insert into ROL(Descripcion) values (
		@Descripcion
		)
		set @idrol  = Scope_identity()

		insert into PERMISOS(IdRol,IdSubMenu,Activo)
		select @idrol, IdSubMenu,0 from SUBMENU
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarUsuario]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA REGISTRAR USUARIO
CREATE PROC [dbo].[usp_RegistrarUsuario](
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Clave varchar(100),
@IdAgencia int,
@IdRol int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)

		insert into USUARIO(Nombres,Apellidos,Correo,Clave,IdAgencia,IdRol) values (
		@Nombres,@Apellidos,@Correo,@Clave,@IdAgencia,@IdRol
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVenta]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************* VENTA **************************/

--PROCEDIMIENTO PARA REGITRAR VENTA
CREATE procedure [dbo].[usp_RegistrarVenta](
@Detalle xml,
@Resultado int output
)
as
begin


begin try

	BEGIN TRANSACTION
	
	declare @cliente table (tipodocumento varchar(50),numerodocumento varchar(100),nombre varchar(100),direccion varchar(100),telefono varchar(50))
	declare @venta table (idagencia int,idusuario int,idcliente int default 0,tipodocumento varchar(50),cantidadproducto int,cantidadtotal int)
	declare @detalleventa table (idventa int,idproducto int,cantidad int,preciounidad decimal(18,2),importetotal decimal(18,2),observacion varchar(255))

	insert into @cliente(tipodocumento,numerodocumento,nombre,direccion,telefono)
		 select 
		 tipodocumento = Node.Data.value('(TipoDocumento)[1]','varchar(50)'),
		 numerodocumento = Node.Data.value('(NumeroDocumento)[1]','varchar(100)'),
		 nombre = Node.Data.value('(Nombre)[1]','varchar(100)'),
		 direccion = Node.Data.value('(Direccion)[1]','varchar(100)'),
		 telefono = Node.Data.value('(Telefono)[1]','varchar(50)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_CLIENTE/DATOS') Node(Data)

	insert into @venta(idagencia,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal )
	select 
		 IdAgencia = Node.Data.value('(IdAgencia)[1]','varchar(50)'),
		 IdUsuario = Node.Data.value('(IdUsuario)[1]','varchar(50)'),
		 IdCliente = Node.Data.value('(IdCliente)[1]','varchar(100)'),
		 TipoDocumento = Node.Data.value('(TipoDocumento)[1]','varchar(100)'),
		 CantidadProducto = Node.Data.value('(CantidadProducto)[1]','varchar(50)'),
		 CantidadTotal = Node.Data.value('(CantidadTotal)[1]','varchar(50)')
		
		 
		 
		 
		 FROM @Detalle.nodes('/DETALLE/VENTA') Node(Data)

	insert into @detalleventa(idventa,idproducto,cantidad,preciounidad,importetotal,observacion)
		 select 
		 IdVenta = Node.Data.value('(IdVenta)[1]','int'),
		 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
		 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
		 PrecioUnidad = Node.Data.value('(PrecioUnidad)[1]','decimal(18,2)'),
		 ImporteTotal = Node.Data.value('(ImporteTotal)[1]','decimal(18,2)'),
		  Observacion  = Node.Data.value('(Observacion)[1]','varchar(255)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_VENTA/DATOS') Node(Data)

	--******************* AREA DE TRABAJO *************************
	declare @identity as table(ID int)

	if not exists(select * from CLIENTE where numeroDocumento = (select numerodocumento from @cliente))
	insert into CLIENTE(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono)
	output inserted.IdCliente into @identity
	select tipodocumento,numerodocumento,nombre,direccion,telefono from @cliente
	else 
	 insert into @identity(ID)
	 select IdCliente from CLIENTE where numeroDocumento = (select numerodocumento from @cliente)

	update @venta set idcliente = (select ID from @identity)
	delete from @identity

	insert into VENTA(Codigo,ValorCodigo,IdAgencia,IdUsuario,IdCliente,TipoDocumento,CantidadProducto,CantidadTotal )
	output inserted.IdVenta into @identity
	select 
	RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from VENTA) ),6),
	(select isnull(max(ValorCodigo),0) + 1 from VENTA),
	idagencia,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal 
	from @venta

	update @detalleventa set idventa = (select ID from @identity)

	insert into DETALLE_VENTA(IdVenta,IdProducto,Cantidad,PrecioUnidad,ImporteTotal,Observacion)
	select idventa,idproducto,cantidad,preciounidad,importetotal,observacion from @detalleventa


	 COMMIT
	 set @Resultado = (select ID from @identity)

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptProductoAgencia]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[usp_rptProductoAgencia](
 @IdAgencia int = 0,
 @Codigo varchar(50)
 )
 as
 begin
 select 
  t.Nombre[Nombre Agencia],t.Direccion[Direccion Agencia],
 p.Codigo[Codigo Producto],p.Nombre[Nombre Producto],p.Descripcion[Descripcion Producto],
 pt.Stock[Stock en Agencia],convert(decimal(10,2),pt.PrecioUnidadCompra)[Precio Compra],convert(decimal(10,2),pt.PrecioUnidadVenta)[Precio Venta]
 from PRODUCTO_AGENCIA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join AGENCIA t on t.IdAgencia = pt.IdAgencia
 where pt.IdAgencia = iif(@IdAgencia = 0,pt.IdAgencia,@IdAgencia) and
 p.Codigo like '%' + @Codigo + '%'
 end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptVenta]    Script Date: 11-Oct-21 12:48:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_rptVenta] (
@FechaInicio date,
@FechaFin date,
@IdAgencia int = 0
)
as
begin

 select convert(char(10), v.FechaRegistro ,103)[Fecha Venta],v.Codigo[Numero Documento],v.TipoDocumento[Tipo Documento],
 t.Nombre[Nombre Agencia] ,
 concat(u.Nombres,' ', u.apellidos)[Nombre Empleado],
 v.CantidadTotal[Cantidad Unidades Vendidas],v.CantidadProducto[Cantidad Productos] 
 from VENTA v
 inner join AGENCIA t on t.IdAgencia = v.IdAgencia
 inner join USUARIO u on u.IdUsuario = v.IdUsuario
 where 
 CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin 
 and v.IdAgencia = iif(@IdAgencia =0 ,v.IdAgencia,@IdAgencia)
end

GO
USE [master]
GO
ALTER DATABASE [DBINVENTARIO1_WEB] SET  READ_WRITE 
GO
