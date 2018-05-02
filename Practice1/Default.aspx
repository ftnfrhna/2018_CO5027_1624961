<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <form id="form1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
            <img src="/ProductImages/<%#Eval("ProductId") %>.jpg" width="300" height="300" /><br />
                <p style="font-size: larger"><strong>Available size:</strong></p>
                <p>&nbsp;</p>
                <p>  
                <a href="<%#Eval("ProductId","Product.aspx?Id={0}") %>"></a></p>
                <p><h3>Quantity:</h3><%#Eval("Quantity") %></p>
                <p><h3>Price:</h3><%#Eval("ProductPrice") %></p>
             </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_1624961_co5027_asgConnectionString %>" SelectCommand="SELECT * FROM [tbl_Product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_1624961_co5027_asgConnectionString %>" SelectCommand="SELECT * FROM [tbl_Product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_1624961_co5027_asgConnectionString %>" SelectCommand="SELECT * FROM [tbl_Product]"></asp:SqlDataSource>
        <br />
    </form>
</asp:Content>
