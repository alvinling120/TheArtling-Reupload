<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="Payment.aspx.cs" Inherits="TheArtling.Payment" %>

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
      font-size:16px;
	    color:#666;
	    font-family:Georgia, "Times New Roman", Times, serif;
	    height:30px;
	    border-color:#DFDFDF;
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


    .auto-style6 {
        padding-left: 20%;
        padding-bottom: 10px;
        text-align: left;
        height: 38px;
    }


</style>

  <div class="backg">
    <div class="parent">
        <div class="left">
            <table class="styled-table">
           <tr><td class="head">Select Payment Method</td></tr>
            <tr style="border-bottom:1px solid black">
                    <td colspan="2"><hr /></td>
           </tr>
           <tr><td>
               <asp:Image ID="Image1" runat="server" ImageUrl="~/ImagesAndIcons/Icons/visa.svg" Height="100" Width="160" BorderColor="Black" />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Image ID="Image2" runat="server" ImageUrl="~/ImagesAndIcons/Icons/mastercard.svg" Height="100" Width="160" BorderColor="Black" />
               </td></tr>
           <tr><td class="label">Card Type</tr>
           <tr><td class="auto-style6">
               
               <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textbox">
                   <asp:ListItem>Select Card Type</asp:ListItem>
                   <asp:ListItem>Visa Card</asp:ListItem>
                   <asp:ListItem>Master Card</asp:ListItem>
               </asp:DropDownList>
               
               </td></tr>
           <tr><td class="label">Name on Card</td></tr>
           <tr><td class="text"><asp:TextBox ID="txtCard" runat="server" CssClass="textbox" Placeholder="Name"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Credit Card Number</td></tr>
           <tr><td class="text"><asp:TextBox ID="txtCardNo" runat="server" CssClass="textbox" Placeholder="Credit Card Number"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Expires</td></tr>
           <tr><td class="text"><asp:TextBox ID="txtExpiry" runat="server" CssClass="textbox" Placeholder="Expiry Date"></asp:TextBox>
               </td></tr>
           <tr><td class="label">Security Code </td></tr>
            <tr><td class="text"><asp:TextBox ID="txtCode" runat="server" CssClass="textbox"></asp:TextBox>
               </td></tr>
       </table>
       
       
        </div>
        <div class="right" style="height:50%">
          <table class="styled-table">
               <tr><td colspan="2" class="head pad">Summary</td></tr>
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
              <tr><td class="labelV" style="text-align:left; font-weight:bold">TOTAL</td><td class="labelV" style="text-align:right">
                    <asp:Label ID="lblTotalP" runat="server" Text="RM 8850.00" Font-Bold="True" Font-Size="Larger"></asp:Label>
                </td></tr>
                 <tr><td colspan="2">
                      <asp:Button ID="btnConfirm" runat="server" Text="Make Payment" CssClass="button" OnClick="btnConfirm_Click"/>
                 </td></tr>
            </table>      
        </div>
    </div>
</div>
</asp:Content>
