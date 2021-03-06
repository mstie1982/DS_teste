USE [DS_TRAINNING]
GO
/****** Object:  StoredProcedure [dbo].[SP_WRK_CLIENTES]    Script Date: 8/11/2020 6:54:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Mônica Sasaki>
-- Create date: <20200811>
-- Description:	<Procedure que cria a tabela WRK_CLIENTES>
-- =============================================
ALTER PROCEDURE [dbo].[SP_WRK_CLIENTES] 

AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================

IF OBJECT_ID('WRK_CLIENTES') IS NOT NULL
DROP TABLE [dbo].[WRK_CLIENTES]

-- =============================================
-- CRIAÇÃO DA TABELA
-- =============================================

CREATE TABLE WRK_CLIENTES
(
	 [RowNumber]		INT IDENTITY
	,[Customer ID]		VARCHAR(100)
    ,[City]				VARCHAR(100)
    ,[ZipCode]			VARCHAR(100)
    ,[Gender]			CHAR(1)
    ,[Age]				FLOAT
)

-- =============================================
-- TRUNCATE DA TABELA
-- =============================================

TRUNCATE TABLE [dbo].[WRK_CLIENTES]

-- =============================================
-- INSERÇÃO DOS DADOS
-- =============================================

INSERT INTO [dbo].[WRK_CLIENTES]
(
		[Customer ID]
       ,[City]
       ,[ZipCode]
       ,[Gender]
       ,[Age]
)
SELECT 
	   RIGHT('0000000' + [Customer ID],7)
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
  FROM [DS_TRAINNING].[dbo].[RAW_Clientes_20200802]

END
