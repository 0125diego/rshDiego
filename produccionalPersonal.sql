use Nominal
CREATE TABLE [dbo].[datosNominal](
	[id_cita] [varchar](9) NULL,
	[Año] [varchar](4) NULL,
	[Mes] [varchar](2) NULL,
	[Dia] [varchar](2) NULL,
	[Lote] [varchar](3) NULL,
	[Num_Pag] [varchar](2) NULL,
	[Num_Reg] [varchar](2) NULL,
	[Servicio] [varchar](6) NULL,
	[RENAES] [varchar](9) NULL,
	[Tipo_Doc] [varchar](12) NULL,
	[IDENTIFICADOR] [varchar](8) NULL,
	[Nro_Doc] [varchar](15) NULL,
	[Nombre] [varchar](50) NULL,
	[Paterno] [varchar](50) NULL,
	[Materno] [varchar](50) NULL,
	[Nro  de HCL] [varchar](12) NULL,
	[FichaFam] [varchar](10) NULL,
	[Financiador] [varchar](13) NULL,
	[Nro_Afiliacion] [varchar](15) NULL,
	[Cond  EESS] [varchar](1) NULL,
	[Cond  Serv ] [varchar](1) NULL,
	[Tipo Edad] [varchar](1) NULL,	
	[Ubigeo] [varchar](6) NULL,
	[Turno atención] [varchar](1) NULL,
	[Género] [varchar](1) NULL,
	[id_ciex1] [varchar](8) NULL,
	[id_tipdiag1] [varchar](1) NULL,
	[valor_lab1] [varchar](3) NULL,
	[id_ciex2] [varchar](8) NULL,
	[id_tipdiag2] [varchar](1) NULL,
	[valor_lab2] [varchar](3) NULL,
	[id_ciex3] [varchar](8) NULL,
	[id_tipdiag3] [varchar](1) NULL, 	
	[valor_lab3] [varchar](3) NULL,
	[id_ciex4] [varchar](8) NULL,
	[id_tipdiag4] [varchar](1) NULL,
	[valor_lab4] [varchar](3) NULL,
	[id_ciex5] [varchar](8) NULL,
	[id_tipdiag5] [varchar](1) NULL,
	[valor_lab5] [varchar](3) NULL,
	[id_ciex6] [varchar](8) NULL,
	[id_tipdiag6] [varchar](1) NULL,
	[valor_lab6] [varchar](3) NULL,
	[NUM_DOC_ATIENDE] [varchar](8) NULL,
	[ATIENDE] [varchar](50) NULL,
	[NUM_DOC_REGISTRA] [varchar](8) NULL,
	[REGISTRADOR] [varchar](50) null,
	[PESO] [varchar] (15)NULL,
	[TALLA] [varchar] (15) NULL,
	[HB] [varchar] (15) NULL,
	[PAB] [varchar](5) NULL,
	[PC] [varchar](5) NULL,
	[ICM] [varchar](1) NULL

)

INSERT INTO datosNominal([id_cita],[Año],[Mes],[Dia],[Lote],[Num_Pag],[Num_Reg],[Servicio],[RENAES],[Tipo_Doc],[IDENTIFICADOR],[Nro_Doc],[Nombre],[Paterno],
	[Materno],[Nro  de HCL],[FichaFam],[Financiador],[Nro_Afiliacion],[Cond  EESS],[Cond  Serv ],[Tipo Edad],[Ubigeo],[Turno atención],[Género],
	[id_ciex1],[id_tipdiag1],[valor_lab1],[id_ciex2],[id_tipdiag2],[valor_lab2],[id_ciex3],[id_tipdiag3],[valor_lab3],[id_ciex4],[id_tipdiag4],
	[valor_lab4],[id_ciex5],[id_tipdiag5],[valor_lab5],[id_ciex6],[id_tipdiag6],[valor_lab6],[NUM_DOC_ATIENDE],[ATIENDE],[NUM_DOC_REGISTRA],
	[REGISTRADOR],[PESO],[TALLA],[HB],[PAB],[PC],[ICM]) 
	SELECT [id_cita],[Año],[Mes],[Dia],[Lote],[Num_Pag],[Num_Reg],[Servicio],[RENAES],[Tipo_Doc],[IDENTIFICADOR],[Nro_Doc],[Nombre],[Paterno],
	[Materno],[Nro  de HCL],[FichaFam],[Financiador],[Nro_Afiliacion],[Cond  EESS],[Cond  Serv ],[Tipo Edad],[Ubigeo],[Turno atención],[Género],
	[id_ciex1],[id_tipdiag1],[valor_lab1],[id_ciex2],[id_tipdiag2],[valor_lab2],[id_ciex3],[id_tipdiag3],[valor_lab3],[id_ciex4],[id_tipdiag4],
	[valor_lab4],[id_ciex5],[id_tipdiag5],[valor_lab5],[id_ciex6],[id_tipdiag6],[valor_lab6],[NUM_DOC_ATIENDE],[ATIENDE],[NUM_DOC_REGISTRA],
	[REGISTRADOR],[PESO],[TALLA],[HB],[PAB],[PC],[ICM]  FROM nominalDatos

SELECT GETDATE() 
--YYY-MM-DD  

--		CREAR TABLA m_Produccion_Personal
USE Nominal
CREATE TABLE m_Produccion_Personal(
	[DNI] [varchar](8) NULL,
	[ID_IPRESS] [varchar](9) NULL,
	[TURNO_ATENC] [varchar](1) NULL,
	[FECHA] [date] NULL,
	[NUMERO_ATENC] [int] NULL,
	[TIPO_ATENC] [varchar](30) NULL,
	)
-- INSERTAR DATOS FILTRADOS A m_Produccion_Personal
	INSERT INTO m_Produccion_Personal(DNI, ID_IPRESS, TURNO_ATENC, FECHA, NUMERO_ATENC, TIPO_ATENC)
	SELECT NUM_DOC_ATIENDE, RENAES, [Turno atención], CONCAT(Año,+'-'+Mes,+'-'+Dia), COUNT(id_cita), NULL FROM datosNominal
	GROUP BY NUM_DOC_ATIENDE, RENAES, [Turno atención], Dia, Mes, Año

UPDATE datosNominal set Nombre='', Paterno='', Materno='';

