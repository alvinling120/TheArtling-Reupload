<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="ProductCart.aspx.cs" Inherits="TheArtling.ProductCart" %>

<asp:Content ID="Content10" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>

.header {
    background-color:royalblue;
    font-family: Arial;
    color: white;
    border: none 0px transparent;
    height: 40px;
    text-align: left;
    font-size: 16px;
    padding:10px;
    border-radius:10px;
    opacity:0.95
}

.rows {
    font-family: Arial;
    font-size: 14px;
    color: #000;
    min-height: 25px;
    text-align: left;
    border: none 0px transparent;
    border-bottom: none 5px grey;
    border-bottom-width:medium;
}

.rows:hover {
    background-color: #D2D9D5;
    font-family: Arial;
    color:black;
    text-align: left;
    cursor:pointer;
}


.styled-table td {
    padding: 5px;
}

.styled-table tr {
    padding: 5px;
}

.icon {
    padding-right: 10px
}
.image{
    margin-left:10px;
    width:15px;
}
.backg {
    background-attachment: fixed;
    text-align:center;
    width:100%;
    background-size:cover;
    background-image: url('../ImagesAndIcons/Images/pexels-photo-1084510.jpeg');
}
.parent{
    display: flex;
}
.left{
    height:100%;
    width:50%;
    text-align:right;
    margin-bottom:50px;
    padding-top:20px;
}
.right{
    width:30%;
    left:50%;
    text-align:left;
    margin-bottom:50px;
    padding: 10px;
}

.head{
    margin-top:20px;
    font-size:18px;
    color:royalblue;
    font-weight:bold;
    text-align:left;
    margin-bottom:20px;
}

.button{
	height:40px;
	width:200px;
	border:none;
	background-color:royalblue;
	color:white;
	font-size:12pt;
	border: 1px solid white;
	cursor:pointer;
	display:inline-block;
	border-radius: 20px;
}

.button:hover {
    background-color:dimgrey;
    color:white;
}
.pad{
    padding-top:20px;
    padding-bottom:10px;
}
.label{
    padding-bottom:30px;
}
.styled-table {
    width:100%;
    margin-top:10px;
    padding:20px;
    border-radius:5px;
    background-color:white;
    box-shadow: 0 8px 16px 0 grey;
}

.heading{
    font-weight:bold;
}

.name{
    font-weight:bold;
    font-size:30px;
}
.icon{
    padding-right:20px;
}


</style>
<div class="backg">
    <div class="parent">
        <div class="left">
            <asp:Image ID="ProductImage" runat="server" Height="500px" Width="500px" />
        </div>
        <div class="right">
           <table class="styled-table">
               <tr><td colspan="2">
                   <asp:Label ID="lblName" runat="server" CssClass="name"></asp:Label></td></tr>
               <tr><td>by <asp:HyperLink ID="hlArtist" runat="server" NavigateUrl='<%# "ArtistProfile.aspx?ID=" + Request.QueryString["aid"]%>'>HyperLink</asp:HyperLink></td><td style="text-align:right">
                   <asp:ImageButton ID="Favourite" runat="server" ImageUrl="~/ImagesAndIcons/Icons/favorite.svg" Width="30px" Height="30px" CssClass="icon" ToolTip="Add to Favourite" OnClick="Favourite_Click"/>
                   <asp:ImageButton ID="Remove" runat="server" ImageUrl="~/ImagesAndIcons/Icons/heart.svg" Width="30px" Height="30px" CssClass="icon" ToolTip="Remove from Favourite" OnClick="Remove_Click"/>
               </td></tr>
               <tr><td><asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label></td><td style="text-align:right">
                   <asp:Button ID="btnCart" runat="server" Text="Add to Cart" CssClass="button" OnClick="btnCart_Click"/></td></tr>
               <tr><td colspan="2"><hr /></td></tr>
               <tr><td colspan="2" class="heading">OVERVIEW</td></tr>
               <tr><td colspan="2"><hr /></td></tr>
               <tr><td colspan="2">
                   <asp:Label ID="lblYear" runat="server" Text="Label"></asp:Label></td></tr>
               <tr><td colspan="2">
                   <asp:Label ID="lblCategory" runat="server" Text="Label"></asp:Label></td></tr>
               <tr><td colspan="2"><strong>Dimensions: </strong>
                   <asp:Label ID="lblDimension" runat="server" Text="Label"></asp:Label></td></tr>
               <tr><td colspan="2" style="font-size:12px">Note: Actual colours may vary due to photography & computer settings.</td></tr>
               <tr><td colspan="2"><hr /></td></tr>
               <tr><td colspan="2" class="heading">ARTIST DESCRIPTION</td></tr>
               <tr><td colspan="2"><hr /></td></tr>
               <tr><td colspan="2">
                   <asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label></td></tr>
               <tr><td colspan="2"><hr /></td></tr>
               <tr><td colspan="2" class="heading">SHIPPING & RETURNS</td></tr>
               <tr><td colspan="2"><hr /></td></tr>
               <tr><td colspan="2" style="font-size:12px; font-weight:bold">SHIPPING</td></tr>
               <tr><td colspan="2" style="font-size:12px">Please note that this item is unframed and will be shipped rolled</td></tr>
               <tr><td colspan="2" style="height:10px"></td></tr>
               <tr><td colspan="2" style="font-size:12px; font-weight:bold">RETURNS</td></tr>
               <tr><td colspan="2" style="font-size:12px">This item is not eligible for returns.</td></tr>
           </table>
        </div>
    </div>
</div>
</asp:Content>

