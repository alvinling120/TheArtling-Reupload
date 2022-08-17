using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TheArtling
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

           
            // retrieve data
            string strSelect = "Select * from Account where email=@email";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@email", Page.Request.Form["txtEmail"]);

            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrAcc = cmdSelect.ExecuteReader();

            if (dtrAcc.HasRows)
            {
                while (dtrAcc.Read())
                {
                    if (dtrAcc["password"].ToString().Equals(Page.Request.Form["txtPass"]))
                    {
                        Session["id"] = Int32.Parse(dtrAcc["UserID"].ToString());
                        Session["accType"] = dtrAcc["accType"].ToString();
                        Response.Write("<script>alert('Login Successfully');window.location.href='Homepage.aspx'</script>");
                        
                    }
                    else
                    {
                        Response.Write("<script>alert('Incorrect Password');</script>");

                    }
                }
            }
            else
            {
                Response.Write("<script>alert('No such user(s)');</script>");
            }
            con.Close();

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }
    }
}