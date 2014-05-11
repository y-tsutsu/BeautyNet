<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="tpname" DataValueField="tpcd" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [tpcd], [tpname] FROM [tenpo]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="tncd" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="tncd" HeaderText="コード" ReadOnly="True" SortExpression="tncd" />
                <asp:BoundField DataField="tnname" HeaderText="担当者名" SortExpression="tnname" />
                <asp:BoundField DataField="tpname" HeaderText="店舗" SortExpression="tpname" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tanto.tncd, tanto.tnname, tenpo.tpname FROM tanto INNER JOIN tenpo ON tanto.stpcd = tenpo.tpcd WHERE (tanto.stpcd = @stpcd)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="stpcd" PropertyName="SelectedValue" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
