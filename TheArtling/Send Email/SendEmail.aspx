<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendEmail.aspx.cs" Inherits="TheArtling.Send_Email.SendEmail" %>

<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title>  
    <style type="text/css">  
        .auto-style1 {  
            width: 169px;  
        }  
    </style>  
</head>  
<body>  
    <form id="form1" runat="server">  
        <div>  
            <table border="0"  style="width: 464px">  
                <tr>  
                    <td class="auto-style1">To:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtTo" runat="server" Width="204px"></asp:TextBox>  
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1">Subject:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtSubject" runat="server" Width="201px"></asp:TextBox>  
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1">Attachment:  
                    </td>  
                    <td>  
                        <asp:FileUpload ID="fileUploader" runat="server" />  
                    </td>  
                </tr>  
                <tr>  
                    <td  class="auto-style1">Body:  
                    </td>  
                    <td>  
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="150" Width="200"></asp:TextBox>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="auto-style1">   
                    </td>  
                </tr>  
   
                <tr>  
                    <td class="auto-style1"></td>  
                    <td>  
                        <asp:Button ID="bttn_Send" Text="Send Mail" runat="server" OnClick="bttn_Send_Click" />  
                    </td>  
                </tr>  
            </table>  
  
   
        </div>  
    </form>  
</body>  
</html> 