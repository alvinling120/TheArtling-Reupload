<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="EditProduct.aspx.cs" Inherits="TheArtling.EditProduct" %>

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
.textbox2{

    color:dimgrey;
	border-color:grey;
    font-size:16px;
	font-family:Georgia, "Times New Roman", Times, serif;
	height:30px;
    border-radius:5px;
    width:40%
}

.textbox3{

    color:dimgrey;
	border-color:grey;
    font-size:16px;
	font-family:Georgia, "Times New Roman", Times, serif;
	height:30px;
    border-radius:5px;
    width:20%
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
           <tr><td class="head">Edit <asp:Label ID="lblProd" runat="server" Text="Label"></asp:Label></td></tr>
           <tr>
                    <td colspan="2"><hr /></td>
                  </tr>
           <tr><td class="label">Product Image </td></tr>
           <tr><td class="text">
               
               <asp:Image ID="ImageProduct" runat="server" BorderColor="Black" Width="300px" Height="300px"/>
               <br />
               <asp:FileUpload ID="fuImage" runat="server" />
               
               </td></tr>
           <tr><td class="label" colspan="2">Product Name </td></tr>
           <tr><td class="text" colspan="2"><asp:TextBox ID="txtName" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td class="label" colspan="2">Description </td></tr>
           <tr><td class="text" colspan="2"><asp:TextBox ID="txtDesc" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td class="label" style="width:35%; padding-bottom:10px">Unit Price(RM)</td>
               <td style="text-align:left; padding-top:20px"> <asp:TextBox ID="txtPrice" runat="server" CssClass="textbox2"></asp:TextBox>
               </td></tr>
            <tr><td class="label" style="width:35%; padding-bottom:10px">Finished Year</td>
             <td style="text-align:left; padding-top:20px">
                 <asp:TextBox ID="txtYear" runat="server" CssClass="textbox2"></asp:TextBox>
               </td></tr>
           <tr><td colspan="2">
             <tr><td class="label" style="width:35%; padding-bottom:10px">Dimension</td>
             <td style="text-align:left; padding-top:20px">
                 <asp:TextBox ID="lblWidth" runat="server" CssClass="textbox3"></asp:TextBox>&nbsp; cm(W) &nbsp;x &nbsp;
                 <asp:TextBox ID="lblHeight" runat="server" CssClass="textbox3"></asp:TextBox>&nbsp; cm(H)
               </td></tr>
           <tr><td colspan="2">
               <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button"/>
               </td></tr>
       </table>
       </div>
     </div>
    </div>
</asp:Content>