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
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();


            // retrieve data
            string strSelect = "Select * from Orders INNER JOIN Carts ON Orders.OrderID = Carts.OrderId AND Orders.OrderID = @id INNER JOIN ShippingDetails ON Orders.OrderID = ShippingDetails.OrderID";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@id", Request.QueryString["Id"]);


            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrProd = cmdSelect.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    lblAddress.Text = dtrProd["Street"].ToString();
                    lblCity.Text = dtrProd["City"].ToString();
                    lblState.Text = dtrProd["State"].ToString();
                    lblCountry.Text = dtrProd["Country"].ToString();
                    lblPTotal.Text = dtrProd["GrandTotal"].ToString();
                    lblOTotal.Text = dtrProd["GrossTotal"].ToString();
                    lblShip.Text = dtrProd["ShippingFee"].ToString();


                }
            }
            else
            {
                Response.Write("<script>alert('No such user(s)');</script>");
            }
            con.Close();
        }
    }
}