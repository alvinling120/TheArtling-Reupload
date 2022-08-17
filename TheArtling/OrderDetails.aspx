<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="OrderDetails.aspx.cs" Inherits="TheArtling.OrderDetails" %>

<asp:Content ID="Content10" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

.header {
    background-color:royalblue;
    color: white;
    border: none 0px transparent;
    height: 40px;
    text-align: left;
    font-size: 18px;
    padding:10px;
    border-radius:10px;
    opacity:0.95
}

.rows {
    font-size: 16px;
    color: #000;
    min-height: 25px;
    text-align: left;
    border: none 0px transparent;
    border-bottom: none 5px grey;
    border-bottom-width:medium;
}

.rows:hover {
    background-color: #D2D9D5;
    color:black;
    text-align: left;
}


.styled-table td {
    padding: 10px;
}

.styled-table tr {
    padding: 10px;
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
    width:65%;
    text-align:center;
    margin-bottom:50px;
}
.right{
    width:35%;
    right:65%;
    top:10%;
    margin-bottom:50px;
}

.head{
    margin-top:20px;
    font-size:18px;
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
.label{
    padding-bottom:30px;
}
.styled-table {
    width:90%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 black;
    background-color:white;
    border-radius:5px;
    padding:20px;
}


</style>
<div class="backg">
    <div class="parent">
        <div class="left">
            
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <HeaderTemplate>
                    <table class="styled-table">
                         <tr class="header">
                            <td>Product Image</td>
                            <td>Name</td>
                             <td>Quantity</td>
                            <td style="text-align:center">Unit Price(RM)</td>
                            
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="rows">
                        <td><asp:Image ID ="image" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Height="80" Width="80" /></td>
                    <td><%# Eval("ProductName") %></td>
                    <td><%# Eval("Quantity") %></td>
                    <td style="text-align:right"><%# Eval("ProductPrice", "{0:0.00}") %></td></tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT Product.ProductImage, Product.ProductName, Orders.GrandTotal, Carts.Quantity, Product.ProductPrice FROM Carts INNER JOIN Product ON Carts.OrderId = @id AND Carts.ProductID = Product.ProductID INNER JOIN Orders ON Orders.OrderID = Carts.OrderId">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="Id" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            
       <br />
            <br />
   
            
             </div>

        <div class="right" style="height:50%">
             <table class="styled-table">
                    <tr><td colspan="2" class="head pad">Shipping Information</td></tr>
                     <tr>
                        <td colspan="2"><hr /></td>
                   </tr>
                <tr><td class="label" style="text-align:left; width:20%">Address</td><td class="label" style="text-align:left">
                        <asp:Label ID="lblAddress" runat="server" ></asp:Label>
                        </td></tr>
                    <tr><td class="label" style="text-align:left">City</td><td class="label" style="text-align:left">
                        <asp:Label ID="lblCity" runat="server" ></asp:Label>
                        </td></tr>
                  <tr><td class="label" style="text-align:left">State</td><td class="label" style="text-align:left">
                        <asp:Label ID="lblState" runat="server" ></asp:Label>
                        </td></tr>
                     <tr><td class="label" style="text-align:left">Country</td><td class="label" style="text-align:left">
                        <asp:Label ID="lblCountry" runat="server" ></asp:Label>
                        </td></tr>
                    <tr>
                        <td colspan="2"><hr /></td>
                    <tr><td class="head pad">Order Total</td> <td class="head pad" style="text-align:right">RM</td></tr>
                     <tr>
                        <td colspan="2"><hr /></td>
                   </tr>
                <tr><td class="label" style="text-align:left; width:20%">Product Total</td>
                    <td class="label" style="text-align:right">
                        <asp:Label ID="lblPTotal" runat="server" ></asp:Label>
                        </td></tr>
                    <tr><td class="label" style="text-align:left">Shipping Fee</td>
                        <td class="label" style="text-align:right">
                        <asp:Label ID="lblShip" runat="server" ></asp:Label>
                        </td></tr>
                        <tr><td colspan="2"><hr /></td>
                   </tr>
                    <tr><td class="label" style="text-align:left; width:30%">Order Total</td>
                        <td class="label" style="text-align:right">
                        <strong><asp:Label ID="lblOTotal" runat="server" ></asp:Label></strong>
                        </td></tr>
                </table> 
        </div>
    </div>
</div>
</asp:Content>

