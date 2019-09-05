using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SanalMuze.wepPages
{
    public partial class MaterialGuncelle : System.Web.UI.Page
    {
        DbProcess db = new DbProcess();
        int materialID;
        string name, type, description, whoadded, path;
        List<Material> listMaterial;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["MatID"] != null)
            {
                materialID = Convert.ToInt32(Request.QueryString["MatID"]);
                name = txt_name.Text;
                type = txt_type.Text;
                description = txt_description.Text;
                whoadded = txt_whoadded.Text;
                listMaterial = db.MaterialDetails(materialID);
                txt_name.Text = txt_name.Text = listMaterial[0].Name.ToString();
                txt_type.Text = listMaterial[0].Type.ToString();
                txt_description.Text = listMaterial[0].Description.ToString();
                txt_whoadded.Text = listMaterial[0].WhoAdded.ToString();
                path = listMaterial[0].ImageFilePath.ToString();
            }
        }

        protected void btn_save_material_Click(object sender, EventArgs e)
        {
            if (materialAddedFileUpload.FileName == "" && materialAddedFileUpload.FileContent.Length <= 0)
            {
                Material material = new Material()
                {
                    ID = materialID,
                    Name = name,
                    Type = type,
                    Description = description,
                    WhoAdded = whoadded,
                    AddedDate = listMaterial[0].AddedDate,
                    ImageFilePath = path
                };
                db.MaterialUpdate(material);

                txt_name.Text = "";
                txt_type.Text = "";
                txt_whoadded.Text = "";
                txt_description.Text = "";
            }
            else
            {
                string guid = Guid.NewGuid().ToString();//.Net te bizim için rastgele 32 karakterlik bir string oluşturan sınıftır. 
                path = "~/images/" + guid + "." + materialAddedFileUpload.PostedFile.ContentType.Split('/')[1];
                materialAddedFileUpload.SaveAs(Server.MapPath(path));
                MemoryStream stream = new MemoryStream();// MemoryStream geçici veri saklama işleminde veriyi bellekte sakladığından hızlı depolama imkanı sunmaktadır.http://www.kazimcesur.com/c-memorystream-networkstream-cryptostream/

                System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath(path));
                image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                byte[] byteArray = stream.ToArray();
                Material material = new Material()
                {
                    ID = materialID,
                    Name = name,
                    Type = type,
                    Description = description,
                    WhoAdded = whoadded,
                    AddedDate = listMaterial[0].AddedDate,
                    ImageFilePath = path
                };
                db.MaterialUpdate(material);

                txt_name.Text = "";
                txt_type.Text = "";
                txt_whoadded.Text = "";
                txt_description.Text = "";
            }
        }
    }
}