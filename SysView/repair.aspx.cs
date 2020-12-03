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


    public partial class Repair : System.Web.UI.Page
    {

        public string FirstName { get; set; }
        public string UserEmail { get; set; }
        public static string InvKey { get; set; }
        public string TotalLost { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_EMAIL"] != null && !string.IsNullOrEmpty(Session["USER_EMAIL"].ToString()) && !String.IsNullOrEmpty(Session["UserStatus"].ToString()) && Session["UserStatus"].ToString() == "Admin")
            {

                FirstName = Session["FirstName"].ToString();
                if (Request.QueryString["InventoryKey"] != null)
                {
                    InvKey = Request.QueryString["InventoryKey"].ToString();
                    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

                    SqlDataReader dataReader;
                    string query = "select * from sv_Inventory where InventoryKey='" + InvKey + "'";
                    con.Open();
                    SqlCommand command = new SqlCommand(query, con);
                    dataReader = command.ExecuteReader();

                    while (dataReader.Read())
                    {
                }
                SqlCommand com = new SqlCommand("sv_usp_GetStudentDevices", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@studentKey", InvKey);
                com.Connection = con;
                SqlDataReader reader = com.ExecuteReader();
                while (reader.Read())
                {
                    string userStatus = reader["InvStatus"].ToString();
                    string statusBtn;
                    switch (userStatus)
                    {
                        case "In Use":
                            statusBtn = "<span class='badge text-info-light badge-success ml-1 badge-text '>" + userStatus + "</span>";
                            break;
                        default:
                            statusBtn = "<span class='badge text-danger-light badge-danger ml-1 badge-text'>" + userStatus + "</span>";
                            break;
                    }
                    string btn_lost_stolen = "<a href='javascript:void(0);' data-studentid='" + reader["StudentID"].ToString() + "' data-assettag='" + reader["AssetTag"].ToString() + "' data-email='" + reader["Email"].ToString() + "' data-inventorykey='" + reader["InventoryKey"].ToString() + "' class='btn btn-info btn-lost-stolen'>Lost/Stolen</a>";
                    if (userStatus == "Lost/Stolen")
                    {
                        btn_lost_stolen = "";
                        studentDevice_title.InnerText = "Device";
                    }
                    Devicelist.InnerHtml += "<tr>" +
                                                "<td class='first-name'>" + reader["FirstName"].ToString() + "</td>" +
                                                "<td class='last-name'>" + reader["LastName"].ToString() + "</td>" +
                                                "<td class='model'>" + reader["Model"].ToString() + "</td>" +
                                                "<td class='serial-num'>" + reader["SerialNum"].ToString() + "</td>" +
                                                "<td>" + statusBtn + "</td>" +
                                                "<td>" + btn_lost_stolen + "</td>" +
                                              "</tr>";
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
    public static string InsertRepairs(string invkey, string problems, string problemNotes)
    {
        try
        {

            SqlDataReader dataReader;
            string querySelect = "select Model, SerialNum, MAC, UserEmail, AssetTag, StatusID, Location, fkStudentID from sv_Inventory where InventoryKey='" + invkey + "'";

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(querySelect, conn);

            dataReader = cmd.ExecuteReader();

            while (dataReader.Read())
            {
                string Model = dataReader["Model"].ToString();
                string SerialNum = dataReader["SerialNum"].ToString();
                string MAC = dataReader["MAC"].ToString();
                string UserEmail = dataReader["UserEmail"].ToString();
                string fk_AssetTag = dataReader["AssetTag"].ToString();
                string StatusID = dataReader["StatusID"].ToString();
                string Location = dataReader["Location"].ToString();
                string fkStudentID = dataReader["fkStudentID"].ToString();

                SqlCommand cmdInsert = new SqlCommand("insert into sv_Repairs (Model, SerialNum, MAC, UserEmail, fk_AssetTag, StatusID, Location, fkStudentID, Problems, ProblemNotes) values(@Model, @SerialNum, @MAC, @UserEmail, @fk_AssetTag, @StatusID, @Location, @fkStudentID, @Problems, @ProblemNotes)", conn);
                cmdInsert.Parameters.AddWithValue("@Model", Model);
                cmdInsert.Parameters.AddWithValue("@SerialNum", SerialNum);
                cmdInsert.Parameters.AddWithValue("@MAC", MAC);
                cmdInsert.Parameters.AddWithValue("@UserEmail", UserEmail);
                cmdInsert.Parameters.AddWithValue("@fk_AssetTag", fk_AssetTag);
                cmdInsert.Parameters.AddWithValue("@StatusID", StatusID);
                cmdInsert.Parameters.AddWithValue("@Location", Location);
                cmdInsert.Parameters.AddWithValue("@fkStudentID", fkStudentID);
                cmdInsert.Parameters.AddWithValue("@Problems", problems);
                cmdInsert.Parameters.AddWithValue("@ProblemNotes", problemNotes);

                cmdInsert.ExecuteNonQuery();

                SqlCommand cmdInvUpdate = new SqlCommand("update sv_Inventory SET StatusID = 2 WHERE SerialNum ='" +
                                                            SerialNum + "' " +
                                                         "AND AssetTag='" +
                                                            fk_AssetTag + "'", conn);
                cmdInvUpdate.ExecuteNonQuery();
            }


            dataReader.Close();
            conn.Close();
            return "success";
        }
        catch (Exception ex)
        {
            Console.Write(ex);
            return "Failure";
        }
    }

}
