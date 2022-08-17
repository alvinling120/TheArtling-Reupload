<%@ Page Title="" Language="C#" MasterPageFile="~/HeadAndFooter.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TheArtling.Cart" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
.mydatagrid {
    width: 90%;
    min-width: 80%;
    margin-top:10px;
    padding:20px;
    background-color:white;
    opacity:0.9;
    border-radius:5px;
}

.header {
    background-color: royalblue;
    font-family: Arial;
    color: white;
    border: none 1px white;
    height: 40px;
    text-align: left;
    font-size: 16px;
    padding:10px;
    border-radius:10px;
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
    padding:20px;
}

.rows:hover {
    background-color: #D2D9D5;
    font-family: Arial;
    color:black;
    text-align: left;
}

.selectedrow {
    background-color: #D2D9D5;
    font-family: Arial;
    color: #fff;
    font-weight: bold;
    text-align: left;
}

.mydatagrid a /** FOR THE PAGING ICONS **/ {
    background-color: Transparent;
    padding: 5px 5px 5px 5px;
    color: #fff;
    text-decoration: none;
    font-weight: bold;
}

    .mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
        background-color: #000;
        color: #fff;
    }

.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
    background-color: #c9c9c9;
    color: #000;
    padding: 5px 5px 5px 5px;
}

.pager {
    background-color: #646464;
    font-family: Arial;
    color: White;
    height: 30px;
    text-align: left;
}

.mydatagrid td {
    padding: 10px;
}

.mydatagrid th {
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
.styled-table {
    font-size: 0.9em;
    font-family: sans-serif;
    width:80%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 black;
    background-color:white;
    border-radius:5px;
    padding:20px;
}
.parent{
    display: flex;
}
.left{
    height:100%;
    width:80%;
    text-align:center;
     margin-bottom:50px;
}
.right{
    width:15%;
    right:5%;
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
.bcolor{
    background-color:white;
}

.transparent-style{
    background-color: rgba(255, 255, 255, .4);
}

.container {
  width: 100%;
  border-collapse:collapse;
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
}

</style>
<div class="backg">
    <div class="parent">
        <div class="left">
         
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowEditing="GridView1_RowEditing" CssClass="mydatagrid" PagerStyle-CssClass="pager" DataKeyNames="CartId"
         HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="Image" SortExpression="ProductImage" >
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ProductImage") %>' Height="80px" Width="80px"></asp:Image>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" readonly="true"/>
                        
                <asp:BoundField DataField="ProductPrice" HeaderText="Price(RM)" SortExpression="UnitPrice" readonly="true" DataFormatString="{0:N2}"/>
                 <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity" >
                     <ItemTemplate>
                          <asp:Label runat="server" ID="lblNum" Text='<%# Bind("Quantity") %>' CssClass="rows" BackColor="#F8F8F8"></asp:Label>
                     </ItemTemplate>
                     <EditItemTemplate>
                         <asp:Textbox runat="server" ID="quantity" Text='<%# Bind("Quantity") %>' style="width:50px;"></asp:Textbox>
                     </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TPrice" HeaderText="Total(RM)" SortExpression="TPrice" readonly="true" DataFormatString="{0:N2}"/>
                <asp:TemplateField HeaderText="Action">
                  <ItemTemplate>
                      <asp:ImageButton runat="server" Class="image" ImageUrl ="~/ImagesAndIcons/Icons/edit.svg" CommandName="Edit" ToolTip="Edit" Width="30px" Height="30px"/>
                      <asp:ImageButton runat="server" Class="image" ImageUrl ="~/ImagesAndIcons/Icons/bin.svg" CommandName="Delete" ToolTip="Delete" Width="30px" Height="30px"/>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:ImageButton runat="server" Class="image" ImageUrl ="~/ImagesAndIcons/Icons/save.svg" CommandName="Update" ToolTip="Update" Width="30px" Height="30px"/>
                      <asp:ImageButton runat="server" Class="image" ImageUrl ="~/ImagesAndIcons/Icons/cancel.svg" CommandName="Cancel" ToolTip="Cancel" Width="30px" Height="30px"/>
                  </EditItemTemplate>
               </asp:TemplateField>
           </Columns>
            
<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
        </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT Carts.CartId, Product.ProductName, Product.ProductImage, Product.ProductPrice, Carts.Quantity, Carts.TPrice FROM Carts INNER JOIN Product ON Product.ProductID = Carts.ProductID AND Carts.UserId = @id AND Carts.OrderId IS NULL">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </div>
        <div runat="server" class="right" style="height:50%" id="summary">
          <table class="styled-table">
                    <tr><td colspan="2" class="head pad">Order Summary</td></tr>
                     <tr>
                        <td colspan="2"><hr /></td>
                   </tr>
                <tr><td class="label" style="text-align:left">Item Totals</td><td class="label" style="text-align:right">
                        <asp:Label ID="lblItem" runat="server"></asp:Label>
                        </td></tr>
                    <tr><td class="label" style="text-align:left">Cart Totals(RM)</td><td class="label" style="text-align:right">
                        <asp:Label ID="lblTotal" runat="server" ></asp:Label>
                        </td></tr>
                 
                    <tr><td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="CheckOut" PostBackUrl="~/Shipping.aspx" CssClass="button"/>
                        </td></tr>
                </table>      
        </div>
    </div>
</div>
</asp:Content>
