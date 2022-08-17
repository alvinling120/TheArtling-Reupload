<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TheArtling.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Layout/layout.css" rel="stylesheet" type="text/css"/>
     <style type="text/css">
        body {
            background-size:cover;
            background-repeat: no-repeat;
            background-image: url('../ImagesAndIcons/Images/brush.jpg');
        }
        
        .head {
            width: 100%;
            height: 8%;
            position: fixed;
            z-index: 3;
        }
         .auto-style2 {
             width: 30%;
             height: 350px;
             border-radius: 25px;
         }
         .auto-style3 {
             width: 263px;
         }
         .login{
             font-size:20px;
             font-weight:bold;
             text-align:center;
         }
         .styled-table {
            border-collapse: collapse;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 8px 16px 0 black;
            padding:20px
        }
         input[type=text], input[type=password], input[type=date], select, input[type=date], input[type=time], input[type=email]
        {
	        font-size:14px;
	        color:#666;
	        font-family:Georgia, "Times New Roman", Times, serif;
	        height:35px;
	        border-width:0px 0px 2px 0px;
	        border-color:#DFDFDF;

        }
         .image{
             padding-right:10px;
         }

         .focus{
             padding:5px;
             border-color:black;
             box-shadow:0px 0px 5px 0px white;
         }
         .button{
	        font-family: Raleway, sans-serif;
	        height:40px;
	        width:250px;
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
     </style>
    <title></title>
</head>
<body style="height:100%;">
    <form id="form1" runat="server">
       
        <div class="head">
                <table style="width:100%">
                    <tr class="topnav">
                        <td style="width: 5%"></td>
                        <td>
                            <a class="logo" style="color:white">The<br/>&nbsp;Artling</a>
                        </td>
                        <td style="width: 65%"></td>
                        <td>
                            <a class="logo focus" style="color:white; font-size:15px" href="Login.aspx">Login</a>
                        </td>
                        <td>
                            <a class="logo" style="color:white; font-size:15px" href="Register.aspx">Sign Up</a>
                        </td>
                    </tr>
                </table>
        </div>
        <div style="text-align: center; vertical-align: middle;">
            <table>
                <tr style="height: 200px"><td></td></tr>
            </table>
            <table border ="0" style="border-color: inherit; border-width:thin; background-color:white; margin-left: auto; opacity:0.95" class="auto-style2 styled-table">
                <tr><td colspan="2" style="text-align:center" >
                    <asp:Image ID="Image3" runat="server" Height="100px" ImageUrl="~/ImagesAndIcons/Icons/login.svg" Width="100px" />
                    </td></tr>
                <tr><td colspan="2" class="login">Login</td></tr>
                <tr><td style="text-align:center; width: 32%">
                    <asp:Image ID="Image1" runat="server" Height="20px" ImageAlign="Right" CssClass="image" ImageUrl="~/ImagesAndIcons/Icons/email.svg" Width="20px" />
                    </td>
                <td style="text-align:left" class="auto-style3"><input id="txtEmail" name="txtEmail" type="email" style="height: 30px; width:200px;" class="textbox" placeholder="Email"/></td></tr>
                <tr>
                <td style="text-align:center">
                    <asp:Image ID="Image2" runat="server" Height="20px" ImageAlign="Right" CssClass="image" ImageUrl="~/ImagesAndIcons/Icons/padlock.svg" Width="20px" />
                    </td>
                <td style="text-align:left" class="auto-style3">
                    <input id="txtPass" name="txtPass" type="password"  style="height: 30px; width:200px;" class="textbox" placeholder="Password"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center"><asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="button"/></td>
                </tr>
                <tr><td colspan="2" style="text-align:center">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Resetpassword.aspx">Forgot Password?</asp:HyperLink></td></tr>
            </table>
        
            
        </div>
    </form>
</body>
</html>
