using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanalMuze
{
    public partial class MainPage : System.Web.UI.Page
    {
        DbProcess db = new DbProcess();
        protected void Page_Load(object sender, EventArgs e)
        {
            rptMainList.DataSource = db.ListMaterials().ToList();
            rptMainList.DataBind();
        }
    }
}