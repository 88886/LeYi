/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP 1000 [StaID]
--      ,[StaName]
--      ,[StaDesc]
--      ,[StaIsdriver]
--      ,[StaType]
--      ,[DelFlag]
--      ,[StaOrder]
--      ,[UnitID]
--  FROM [C6].[dbo].[Station] WHERE DelFlag = 0 ORDER By UnitID


  DECLARE @StaID int
  DECLARE @UnitID varchar(50)
  DECLARE @FOUND varchar(50)
  DECLARE @O int
  DECLARE TEMP CURSOR FOR SELECT StaID, UnitID FROM [C6].[dbo].[Station] WHERE DelFlag = 0 ORDER By UnitID
  OPEN TEMP
  FETCH NEXT FROM TEMP INTO @StaID, @UnitID
  WHILE(@@FETCH_STATUS=0)
  BEGIN
  SELECT @FOUND = CONVERT(varchar(50),Id), @O = Ordinal FROM [Platform_BT].[dbo].[Department] WHERE AutoId = CONVERT(INT, @UnitID)
  UPDATE [C6].[dbo].[Station] SET UnitID = @FOUND, StaOrder = @O WHERE StaID = @StaID
  FETCH NEXT FROM TEMP INTO @StaID, @UnitID
  END
  CLOSE TEMP
  DEALLOCATE TEMP