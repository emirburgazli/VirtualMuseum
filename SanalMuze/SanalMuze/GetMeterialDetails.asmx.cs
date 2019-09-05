using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace SanalMuze
{
    /// <summary>
    /// Summary description for GetMeterialDetails
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetMeterialDetails : System.Web.Services.WebService
    {
        SqlConnection con = new SqlConnection("Data Source=W10-1903-PC\\SQLExpress;Initial Catalog=VirtualMuseum;integrated Security=SSPI");


        [WebMethod]
        public List<Material> GetMaterialsDetails(int inID)
        {
            List<Material> materials = new List<Material>();
            SqlCommand cmd = new SqlCommand("select * from Material where ID=" + inID + "", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Material material = new Material()
                {
                    ID = int.Parse(dr[0].ToString()),
                    Name = dr[1].ToString(),
                    Type = dr[2].ToString(),
                    ImageFilePath = dr[3].ToString(),
                    Description = dr[4].ToString(),
                    WhoAdded = dr[5].ToString(),
                    AddedDate = dr[6].ToString(),
                    DeletionDate = dr[7].ToString()
                };
                materials.Add(material);
            }
            con.Close();
            return materials;

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetMaterialsDetailsJson(int inID)
        {
            var json = "";
            List<Material> materials = new List<Material>();
            SqlCommand cmd = new SqlCommand("select * from Material where ID=" + inID + "", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Material material = new Material()
                {
                    ID = int.Parse(dr[0].ToString()),
                    Name = dr[1].ToString(),
                    Type = dr[2].ToString(),
                    ImageFilePath = dr[3].ToString(),
                    Description = dr[4].ToString(),
                    WhoAdded = dr[5].ToString(),
                    AddedDate = dr[6].ToString(),
                    DeletionDate = dr[7].ToString()
                };
                materials.Add(material);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                json = jss.Serialize(materials);
            }
            con.Close();

            return json;

        }
    }
}

