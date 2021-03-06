

DELETE [DataCenter].[dbo].[Teacher] WHERE ID = 1602 AND [Time] = '2012-11-02 09:20:07.167'
DELETE [DataCenter].[dbo].[User] WHERE ID = 1602 AND [Time] = '2012-11-02 09:20:07.167'

UPDATE [DataCenter].[dbo].[User] SET [Status] = 'O' WHERE ID = 1175
UPDATE [DataCenter].[dbo].[Teacher] SET [Status] = 'O' WHERE ID = 1175

UPDATE [DataCenter].[dbo].[User] SET [Status] = 'O' WHERE ID = 4110
UPDATE [DataCenter].[dbo].[Teacher] SET [Status] = 'O' WHERE ID = 4110

UPDATE [DataCenter].[dbo].[User] SET [Status] = 'O' WHERE ID = 4125
UPDATE [DataCenter].[dbo].[Teacher] SET [Status] = 'O' WHERE ID = 4125

UPDATE [DataCenter].[dbo].[User] SET [Status] = 'O' WHERE ID = 1579
UPDATE [DataCenter].[dbo].[Teacher] SET [Status] = 'O' WHERE ID = 1579

UPDATE [DataCenter].[dbo].[User] SET [Status] = 'O' WHERE ID = 1124
UPDATE [DataCenter].[dbo].[Teacher] SET [Status] = 'O' WHERE ID = 1124

GO

DECLARE @NUM nvarchar(100)
SELECT @NUM = MAX(CardNo) FROM [Platform_BT].[dbo].[CardNo]
UPDATE [DataCenter].[dbo].[User] SET [CardNo] = @NUM WHERE ID = 4009
DELETE [Platform_BT].[dbo].[CardNo] WHERE CardNo = @NUM
GO

DECLARE @NUM nvarchar(100)
SELECT @NUM = MAX(CardNo) FROM [Platform_BT].[dbo].[CardNo]
UPDATE [DataCenter].[dbo].[User] SET [CardNo] = @NUM WHERE ID = 4184
DELETE [Platform_BT].[dbo].[CardNo] WHERE CardNo = @NUM
GO
