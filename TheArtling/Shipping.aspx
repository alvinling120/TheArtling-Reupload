<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="Shipping.aspx.cs" Inherits="TheArtling.Shipping" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
.label { 
     padding-left:20%;
     padding-top: 20px;
     text-align:left
    }
.text{
      padding-left:20%;
      padding-bottom:10px;
      text-align:left;
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
.backg {
    background-attachment: fixed;
    text-align:center;
    width:100%;
    background-size:cover;
    background-image: url('../ImagesAndIcons/Images/pexels-photo-1084510.jpeg');
}
.styled-table {
    font-size: 0.9em;
    font-family: sans-serif;
    width:80%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 black;
    background-color:white;
    opacity:0.9;
    border-radius:5px;
    padding:20px;
    margin-bottom:50px;
}
.parent{
    display: flex;
}
.left{
    height:100%;
    width:80%;
    text-align:center;
}
.right{
    width:15%;
    right:5%;
    top:10%;
}

.head{
    margin-top:30px;
    font-size:18px;
    font-weight:bold;
    text-align:left;
    margin-bottom:20px;
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
        }

.button:hover {
    background-color:dimgrey;
    color:white;
}
.pad{
    padding-top:20px;
    padding-bottom:10px;
}

.labelV{
    padding-bottom:30px;
}


</style>

  <div class="backg">
    <div class="parent">
        <div class="left">
            <table class="styled-table">
           <tr><td class="head">Shipping Information</td></tr>
          <tr style="border-bottom:1px solid black">
                    <td colspan="2"><hr /></td>
                  </tr>
           <tr><td class="label">Name </td></tr>
           <tr><td class="text">
               <asp:TextBox ID="txtName" runat="server" CssClass="textbox" Placeholder="Receiver Name"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Address </td></tr>
           <tr><td class="text"><asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Placeholder="Address"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Poscode </td></tr>
           <tr><td class="text"><asp:TextBox ID="txtPoscode" runat="server" CssClass="textbox" Placeholder="Poscode"></asp:TextBox>
               </td></tr>
           <tr><td class="label">City </td></tr>
           <tr><td class="text"><asp:TextBox ID="txtCity" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
           <tr><td class="label">State </td></tr>
            <tr><td class="text"><asp:TextBox ID="txtState" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
            <tr><td class="label">Country </td></tr>
            <tr><td class="text"><asp:DropDownList ID="ddlCountry" runat="server" CssClass="textbox"></asp:DropDownList>
               </td></tr>
            <tr><td class="label">Mobile Number </td></tr>
            <tr><td class="text"><asp:TextBox ID="txtNum" runat="server" CssClass="textbox" Placeholder="Mobile Number"></asp:TextBox>
               </td></tr>
       </table>
       
       
        </div>
        <div class="right" style="height:50%">
          <table class="styled-table">
               <tr><td class="head pad" colspan="2">Check Out</td></tr>
               <tr style="border-bottom:1px solid black">
                    <td colspan="2"><hr /></td>
                  </tr>
               <tr><td class="labelV" style="text-align:left"></td><td class="labelV" style="text-align:right">
                    RM
                </td></tr>
               <tr><td class="labelV" style="text-align:left">Cart Totals</td><td class="labelV" style="text-align:right">
                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </td></tr>
              <tr><td class="labelV" style="text-align:left">Shipping Fee</td><td class="labelV" style="text-align:right">
                    <asp:Label ID="lblShipping" runat="server" Text="50.00"></asp:Label>
                </td></tr>
              <tr style="border-bottom:1px solid black">
                    <td colspan="2"><hr /></td>
                  </tr>
              <tr><td class="labelV" style="text-align:left">Total Costs</td><td class="labelV" style="text-align:right">
                    <asp:Label ID="lblCost" runat="server"></asp:Label>
                </td></tr>
                 <tr><td colspan="2">
                      <asp:Button ID="Button1" runat="server" Text="Confirm" CssClass="button" OnClick="Button1_Click"/>
                 </td></tr>
            </table>      
        </div>
    </div>
</div>
</asp:Content>
