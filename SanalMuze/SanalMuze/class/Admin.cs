using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SanalMuze
{
    public class Admin
    {
        public Admin(string inMail,string inPass)
        {
            Email = inMail;
            Password=inPass;
        }
        public Admin()
        {

        }
        public int ID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }
    }
}