<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kokyakuHosyu.aspx.cs" Inherits="kokyakuHosyu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="tpname" DataValueField="tpcd">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [tpname], [tpcd] FROM [tenpo]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="koid" DataSourceID="SqlDataSource2" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="koid" HeaderText="顧客ID" InsertVisible="False" ReadOnly="True" SortExpression="koid" />
                        <asp:BoundField DataField="koname" HeaderText="顧客名" SortExpression="koname" />
                        <asp:BoundField DataField="furi" HeaderText="フリガナ" SortExpression="furi" />
                        <asp:BoundField DataField="birth" DataFormatString="{0:d}" HeaderText="生年月日" SortExpression="birth" />
                        <asp:BoundField DataField="telno" HeaderText="電話番号" SortExpression="telno" />
                        <asp:BoundField DataField="keitai" HeaderText="携帯" SortExpression="keitai" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [koid], [koname], [furi], [birth], [telno], [keitai] FROM [kokyaku] WHERE ([ttpcd] = @ttpcd)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ttpcd" PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
            </asp:View>
        </asp:MultiView>
    
    </div>
    </form>
</body>
</html>
