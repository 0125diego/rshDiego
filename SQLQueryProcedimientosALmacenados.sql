--PROCEDIMEINTO ALMACENADO CREAR TABLA @sp_creartablaProduccPersonal
CREATE PROCEDURE sp_creartablaProduccPersonal
	@NombreTabla sysname
AS
BEGIN
	DECLARE @ConsultaSQL nvarchar(4000);

	SET @ConsultaSQL = 'CREATE TABLE ' + @NombreTabla + 
	' (DNI char(8) NOT NULL, Turno varchar(2) NOT NULL, Fecha varchar(9) NOT NULL, 
	id_IPRESS varchar(9) NOT NULL, nro_Atenciones int NOT NULL, tipo_atenciones varchar(200) null)';

	EXECUTE sp_executesql @ConsultaSQL;
END
GO

--PROCEDIMEINTO ALMACENADO INSERTAR DATOS EN LA TABLA @m_ProduccPersonal
CREATE PROCEDURE sp_InsertarDatosProduccPersonal
	@NombreTabla sysname
AS
BEGIN
	DECLARE @ConsultaSQL nvarchar(4000);
	SET @ConsultaSQL = 'INSERT INTO ' + @NombreTabla + 
	 ' (DNI, Turno, Fecha, id_IPRESS, nro_Atenciones, tipo_atenciones) 
	SELECT NUM_DOC_ATIENDE, [Turno atención],CONCAT (Dia,+''/''+ Mes,+''/''+Año),RENAES, COUNT(id_cita), null FROM nominalDatos
	GROUP BY NUM_DOC_ATIENDE, RENAES, [Turno atención],  Dia,MES,Año'

		EXECUTE sp_executesql @ConsultaSQL;
END
GO


--EJECUTAR PROCEDIMIENTOS ALMACENADOS
EXECUTE sp_creartablaProduccPersonal 'm_ProduccPersonal';
EXECUTE sp_InsertarDatosProduccPersonal 'm_ProduccPersonal';

