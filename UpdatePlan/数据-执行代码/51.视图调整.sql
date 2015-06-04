USE [Platform_BT]
GO

/****** Object:  View [dbo].[ViewQueryTaught]    Script Date: 2015/4/26 22:51:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[ViewQueryTaught] AS


SELECT T.DepartmentId, T.CourseId, T.State,D3.Name AS ѧУ,D2.Name AS ��, D.DisplayName AS �༶, C.Name AS �γ�����, U.RealName AS ��ʦ FROM Taught T INNER JOIN [User] U ON U.[State] < 2 AND T.State < 2 AND T.UserId = U.Id
INNER JOIN Catalog C ON C.Type = 2 AND C.State < 2 AND C.Id = T.CourseId INNER JOIN Department D ON D.State < 2 AND T.DepartmentId = D.Id INNER JOIN Department D2 ON D.ParentId = D2.Id INNER JOIN
Department D3 ON D.TopId = D3.Id