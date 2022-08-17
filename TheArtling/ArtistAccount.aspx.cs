using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Globalization;

namespace TheArtling
{
    public partial class ArtistAccount : System.Web.UI.Page
    {
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
        }

       
    }


}