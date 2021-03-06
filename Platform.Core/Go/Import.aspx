﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Import.aspx.cs" Inherits="Extended_Import" %>

<%@ Register Src="~/Control/SideBar.ascx" TagPrefix="homory" TagName="SideBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,Chrome=1" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1" />
    <title>基础平台</title>
    <link href="../Content/Semantic/css/semantic.min.css" rel="stylesheet" />
    <link href="../Content/Homory/css/common.css" rel="stylesheet" />
    <link href="../Content/Core/css/common.css" rel="stylesheet" />
    <script src="../Content/jQuery/jquery.min.js"></script>
    <script src="../Content/Semantic/javascript/semantic.min.js"></script>
    <script src="../Content/Homory/js/common.js"></script>
    <script src="../Content/Homory/js/notify.min.js"></script>
    <!--[if lt IE 9]>
	    <script src="../Content/Homory/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <homory:sidebar runat="server" id="SideBar" />
                <script>
                    $("#headInfo").text("学生导入");
                </script>
            </div>
            <telerik:RadAjaxLoadingPanel ID="loading" runat="server">
                <i class="ui huge teal loading icon" style="margin-top: 50px;"></i>
                <div>&nbsp;</div>
                <div style="color: #564F8A; font-size: 16px;">正在加载 请稍候....</div>
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxPanel ID="panel" runat="server" CssClass="ui left aligned page grid" style="margin:0;padding:0;" LoadingPanelID="loading">
                <div class="sixteen wide column">
                    <div>
                        <div class="ui teal circular label">1</div>上传学生Excel文档
                    </div>
                    <div style="margin-left: 50px;">
                        <telerik:RadAsyncUpload RegisterWithScriptManager="True" runat="server" ID="im_up" Skin="Metro" OnFileUploaded="im_up_FileUploaded" HideFileInput="False" LocalizationPath="~/Language" TemporaryFolder="~/Temp" TargetFolder="~/Temp" PostbackTriggers="im_do" ChunkSize="1048576" AutoAddFileInputs="False" MaxFileInputsCount="1" InitialFileInputsCount="1" />
                        <input type="hidden" id="file" runat="server" />
                    </div>
                    <div>&nbsp;</div>
                    <div>
                        <div class="ui teal circular label">2</div>
                        <telerik:RadButton ID="im_do" runat="server" Text="生成并预览学生数据" OnClick="im_do_Click"></telerik:RadButton>
                    </div>
                    <div style="margin-left: 50px;">
                        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="true" Font-Size="12px">
                        </asp:GridView>
                    </div>
                </div>
            </telerik:RadAjaxPanel>
            <telerik:RadAjaxPanel ID="panelX" runat="server" CssClass="ui left aligned page grid" style="margin:0;padding:0;" LoadingPanelID="loading">
                <div class="sixteen wide column">
                    <div>
                        <div class="ui teal circular label">3</div>
                        <telerik:RadButton ID="im_ok" runat="server" Text="完成学生数据导入" OnClick="im_ok_Click"></telerik:RadButton>
                    </div>
                </div>
            </telerik:RadAjaxPanel>
        </div>
    </form>
</body>
</html>
