DELETE FROM [DataCenter].[dbo].[Department] WHERE [Status]='N' AND G_TopID IS NULL

DECLARE @ID uniqueidentifier
DECLARE @ParentID uniqueidentifier
DECLARE @TopID uniqueidentifier
DECLARE @Name nvarchar(32)
DECLARE @Code nvarchar(32)
DECLARE @BuildType int
DECLARE @ClassType int
DECLARE @Ordinal int
DECLARE @AutoId int

DECLARE TEMP CURSOR FOR SELECT [G_ID],[G_ParentID],[G_TopID],[Name],[Code],[BuildType],[ClassType],[Ordinal],[ID] FROM [DataCenter].[dbo].[Department] WHERE [Status] = 'N' ORDER BY ID
OPEN TEMP
FETCH NEXT FROM TEMP INTO @ID,@ParentID,@TopID,@Name,@Code,@BuildType,@ClassType,@Ordinal,@AutoId
WHILE(@@FETCH_STATUS=0)
BEGIN

INSERT INTO [Platform_BT].[dbo].[Department]([Id],[ParentId],[TopId],[Name],[DisplayName],[Level],[Hidden],[Type],[State],[Ordinal],[BuildType],[ClassType],[Code],[AutoId])
     VALUES(@ID,@ParentID,@TopID,@Name,@Name,-1,'False',1,1,@Ordinal,@BuildType,@ClassType,@Code,@AutoId)

FETCH NEXT FROM TEMP INTO @ID,@ParentID,@TopID,@Name,@Code,@BuildType,@ClassType,@Ordinal,@AutoId
END
CLOSE TEMP
DEALLOCATE TEMP
GO
