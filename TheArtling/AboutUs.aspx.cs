using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheArtling
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void BrowseArt_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("PaintingPage.aspx");
        }

        protected void BrowseDesign_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("PhotographyPage.aspx");
        }

        protected void ArtConsultancy_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("DrawingPage.aspx");
        }
    }
}