using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanalMuze
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

            }
        }
        DbProcess db = new DbProcess();
        protected void btn_save_Click(object sender, EventArgs e)
        {



            if (materialAddedFileUpload.HasFile)
            {
                if (materialAddedFileUpload.PostedFile.ContentType.Contains("image"))
                {
                    string guid = Guid.NewGuid().ToString();//.Net te bizim için rastgele 32 karakterlik bir string oluşturan sınıftır. 
                    string path = "~/images/" + guid + "." + materialAddedFileUpload.PostedFile.ContentType.Split('/')[1];
                    materialAddedFileUpload.SaveAs(Server.MapPath(path));


                    MemoryStream stream = new MemoryStream();// MemoryStream geçici veri saklama işleminde veriyi bellekte sakladığından hızlı depolama imkanı sunmaktadır.http://www.kazimcesur.com/c-memorystream-networkstream-cryptostream/

                    System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath(path));
                    image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    byte[] byteArray = stream.ToArray();

                    Material material = new Material // oluşturduğumuz classın içini dolduruyoruz.
                    {
                        Name = txt_name.Text,
                        Type = txt_type.Text,
                        ImageFilePath = path.ToString(),
                        WhoAdded = txt_whoadded.Text,
                        Description = txt_description.Text
                    };
                    db.MaterialAdd(material);// Doldurulan verileri kendi yazdığımız prosess ile Veritabaına ekliyoruz.

                }
            }
        }
    }
}