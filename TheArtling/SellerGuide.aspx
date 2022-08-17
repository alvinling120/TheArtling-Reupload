<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="SellerGuide.aspx.cs" Inherits="TheArtling.SellerGuide" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Layout/sellerGuide.css" rel="stylesheet" type="text/css"/>
    <link href="Layout/common.css" rel="stylesheet" type="text/css"/>
<style>
.styled-table {
    width:70%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 black;
    background-color:white;
    border-radius:5px;
    padding:20px;
}
.button{
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

.textbox{
      font-size:16px;
	  color:dimgrey;
	  font-family:Georgia, "Times New Roman", Times, serif;
	  border-color:grey;
      border-radius:5px;
}
</style>
<div class="backg">
    <div class="parent">
        <div class="left">
        <div class="contentSG styled-table">

         <p style="text-align:left;font-size:18px;"><b>Seller Guide </b></p>

         <hr />
         <div class="subContSG">

         Welcome to The Artling. To start your journey as a seller in The Artling, you must complete the account registration with phone number and <b>email</b> included.
             <br />
             <a href="ArtistAccount.aspx">Complete My Account</a>
       
             <br />   <br />   <br />
             <b style="font-size:16px;">Common FAQs regarding Selling Art</b>
             <hr />
             <br /> <br />
                         <b class="questionSG">Question:</b> What payment do I need to perform if I wanted to sell my art?
                         <br />
 
                         You will have to pay a one-time promotional fee of RM20. After that, no payment shall be needed until the artwork was sold.
                          <br /><br />


                 <b class="questionSG">Question:</b> How much of % earnings that I'll have to pay this website upon selling my art successfully?
                 <br />
                 A 5% charge from total price of the art  will be carried on the payment received by artist. 
                  <br /><br />

                 <b class="questionSG">Question:</b> How long will my art be promoted on the website?
                 <br />
                 There will be no time/day limit for the promotional period. Your art will be put on available until it was sold, unless your account was terminated due to terms breach or other reasons.
                 <br /><br />

                  <b class="questionSG">Question:</b> What are the acceptable format(s) / extension(s) for the art?
                 <br />
                 The only acceptable format / extension for art upload for sell is .JPG and .JPEG.
                  <br /><br />

                  <b class="questionSG">Question:</b> Can I remove my art after uploading it if I decided not to sell it?
                 <br />
                 Yes. However, the promotional cost will not be refunded.
                  <br /><br />
                
                
             <p> Have other questions? Drop it here and we will respond as soon as possible. </p>
             <asp:TextBox ID="tbQuestionSG" runat="server" Width="90%" CssClass="textbox"></asp:TextBox><asp:Button ID="btnSubmitQuestionSG" runat="server" Text="Submit" CssClass="button" Height="30px"/>
             <br />
             <p>Don't hesitate to send us an email at <b>theartlingofficial@gmail.com</b> for more FAQs.</p>



             </div>
           </div>
        </div>
    </div>
</div>
</asp:Content>
