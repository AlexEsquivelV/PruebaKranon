USE [master]
GO
/****** Object:  Database [LibreriaKranon]    Script Date: 20/06/2022 06:32:57 p. m. ******/
CREATE DATABASE [LibreriaKranon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibreriaKranon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ALEX\MSSQL\DATA\LibreriaKranon.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibreriaKranon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.ALEX\MSSQL\DATA\LibreriaKranon_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibreriaKranon] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibreriaKranon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibreriaKranon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibreriaKranon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibreriaKranon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibreriaKranon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibreriaKranon] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibreriaKranon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibreriaKranon] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibreriaKranon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibreriaKranon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibreriaKranon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibreriaKranon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibreriaKranon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibreriaKranon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibreriaKranon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibreriaKranon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibreriaKranon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibreriaKranon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibreriaKranon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibreriaKranon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibreriaKranon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibreriaKranon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibreriaKranon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibreriaKranon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibreriaKranon] SET RECOVERY FULL 
GO
ALTER DATABASE [LibreriaKranon] SET  MULTI_USER 
GO
ALTER DATABASE [LibreriaKranon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibreriaKranon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibreriaKranon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibreriaKranon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibreriaKranon', N'ON'
GO
USE [LibreriaKranon]
GO
/****** Object:  User [DESKTOP-JJL3M6U\quik_]    Script Date: 20/06/2022 06:32:58 p. m. ******/
CREATE USER [DESKTOP-JJL3M6U\quik_] FOR LOGIN [DESKTOP-JJL3M6U\quik_] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[SP_AllR]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para consultar todos los registros de la tabla Libros
*/
CREATE PROCEDURE [dbo].[SP_AllR]
AS
BEGIN
    SELECT 
	      Id_Libro, Autor, Titulo, anio_publicacion, Editorial 
    FROM 
	     Libros
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Autor_Eliminar]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para eliminar los registros de la tabla Libros por Autor
*/
CREATE PROCEDURE [dbo].[SP_Autor_Eliminar] (@Autor VARCHAR(100))
AS
BEGIN
    DELETE FROM 
	         Libros 
		   WHERE 
		     Autor LIKE @Autor;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Editorial_Eliminar]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para eliminar los registros de la tabla Libros por Editorial
*/
CREATE PROCEDURE [dbo].[SP_Editorial_Eliminar] (@Editorial VARCHAR(100))
AS
BEGIN
    DELETE FROM 
	         Libros 
		   WHERE 
		     Editorial LIKE @Editorial;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Gby_Anio]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para consultar todos los registros de la tabla Libros por Año de publicacion
*/
CREATE PROCEDURE [dbo].[SP_Gby_Anio] (@anio_publicacion INT)
AS
BEGIN
    SELECT 
	  Autor, Titulo, anio_publicacion, Editorial 
	FROM 
	  Libros 
	WHERE 
	  anio_publicacion LIKE @anio_publicacion;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Gby_Autor]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para consultar todos los registros de la tabla Libros por autor
*/
CREATE PROCEDURE [dbo].[SP_Gby_Autor] (@Autor VARCHAR(100))
AS
BEGIN
    SELECT 
	  Autor, Titulo, anio_publicacion, Editorial 
	FROM 
	  Libros 
	WHERE
	  Autor LIKE @Autor;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Gby_AutoryAnio]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para consultar todos los registros de la tabla Libros por Autor y Año
*/
CREATE PROCEDURE [dbo].[SP_Gby_AutoryAnio] (@Autor VARCHAR(100), @anio_publicacion INT)
AS
BEGIN
    SELECT 
	  Autor, Titulo, anio_publicacion, Editorial 
	FROM 
	  Libros 
	WHERE 
	  Autor LIKE @Autor AND anio_publicacion LIKE @anio_publicacion;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Gby_Editorial]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para consultar todos los registros de la tabla Libros por Editorial
*/
CREATE PROCEDURE [dbo].[SP_Gby_Editorial] (@Editorial VARCHAR(100))
AS
BEGIN
    SELECT 
	  Autor, Titulo, anio_publicacion, Editorial 
	FROM 
	  Libros 
	WHERE 
	  Editorial LIKE @Editorial;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Gby_Titulo]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis Alejandro Esquivel Villegas
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para consultar todos los registros de la tabla Libros por Titulo
*/
CREATE PROCEDURE [dbo].[SP_Gby_Titulo] (@Titulo VARCHAR(100))
AS
BEGIN
    SELECT 
	  Autor, Titulo, anio_publicacion, Editorial 
	FROM 
	  Libros 
	WHERE 
	  Titulo LIKE @Titulo;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Libro_Ins]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Autor: Luis lejandro Esquivel
  Fecha: 14-Junio-2022
  Descripcion: Stored Procedure para insertar un nuevo libro a la base de datos
               @Autor: Autor del Libro
			   @Titulo: Titulo del libro
			   @anio_publicacion: Año de publicacion del libro
			   @Editorial: Editorial del libro
*/
CREATE PROCEDURE [dbo].[SP_Libro_Ins] (@Autor VARCHAR(100), @Titulo VARCHAR(100), @anio_publicacion INT, @Editorial VARCHAR(100))
AS
BEGIN
    INSERT INTO 
	  Libros
      (Autor, Titulo, anio_publicacion, Editorial)
    VALUES
      (@Autor, @Titulo, @anio_publicacion, @Editorial);
END
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 20/06/2022 06:32:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libros](
	[Id_Libro] [int] IDENTITY(1,1) NOT NULL,
	[Autor] [varchar](100) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[anio_publicacion] [int] NOT NULL,
	[Editorial] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [LibreriaKranon] SET  READ_WRITE 
GO
