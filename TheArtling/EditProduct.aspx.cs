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
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();


            // retrieve data
            string strSelect = "Select * from Product where ProductID=@id";

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
                    txtName.Text = dtrProd["ProductName"].ToString();
                    lblProd.Text = dtrProd["ProductName"].ToString();
                    txtPrice.Text = dtrProd["ProductPrice"].ToString();
                    ImageProduct.ImageUrl = dtrProd["ProductImage"].ToString();
                    lblHeight.Text = dtrProd["ProductHeight"].ToString();
                    lblWidth.Text = dtrProd["ProductWidth"].ToString();
                    txtDesc.Text = dtrProd["ProductDescription"].ToString();
                    txtYear.Text = dtrProd["ProductYear"].ToString();
                    SiteMap.Provider.CurrentNode.ReadOnly = false;
                    SiteMap.CurrentNode.Title = "Edit " + dtrProd["ProductName"].ToString();
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