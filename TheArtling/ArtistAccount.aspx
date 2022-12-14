<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="ArtistAccount.aspx.cs" Inherits="TheArtling.ArtistAccount" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<style>
.backg {
    background-attachment: fixed;
    background-size:cover;
    width:100%;
    background-image: url('../ImagesAndIcons/Images/pexels-photo-1084510.jpeg');
}

.styled-table {
    font-size: 0.9em;
    font-family: sans-serif;
    width:70%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 black;
    background-color:white;
    opacity:0.9;
    border-radius:5px;
    padding:20px;
    margin-bottom:50px;
}
    
.head{
    margin-top:30px;
    font-size:18px;
    color:royalblue;
    font-weight:bold;
    text-align:left;
    margin-bottom:20px;
}
    .label { 
     padding-left:20%;
     padding-top: 20px;
     text-align:left
    }
    .text{
      padding-left:20%;
      padding-bottom:10px;
      text-align:left
    }
    .textbox{
        color:dimgrey;
	border-color:grey;
    font-size:16px;
	font-family:Georgia, "Times New Roman", Times, serif;
	height:30px;
    border-radius:5px;
        width:70%
    }
.button{
	 font-family: Raleway, sans-serif;
	 height:40px;
	 width:200px;
	 border:none;
	 background-color:royalblue;
	 color:white;
	 font-size:12pt;
	 border: 1px solid white;
	 cursor:pointer;
	 display:inline-block;
	 border-radius: 5px;
     opacity:1;
}
.button:hover {
    background-color:dimgrey;
    color:white;
}

.parent{
    display: flex;
}
.left{
    height:100%;
    width:100%;
    text-align:center;
}
         

</style>
<div class="backg">
    <div class="parent">
        <div class="left">
       <table class="styled-table">
           <tr><td class="head">Artist Info</td></tr>
           <tr>
                <td colspan="2"><hr /></td>
           </tr>
           <tr><td class="label">Name </td></tr>
           <tr><td class="text">
               <asp:TextBox ID="txtName" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Country </td></tr>
           <tr><td class="text">
               <asp:DropDownList ID="ddlCountry" runat="server" CssClass="textbox"></asp:DropDownList>
           </td></tr>
           <tr><td class="label">Breifly describe your profile </td></tr>
           <tr><td class="text"><asp:TextBox ID="txtId" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Email </td></tr>
           <tr><td class="text"><asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Mobile Number </td></tr>
            <tr><td class="text"><asp:TextBox ID="txtMnum" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td>
               <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button"/>
               </td></tr>
       </table>


       </div>
     </div>
    </div>
</asp:Content>