using System;
using System.Collections.Generic;
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
using System.Configuration;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;

public partial class Admin_LogIn : System.Web.UI.Page
{
    string SqlCon = "";
    SqlConnection objsqlconn;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCon = ConfigurationManager.ConnectionStrings["DB_A17D64_trinovitechEntities"].ToString();
        objsqlconn = new SqlConnection(SqlCon);
        if (!string.IsNullOrEmpty(Request.QueryString["state"]))
        {
            Session["USER_EMAIL"] = null;
            Session["redirect"] = null;
        }
    }

    protected void btnsignin_Click(object sender, EventArgs e)
    {
        Session["USER_EMAIL"] = null;
        Session["Admin"] = null;
        if (String.IsNullOrEmpty(txtusername.Text) || String.IsNullOrEmpty(txtpassword.Text))
        {
            lblmsg.Text = "Please enter a valid email and password";
        }
        else
        {
            SqlCommand command = new SqlCommand("usp_GetAlldusers", objsqlconn);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            objsqlconn.Open();

            DataTable dt = new DataTable();

            dt.Load(command.ExecuteReader());
            objsqlconn.Close();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow item in dt.Rows)
                {
                    if (txtusername.Text.ToString().Trim().ToUpper() == item["Email"].ToString().Trim().ToUpper() && txtpassword.Text.ToString().Trim() == item["Password"].ToString().Trim() && item["UserStatus"].ToString().Trim()=="Admin")
                    {
                        Session["USER_EMAIL"] = item["Email"].ToString().Trim();
                        Session["UserName"] = item["FirstName"].ToString() + " " + item["LastName"].ToString();
                        Session["UserKey"] = item["UserKey"].ToString();
                        Session["Admin"] = "1";
                        Response.Redirect("inventorylist.aspx");
                    }
                    else
                    {
                        lblmsg.Text = "Please enter a valid email and password";
                    }
                }
            }
        }
    }
}