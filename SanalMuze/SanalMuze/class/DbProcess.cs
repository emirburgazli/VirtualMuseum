using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SanalMuze
{
    public class DbProcess
    {
        //WEB SERVİCE JSON DÖNDÜRSÜN........
        //SqlConnection con = new SqlConnection("Data Source=W10-1903-PC\\SQLExpress;Initial Catalog=VirtualMuseum;integrated Security=SSPI");
        SqlConnection con = new SqlConnection("Server=W10-1903-PC\\SQLExpress; Database=VirtualMuseum;Trusted_Connection=True;");
        //SqlConnection con = new SqlConnection("Server=localhost; Database=VirtualMuseum;Trusted_Connection=True;");
        int result;
        public void StartQuery(string inquery)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(inquery, con);
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
        }

        public int MaterialIDBring(string inName)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT ID FROM material where Name = '" + inName + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result = int.Parse(dr[0].ToString());
            }
            con.Close();
            cmd.Dispose();
            dr.Close();
            return result;
        }

        #region Material Events

        public void MaterialAdd(Material inMaterial)
        {
            StartQuery("Insert Into material (Name,Type,ImageFilePath,Description,WhoAdded,AddedDate) values ('" + inMaterial.Name + "','" + inMaterial.Type + "','" + inMaterial.ImageFilePath + "','" + inMaterial.Description + "','" + inMaterial.WhoAdded + "','" + DateTime.Now.ToString() + "')");
        }

        public void MaterialDetele(int inID)
        {
            StartQuery("update material Set IsActive=0 ,DeletionDate='" + DateTime.Now.ToString() + "'  where ID = " + inID + "");

        }
        public void MaterialUpdate(Material inMaterial)
        {
            StartQuery("Update material set Name='" + inMaterial.Name + "',Type= '" + inMaterial.Type + "',Description='" + inMaterial.Description + "',WhoAdded='" + inMaterial.WhoAdded + "',AddedDate='" + inMaterial.AddedDate + "',ImageFilePath='" + inMaterial.ImageFilePath + "' where ID=" + inMaterial.ID + "");
        }

        public List<Material> ListMaterials()
        {

            con.Open();
            List<Material> Materials = new List<Material>();
            SqlCommand cmd = new SqlCommand("select ID,Name,Type,ImageFilePath,Description,WhoAdded,AddedDate,DeletionDate from Material Where IsActive=1", con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Material Material = new Material()
                {
                    ID = int.Parse(dr[0].ToString()),
                    Name = dr[1].ToString(),
                    Type = dr[2].ToString(),
                    ImageFilePath = dr[3].ToString(),
                    Description = dr[4].ToString(),
                    WhoAdded = dr[5].ToString(),
                    AddedDate = dr[6].ToString(),
                    DeletionDate = dr[7].ToString(),
                };
                Materials.Add(Material);
            }
            dr.Close();
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return Materials;

        }

        public int AvailableMaterialCount()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Count(ID) FROM material where IsActive=1", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result = int.Parse(dr[0].ToString());
            }
            con.Close();
            cmd.Dispose();
            dr.Close();
            return result;
        }

        public int DeletedMaterialCount()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Count(ID) FROM material where IsActive=0", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result = int.Parse(dr[0].ToString());
            }
            con.Close();
            cmd.Dispose();
            dr.Close();
            return result;
        }
        public List<Material> MaterialDetails(int inID)
        {
            con.Open();
            List<Material> Materials = new List<Material>();
            SqlCommand cmd = new SqlCommand("SELECT Name,Type,Description,WhoAdded,AddedDate,ImageFilePath FROM material where ID=" + inID + "", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Material m = new Material()
                {
                    Name = dr[0].ToString(),
                    Type = dr[1].ToString(),
                    Description = dr[2].ToString(),
                    WhoAdded = dr[3].ToString(),
                    AddedDate=dr[4].ToString(),
                    ImageFilePath=dr[5].ToString()
                   
                };
                Materials.Add(m);
            }
            con.Close();
            cmd.Dispose();
            dr.Close();
            return Materials;
        }


        public Material GetById(int id)
        {
            con.Open();
            Material m = new Material();
            SqlCommand cmd = new SqlCommand("SELECT ID FROM material where ID = " + id + "", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result = int.Parse(dr[0].ToString());
                m.ID = id;
            }
            con.Close();
            cmd.Dispose();
            dr.Close();
            return m;

        }
        #endregion

        public List<Admin> ListAdmin()
        {

            con.Open();
            List<Admin> admins = new List<Admin>();
            SqlCommand cmd = new SqlCommand("select ID,Email,Password from Login", con);
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Admin admin = new Admin()
                {
                    ID = int.Parse(dr[0].ToString()),
                    Email = dr[1].ToString(),
                    Password = dr[2].ToString(),

                };
                admins.Add(admin);
            }
            dr.Close();
            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            return admins;

        }

    }
}