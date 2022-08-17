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
    public partial class Cart : System.Web.UI.Page
    {
        double price;
        protected void Page_Load(object sender, EventArgs e)
        {
            Starting();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlDataSource1.DeleteCommand = "DELETE FROM Carts WHERE CartID=0";
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);

            con.Open();


            // retrieve data
            string strSelect = "Delete From Carts Where CartId=@id";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@id", Int32.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString()));

            int numRowAffected = cmdSelect.ExecuteNonQuery();
            if (numRowAffected > 0)
            {
                Response.Write("<script>alert('Delete Product from Cart Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Delete Product from Cart Failed');</script>");
            }

            con.Close();
            Starting();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlDataSource1.UpdateCommand = "Update Carts set quantity = 0 where CartId = 0";
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;
            TextBox quantity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("quantity");
            
            double quan = Double.Parse(quantity.Text.ToString());
            int id = Int32.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            
            con = new SqlConnection(strCon);

            con.Open();


            // retrieve data
            string strSelect = "Select * from Product INNER JOIN Carts ON Product.ProductID = Carts.ProductID AND Carts.CartId=@id";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@id", Int32.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString()));

            SqlDataReader dtrAcc = cmdSelect.ExecuteReader();

            if (dtrAcc.HasRows)
            {
                while (dtrAcc.Read())
                {
                    price = Double.Parse(dtrAcc["ProductPrice"].ToString());
                }
            }
            con.Close();
            double total = (price * quan);
            SqlCommand cmd = new SqlCommand("Update Carts set Quantity=@quantity, TPrice = @price where CartId = @id", con);

            cmd.Parameters.AddWithValue("@quantity", Int32.Parse(quantity.Text.ToString()));
            cmd.Parameters.AddWithValue("@price", total);
            cmd.Parameters.AddWithValue("@id" , id);
            con.Open();
            int numRowAffected = cmd.ExecuteNonQuery();
            if (numRowAffected > 0)
            {
                Response.Write("<script>alert('Update Cart Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Update Cart Failed');</script>");
            }
            GridView1.EditIndex = -1;
           
            con.Close();
            Starting();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName.Equals("Update"))
            {

            }
            else if(e.CommandName.Equals("Delete"))
            {

            }
        }

        private void Starting()
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();


            // retrieve data
            string strSelect = "Select * from Carts where UserId=@id AND OrderID IS NULL";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@id", Session["id"]);

            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrAcc = cmdSelect.ExecuteReader();

            if (dtrAcc.HasRows)
            {
                int quantity = 0;
                double total = 0.0;
                while (dtrAcc.Read())
                {
                    summary.Visible = true;
                    quantity += Int32.Parse(dtrAcc["Quantity"].ToString());
                    total += Double.Parse(dtrAcc["TPrice"].ToString());
                }
                lblItem.Text = quantity.ToString();
                lblTotal.Text = total.ToString("0.00");
            }
            else
            {
                summary.Visible = false;
            }
            con.Close();
        }
    }
}