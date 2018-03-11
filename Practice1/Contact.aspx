<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <form id="form1" runat="server">
        <div class="container">
     <div class="row">
      <div class="column">
          <h2>Message Form</h2>
          <asp:Label ID="Label1" runat="server" Text="Subject"></asp:Label>
          <br />
          <br />
          <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
          <br />
          <br />
          <asp:Label ID="Label2" runat="server" Text="Message"></asp:Label>
          <br />
          <br />
          <asp:TextBox ID="txtBody" runat="server"></asp:TextBox>
          <br />
          <br />
          <asp:Button ID="btnSendEmail" runat="server" Text="Submit" OnClick="btnSendEmail_Click" />
          <br />
          <br />
          <asp:Literal ID="Literal1" runat="server"></asp:Literal>
      </div>
         
      <div class="column">
          <h2>Map</h2>
          <p>Will put the map around here</p>
      </div>
       
    </div>  
    </div>
        
    
    </form>
</asp:Content>

