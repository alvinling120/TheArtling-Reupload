<%@ Page Title="" Language="C#" MasterPageFile="~/HeadAndFooter.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="TheArtling.Homepage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Layout/common.css" rel="stylesheet" type="text/css"/>
<style>
/*Homepage Carousel Slider*/
#slider {
    overflow: hidden;
    width: 80%;
    margin: 0 auto;
     box-shadow: 0 8px 16px 0 black;
}

#slider figure {
    position: relative;
    width: 500%;
    left: 0;
    margin: 0;
    animation: 40s slider infinite;
}

#slider figure img {
    width: 20%;
    float: left;
}

@keyframes slider {
    0% {
        left: 0;
    }
    20% {
        left: 0;
    }
    25% {
        left: -100%;
    }
    45% {
        left: -100%;
    }
    50% {
        left: -200%;
    }
    70% {
        left: -200%;
    }
    75% { 
        left: -300%;
    }
    95% {
        left: -300%;
    }
    100% {
        left: -400%;
    }
}

.styled-table {
    width:80%;
    margin-top:10px;
    box-shadow: 0 8px 16px 0 grey;
    background-color:white;
    border-radius:5px;
    padding:10px;
}

/*Homepage Fonts*/
.bold-text {
    font-family: Arvo-Bold;
    font-size: 18px;
    font-weight: bold;
}

.normal-text {
    font-family: Arvo-Regular;
    font-size: 16px;
    font-weight: normal;
}

.box-size {
    width: 300px;
    margin-left: 20px;
    margin-right: 20px;
}

.title-text {
    font-family: Arvo-Regular;
    font-size: 24px;
    font-weight: 600;
}

.small-icon {
    color: #F95F62;
    width: 26px;
    height: 26px;
    margin-top: 5px;
}

.large_icon {
    width: 36px;
    height: 36px;
}

.left {
    height: 100%;
    width: 100%;
    text-align: center;
    margin-bottom: 50px;
}

</style>
<div>
    <div class="parent">
        <div class="left">
            <div style="text-align:center; width:100%">
                    <div id="slider">
                        <figure>
                            <img class="images" src="ImagesAndIcons/Images/carousel_image1.jpg" />
                            <img class="images" src="ImagesAndIcons/Images/carousel_image2.jpg" />
                            <img class="images" src="ImagesAndIcons/Images/carousel_image3.jpg" />
                        </figure>
                    </div>
                </div>
        <br />
            <br />
        <div style=" border-bottom: solid 2px #D2D9D5; width:100%; text-align:center"></div>
        <br />
        <div style="border-bottom: solid 2px #D2D9D5">
            <table>
                <tr>
                    <td style="width: 170px;"></td>
                    <td style="height: 270px; width: 340px; text-align: center;">
                        <div>
                            <img src="ImagesAndIcons/Icons/image_icon.svg" class="large_icon" />
                        </div>
                        <div class="bold-text">
                            Curated
                            <br />
                            Art
                        </div>
                        <br />
                        <div class="normal-text box-size">
                            We feature a curated selected  of the best 
                            pieces from both emerging and established 
                            artist and designers worldwide
                        </div>
                    </td>
                    <td style="width: 190px;"></td>
                    <td style="height: 270px; width: 340px; text-align: center;">
                        <div>
                            <img src="ImagesAndIcons/Icons/guarantee.svg" class="large_icon" />
                        </div>
                        <div class="bold-text">
                            Authenticity
                            <br />
                            Guaranteed
                        </div>
                        <br />
                        <div class="normal-text box-size">
                            Artworks and design items have been carefully hand-picked and vetted by our team. 
                            Artworks come with Certificates of Authenticity from the Artist or Gallery.
                        </div>
                    </td>
                    <td style="width: 170px;"></td>
                </tr>
            </table>
            <br />
        </div>
        <br />
        <div style="text-align: center; width: 100%; border-bottom: solid 2px #D2D9D5" class="title-text">
        <br />
        <div style="width: 100%; text-align: center; border-bottom: solid 2px #D2D9D5" class= "title-text">
            <div style="text-align:center">
                <asp:ImageButton runat="server" ImageUrl="~/ImagesAndIcons/Images/submit.jpg" Width="80%" PostBackUrl="~/SubmitArt.aspx" />
            </div>
            <br />
        </div>
    </div>
  </div>
</div>

</asp:Content>

