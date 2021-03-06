USE DataCenter
GO
CREATE VIEW [dbo].RelationToMigrate AS
SELECT D.[G_ID] AS [DepartmentId],
		U.[G_ID] AS [UserId],
		D.[G_TopID] AS [TopDepartmentId], 
		R.[Status] AS [Type], 
		1 AS [State],
		R.[Ordinal] % 100 AS [Ordinal]
  FROM [DataCenter].[dbo].[Relation] R LEFT JOIN [DataCenter].[dbo].[Department] D
  ON R.DepartmentID = D.ID AND D.[Status]= 'N' LEFT JOIN [DataCenter].[dbo].[User] U
  ON R.[TeacherID] = U.[ID] AND U.[Status] = 'N'
  GO