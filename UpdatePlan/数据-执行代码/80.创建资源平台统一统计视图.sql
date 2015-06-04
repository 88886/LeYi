USE Platform_BT
GO
CREATE VIEW ViewQueryResource AS
SELECT L.Id, L.CampusId, L.[Year] AS ���,
L.Month AS �·�, L.Article AS ��������,
L.Courseware AS �����μ�,
L.Paper AS �����Ծ�,
L.Media AS ������Ƶ,
L.[View] AS �����Դ,
L.Favourite AS �ղ���Դ,
L.Download AS ������Դ,
L.Comment AS ������Դ,
L.Reply AS �ظ�����,
L.Rate AS ������Դ,
L.Credit AS ��û���,
D.Name AS ѧУ,
U.RealName AS ��ʦ FROM ResourceLog L LEFT JOIN [User] U ON U.[State] < 2 AND U.Id = L.Id LEFT JOIN Department D ON L.CampusId = D.Id AND D.State < 2
