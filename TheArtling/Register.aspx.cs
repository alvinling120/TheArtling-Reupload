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
    public partial class Register : System.Web.UI.Page
    {
        Boolean flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPass.Text == txtConPass.Text)
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
                    flag = false;
                }
                else
                {
                    flag = true;
                }

                con.Close();
                if (flag == true)
                {
                    con.Open();

                    // insert -> sqlcommand, insertion sql query
                    string strInsert = "Insert Into Account (email, password, id, accType) Values (@email,@password, @id, @acc)";

                    SqlCommand cmdInsert = new SqlCommand(strInsert, con);

                    cmdInsert.Parameters.AddWithValue("@email", Page.Request.Form["txtEmail"]);
                    cmdInsert.Parameters.AddWithValue("@password", Page.Request.Form["txtPass"]);
                    cmdInsert.Parameters.AddWithValue("@id", Page.Request.Form["txtId"]);
                    cmdInsert.Parameters.AddWithValue("@acc", 'C');

                    int numRowAffected = cmdInsert.ExecuteNonQuery();

                    if (numRowAffected > 0)
                    {
                        Response.Write("<script>alert('Sign Up Successfully');</script>");
                        Server.Transfer("Login.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to Sign Up')</script>");
                    }
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('User with such email already existed!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Password and Confirm Password must be same');</script>");
            }
        }
    }
}