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


    public partial class AdminHome : System.Web.UI.Page
    {

        public string FirstName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_EMAIL"] != null 
                && !string.IsNullOrEmpty(Session["USER_EMAIL"].ToString())
                && !String.IsNullOrEmpty(Session["UserStatus"].ToString()) 
                && Session["UserStatus"].ToString() == "Admin"
            )
            {

                FirstName = Session["FirstName"].ToString();

                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);


                SqlCommand command = new SqlCommand("usp_GetInventoryList", con);
                con.Open();
                command.Connection = con;

                SqlDataReader reader = command.ExecuteReader();
                int i = 0;
                do
                {
                    InventoryList.Text = "<table class='table mb-0'>"
                                         + "<thead><tr><th>Model</th><th>Serial</th><th>MAC Address</th><th>Last User</th></tr><th></th></thead>";

                    while (reader.Read())
                    {
                        InventoryList.Text += "<tr class='invRow' id='"+reader["InventoryKey"]+"'><td>" + reader["Model"].ToString()
                                             + "</td><td>" + reader["SerialNum"].ToString()
                                             + "</td><td>" + reader["MAC"].ToString()
                                             + "</td><td>" + reader["UserEmail"].ToString()

                                             //+ "</td><td>" + "<span class='badge badge-warning badge-text'><i class='fa fa-truck mr-1'></i> Pending</span>"
                                             + "</td><td>" + "</span><span class='badge text-danger-light badge-danger ml-1 badge-text anibadge'>Hot</span>"
                                             + "</td></tr>";
                    } i++;

                    InventoryList.Text += "</table>";

                } while (reader.NextResult());

                reader.Close();
                con.Close();


            }
            else
            {
                Session["redirect"] = "admin-home.aspx";
                Response.Redirect("login.aspx");
            }
        }




    }
