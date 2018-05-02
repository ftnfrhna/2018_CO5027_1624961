<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <form id="form1" runat="server">

<h2>Register</h2>

    <p>Please fill in the form to create an account.</p>

    <asp:Label ID="lblRegUsername" runat="server" Text="Username"></asp:Label>
        <br />
    <asp:TextBox ID="txtRegUsername" runat="server"></asp:TextBox>

        <br />
        <br />

    <asp:Label ID="lblRegPassword" runat="server" Text="Password"></asp:Label>
    <br />
    <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password"></asp:TextBox>

    <br />
    <br />

    <asp:Button ID="btnReg" runat="server" Text="Register" OnClick="btnReg_Click" />

    <br />
    <br />

    <asp:Literal ID="litRegisterError" runat="server"></asp:Literal>
    </form>

</asp:Content>
