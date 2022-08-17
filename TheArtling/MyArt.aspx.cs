using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheArtling
{
    public partial class MyArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string commandArgument = e.CommandArgument.ToString();

            if (e.CommandName == "edit")
            {
                Response.Redirect("~/EditProduct.aspx?Id=" + commandArgument);
            }
            else if (e.CommandName == "manage")
            {
                Response.Redirect("~/ManageStock.aspx?ID=" + commandArgument);
            }

        }
    }
}