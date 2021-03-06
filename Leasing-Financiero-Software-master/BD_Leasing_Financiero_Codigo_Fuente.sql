USE [master]
GO
CREATE DATABASE [Finanzas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Finanzas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Finanzas.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Finanzas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Finanzas_log.ldf' , SIZE = 2112KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Finanzas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Finanzas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Finanzas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Finanzas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Finanzas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Finanzas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Finanzas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Finanzas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Finanzas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Finanzas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Finanzas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Finanzas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Finanzas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Finanzas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Finanzas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Finanzas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Finanzas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Finanzas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Finanzas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Finanzas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Finanzas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Finanzas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Finanzas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Finanzas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Finanzas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Finanzas] SET  MULTI_USER 
GO
ALTER DATABASE [Finanzas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Finanzas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Finanzas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Finanzas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Finanzas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Finanzas] SET QUERY_STORE = OFF
GO
USE [Finanzas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [money] NOT NULL,
	[idusuario] [int] NOT NULL,
 CONSTRAINT [PK_Bien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuota](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_deuda] [int] NOT NULL,
	[saldo_inicial] [money] NOT NULL,
	[interes] [money] NOT NULL,
	[monto_cuota] [money] NOT NULL,
	[amortizacion] [money] NOT NULL,
	[seguro_riesgo] [money] NOT NULL,
	[recompra] [money] NOT NULL,
	[Comision] [money] NOT NULL,
	[saldo_final] [money] NOT NULL,
	[depreciacion] [money] NOT NULL,
	[ahorro-tributario] [money] NOT NULL,
	[IGV] [money] NOT NULL,
	[f_bruto] [money] NOT NULL,
	[f_igv] [money] NOT NULL,
	[f_neto] [money] NOT NULL,
	[PeriodoGracia] [bit] NOT NULL,
	[Pagado] [bit] NOT NULL,
	[Fecha_De_Pago] [datetime] NOT NULL,
 CONSTRAINT [PK_cuota] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deuda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_bien] [int] NOT NULL,
	[id_periodo_gracia] [int] NOT NULL,
	[PG_Tiempo] [int] NOT NULL,
	[nro_años] [int] NOT NULL,
	[frecuencia] [int] NOT NULL,
	[dias_x_año] [int] NOT NULL,
	[TEA] [float] NOT NULL,
	[IGV] [float] NOT NULL,
	[i_renta] [float] NOT NULL,
	[recompra] [float] NOT NULL,
	[costo_notarial] [money] NOT NULL,
	[costo_registral] [money] NOT NULL,
	[tasacion] [money] NOT NULL,
	[comision_de_estudio] [money] NOT NULL,
	[comision_de_activacion] [money] NOT NULL,
	[comision_periodica] [money] NOT NULL,
	[seguro_riesgo] [float] NOT NULL,
	[tasa_ks] [float] NOT NULL,
	[tasa-wacc] [float] NOT NULL,
 CONSTRAINT [PK_Deuda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo_gracia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Tiempo] [int] NOT NULL,
 CONSTRAINT [PK_Periodo_gracia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Bien_id] [int] NOT NULL,
	[IGV] [money] NOT NULL,
	[ValorVenta] [money] NOT NULL,
	[MontoLeasing] [money] NOT NULL,
	[Porcentaje_TEP] [float] NOT NULL,
	[Numero_Cuotas] [int] NOT NULL,
	[Total_Cuotas] [int] NOT NULL,
	[Seguro_Riesgo] [money] NOT NULL,
	[Intereses] [money] NOT NULL,
	[Amortizacion_Capital] [money] NOT NULL,
	[Seguro_contra_riesgo] [money] NOT NULL,
	[Comision_periodica] [money] NOT NULL,
	[Recompra] [money] NOT NULL,
	[Desembolso_Total] [money] NOT NULL,
	[TCEA_FlujoB] [float] NOT NULL,
	[TCEA_FlujoN] [float] NOT NULL,
	[VAN_FlujoB] [money] NOT NULL,
	[VAN_FlujoN] [money] NOT NULL,
 CONSTRAINT [PK_Resultado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[RUC] [bigint] NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Periodo_gracia] ON 

INSERT [dbo].[Periodo_gracia] ([id], [Descripcion], [Tiempo]) VALUES (2, N'Total', 3)
INSERT [dbo].[Periodo_gracia] ([id], [Descripcion], [Tiempo]) VALUES (3, N'Parcial', 3)
INSERT [dbo].[Periodo_gracia] ([id], [Descripcion], [Tiempo]) VALUES (4, N'Nada', 3)
SET IDENTITY_INSERT [dbo].[Periodo_gracia] OFF
SET IDENTITY_INSERT [dbo].[Tipo_usuario] ON 

INSERT [dbo].[Tipo_usuario] ([id], [descripcion]) VALUES (1, N'Cliente')
INSERT [dbo].[Tipo_usuario] ([id], [descripcion]) VALUES (2, N'Administrador')
SET IDENTITY_INSERT [dbo].[Tipo_usuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [RUC], [correo], [contraseña], [idTipoUsuario]) VALUES (1, N'Prestamo Facil', 20211614546, N'PrestamoFacil@gmail.com', N'1234', 2)
INSERT [dbo].[Usuario] ([id], [nombre], [RUC], [correo], [contraseña], [idTipoUsuario]) VALUES (2, N'Codigo Fuente', 20211614547, N'CodigoFuente@hotmail.com', N'1234', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Bien]  WITH CHECK ADD  CONSTRAINT [FK_Bien_Usuario] FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Bien] CHECK CONSTRAINT [FK_Bien_Usuario]
GO
ALTER TABLE [dbo].[cuota]  WITH CHECK ADD  CONSTRAINT [FK_cuota_Deuda] FOREIGN KEY([id_deuda])
REFERENCES [dbo].[Deuda] ([id])
GO
ALTER TABLE [dbo].[cuota] CHECK CONSTRAINT [FK_cuota_Deuda]
GO
ALTER TABLE [dbo].[Deuda]  WITH CHECK ADD  CONSTRAINT [FK_Deuda_Bien] FOREIGN KEY([id_bien])
REFERENCES [dbo].[Bien] ([id])
GO
ALTER TABLE [dbo].[Deuda] CHECK CONSTRAINT [FK_Deuda_Bien]
GO
ALTER TABLE [dbo].[Deuda]  WITH CHECK ADD  CONSTRAINT [FK_Deuda_Periodo_gracia] FOREIGN KEY([id_periodo_gracia])
REFERENCES [dbo].[Periodo_gracia] ([id])
GO
ALTER TABLE [dbo].[Deuda] CHECK CONSTRAINT [FK_Deuda_Periodo_gracia]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Bien] FOREIGN KEY([Bien_id])
REFERENCES [dbo].[Bien] ([id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Bien]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tipo_usuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[Tipo_usuario] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Tipo_usuario]
GO
USE [master]
GO
ALTER DATABASE [Finanzas] SET  READ_WRITE 
GO
