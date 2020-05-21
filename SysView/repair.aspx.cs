using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Activities.Statements;

public partial class repair : System.Web.UI.Page
{

    
    static string ReturnVal { get; set; }
    static object ObjJSON { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USER_EMAIL"] != null
            && !string.IsNullOrEmpty(Session["USER_EMAIL"].ToString())
            && !String.IsNullOrEmpty(Session["UserStatus"].ToString())
            && Session["UserStatus"].ToString() == "Admin"
        )
        {

        }
        else
        {
            Session["redirect"] = "repair.aspx";
            Response.Redirect("login.aspx");
        }
    }

    [WebMethod]
    public static object SearchAssets(string assetNum)
    {
        try
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

            SqlCommand sqlcom = new SqlCommand("sv_usp_GetInventoryByAssetTag", conn);

            sqlcom.CommandType = CommandType.StoredProcedure;
            sqlcom.Parameters.AddWithValue("@AssetTag", assetNum);
            conn.Open();

            DataTable asset = new DataTable();

            asset.Load(sqlcom.ExecuteReader());
            conn.Close();
            
                foreach (DataRow item in asset.Rows)
                {
                
                    string invKey = item["InventoryKey"].ToString();
                    string model = item["Model"].ToString();
                    string serialNum = item["SerialNum"].ToString();
                    string mac = item["MAC"].ToString();
                    string useremail = item["UserEmail"].ToString();
                    string imgLink = item["ImgLink"].ToString();

                ReturnVal = "{'inventoryKey':" + "'" + invKey + "'"
                    + ", 'model':" + "'" + model + "'"
                    + ", 'serialNum':" + "'" + serialNum + "'"
                    + ", 'MAC':" + "'" + mac + "'"
                    + ", 'userEmail':" + "'" + useremail + "'"
                    + ", 'imgLink':" + "'" + imgLink + "'"
                    + "}";

                JavaScriptSerializer j = new JavaScriptSerializer();
                ObjJSON = j.Deserialize(ReturnVal, typeof(object));

            }

            return ObjJSON;
            
        }
        catch (Exception ex)
        {
            return "Error retrieving data from database";
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