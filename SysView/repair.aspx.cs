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
using System.Web.Script.Serialization;


public partial class Repair : System.Web.UI.Page
    {

        public string FirstName { get; set; }
        public string UserEmail { get; set; }
        public static string InvKey { get; set; }
        public string TotalLost { get; set; }
        public string Model { get; set; }
        public string SerialNum { get; set; }
        public string MAC { get; set; }
        public string ImgLink { get; set; }
        public string InvStatus { get; set; }
        public string StudentID { get; set; }
        public string AssetTag { get; set; }

    protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_EMAIL"] != null && !string.IsNullOrEmpty(Session["USER_EMAIL"].ToString()) && !String.IsNullOrEmpty(Session["UserStatus"].ToString()) && Session["UserStatus"].ToString() == "Admin")
            {
                if (Request.QueryString["InventoryKey"] != null)
                {
                    InvKey = Request.QueryString["InventoryKey"].ToString();
                    SearchAssets(InvKey);
                }
                else
                {
                    Response.Redirect("devices.aspx");
                }
        }
        else
        {
            Session["redirect"] = "devices.aspx";
            Response.Redirect("login.aspx");
        }
    }

    public void SearchAssets(string invKey)
    {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

            SqlCommand sqlcom = new SqlCommand("sv_usp_GetInventoryByInvKey", conn);

            sqlcom.CommandType = CommandType.StoredProcedure;
            sqlcom.Parameters.AddWithValue("@InvKey", invKey);
            conn.Open();

            DataTable asset = new DataTable();

            asset.Load(sqlcom.ExecuteReader());
            conn.Close();

            foreach (DataRow item in asset.Rows)
            {

                 InvKey = item["InventoryKey"].ToString();
                 Model = item["Model"].ToString();
                 SerialNum = item["SerialNum"].ToString();
                 MAC = item["MAC"].ToString();
                 UserEmail = item["UserEmail"].ToString();
                 ImgLink = item["ImgLink"].ToString();
                 InvStatus = item["InvStatus"].ToString();
                 StudentID = item["StudentID"].ToString();
                 AssetTag = item["AssetTag"].ToString();
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
