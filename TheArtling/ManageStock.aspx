<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="ManageStock.aspx.cs" Inherits="TheArtling.ManageStock" %>

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
    font-weight:bold;
    text-align:left;
    margin-bottom:20px;
}
.label { 
     padding-left:20%;
     padding-top: 20px;
     text-align:left
}
.label2{
    padding-top: 20px;
}
.text{
    padding-left:20%;
      padding-bottom:10px;
      text-align:left
    }
.textbox2{

    color:dimgrey;
	border-color:grey;
    font-size:16px;
	font-family:Georgia, "Times New Roman", Times, serif;
	height:30px;
    border-radius:5px;
    width:40%
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
           <tr><td class="head">Stock of <asp:Label ID="lblProd" runat="server" Text="Label"></asp:Label></td></tr>
           <tr>
                    <td colspan="2"><hr /></td>
                  </tr>
           
           <tr><td style="text-align:center" colspan="2">
               <asp:Image ID="ImageProduct" runat="server" BorderColor="Black" Width="200px" Height="200px"/>
               </td></tr>
           <tr><td style="text-align:center" colspan="2"><asp:Label ID="lblName" runat="server"/>
               </td></tr>
           <tr><td class="label" style="width:35%; padding-bottom:10px">Current Quantity </td>  
               <td style="text-align:left; padding-bottom:10px" class="label2"><strong><asp:Label runat="server" ID="lblQuantity"/></strong>
               </td></tr>
           <tr><td class="label" style="width:35%; padding-bottom:10px">Quantity AddOn </td>
               <td style="text-align:left"><asp:TextBox ID="txtAddon" runat="server" CssClass="textbox2"></asp:TextBox>
               </td></tr>
          
           <tr><td colspan="2">
               <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="button"/>
               </td></tr>
       </table>
       </div>
     </div>
    </div>
</asp:Content>
