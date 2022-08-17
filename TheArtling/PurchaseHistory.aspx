<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="PurchaseHistory.aspx.cs" Inherits="TheArtling.PurchaseHistory" %>

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
    font-size: 18px;
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
    cursor:pointer;
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
    width:100%;
    text-align:center;
    margin-bottom:50px;
}
.right{
    width:15%;
    right:5%;
    top:10%;
    margin-bottom:50px;
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
.label{
    padding-bottom:30px;
}
.styled-table {
    width:70%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 black;
    background-color:white;
    opacity:0.9;
    border-radius:5px;
    padding:20px;
}


</style>
<div class="backg">
    <div class="parent">
        <div class="left">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table class="styled-table">
                         <tr class="header">
                            <td>Order Id</td>
                            <td>Order Date</td>
                            <td>Total(RM)</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="rows" onclick='window.location = "<%# ResolveClientUrl( "~/OrderDetails.aspx?Id=" + Eval("OrderId") ) %>"'>
                        <td><%# Eval("OrderID") %></td>
                    <td><%# Eval("OrderCreatedDate") %></td>
                    <td><%# Eval("GrossTotal", "{0:0.00}") %></td></tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT [OrderCreatedDate], [GrossTotal], [OrderID] FROM [Orders] WHERE Orders.UserID = @id">
                <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            
       
        </div>
    </div>
</div>
</asp:Content>
