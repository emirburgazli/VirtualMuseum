using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanalMuze
{
    public partial class Dashboard1 : System.Web.UI.Page
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
                lbl_AvailableMaterials.Text = db.AvailableMaterialCount().ToString();
                lbl_deletedMaterials.Text = db.DeletedMaterialCount().ToString();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

      

        protected void btn_Logout_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
                        
        }
    }
}