using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanalMuze
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        DbProcess db = new DbProcess();

        protected void btn_SignIn_Click(object sender, EventArgs e)
        {
            List<Admin> admin = db.ListAdmin();
            if (txt_mail.Text == admin[0].Email && txt_password.Text == admin[0].Password)
            {
                Session["admin"] = admin[0];
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                Response.Write("Yanlış Giriş");
            }
        }


    }
}