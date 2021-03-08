USE BDVentas -- SU BASE DE DATOS
GO

CREATE FUNCTION [dbo].[CantidadConLetra]
(
    @Numero Decimal(18,2)
)
RETURNS Varchar(180)
AS
BEGIN
    DECLARE @ImpLetra Varchar(180)
        DECLARE @lnEntero INT,
                        @lcRetorno VARCHAR(512),
                        @lnTerna INT,
                        @lcMiles VARCHAR(512),
                        @lcCadena VARCHAR(512),
                        @lnUnidades INT,
                        @lnDecenas INT,
                        @lnCentenas INT,
                        @lnFraccion INT
        SELECT  @lnEntero = CAST(@Numero AS INT),
                        @lnFraccion = (@Numero - @lnEntero) * 100,
                        @lcRetorno = '',
                        @lnTerna = 1
  WHILE @lnEntero > 0
  BEGIN /* WHILE */
            -- Recorro terna por terna
            SELECT @lcCadena = ''
            SELECT @lnUnidades = @lnEntero % 10
            SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
            SELECT @lnDecenas = @lnEntero % 10
            SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
            SELECT @lnCentenas = @lnEntero % 10
            SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
            -- Analizo las unidades
            SELECT @lcCadena =
            CASE /* UNIDADES */
              WHEN @lnUnidades = 1 THEN 'UN ' + @lcCadena
              WHEN @lnUnidades = 2 THEN 'DOS ' + @lcCadena
              WHEN @lnUnidades = 3 THEN 'TRES ' + @lcCadena
              WHEN @lnUnidades = 4 THEN 'CUATRO ' + @lcCadena
              WHEN @lnUnidades = 5 THEN 'CINCO ' + @lcCadena
              WHEN @lnUnidades = 6 THEN 'SEIS ' + @lcCadena
              WHEN @lnUnidades = 7 THEN 'SIETE ' + @lcCadena
              WHEN @lnUnidades = 8 THEN 'OCHO ' + @lcCadena
              WHEN @lnUnidades = 9 THEN 'NUEVE ' + @lcCadena
              ELSE @lcCadena
            END /* UNIDADES */
            -- Analizo las decenas
            SELECT @lcCadena =
            CASE /* DECENAS */
              WHEN @lnDecenas = 1 THEN
                CASE @lnUnidades
                  WHEN 0 THEN 'DIEZ '
                  WHEN 1 THEN 'ONCE '
                  WHEN 2 THEN 'DOCE '
                  WHEN 3 THEN 'TRECE '
                  WHEN 4 THEN 'CATORCE '
                  WHEN 5 THEN 'QUINCE '
                  WHEN 6 THEN 'DIEZ Y SEIS '
                  WHEN 7 THEN 'DIEZ Y SIETE '
                  WHEN 8 THEN 'DIEZ Y OCHO '
                  WHEN 9 THEN 'DIEZ Y NUEVE '
                END
              WHEN @lnDecenas = 2 THEN
              CASE @lnUnidades
                WHEN 0 THEN 'VEINTE '
                ELSE 'VEINTI' + @lcCadena
              END
              WHEN @lnDecenas = 3 THEN
              CASE @lnUnidades
                WHEN 0 THEN 'TREINTA '
                ELSE 'TREINTA Y ' + @lcCadena
              END
              WHEN @lnDecenas = 4 THEN
                CASE @lnUnidades
                    WHEN 0 THEN 'CUARENTA'
                    ELSE 'CUARENTA Y ' + @lcCadena
                END
              WHEN @lnDecenas = 5 THEN
                CASE @lnUnidades
                    WHEN 0 THEN 'CINCUENTA '
                    ELSE 'CINCUENTA Y ' + @lcCadena
                END
              WHEN @lnDecenas = 6 THEN
                CASE @lnUnidades
                    WHEN 0 THEN 'SESENTA '
                    ELSE 'SESENTA Y ' + @lcCadena
                END
              WHEN @lnDecenas = 7 THEN
                 CASE @lnUnidades
                    WHEN 0 THEN 'SETENTA '
                    ELSE 'SETENTA Y ' + @lcCadena
                 END
              WHEN @lnDecenas = 8 THEN
                CASE @lnUnidades
                    WHEN 0 THEN 'OCHENTA '
                    ELSE  'OCHENTA Y ' + @lcCadena
                END
              WHEN @lnDecenas = 9 THEN
                CASE @lnUnidades
                    WHEN 0 THEN 'NOVENTA '
                    ELSE 'NOVENTA Y ' + @lcCadena
                END
              ELSE @lcCadena
            END /* DECENAS */
            -- Analizo las centenas
            SELECT @lcCadena =
            CASE /* CENTENAS */
              WHEN @lnCentenas = 1 THEN 'CIENTO ' + @lcCadena
              WHEN @lnCentenas = 2 THEN 'DOSCIENTOS ' + @lcCadena
              WHEN @lnCentenas = 3 THEN 'TRESCIENTOS ' + @lcCadena
              WHEN @lnCentenas = 4 THEN 'CUATROCIENTOS ' + @lcCadena
              WHEN @lnCentenas = 5 THEN 'QUINIENTOS ' + @lcCadena
              WHEN @lnCentenas = 6 THEN 'SEISCIENTOS ' + @lcCadena
              WHEN @lnCentenas = 7 THEN 'SETECIENTOS ' + @lcCadena
              WHEN @lnCentenas = 8 THEN 'OCHOCIENTOS ' + @lcCadena
              WHEN @lnCentenas = 9 THEN 'NOVECIENTOS ' + @lcCadena
              ELSE @lcCadena
            END /* CENTENAS */
            -- Analizo la terna
            SELECT @lcCadena =
            CASE /* TERNA */
              WHEN @lnTerna = 1 THEN @lcCadena
              WHEN @lnTerna = 2 THEN @lcCadena + 'MIL '
              WHEN @lnTerna = 3 THEN @lcCadena + 'MILLONES '
              WHEN @lnTerna = 4 THEN @lcCadena + 'MIL '
              ELSE ''
            END /* TERNA */
            -- Armo el retorno terna a terna
            SELECT @lcRetorno = @lcCadena  + @lcRetorno
            SELECT @lnTerna = @lnTerna + 1
   END /* WHILE */
   IF @lnTerna = 1
       SELECT @lcRetorno = 'CERO'
   DECLARE @sFraccion VARCHAR(15)
   SET @sFraccion = '00' + LTRIM(CAST(@lnFraccion AS varchar))
   SELECT @ImpLetra = RTRIM(@lcRetorno) + ' DOLARES CON ' + SUBSTRING(@sFraccion,LEN(@sFraccion)-1,2) + '/100 '

   RETURN @ImpLetra
END
