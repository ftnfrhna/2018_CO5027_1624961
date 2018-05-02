<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <form id="form1" runat="server">
       
      <div class="column">
          <h2>Message Form</h2>
          <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
          <br />
          <br />
          <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
          <br />
          <br />
          <asp:Label ID="lblBody" runat="server" Text="Message"></asp:Label>
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
         
     
          <h2>Map</h2>
          <div id="map"></div>

          <script>
              function myMap() {
                  var myLatLng = { lat: 4.8857309, lng: 114.9316692 };

                  var map = new google.maps.Map(document.getElementById('map'), {
                      zoom: 15,
                      center: myLatLng
                  });

              var marker = new google.maps.Marker({
                  position: myLatLng,
                  map: map,
                  title: 'Hello!'
              });

              }

          </script>

          <script src ="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_jpb_Bcoe2JUtfBP4qu3CP7pZ09KmK_w&callback=myMap">

          </script>
      </form>
</asp:Content>

