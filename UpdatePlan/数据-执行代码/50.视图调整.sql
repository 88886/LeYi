USE [Platform_BT]
GO

/****** Object:  View [dbo].[ViewQueryStudent]    Script Date: 2015/4/26 22:51:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[ViewQueryStudent] AS
SELECT VS.RealName AS ����, 
CASE VS.State WHEN 0 THEN '����' WHEN 1 THEN '����' WHEN 2 THEN '���' WHEN 3 THEN 'Ĭ��' WHEN 4 THEN 'ͣ��' ELSE 'ɾ��' END ״̬,
VS.Account AS �˺�,
D.Name AS ѧУ,
SUBSTRING (VS.Account, 3,4) ��,
VS.DepartmentName �༶,
VS.Ordinal ѧ��,
VS.UniqueId ѧ����,
VS.IDCard ���֤��,
CASE VS.Gender WHEN 'True' THEN '��' WHEN 'False' THEN 'Ů' ELSE NULL END �Ա�,
VS.Birthplace ����,
VS.Birthday ��������,
VS.Address �־�ס��,
VS.Nationality ����,
VS.Charger ��ϵ��,
VS.ChargerContact ��ϵ����
FROM ViewStudent VS INNER JOIN Department D ON
VS.TopDepartmentId = D.Id AND D.State < 2


GO


