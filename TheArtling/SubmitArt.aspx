<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="SubmitArt.aspx.cs" Inherits="TheArtling.SubmitArt" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Layout/submitArt.css" rel="stylesheet" type="text/css"/>
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
     <div class="contentSA styled-table">
            <p style="text-align:left;font-size:18px;"><b>Submit your Art </b></p>
            <hr />
        <div class="artistquoteSA fontforallSA" >
            <table>
                <tr>
                    <td class="styleImageSA">
                        <asp:Image class="imgcontainer" ID="artquote1" runat="server" ImageUrl="~/ImagesAndIcons/Images/evearnold.jpg" />
                    </td>
                    <td class="styleTextSA">
                        <p style="font-size:20px">“If the photographer is interested in the people in front of his lens, and if he is compassionate, it’s already a lot. The instrument is not the camera but the photographer.”</p>
                        <p style="text-align:center">Eve Arnold<br /> American Photojournalist.</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="styleImageSA">
                        <asp:Image class="imgcontainerSA" ID="artquote2" runat="server" ImageUrl="~/ImagesAndIcons/Images/romerobritto.jpg" />
                        
                    </td>   
                    <td class="styleTextSA">
                        <p style="font-size:20px">“Art is too important not to share.”</p>
                         <p style="text-align:center">Romero Britto<br /> Brazillian Artist, Serigrapher.</p>
                    </td>
                </tr>
            </table>
              
        </div>
        <div class="fontforallSA bottomcontentSA" style="text-align:left">
             <p>Everyone was born with a creative mind. Here, we respect all the artist and gratefully accepts art from whoever thinks their art are worth selling and sharing. </p>
            </div>
             <hr />

             <div class="fontforallSA bottomcontentSA" style="text-align:left">
    
             <p>
                 <b style="font-size:18px; ">Artwork Submission </b>
                 <br /><br />
                     Basic Terms:
                     <p style="font-size:15px">
                     - Seller must have fully detailed personal account, including names and bank account number(for payment purpose)."
                         <br /> <br />
                     - Each submitted artwork will cost RM20 promotional cost.
                         <br /> <br />
                     - Upon purchase from another seller, a 5% charge will be reduced from total payment from the customer.
                        <br /> <br />
                     - For further details, please check out our <a  href="SellerGuide.aspx" target="_blank">Seller Guide</a> for more terms and conditions.
                 </p>

            <asp:CheckBox ID="cbTermsSA" Checked="true"  runat="server" OnCheckedChanged="cbTerms_CheckedChanged" AutoPostBack="True" />&nbsp;I have read the <a href="#" target="_blank">Terms and Conditions</a> and fully agreed on Terms of Use and Privacy Policy.<br />
             <br />
           <div class="hiddenInformationSA" ID="hiddenInfo" visible="false" >
                <table >
                    <tr>
                        <td style="height:20px;">
                            Name : 
                        </td>
                        <td>
                            <asp:TextBox ID="artistnameSA" runat="server" Width="452px" OnTextChanged="artistname_TextChanged" ReadOnly="True" Height="25px" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="rfvname" ErrorMessage="Username is Required" ControlToValidate="artistnameSA">*</asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            Finished Year : 
                        </td>
                        <td>
                            <asp:TextBox ID="artYearSA" runat="server" MaxLength="4" Width="452px" ReadOnly="True" Height="25px" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="rfvyear" ErrorMessage="Age is Required" ControlToValidate="artYearSA">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ForeColor="Red" ID="rvyear" runat="server" ErrorMessage="Year must be between 1900-2021" 
                ControlToValidate="artYearSA" MinimumValue="1900" MaximumValue="2021" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProductCategory" DataValueField="CategoryID" Width="150px" Height="25px" CssClass="textbox"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT [ProductCategory], [ProductType], [CategoryID] FROM [Category]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Dimension : 
                        </td>
                        <td>
                            <asp:TextBox ID="artHeightSA" runat="server" MaxLength="4" Width="150px" ReadOnly="True" Height="25px" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ErrorMessage="Height is Required" ControlToValidate="artHeightSA">*</asp:RequiredFieldValidator>
                            cm (Height) x 
                            <asp:TextBox ID="artWidthSA" runat="server" MaxLength="4" Width="150px" ReadOnly="True" Height="25px" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ForeColor="Red" ErrorMessage="Width is Required" ControlToValidate="artWidthSA">*</asp:RequiredFieldValidator>
                            cm (Width)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Price (RM) : 
                        </td>
                        <td>
                            <asp:TextBox ID="artPriceSA" runat="server" MaxLength="4" OnTextChanged="artPrice_TextChanged" Width="452px" ReadOnly="True" Height="25px" CssClass="textbox"></asp:TextBox>
                            <asp:CompareValidator runat="server" id="compPrimeNumberPositive" Operator="GreaterThan" Type="Currency" Display="Dynamic" ForeColor="Red" ValueToCompare="0" ControlToValidate="artPriceSA" ErrorMessage = "Price must be greater than zero." />
                        </td>
                    </tr>
                    <tr>
                        <td>Highlights/Statement :</td>
                        <td>
                            <asp:TextBox ID="artStatementSA" runat="server"  Width="452px" Height="25px" ReadOnly="True" placeholder="Description of your art" CssClass="textbox"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>Choose Your Image :</td>
                        <td>

                         <asp:FileUpload ID="fuImage"  runat="server" accept=".jpg,.jpeg" />
                        </td>
                    </tr>

                </table>
                <br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="btnAgree" runat="server" Enabled="false" OnClick="btnAgree_Click" CssClass="button" Text="Proceed" Height="30px" Width="100px" />
            </div>
        </div>
         </div>
       </div>
    </div>
</div>
</asp:Content>