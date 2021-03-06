USE [master]
GO

CREATE DATABASE BDTestCanvia;
GO

USE [BDTestCanvia]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 05/06/2020 11:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](8) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido_p] [varchar](50) NOT NULL,
	[apellido_m] [varchar](50) NOT NULL,
	[fecha_nacimiento] [datetime] NOT NULL,
	[sexo] [char](1) NOT NULL,
	[estado] [bit] NOT NULL,
	[Area] [varchar](100) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[usuario_registro] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[SPI_Empleados]    Script Date: 05/06/2020 11:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPI_Empleados]
	@dni					VARCHAR(8)		,
	@nombre					VARCHAR(30)		,
	@apellido_p				VARCHAR(50)		,
	@apellido_m				VARCHAR(50)		,
	@fecha_nacimiento		DATETIME		,
	@sexo					CHAR(1)			,
	@estado					BIT				,
	@Area					VARCHAR(100)	,
	--@fecha_registro			DATETIME	,	
	@usuario_registro		VARCHAR(100)	
AS
BEGIN
	INSERT INTO [dbo].[Empleados] ( 
		[dni], 
		[nombre], 
		[apellido_p], 
		[apellido_m], 
		[fecha_nacimiento], 
		[sexo], 
		[estado], 
		[Area], 
		[fecha_registro], 
		[usuario_registro])
	VALUES (
				@dni, 
				@nombre, 
				@apellido_p, 
				@apellido_m, 
				@fecha_nacimiento, 
				@sexo, 
				@estado, 
				@Area, 
				GETDATE(), 
				@usuario_registro)
END

GO
/****** Object:  StoredProcedure [dbo].[SPS_Empleados]    Script Date: 05/06/2020 11:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_Empleados]
AS
BEGIN
	SELECT 
		[id]				,		
		[dni]				,	
		[nombre]			,	
		[apellido_p]		,	
		[apellido_m]		,	
		[fecha_nacimiento]	,	
		[sexo]				,	
		[estado]			,	
		[Area]				,	
		[fecha_registro]	,
		[usuario_registro]
	FROM [dbo].[Empleados]	
END

GO
