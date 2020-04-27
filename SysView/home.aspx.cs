using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.Services;
using HtmlAgilityPack;


    public partial class Home : System.Web.UI.Page
    {

        public string FirstName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_EMAIL"] != null && !string.IsNullOrEmpty(Session["USER_EMAIL"].ToString()))
            {

                FirstName = Session["FirstName"].ToString();


            if (!String.IsNullOrEmpty(Session["UserStatus"].ToString()) && Session["UserStatus"].ToString() == "Admin")
            {
                Response.Redirect("admin-home.aspx");

            }

        }
            else
            {
                Session["redirect"] = "home.aspx";
                Response.Redirect("login.aspx");
            }
        }





    }
