using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace SanalMuze
{
    public partial class TestService : System.Web.UI.Page
    {
        DbProcess db = new DbProcess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                rptTestService.DataSource = db.ListMaterials().ToList();
                rptTestService.DataBind();
            }
          
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                MetarialService.GetMeterialDetailsSoapClient client = new MetarialService.GetMeterialDetailsSoapClient();
                rptTestService.DataSource = client.GetMaterialsDetails(int.Parse(txt_ara.Text));
                rptTestService.DataBind();
            }
            catch (Exception)
            {


            }
           
        }
    }
}