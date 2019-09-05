using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanalMuze
{
    public partial class Default2 : System.Web.UI.Page
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
                rptList.DataSource = db.ListMaterials().ToList();
                rptList.DataBind();
            }

        }


        protected void lbl_delete_Click(object sender, EventArgs e)
        {



        }

        protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                int ID = Convert.ToInt32(e.CommandArgument.ToString());
                db.MaterialDetele(ID);
                Response.Redirect("ListMateriel.aspx");
            }
        }
    }
}