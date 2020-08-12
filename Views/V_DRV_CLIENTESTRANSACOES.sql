CREATE VIEW V_DRV_CLIENTES TRANSACOES
AS
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