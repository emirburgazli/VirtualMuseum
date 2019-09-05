using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace SanalMuze
{
    public class Material
    {
        public Material(string inName, string inType, string inImageFilePath, string inDescription, string inWhoAdded)
        {
            Name = inName;
            Type = inType;

            ImageFilePath = inImageFilePath;
            Description = inDescription;
            WhoAdded = inWhoAdded;

        }

        public Material(int inID, string inName, string inType, string inImageFilePath, string inDescription, string inWhoAdded)
        {
            ID = inID;
            Name = inName;
            Type = inType;

            ImageFilePath = inImageFilePath;
            Description = inDescription;

        }
        public Material()
        {

        }

        public int ID { get; set; }

        public string Name { get; set; }

        public string Type { get; set; }

        public string ImageFilePath { get; set; }

        public string Description { get; set; }

        public string WhoAdded { get; set; }

        public string AddedDate { get; set; }

        public Boolean IsActive { get; set; }

        public string DeletionDate { get; set; }

    }
}