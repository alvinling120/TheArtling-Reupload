<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TheArtling.Register" %>

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
             height: 450px;
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
            padding:20px;
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
             background-color:#252525;
             color:white;
         }
     </style>
    <title></title>
</head>
<body style="height:100%;">
    <form id="form1" runat="server">
       
        <div class="head">
                <table style=" width:100%">
                    <tr class="topnav">
                        <td style="width: 5%"></td>
                        <td>
                            <a class="logo" style="color:white">The<br/>&nbsp;Artling</a>
                        </td>
                        <td style="width: 65%"></td>
                        <td>
                            <a class="logo" style="color:white; font-size:15px" href="Login.aspx">Login</a>
                        </td>
                        <td>
                            <a class="logo focus" style="color:white; font-size:15px" href="Register.aspx">Sign Up</a>
                        </td>
                    </tr>
                </table>
        </div>
        
        <div style="text-align: center; vertical-align: middle;">
            <table>
                <tr style="height: 120px"><td></td></tr>
            </table>
            <table border ="0" style="border-color: inherit; border-width:thin; background-color:white; margin-left: auto; opacity:0.95" class="auto-style2 styled-table">
                <tr><td colspan="2" style="text-align:center">
                    <asp:Image ID="Image6" runat="server" Height="100px" ImageUrl="~/ImagesAndIcons/Icons/clipboard.svg" Width="100px" />
                    </td></tr>
                <tr><td colspan="2" class="login">Sign Up</td></tr>
                 <tr>
                <td style="text-align:center">
                    <asp:Image ID="Image5" runat="server" Height="20px" ImageAlign="Right" CssClass="image" ImageUrl="~/ImagesAndIcons/Icons/id.svg" Width="20px" />
                    </td>
                <td style="text-align:left" class="auto-style3">
                    <asp:TextBox ID="txtId" runat="server" style="height: 30px; width:200px;" class="textbox" placeholder="User Id"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid User Id Format" ValidationExpression="^(\d{12})$" ControlToValidate="txtId"></asp:RegularExpressionValidator>
                </td>
                </tr>
                <tr><td style="text-align:center; width: 32%">
                    <asp:Image ID="Image1" runat="server" Height="20px" ImageAlign="Right" CssClass="image" ImageUrl="~/ImagesAndIcons/Icons/email.svg" Width="20px" />
                    </td>
                <td style="text-align:left" class="auto-style3">
                    <asp:TextBox ID="txtEmail" style="height: 30px; width:200px;" class="textbox" placeholder="Email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Email Format" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$">*</asp:RegularExpressionValidator>
                </td></tr>
                <tr>
                <td style="text-align:center">
                    <asp:Image ID="Image2" runat="server" Height="20px" ImageAlign="Right" CssClass="image" ImageUrl="~/ImagesAndIcons/Icons/padlock.svg" Width="20px" />
                    </td>
                <td style="text-align:left" class="auto-style3">
                    <asp:TextBox ID="txtPass" runat="server" style="height: 30px; width:200px;" class="textbox" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must minimum eight characters, at least one uppercase letter, one lowercase letter and one number" ControlToValidate="txtPass" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$">*</asp:RegularExpressionValidator>
                </td>
                </tr>
                <tr>
                <td style="text-align:center">
                    <asp:Image ID="Image3" runat="server" Height="20px" ImageAlign="Right" CssClass="image" ImageUrl="~/ImagesAndIcons/Icons/padlock.svg" Width="20px" />
                    </td>
                    
                <td style="text-align:left" class="auto-style3">
                    <asp:TextBox ID="txtConPass" runat="server" style="height: 30px; width:200px;" CssClass="textbox" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Confirm Password must minimum eight characters, at least one uppercase letter, one lowercase letter and one number" ControlToValidate="txtConPass" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$">*</asp:RegularExpressionValidator>
                </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Sign Up" CssClass="button" />
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true" />
        </div>
    </form>
</body>
</html>

