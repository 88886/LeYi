USE [Platform_BT]
GO

/****** Object:  View [dbo].[ViewQueryTeacher]    Script Date: 2015/4/14 23:29:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[ViewQueryTeacher] AS
SELECT VT.RealName AS ����, 
CASE VT.State WHEN 0 THEN '����' WHEN 1 THEN '����' WHEN 2 THEN '���' WHEN 3 THEN 'Ĭ��' WHEN 4 THEN 'ͣ��' ELSE 'ɾ��' END ״̬,
CASE VT.PerStaff WHEN 'True' THEN '��' ELSE '��' END �ڱ�,
CASE VT.Sync WHEN 'True' THEN '��' ELSE '��' END ͬ��,
D.Name У��,
VT.DepartmentName ����,
CASE VT.Type WHEN -1 THEN '��ְ' ELSE '��ְ' END ����ְ,
VT.Phone �ֻ�����,
VT.Email �����ʼ�,
VT.IDCard ���֤��,
CASE VT.Gender WHEN 'True' THEN '��' WHEN 'False' THEN 'Ů' ELSE NULL END �Ա�,
VT.Birthplace ����,
VT.Birthday ��������,
VT.Address �־�ס��,
VT.Nationality ����
FROM ViewTeacher VT INNER JOIN Department D ON
VT.TopDepartmentId = D.Id AND D.State < 2 AND VT.Type < 0



GO


