using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace TheArtling
{
    public partial class DrawingPage : System.Web.UI.Page
    {

        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 12;

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }

            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) ProductRepeater();
            ProductRepeater();

        }

        private DataTable GetDataFromDb()
        {
            SqlConnection sqlcon;
            string strCon = ConfigurationManager.ConnectionStrings["ArtConnectionString"].ConnectionString;
            sqlcon = new SqlConnection(strCon);
            sqlcon.Open();

            string prodSelect;
            SqlCommand cmdSelect1;

            if (ddlArtist.SelectedValue != "Any Artist" && ddlCategory.SelectedValue != "Any Category")
            {
                prodSelect = "SELECT Product.*, Artist.ArtistName, Artist.ArtistHometown, Category.* " +
                    "FROM ((Product INNER JOIN Artist ON Product.ArtistID = Artist.ArtistID) INNER JOIN Category ON Product.CategoryID = Category.CategoryID) " +
                    "WHERE (Product.ArtistID=@artistID AND Product.CategoryID=@catID AND Category.ProductType='Drawing')";
                cmdSelect1 = new SqlCommand(prodSelect, sqlcon);
                cmdSelect1.Parameters.AddWithValue("@catID", ddlArtist.SelectedValue);
                cmdSelect1.Parameters.AddWithValue("@artistID", ddlArtist.SelectedValue);
            }
            else if (ddlArtist.SelectedValue != "Any Artist")
            {
                prodSelect = "SELECT Product.*, Artist.ArtistName, Artist.ArtistHometown, Category.* " +
                    "FROM ((Product INNER JOIN Artist ON Product.ArtistID = Artist.ArtistID) INNER JOIN Category ON Product.CategoryID = Category.CategoryID) " +
                    "WHERE (Product.ArtistID=@artistID AND Category.ProductType='Drawing')";
                cmdSelect1 = new SqlCommand(prodSelect, sqlcon);
                cmdSelect1.Parameters.AddWithValue("@artistID", ddlArtist.SelectedValue);
            }
            else if (ddlCategory.SelectedValue != "Any Category")
            {
                prodSelect = "SELECT Product.*, Artist.ArtistName, Artist.ArtistHometown, Category.* " +
                    "FROM ((Product INNER JOIN Artist ON Product.ArtistID = Artist.ArtistID) INNER JOIN Category ON Product.CategoryID = Category.CategoryID) " +
                    "WHERE (Product.CategoryID=@catID AND Category.ProductType='Drawing')";
                cmdSelect1 = new SqlCommand(prodSelect, sqlcon);
                cmdSelect1.Parameters.AddWithValue("@catID", ddlCategory.SelectedValue);
            }
            else
            {
                prodSelect = "SELECT Product.*, Artist.ArtistName, Artist.ArtistHometown, Category.* " +
                    "FROM ((Product INNER JOIN Artist ON Product.ArtistID = Artist.ArtistID) INNER JOIN Category ON Product.CategoryID = Category.CategoryID) " +
                    "WHERE Category.ProductType='Drawing'";
                cmdSelect1 = new SqlCommand(prodSelect, sqlcon);
                cmdSelect1.ExecuteScalar();
            }

            SqlDataAdapter adaproduct = new SqlDataAdapter(cmdSelect1);

            DataTable dt = new DataTable();
            adaproduct.Fill(dt);
            sqlcon.Close();
            return dt;
        }

        private void ProductRepeater()
        {
            var dt = GetDataFromDb();
            _pgsource.DataSource = dt.DefaultView;
            _pgsource.AllowPaging = true;
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            ViewState["TotalPages"] = _pgsource.PageCount;


            Repeater1.DataSource = _pgsource;
            Repeater1.DataBind();

            HandlePaging();
        }

        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;


            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            Paging.DataSource = dt;
            Paging.DataBind();
        }

        protected void ddlArtist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            ProductRepeater();
        }

        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            ProductRepeater();
        }

        protected void Paging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            ProductRepeater();
        }

        protected void Paging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
        }
    }
}