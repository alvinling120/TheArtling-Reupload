<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="DrawingPage.aspx.cs" Inherits="TheArtling.DrawingPage" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Layout/common.css" rel="stylesheet" type="text/css" />
    <link href="Layout/shop_layout.css" rel="stylesheet" type="text/css" />
    <style>

</style>
    <div class="backg">
        <div class="parent">
            <div class="left">
                <div style="font-size: 20px; font-weight: 600;">
                    Original Contemporary Drawing for Sale
                </div>
                <br />
                <div class="content-wrapper">
                    <table>
                        <tr>
                            <td>
                                <div class="filter">
                                    <div>
                                        Artist
                                    </div>
                                    <div style="height: 10px;"></div>
                                    <div>
                                        <asp:DropDownList ID="ddlArtist" runat="server" BackColor="#E5E5E5" ForeColor="Black" CssClass="ddl" DataSourceID="ArtistDatabase" DataTextField="ArtistName" DataValueField="ArtistID" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlArtist_SelectedIndexChanged">
                                            <asp:ListItem>Any Artist</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="ArtistDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT [ArtistName], [ArtistID] FROM [Artist]"></asp:SqlDataSource>
                                    </div>
                                    <div style="height: 10px; border-bottom: 2px dashed #D2D9D5"></div>
                                    <br />
                                    <div>
                                        Category
                                    </div>
                                    <div style="height: 10px;"></div>
                                    <div>
                                        <asp:DropDownList ID="ddlCategory" runat="server" BackColor="#E5E5E5" ForeColor="Black" CssClass="ddl" AutoPostBack="true" AppendDataBoundItems="true" DataSourceID="CategoryDatabase" DataTextField="ProductCategory" DataValueField="CategoryID">
                                            <asp:ListItem>Any Category</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="CategoryDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT * FROM [Category] WHERE [ProductType]='Drawing'"></asp:SqlDataSource>
                                    </div>
                                    <div style="height: 10px; border-bottom: 2px dashed #D2D9D5"></div>
                                    <br />
                                    <div>
                                        Size
                                    </div>
                                    <div style="height: 10px;"></div>
                                    <div class="slide-container">
                                        <div style="font-size: 16px;">Width</div>
                                        <input type="range" class="rangeslide" id="widthRangeSlider" min="0" max="500" value="500" style="width: 100%;" />
                                        <div style="margin-left: 180px;" id="productWidth">500</div>
                                    </div>
                                    <div style="height: 10px;"></div>
                                    <div class="slide-container">
                                        <div style="font-size: 16px;">Height</div>
                                        <input type="range" class="rangeslide" id="heightRangeSlider" min="0" max="500" value="500" style="width: 100%;" />
                                        <div style="margin-left: 180px;" id="productHeight">500</div>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 20px;"></td>
                            <td>
                                <div class="product-holder">
                                    <asp:SqlDataSource ID="ProductDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:ArtConnectionString %>" SelectCommand="SELECT Product.ProductName, Product.ProductImage, Product.ProductPrice, Product.ProductCategory, Product.ArtistID, Artist.ArtistName, Artist.ArtistHometown FROM Product INNER JOIN Artist ON Product.ArtistID = Artist.ArtistID"></asp:SqlDataSource>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <%# (Container.ItemIndex != 0 && Container.ItemIndex % 3 == 0) ? @"<div></div>" : string.Empty %>
                                            <a href="/ProductCart.aspx?3=3&Id=<%# Eval("ProductID") %>">
                                                <div class="product-item">
                                                    <img src="<%# Eval("ProductImage") %>" style="width: 100%; height: 300px;" />
                                                    <asp:Label ID="lblProductName" runat="server" CssClass="product-name"><%# Eval("ProductName") %></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblArtistName" runat="server" CssClass="product-artist"><%# Eval("ArtistName") %>, </asp:Label>
                                                    <asp:Label ID="lblArtistHometown" runat="server"><%# Eval("ArtistHometown") %></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblProductCategory" runat="server" CssClass="product-cat"><%# Eval("ProductCategory") %></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblProductPrice" runat="server" CssClass="product-price">RM <%# Eval("ProductPrice") %></asp:Label>
                                                </div>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>
                                <asp:DataList runat="server" ID="Paging" OnItemCommand="Paging_ItemCommand" OnItemDataBound="Paging_ItemDataBound" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <div style="text-align: center">
                                            <asp:LinkButton ID="lbPaging" runat="server"
                                                CommandArgument='<%# Eval("PageIndex") %>'
                                                CommandName="newPage"
                                                Text='<%# Eval("PageText") %>' Width="20px" CssClass="paging-layout" Style="padding: 8px; margin: 2px; background: lightgray; border: solid 1px #666; color: black; font-weight: bold" Font-Bold="True"> </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </div>
                <script src="Scripts/filtering.js" type="text/javascript"></script>
            </div>
        </div>
    </div>
</asp:Content>
