using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;

namespace TheArtling
{
    public partial class Shipping : System.Web.UI.Page
    {
        String OrderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SortedDictionary<string, string> countries = new SortedDictionary<string, string>();
                CultureInfo[] cultureInfos = CultureInfo.GetCultures(CultureTypes.AllCultures);
                foreach (CultureInfo culture in cultureInfos)
                {
                    try
                    {
                        RegionInfo regionInfo = new RegionInfo(culture.LCID);
                        if (!(countries.ContainsKey(regionInfo.EnglishName)))
                            countries.Add(regionInfo.EnglishName, regionInfo.EnglishName);
                    }
                    catch { }
                }

                foreach (KeyValuePair<string, string> value in countries)
                    ddlCountry.Items.Add(new ListItem(value.Value));

                ddlCountry.Items.Insert(0, "Select a country");
            }

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
                    quantity += Int32.Parse(dtrAcc["Quantity"].ToString());
                    total += Double.Parse(dtrAcc["TPrice"].ToString());
                }
                lblTotal.Text = total.ToString("0.00");
                lblCost.Text = (total+50).ToString("0.00");
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
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
                OrderId = (dr.GetInt32(0) + 1).ToString();
            }
            con.Close();
          
            con.Open();

            // insert -> sqlcommand, insertion sql query
            string strInsert = "Insert Into ShippingDetails (OrderID, FirstName, Street, City, State, Country, PostalCode, PhoneNumber, UserID) Values (@oid, @name, @street, @city, @state, @country, @code, @num, @id )";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);

            cmdInsert.Parameters.AddWithValue("@oid", "D" + OrderId);
            cmdInsert.Parameters.AddWithValue("@name", txtName.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@id", Session["id"]);
            cmdInsert.Parameters.AddWithValue("@street", txtAddress.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@city", txtCity.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@state", txtState.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@country", ddlCountry.SelectedItem.Value.ToString());
            cmdInsert.Parameters.AddWithValue("@code", txtPoscode.Text.ToString());
            cmdInsert.Parameters.AddWithValue("@num", txtNum.Text.ToString());

            int numRowAffected = cmdInsert.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                Response.Redirect("Payment.aspx");
            }
            else
            {
                
            }
            con.Close();
            
            
        }
    }
}