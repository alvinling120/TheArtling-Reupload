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
    public partial class Artpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddArt_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            string path = "~/ProductImage/" + fuImage.FileName;
            fuImage.SaveAs(Server.MapPath("ProductImage") + "/" + fuImage.FileName);
            // insert -> sqlcommand, insertion sql query
            string strInsert = "Insert Into Products (ProductName, ProductDescription, ProductImage, Quantity, UnitPrice ) Values (@prod, @desc, @image, @q, @price )";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@prod", txtName.Text);
            cmdInsert.Parameters.AddWithValue("@image", path);
            cmdInsert.Parameters.AddWithValue("@desc", Page.Request.Form["S1"]);
            cmdInsert.Parameters.AddWithValue("@q", Int32.Parse(txtQuantity.Text));
            cmdInsert.Parameters.AddWithValue("@price", Double.Parse(txtPrice.Text));

            int numRowAffected = cmdInsert.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                Response.Write("Item inserted Successfully");
            }
            else
            {
                Response.Write("Try again");
            }
            con.Close();

           
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;
            //find image id of edit row    
            string imageId = GridView2.DataKeys[e.RowIndex].Value.ToString();

           // find values for update    
            //TextBox name = (TextBox)gvImage.Rows[e.RowIndex].FindControl("txt_Name");
            FileUpload FileUpload1 = (FileUpload)GridView2.Rows[e.RowIndex].FindControl("editImage");
            con = new SqlConnection(strCon);
            con.Open();
            string path = "~/ProductImage/";
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                //save image in folder    
                FileUpload1.SaveAs(MapPath(path));
            }
            else
            {
                // use previous user image if new image is not changed    
                Image img = (Image)GridView2.Rows[e.RowIndex].FindControl("image");
                path = img.ImageUrl;
            }
            SqlCommand cmd = new SqlCommand("Update Products set ProductImage='" + path + "' where ProductId=" + Int32.Parse(imageId) + "", con);
            
            cmd.ExecuteNonQuery();
            con.Close();
          
        }



    }
}