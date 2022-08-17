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
    public partial class ProductCart : System.Web.UI.Page
    {
        double price = 0.0;
        bool flag = false;
        private int prodQty = 0;
        private String productID;
        int newQty = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();


            // retrieve data
            string strSelect = "Select * from Product INNER JOIN Artist ON Product.ArtistID = Artist.ArtistID AND Product.ProductID=@id INNER JOIN Category ON Product.CategoryID = Category.CategoryID";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@id", Request.QueryString["id"]);

            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrProd = cmdSelect.ExecuteReader();

            if (dtrProd.HasRows)
            {
                while (dtrProd.Read())
                {
                    productID=dtrProd["ProductID"].ToString();
                    prodQty = int.Parse(dtrProd["Quantity"].ToString());
                    price = Double.Parse(dtrProd["ProductPrice"].ToString());
                    ProductImage.ImageUrl = dtrProd["ProductImage"].ToString();
                    lblName.Text = dtrProd["ProductName"].ToString();
                    hlArtist.Text = dtrProd["ArtistName"].ToString();
                    lblYear.Text = dtrProd["ProductYear"].ToString();
                    lblPrice.Text = "RM " + price.ToString();
                    lblDimension.Text = dtrProd["ProductWidth"].ToString() + " cm (W) x " + dtrProd["ProductHeight"].ToString() + " cm (H)";
                    lblDesc.Text = dtrProd["ProductDescription"].ToString();
                    lblCategory.Text = dtrProd["ProductCategory"].ToString() + ", " + dtrProd["ProductType"].ToString();
                    SiteMap.Provider.CurrentNode.ReadOnly = false;
                    SiteMap.CurrentNode.Title = dtrProd["ProductName"].ToString();
                }
            }
            con.Close();

            con.Open();
            // retrieve data
            string strSelectF = "Select * from Favourites WHERE userId=@pid";

            SqlCommand cmdSelectF = new SqlCommand(strSelectF, con);

            cmdSelectF.Parameters.AddWithValue("@pid", Session["id"]);

            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrFav = cmdSelectF.ExecuteReader();

            if (dtrFav.HasRows)
            {
                while (dtrFav.Read())
                {
                    String id = Request.QueryString["id"].ToString();
                    if (String.Compare(id, dtrFav["ProductId"].ToString()) == 0)
                    {
                        flag = true;
                    }
                }
            }

            con.Close();

            if (flag == true)
            {
                Remove.Visible = true;
                Favourite.Visible = false;
            }
            else
            {
                Remove.Visible = false;
                Favourite.Visible = true;
            }
        }

        public static System.Web.SiteMapNode CurrentNode
        {
            get;
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            if (prodQty > 0)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                //minus 1 qty from selected Product
                newQty = prodQty - 1;
                //update qty
                string updateQty = "Update Product Set Quantity=@newQty Where ProductID=@productID";
                SqlCommand cmdUpdate = new SqlCommand(updateQty, con);

                cmdUpdate.Parameters.AddWithValue("@newQty", newQty);
                cmdUpdate.Parameters.AddWithValue("@productID", productID);
                int numRowUpdateAffected = cmdUpdate.ExecuteNonQuery();

                con.Close();

                con.Open();


                // insert -> sqlcommand, insertion sql query
                string strInsert = "Insert Into Carts (ProductId, UserId, Quantity, TPrice) Values (@pid, @uid, @quantity, @price )";
                SqlCommand cmdInsert = new SqlCommand(strInsert, con);

                cmdInsert.Parameters.AddWithValue("@pid", Request.QueryString["id"]);
                cmdInsert.Parameters.AddWithValue("@uid", Session["id"]);

                cmdInsert.Parameters.AddWithValue("@quantity", 1);
                cmdInsert.Parameters.AddWithValue("@price", price);

                int numRowAffected = cmdInsert.ExecuteNonQuery();

                if (numRowAffected > 0)
                {
                    Response.Write("<script>alert('Add to Cart Successfully');</script>");
                    //Server.Transfer("Login.aspx");
                }

                else
                {
                    Response.Write("<script>alert('Add to Cart Failed')</script>");
                }
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Add to Cart Failed, Selected Products Out of Stocks')</script>");

            }
        }

        protected void Favourite_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();


            // insert -> sqlcommand, insertion sql query
            string strInsert = "Insert Into Favourites (ProductID, userId) Values (@pid, @uid)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@pid", Request.QueryString["id"]);
            cmdInsert.Parameters.AddWithValue("@uid", Session["id"]);

            int numRowAffected = cmdInsert.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                Response.Write("<script>alert('Add to Favourite Successfully');</script>");
                //Server.Transfer("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Add to Favourite Failed')</script>");
            }
            con.Close();
        }

        protected void Remove_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            // insert -> sqlcommand, insertion sql query
            string strInsert = "Delete From Favourites (ProductID, userId) Values (@pid, @uid)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@pid", Request.QueryString["id"]);
            cmdInsert.Parameters.AddWithValue("@uid", Session["id"]);

            int numRowAffected = cmdInsert.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                Response.Write("<script>alert('Add to Favourite Successfully');</script>");
                //Server.Transfer("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Add to Favourite Failed')</script>");
            }
            con.Close();
        }
    }
}