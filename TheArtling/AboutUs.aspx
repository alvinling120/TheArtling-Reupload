<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HeadAndFooter.Master" CodeBehind="AboutUs.aspx.cs" Inherits="TheArtling.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Layout/common.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .belowImgWords {
            padding-left: 43px;
        }

        .titlePos {
            padding-left: 18px;
            text-align: start
        }

        .auto-style10 {
            height: 376px;
            width: 370px;
        }

        .imgPos {
            width: 230px;
            height: 158.7px;
            margin-top: 50px;
        }

        .tableImg {
            text-align: center;
        }

        .tableImgText {
            text-align: center;
            padding-bottom: 50px;
        }


        .browsertext {
            color: black;
            cursor: pointer;
            text-decoration: none;
        }

        .tableImgText a.browsertext:hover {
            text-decoration-line: underline;
            text-decoration-color: #F95F62;
            color: #F95F62
        }

        .paragraphaboutus {
            width: 75%;
        }
    </style>
    <table style="width: 100%;">
        <tr>
            <%-- image and words below--%>
            <td class="auto-style10">

                <img class="images" src="ImagesAndIcons/Images/AboutUsImg/AboutUs.png" style="width: 394.7px; height: 370px; padding-left: 43px;" />
                <p class="belowImgWords">By Hyungkoo Lee</p>
            </td>
            <%--    right side words title, and paragraph--%>
            <td class="titlePos" style="height: 100%; width: 100%">
                <h1>About The Artling </h1>
                <p style="width: 100%">The World’s Primary Resource for Contemporary Art & Design</p>
                <div class="paragraphaboutus">The Artling is an Art and Design consultancy and online gallery focused on highlighting the best of contemporary art and design from both emerging and established studios and galleries across the globe. Our online platform, theArtling.com, now lists over 3,000 designers, artists and galleries from around the world, with new artworks and design items added to the site daily.</div>
                <p>
                    The Artling offers end-to-end consultancy and sourcing services for both private and corporate clients where we mainly:
                </p>
                <ul>
                    <li>Develop art themes and narratives</li>
                    <li>Guide the concept design process</li>
                    <li>Source and commission artworks to project specifications</li>
                    <li>Handle delivery, installation, logistics and insurance50</li>
                </ul>
                <p>The Artling works internationally and is headquartered in Singapore, with a private viewing space and office in Shanghai.</p>

        </tr>


        <tr>
            <%-- broweser that navigate to others pages--%>
            <td colspan="2">
                <table style="border-top: solid 2px #D2D9D5; border-bottom: solid 2px #D2D9D5" class="auto-style5">
                    <tr>
                        <td class="tableImg">

                            <asp:ImageButton ID="browseArtButton" ImageUrl="~/ImagesAndIcons/Images/ProductImages/Painting/Nature/nature1.jpg" runat="server" CssClass="imgPos" OnClick="BrowseArt_Click" />

                        </td>
                        <td class="tableImg">
                            <asp:ImageButton ID="browseDesignButton" ImageUrl="~/ImagesAndIcons/Images/ProductImages/Photograph/Life/life1.jpg" runat="server" CssClass="imgPos" OnClick="BrowseDesign_Click" />

                        </td>
                        <td class="tableImg">
                            <asp:ImageButton ID="artConsult" ImageUrl="~/ImagesAndIcons/Images/ProductImages/Drawing/Abstract/abs1.jpg" runat="server" CssClass="imgPos" OnClick="ArtConsultancy_Click" />

                        </td>
                    </tr>
                    <tr>
                        <td class="tableImgText">
                            <a class="browsertext" href="PaintingPage.aspx">Browse Painting</a>
                        </td>
                        <td class="tableImgText ">
                            <a class="browsertext" href="PhotographyPage.aspx">Browse Photography</a>
                        </td>
                        <td class="tableImgText">
                            <a class="browsertext" href="DrawingPage.aspx">Browse Drawing</a>
                        </td>



                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>

