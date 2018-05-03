<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <form id="form1" runat="server">
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_1624961_co5027_asgConnectionString %>" SelectCommand="SELECT * FROM [tbl_Product]"></asp:SqlDataSource>
        <asp:Repeater ID="ProductList" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate><ul></HeaderTemplate>
            <ItemTemplate>
                <ul class="repeater">
                    <li>
                    <p><img src="/ProductImages/<%#Eval("ProductId") %>.jpg" alt="<%#Eval("ProductId") %>" width="200" height="200" /></p>
                    <a href="<%#Eval("ProductId", "Product.aspx?ProductId={0}")%>">
                        <h3>Product Name:</h3><%#Eval("ProductName")%></a>
                      <p><h3>Product Price</h3> <%#Eval("ProductPrice")%></p> 
                       <p><h3>Quantity</h3> <%#Eval("Quantity")%></p>
                    </li>
                 </ul>
    </ItemTemplate>
            <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>
            </form>
</asp:Content>

