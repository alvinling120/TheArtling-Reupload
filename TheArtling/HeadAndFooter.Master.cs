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
    public partial class HeadAndFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["accType"].Equals("A"))
            {
                
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();


                // retrieve data
                string strSelect = "Select ArtistID from Artist where UserID=@id";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@id", Session["id"]);

                // execute reader - select statement will return more than one value
                // execute scalar - select statement will return only one value
                // execute non query - insert, update and delete
                SqlDataReader dtrAcc = cmdSelect.ExecuteReader();

                if (dtrAcc.HasRows)
                {
                    while (dtrAcc.Read())
                    {

                        Session["artistid"] = dtrAcc["ArtistID"].ToString();
                    }
                }
                con.Close();
            }
            else
            {
                gallery.Visible = false;
            }
        }

        protected void CartImageButton_Click(object sender, ImageClickEventArgs e)
        {
            ibtnCart.ForeColor = System.Drawing.Color.RoyalBlue;
            Server.Transfer("Cart.aspx");
        }

        protected void FavouriteImageButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void AccountImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Account.aspx");
        }

        protected void ibtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            
            Session.Clear();
            Server.Transfer("Login.aspx");
        }

        protected void ibtnHistory_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}