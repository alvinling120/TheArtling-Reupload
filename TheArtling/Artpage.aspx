<%@ Page Title="" Language="C#" MasterPageFile="~/HeadAndFooter.Master" AutoEventWireup="true" CodeBehind="Artpage.aspx.cs" Inherits="TheArtling.Artpage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>Art Page<asp:Button ID="btnAddArt" runat="server" OnClick="btnAddArt_Click" PostBackUrl="~/AddArtwork.aspx" Text="Add Artwork" />
      <style>
        .Product{
            float:left;
            width:33.3333%;
            text-align:center;
            margin-left:10px;
            background-color:#EEE;
        }
        .lblproduct{
            display:block;
            margin-bottom:5px;
            
        }
    </style>
    <table>
        <tr><td>Product Name:</td><td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td></tr>
        <tr><td>Product Description:</td><td>
            <textarea id="TextArea" cols="20" name="S1" rows="2"></textarea></td></tr>
        <tr><td>Product Image:</td><td>
            <asp:FileUpload ID="fuImage" runat="server" />
            </td></tr>
        <tr><td>Quantity:</td><td>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            </td></tr>
        <tr><td>Unit Price:</td><td>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </td></tr>
        <tr><td></td><td>
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click1" Text="Add" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT * FROM [Products]" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductName], [ProductDescription], [ProductImage], [CategoryId], [UnitPrice], [Quantity], [Status]) VALUES (@ProductName, @ProductDescription, @ProductImage, @CategoryId, @UnitPrice, @Quantity, @Status)" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [ProductDescription] = @ProductDescription, [ProductImage] = @ProductImage, [CategoryId] = @CategoryId, [UnitPrice] = @UnitPrice, [Quantity] = @Quantity, [Status] = @Status WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDescription" Type="String" />
                    <asp:Parameter Name="ProductImage" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDescription" Type="String" />
                    <asp:Parameter Name="ProductImage" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" AllowPaging="True" OnRowUpdating="GridView2_RowUpdating">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="ProductDescription" HeaderText="ProductDescription" SortExpression="ProductDescription" />
                    <asp:TemplateField HeaderText="ProductImage" SortExpression="ProductImage">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ProductImage") %>' Height="20px" Width="20px"></asp:Image>
                        </ItemTemplate>
                        <EditItemTemplate>  
                            <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("ProductImage") %>'  
                                Height="20px" Width="20px" /><br />  
                            <asp:FileUpload ID="editImage" runat="server" />  
                        </EditItemTemplate>  
                    </asp:TemplateField>
                    <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>  
                <div class ="Product">
                    <asp:Image ID="image" runat="server" ImageUrl='<%#Eval("ProductImage") %>' Width="150px" Height="150px"/> 
                    <asp:Label ID="name" runat="server" Text='<%#Eval("ProductName") %>' class="lblproduct"/> 
                    <asp:Label ID="price" runat="server" Text='<%#Eval("UnitPrice") %>' class="lblproduct"/>
                </div>
            </ItemTemplate>  
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT [ProductName], [ProductImage], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
            
        </table>   
     
</div>
</asp:Content>
