USE master
GO
CREATE DATABASE Clientes
GO
USE Clientes
GO
CREATE TABLE Cliente (
	IdCliente INT PRIMARY KEY IDENTITY (1, 1)
   ,Nombre VARCHAR(200) NOT NULL
   ,Celular VARCHAR(10) NOT NULL
   ,Correo VARCHAR(200) NOT NULL
   ,Activo BIT NOT NULL
   ,IdUsuarioRegistra INT NOT NULL
   ,FechaRegistro DATETIME NOT NULL
   ,IdUsuarioActualiza INT NULL
   ,FechaActualizacion DATETIME NULL
)
GO
ALTER PROCEDURE InsertCliente
@Nombre VARCHAR(200),
@Celular VARCHAR(10),
@Correo VARCHAR(200),
@IdUsuarioRegistra INT
AS
BEGIN 
	BEGIN TRANSACTION INSERTARCLIENTE
		BEGIN TRY
			INSERT INTO 
				Cliente (Nombre, Celular, Correo, Activo, IdUsuarioRegistra, FechaRegistro)
				VALUES (@Nombre, @Celular, @Correo, 1, @IdUsuarioRegistra, GETDATE());
			SELECT SCOPE_IDENTITY() AS IdCliente
			COMMIT TRANSACTION INSERTARCLIENTE
		END TRY
		BEGIN CATCH
			select 0 as Error
			ROLLBACK TRANSACTION INSERTARCLIENTE
		END CATCH
END
GO
ALTER PROC UpdateCliente 
@IdCliente INT,
@Nombre VARCHAR(200),
@Celular VARCHAR(10),
@Correo VARCHAR(200),
@IdUsuarioActualiza INT
AS
BEGIN
	BEGIN TRANSACTION UpdateCliente
		BEGIN TRY
			UPDATE Cliente
			SET Nombre = @Nombre
			   ,Celular = @Celular
			   ,Correo = @Correo
			   ,IdUsuarioActualiza = @IdUsuarioActualiza
			   ,FechaActualizacion = GETDATE()
			WHERE IdCliente = @IdCliente;
			SELECT @IdCliente AS IdCliente
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			SELECT 0 AS Error
			ROLLBACK TRANSACTION
		END CATCH
END
GO
ALTER PROC DeleteCliente 
@IdCliente INT,
@IdUsuarioActualiza INT
AS
BEGIN
	BEGIN TRANSACTION DeleteCliente
		BEGIN TRY
			UPDATE Cliente
				SET Activo = 0
					,IdUsuarioActualiza = @IdUsuarioActualiza
					,FechaActualizacion = GETDATE()
				WHERE IdCliente = @IdCliente;
				SELECT @IdCliente AS IdCliente
				COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			SELECT 0 AS Error
			ROLLBACK TRANSACTION
		END CATCH
END
GO
CREATE PROC SelectCliente
@IdCliente INT = 0
AS
BEGIN
	 IF @IdCliente > 0 
		 BEGIN
			SELECT 
				 c.IdCliente
				  ,c.Nombre
				  ,c.Celular
				  ,c.Correo 
				  FROM Cliente c
				  WHERE c.IdCliente = @IdCliente
		 END
	ELSE
		BEGIN
        	SELECT 
				 c.IdCliente
				  ,c.Nombre
				  ,c.Celular
				  ,c.Correo 
				  FROM Cliente c
				  WHERE c.Activo = 1
        END
END
GO
