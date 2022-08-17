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
    public partial class Payment : System.Web.UI.Page
    {
        String OrderId;
        Double Fee = 50, Total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();


            // retrieve data
            string strSelect = "Select * from Carts where UserID=@id AND OrderID IS NULL";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@id", Session["id"]);

            // execute reader - select statement will return more than one value
            // execute scalar - select statement will return only one value
            // execute non query - insert, update and delete
            SqlDataReader dtrAcc = cmdSelect.ExecuteReader();

            if (dtrAcc.HasRows)
            {
                int quantity = 0;
                while (dtrAcc.Read())
                {
                    quantity += Int32.Parse(dtrAcc["Quantity"].ToString());
                    Total += Double.Parse(dtrAcc["TPrice"].ToString());
                }
                lblTotal.Text = Total.ToString("0.00");
                lblTotalP.Text = (Total + 50).ToString("0.00");
            }
            con.Close();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            // insert -> sqlcommand, insertion sql query
            string strFind = "SELECT COUNT(*) FROM Orders";

            SqlCommand cmdFind = new SqlCommand(strFind, con);

            SqlDataReader dr = cmdFind.ExecuteReader();
            while (dr.Read())
            {
                OrderId = (dr.GetInt32(0) + 1) .ToString();
            }
            con.Close();

            /*con.Open();

            // insert -> sqlcommand, insertion sql query
            string strInsert = "Insert Into ShippingDetails (OrderID, FirstName, Street, City, State, Country, PostalCode, PhoneNumber, UserID) Values (@oid, @name, @street, @city, @state, @country, @code, @num, @id )";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@oid", "D000" + OrderId);
            cmdInsert.Parameters.AddWithValue("@name", Session["Name"]);
            cmdInsert.Parameters.AddWithValue("@id", Session["id"]);
            cmdInsert.Parameters.AddWithValue("@street", Session["Add"]);
            cmdInsert.Parameters.AddWithValue("@city", Session["City"]);
            cmdInsert.Parameters.AddWithValue("@state", Session["State"]);
            cmdInsert.Parameters.AddWithValue("@country", Session["Country"]);
            cmdInsert.Parameters.AddWithValue("@code", Session["Pos"]);
            cmdInsert.Parameters.AddWithValue("@num", Session["Num"]);

            int numRowAffected = cmdInsert.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                
            }
            else
            {
                
            }
            con.Close();*/

            con.Open();

            // insert -> sqlcommand, insertion sql query
            /*string strInsert2 = "Insert Into Payment (BillDateTime, CardNo, CardExpiryDate, CardCVV, OrderID) Values (@date, @no, @exp, @cvv, @id )";

            SqlCommand cmdInsert2 = new SqlCommand(strInsert2, con);

            cmdInsert2.Parameters.AddWithValue("@date", DateTime.Now);
            cmdInsert2.Parameters.AddWithValue("@no", txtCardNo.Text.ToString());
            cmdInsert2.Parameters.AddWithValue("@exp", DateTime.Now.Date);
            cmdInsert2.Parameters.AddWithValue("@cvv", txtCode.Text.ToString());
            cmdInsert2.Parameters.AddWithValue("@id", "D000" + OrderId);

            int numRowAffected2 = cmdInsert2.ExecuteNonQuery();

            if (numRowAffected2 > 0)
            {
               
            }
            else
            {
                
            }
            con.Close();*/

            // insert -> sqlcommand, insertion sql query
            string strInsert3 = "Insert Into Orders (OrderID, OrderCreatedDate, GrandTotal, ShippingFee, GrossTotal, UserID) Values (@id, @date, @total, @fee, @gtotal, @uid )";

            SqlCommand cmdInsert3 = new SqlCommand(strInsert3, con);

            cmdInsert3.Parameters.AddWithValue("@total", Total.ToString());
            cmdInsert3.Parameters.AddWithValue("@date", DateTime.Now);
            cmdInsert3.Parameters.AddWithValue("@fee", Fee.ToString());
            cmdInsert3.Parameters.AddWithValue("@gtotal", (Fee + Total).ToString());
            cmdInsert3.Parameters.AddWithValue("@id", "D" + OrderId);
            cmdInsert3.Parameters.AddWithValue("@uid", Session["id"]);

            int numRowAffected3 = cmdInsert3.ExecuteNonQuery();

            if (numRowAffected3 > 0)
            {
               
            }
            else
            {
            }
            con.Close();
            con.Open();

            string strInsert4 = "Update Carts Set OrderId = 'D"+OrderId+"' WHERE UserId = '" + Session["id"] + "' AND OrderId IS NULL";

            SqlCommand cmdInsert4 = new SqlCommand(strInsert4, con);

            int numRowAffected4 = cmdInsert4.ExecuteNonQuery();

            if (numRowAffected4 > 0)
            {
                Response.Write("<script>alert('Create Order Successfully');window.location.href='PurchaseHistory.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Create Order Failed')</script>");
            }
            con.Close();
        }
    }
}