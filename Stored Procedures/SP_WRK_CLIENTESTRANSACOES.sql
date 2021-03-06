USE [DS_TRAINNING]
GO
/****** Object:  StoredProcedure [dbo].[SP_DRV_CLIENTESTRANSACOES]    Script Date: 8/11/2020 6:56:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Mônica Sasaki>
-- Create date: <20200811>
-- Description:	<Procedure que cria a tabela DRV_CLIENTESTRANSACOES>
-- =============================================
ALTER PROCEDURE [dbo].[SP_DRV_CLIENTESTRANSACOES] 

AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================

IF OBJECT_ID('DRV_CLIENTESTRANSACOES') IS NOT NULL
DROP TABLE [dbo].[DRV_CLIENTESTRANSACOES]

-- =============================================
-- CRIAÇÃO DA TABELA
-- =============================================

CREATE TABLE DRV_CLIENTESTRANSACOES
(
	[RowNumber]		INT IDENTITY,
	[Customer ID]		VARCHAR(100), 
	City				VARCHAR(100), 
	ZipCode				VARCHAR(100), 
	Gender				CHAR(1), 
	Age					FLOAT, 
	[Order ID]			VARCHAR(100), 
	[Order Date]		DATE, 
	Region				VARCHAR(100), 
	Rep					VARCHAR(100), 
	Item				VARCHAR(100), 
	Units				NUMERIC, 
	[Unit Price]		FLOAT
)

-- =============================================
-- TRUNCATE DA TABELA
-- =============================================

TRUNCATE TABLE [dbo].[DRV_CLIENTESTRANSACOES]

-- =============================================
-- INSERÇÃO DOS DADOS
-- =============================================

INSERT INTO [dbo].[DRV_CLIENTESTRANSACOES]
(
	 [Customer ID]	 
	,City			 
	,ZipCode			 
	,Gender			
	,Age				
	,[Order ID]		 
	,[Order Date]	
	,Region			 
	,Rep				 
	,Item			 
	,Units			
	,[Unit Price]	
)

SELECT        
	dbo.WRK_CLIENTES.[Customer ID], 
	dbo.WRK_CLIENTES.City, 
	dbo.WRK_CLIENTES.ZipCode, 
	dbo.WRK_CLIENTES.Gender, 
	dbo.WRK_CLIENTES.Age, 
	dbo.WRK_TRANSACOES.[Order ID], 
	dbo.WRK_TRANSACOES.[Order Date], 
	dbo.WRK_TRANSACOES.Region, 
	dbo.WRK_TRANSACOES.Rep, 
	dbo.WRK_TRANSACOES.Item, 
	dbo.WRK_TRANSACOES.Units, 
	dbo.WRK_TRANSACOES.[Unit Price]
FROM            
	dbo.WRK_CLIENTES INNER JOIN dbo.WRK_TRANSACOES 
	ON dbo.WRK_CLIENTES.[Customer ID] = dbo.WRK_TRANSACOES.[Customer ID]

END
