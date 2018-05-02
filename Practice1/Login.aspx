<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">

<form id="form1" runat="server">

        <h2>&nbsp;</h2>
        <h2>Login</h2>
        <br />
        <asp:Label ID="lblUser" runat="server" Text="Username:"></asp:Label>
        <br />
        <asp:TextBox ID="txtLoginUsername" runat="server"></asp:TextBox>

        <br />
        <br />

        <asp:Label ID="lplPass" runat="server" Text="Password"></asp:Label>
        <br />
        <asp:TextBox ID="txtLoginPassword" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

        <br />
        <br />
        <asp:Literal ID="litLoginError" runat="server"></asp:Literal>

    </form>
</asp:Content>