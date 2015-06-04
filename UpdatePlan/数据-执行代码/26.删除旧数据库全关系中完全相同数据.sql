ALTER TABLE DataCenter.dbo.DepartmentUser
ADD x int IDENTITY(1,1)
GO

DELETE FROM DataCenter.dbo.DepartmentUser where x in (select max(x) from DataCenter.dbo.DepartmentUser
GROUP BY DepartmentId, UserId, [Type] HAVING COUNT(*)>1)
GO

alter table DataCenter.dbo.DepartmentUser drop column x
go