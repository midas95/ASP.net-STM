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


    public partial class AdminStudentEdit : System.Web.UI.Page
    {

        public string FirstName { get; set; }
        public string UserEmail { get; set; }
        public static string StudentKey { get; set; }
        public string TotalLost { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_EMAIL"] != null && !string.IsNullOrEmpty(Session["USER_EMAIL"].ToString()) && !String.IsNullOrEmpty(Session["UserStatus"].ToString()) && Session["UserStatus"].ToString() == "Admin")
            {

                FirstName = Session["FirstName"].ToString();
                if (Request.QueryString["studentKey"] != null)
                {
                    StudentKey = Request.QueryString["studentKey"].ToString();
                    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

                    SqlDataReader dataReader;
                    string query = "select * from sv_Students where StudentKey='" + StudentKey + "'";
                    con.Open();
                    SqlCommand command = new SqlCommand(query, con);
                    dataReader = command.ExecuteReader();

                    while (dataReader.Read())
                    {
                        firstName.Value = dataReader["FirstName"].ToString();
                        lastName.Value = dataReader["LastName"].ToString();
                        email.Value = dataReader["Email"].ToString();
                        grade.Value = dataReader["Grade"].ToString();
                        teacher.Value = dataReader["Teacher"].ToString();
                        var o = user_status as System.Web.UI.HtmlControls.HtmlSelect;
                        if (dataReader["UserStatus"].ToString() == "Active") o.SelectedIndex = 0;
                        else o.SelectedIndex = 1;
                    }
                    con.Close();
                }
                else 
                { 
                    Response.Redirect("admin-student.aspx");
                }
            }
            else
            {
                Session["redirect"] = "admin-home.aspx";
                Response.Redirect("login.aspx");
            }
        }
        [WebMethod]
        public static string updateStudent(string firstName, string lastName, string email, string grade, string teacher, string status)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

            string query = "update sv_Students set FirstName=@FirstName, LastName=@LastName, Email=@Email, Grade=@Grade, Teacher=@Teacher, UserStatus=@UserStatus where StudentKey='" + StudentKey + "'";
            con.Open();
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@FirstName", firstName);
            command.Parameters.AddWithValue("@LastName", lastName);
            command.Parameters.AddWithValue("@Email", email);
            command.Parameters.AddWithValue("@Grade", grade);
            command.Parameters.AddWithValue("@Teacher", teacher);
            command.Parameters.AddWithValue("@UserStatus", status);

            command.ExecuteNonQuery();
            return "success";
        }


    }
