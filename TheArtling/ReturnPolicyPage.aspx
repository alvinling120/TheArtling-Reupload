<%@ Page Title="" Language="C#" MasterPageFile="~/HeadAndFooter.Master" AutoEventWireup="true" CodeBehind="ReturnPolicyPage.aspx.cs" Inherits="TheArtling.CustomerCare.ReturnPolicyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @font-face {
            font-family: Arvo-Regular;
            src: url(Arvo-Regular.ttf);
            font-family: Arvo-Bold;
            src: url(Arvo-Bold.ttf);
        }
        .content-wrapper {
            width: 100%;
            margin-bottom: 10%;
            margin-left: 20%; 
            max-width: 60%;
        }

        .content {
            width: 100%;
            text-align: left;
        }

        .title-text {
            font-family: Arvo-Bold;
            font-size: 30px;
            font-weight: 800;
        }

        .content-title {
            font-family: Arvo-Regular;
            font-size: 21px;
            font-weight: 600;
        }

        .content-text {
            font-family: Arvo-Regular;
            font-size: 18px;
            font-weight: 400;
        }

    </style>
    <div class="content-wrapper">
        <div class="title-text" style="text-align: center;">Return Policy</div>
        <br />
        <div class="content">
            <div class="content-title">Returns of Damaged Works</div>
            <br />
            <div class="content-text">
                In the unfortunate event that your order arrives in less than satisfactory condition, 
                simply take a digital photo of the item and of the shipping packaging it arrived in, 
                then attach the photos to an email and send to <span style="color: #F95F62">admin@theartling.com</span>.
                <br /><br />
                Please include in the body of the email: your order number, 
                the shipping ID or item number, a brief description of the reason for the return, 
                and let us know whether you are seeking a replacement or a refund. 
                You will receive an email from us with an update and steps on how to proceed.
            </div>
            <br /><br />
            <hr />
            <br />
            <div class="content-title">Returns of Other Reasons</div>
            <br />
            <div class="content-text">
                Our art works are sourced from reputable galleries and directly from artists, 
                therefore, our Returns Policy varies depending on the source of the art work. 
                <br /><br />
                Returns of some artwork are accepted within 3 days of delivery for any reason whatsoever. 
                <br /><br />
                The return policy of each art work is indicated on the Artwork Page and in your cart before you checkout. 
                <br /><br />
                The customer is responsible for the cost of return shipping using a recognized 
                international courier company such as UPS, DHL, FEDEX, TNT or Registered Mail. 
                All returns must include original packaging and the customer is required to pay for shipping insurance. 
            </div>
            <br />
        </div>
    </div>
</asp:Content>
