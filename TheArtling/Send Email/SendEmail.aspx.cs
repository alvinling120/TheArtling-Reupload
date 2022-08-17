using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TheArtling.Send_Email
{
    public partial class SendEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void bttn_Send_Click(object sender, EventArgs e)
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("chonghuitze5842@gmail.com", "");
                MailMessage mail = new MailMessage();
                mail.To.Add("chonght-wm20@student.tarc.edu.my");
                mail.From = new MailAddress("chonghuitze5842@gmail.com");
                mail.Subject = "Testing";
                mail.Body = "This is testing";
                client.Send(mail);
                Response.Write("Send Successfully");
            }
            catch(Exception ex)
            {
                Response.Write("Could not send email" + ex.Message);
            }
            /*using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("chonghuitze5842@gmail.com");
                mail.To.Add("chonght-wm20@student.tarc.edu.my");
                mail.Subject = "Hello World";
                mail.Body = "<h1>Hello</h1>";
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("C:\\file.zip"));

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new NetworkCredential("chonghuitze5842@gmail.com", "huitze5842");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }*/
        }
    }
}