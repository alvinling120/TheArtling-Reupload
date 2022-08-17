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
    
    public partial class SubmitArt : System.Web.UI.Page
    {
        String PId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (cbTermsSA.Checked == true)
            {
                artistnameSA.ReadOnly = false;
                artPriceSA.ReadOnly = false;
                artYearSA.ReadOnly = false;
                artStatementSA.ReadOnly = false;
                artHeightSA.ReadOnly = false;
                artWidthSA.ReadOnly = false;
                btnAgree.Enabled = true;
            }
        }

        protected void artPrice_TextChanged(object sender, EventArgs e)
        {

        }

        protected void artistname_TextChanged(object sender, EventArgs e)
        {

        }



        protected void btnAgree_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            string path = "/ImagesAndIcons/Images/ProductImages/";
            String cat = "";

            // retrieve data
            string strSelect = "Select * from Category where CategoryID=@id";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@id", DropDownList1.SelectedItem.Value.ToString());

            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrAcc = cmdSelect.ExecuteReader();

            if (dtrAcc.HasRows)
            {
                while (dtrAcc.Read())
                {
                    if(dtrAcc["ProductType"].Equals("Photography"))
                    {

                    }
                    else 
                    cat += dtrAcc["ProductType"] + "/" + dtrAcc["ProductCategory"] + "/";
                }
            }
            con.Close();
            con.Open();
            path += cat + fuImage.FileName;
            fuImage.SaveAs(Server.MapPath("ImagesAndIcons/Images/ProductImages/") + cat + fuImage.FileName);
            // insert -> sqlcommand, insertion sql query
            string strFind = "SELECT COUNT(*) FROM Product";

            SqlCommand cmdFind = new SqlCommand(strFind, con);

            SqlDataReader dr = cmdFind.ExecuteReader();
            while (dr.Read())
            {
                PId = (dr.GetInt32(0) + 7).ToString();
            }
            con.Close();

            con.Open();
            // insert -> sqlcommand, insertion sql query
            string strInsert = "Insert Into Product (ProductID, ProductName, ProductDescription, ProductPrice, ProductImage, ProductYear, ArtistID, CategoryID, ProductWidth, ProductHeight, Quantity) " +
                "Values (@pid, @name, @desc, @price, @image, @year, @aid, @cid, @width, @height, @quantity )";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@pid", "P" + PId);
            cmdInsert.Parameters.AddWithValue("@name", artistnameSA.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@desc", artStatementSA.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@price", artPriceSA.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@image", path.ToString());
            cmdInsert.Parameters.AddWithValue("@year", artYearSA.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@aid", Session["artistid"]);
            cmdInsert.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue.ToString());
            cmdInsert.Parameters.AddWithValue("@width", artWidthSA.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@height", artHeightSA.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@quantity", 0);
            int numRowAffected = cmdInsert.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                Response.Write("<script>alert('Submit Art Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Submit Art Failed');</script>");
            }
            con.Close();
        }

        protected void cbTerms_CheckedChanged(object sender, EventArgs e)
        {
            if (!cbTermsSA.Checked)
            {
                artistnameSA.ReadOnly = true;
                artPriceSA.ReadOnly = true;
                artYearSA.ReadOnly = true;
                artStatementSA.ReadOnly = true;
                artHeightSA.ReadOnly = true;
                artWidthSA.ReadOnly = true;
                artHeightSA.Text = "";
                artWidthSA.Text = "";
                artistnameSA.Text = "";
                artPriceSA.Text = "";
                artYearSA.Text = "";
                artStatementSA.Text = "";
                //FileUpload1.FileContent.Dispose();




            }
            else if(cbTermsSA.Checked)
            {
                artistnameSA.ReadOnly = false;
                artPriceSA.ReadOnly = false;
                artYearSA.ReadOnly = false;
                artStatementSA.ReadOnly = false;
                artHeightSA.ReadOnly = false;
                artWidthSA.ReadOnly = false;
                btnAgree.Enabled = true;

            }
        }
    }
}