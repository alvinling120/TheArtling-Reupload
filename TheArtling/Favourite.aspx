<%@ Page Language="C#" MasterPageFile="~/HeadAndFooter.Master" AutoEventWireup="true" CodeBehind="Favourite.aspx.cs" Inherits="TheArtling.Favourite" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="Layout/table.css" rel="stylesheet" type="text/css"/>
<style>
.Product{
   float:left;
   width:200px;
   height:250px;
   text-align:center;
   margin-left:50px;
   background-color:white;
   margin-top:25px;
   margin-bottom:20px;
   box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
   border-radius:5px;
}
.Product:hover{
   box-shadow: 1px 1px 1px 1px grey;
   cursor:pointer
}
.lblproduct{
   display:block;
   margin-bottom:3px;
}
.backg {
    background-attachment: fixed;
    text-align:center;
    width:100%;
    background-size:cover;
    background-image: url('../ImagesAndIcons/Images/pexels-photo-1084510.jpeg');
}
.image{
   border-radius:5px;
}
.icon{
}
.parent{
    display: flex;
}
.left{
    height:100%;
    width:100%;
    text-align:center;
}
a{
    color:black;
}
</style>
    <div class="backg">
        <div class="parent">
        <div class="left">
         <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
              <ItemTemplate>  
                <a href="ProductCart.aspx?4=4&id=<%# Eval("ProductID") %>">
                    <div class ="Product">
                        <asp:Image ID="image" runat="server" ImageUrl='<%#Eval("ProductImage") %>' Width="200px" Height="200px" CssClass="image"/> 
                        <asp:Label ID="name" runat="server" Text='<% # Eval("ProductName").ToString().Length <= 20 ? Eval("ProductName") : Eval("ProductName").ToString().Substring(0, 20)+"..." %>' class="lblproduct"/> 
                        <asp:ImageButton ID="imagebtn" runat="server" ImageUrl="~/ImagesAndIcons/Icons/heart.svg" class="lblproduct" Width="20px" Height="20px" ToolTip="Remove" CommandArgument='<%#Eval("ProductID") %>' CommandName="img" ImageAlign="Right" CssClass="icon" />
                     </div>
                 </a>
            </ItemTemplate>  
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT Product.ProductID, Product.ProductName, Product.ProductImage FROM Favourites INNER JOIN Product ON Product.ProductID = Favourites.ProductId AND Favourites.userId = @id">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
         
       
        </div>
     </div>
    </div>
</asp:Content>

