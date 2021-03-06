﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AppManage.aspx.cs" Inherits="Go.GoAppManage" %>

<%@ Register Src="~/Control/SideBar.ascx" TagPrefix="homory" TagName="SideBar" %>

<!DOCTYPE html>

<html>
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
    <form id="formHome" runat="server">
        <telerik:RadWindowManager ID="wm" runat="server">
            <Windows>
                <telerik:RadWindow ID="windowIcon" runat="server" NavigateUrl="~/Extended/AppIcon.aspx" Width="560" Height="130" CssClass="coreCenter coreMiddle" ReloadOnShow="true" VisibleStatusbar="false" Behaviors="Close" Modal="true" Title="选择应用Logo" Localization-Close="关闭">
                </telerik:RadWindow>
                <telerik:RadWindow ID="windowUserType" runat="server" OnClientClose="refreshGrid" NavigateUrl="~/Extended/AppUserType.aspx" Width="560" Height="130" CssClass="coreCenter coreMiddle" ReloadOnShow="true" VisibleStatusbar="false" Behaviors="Close" Modal="true" Title="选择应用可访问对象" Localization-Close="关闭">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>
	    <%-- ReSharper disable UseOfImplicitGlobalInFunctionScope --%>
	    <%-- ReSharper disable UnusedParameter --%>
        <script type="text/javascript">
            function PopIcon(id) {
                var w = window.radopen("../Extended/AppIcon.aspx?" + id, "windowIcon");
                return false;
            }

            function PopUserType(id) {
                window.radopen("../Extended/AppUserType.aspx?" + id, "windowUserType");
                return false;
            }

            function refreshGrid() {
                var g = $find("grid");
                g.MasterTableView.rebind();
            }

            function ccRefresh(sender, e) {
                refreshGrid();
            }
        </script>
	    <%-- ReSharper restore UnusedParameter --%>
	    <%-- ReSharper restore UseOfImplicitGlobalInFunctionScope --%>
        <div>
            <homory:SideBar runat="server" ID="SideBar" />
        </div>
        <telerik:RadAjaxLoadingPanel ID="loading" runat="server">
            <i class="ui huge teal loading icon" style="margin-top: 50px;"></i>
            <div>&nbsp;</div>
            <div style="color: #564F8A; font-size: 16px;">正在加载 请稍候....</div>
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxPanel ID="panel" runat="server" CssClass="ui center aligned page grid" style="margin:0;padding:0;" LoadingPanelID="loading">
            <div class="column">
                <telerik:RadGrid ID="grid" runat="server" AutoGenerateColumns="false" LocalizationPath="../Language" AllowSorting="True" PageSize="20" GridLines="None" OnNeedDataSource="grid_NeedDataSource" OnBatchEditCommand="grid_BatchEditCommand" OnItemCreated="grid_ItemCreated">
                    <MasterTableView EditMode="Batch" DataKeyNames="Id" CommandItemDisplay="Top" HorizontalAlign="NotSet" ShowHeader="true" ShowHeadersWhenNoRecords="true" NoMasterRecordsText="">
                        <BatchEditingSettings EditType="Row" OpenEditingEvent="DblClick" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <Columns>
                            <telerik:GridTemplateColumn HeaderStyle-Width="60" ItemStyle-Width="60" HeaderText="序号" DataField="Ordinal" SortExpression="Ordinal" UniqueName="Ordinal">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Ordinal") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadNumericTextBox ID="Ordinal" runat="server" EnabledStyle-HorizontalAlign="Center" Width="40" MinValue="1" MaxValue="999999" AllowOutOfRangeAutoCorrect="true" Value='<%# Bind("Ordinal") %>'>
                                        <NumberFormat DecimalDigits="0" AllowRounding="true" />
                                    </telerik:RadNumericTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="名称 *" DataField="Name" SortExpression="Name" UniqueName="Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Name" runat="server" EnabledStyle-HorizontalAlign="Center" Width="64" MaxLength="16" Text='<%# Bind("Name") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderStyle-Width="360" ItemStyle-HorizontalAlign="Left" HeaderText="首页" ItemStyle-Width="360" DataField="Home" SortExpression="Home" UniqueName="Home">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Home") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadTextBox ID="Home" runat="server" EnabledStyle-HorizontalAlign="Center" Width="160" MaxLength="512" Text='<%# Bind("Home") %>'>
                                    </telerik:RadTextBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="状态" DataField="State" SortExpression="State" UniqueName="State">
                                <ItemTemplate>
                                    <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <telerik:RadComboBox ID="State" runat="server" Width="64" EnableTextSelection="true" Text='<%# Eval("State") %>'>
                                        <Items>
                                            <telerik:RadComboBoxItem Text="" Value="-1" />
                                            <telerik:RadComboBoxItem Text="启用" Value="1" />
                                            <telerik:RadComboBoxItem Text="停用" Value="4" />
                                            <telerik:RadComboBoxItem Text="删除" Value="5" />
                                        </Items>
                                    </telerik:RadComboBox>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn ReadOnly="true" ItemStyle-HorizontalAlign="Center" HeaderText="Logo" DataField="Icon" AllowSorting="false" UniqueName="Icon">
                                <ItemTemplate>
                                    <asp:Image ID="icon" runat="server" onclick=<%# string.Format("PopIcon('{0}');", Eval("Id")) %> Width="60" Height="60" CssClass='<%# string.Format("{0}{1}", "ui image rootPointer", ((Homory.Model.State)Eval("State")) < Homory.Model.State.审核 ? "" : " disabled") %>' ImageUrl='<%# FormatIcon((string)Eval("Icon")) %>'></asp:Image>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn ReadOnly="true" ItemStyle-HorizontalAlign="Center" HeaderText="可访问用户" AllowSorting="false" UniqueName="AppUser">
                                <ItemTemplate>
                                    <asp:Label runat="server" CssClass="rootPointer" Text='<%# GenText(Container.DataItem as Homory.Model.Application) %>' onclick=<%# string.Format("PopUserType('{0}');", Eval("Id")) %>></asp:Label>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </telerik:RadAjaxPanel>
    </form>
</body>
</html>
