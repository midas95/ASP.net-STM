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

public partial class AdminAssetDetail : System.Web.UI.Page
{

    static string ReturnVal { get; set; }
    static object ObjJSON { get; set; }
    public string FirstName { get; set; }
    public string InventoryKey { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USER_EMAIL"] != null
            && !String.IsNullOrEmpty(Session["USER_EMAIL"].ToString())
            && !String.IsNullOrEmpty(Session["UserStatus"].ToString())
            && Session["UserStatus"].ToString() == "Admin"
        )
        {

            FirstName = Session["FirstName"].ToString();

            if (!String.IsNullOrEmpty(Request.QueryString["inventorykey"].ToString())){
                InventoryKey = Request.QueryString["inventorykey"].ToString();
            } else
            {
                Response.Redirect("admin-home.aspx");
            }

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

            SqlCommand sqlcom = new SqlCommand("sv_usp_GetInventoryByKey", conn);
            sqlcom.CommandType = CommandType.StoredProcedure;
            sqlcom.Parameters.AddWithValue("@InventoryKey", InventoryKey);
            conn.Open();

            DataTable asset = new DataTable();

            asset.Load(sqlcom.ExecuteReader());

            foreach (DataRow item in asset.Rows)
            {

                string InventoryKey = item["InventoryKey"].ToString();
                string model = item["Model"].ToString();
                string serialNum = item["SerialNum"].ToString();
                string mac = item["MAC"].ToString();
                string useremail = item["UserEmail"].ToString();
                string assetTag = item["AssetTag"].ToString();
                string statusID = item["StatusID"].ToString();
                string loanerFlag = item["LoanerFlag"].ToString();
                string homeUseFlag = item["HomeUseFlag"].ToString();
                string location = item["Location"].ToString();
                string fkStudentID = item["fkStudentID"].ToString();
                string imgLink = item["ImgLink"].ToString();

                txtAssetTag.Value = assetTag;
                txtModel.Value = model;
                txtSerialNum.Value = serialNum;
                txtStudentEmail.Value = useremail;
                if (!String.IsNullOrEmpty(assetTag) && !String.IsNullOrEmpty(serialNum))
                {
                    SqlCommand command = new SqlCommand("sv_usp_GetRepairHistory", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@AssetTag", assetTag);
                    command.Parameters.AddWithValue("@SerialNum", serialNum);

                    SqlDataReader reader = command.ExecuteReader();
                    int i = 0;
                    do
                    {
                        RepairList.Text = "<table class='table mb-0'>"
                                             + "<thead><tr><th>Model</th><th>Serial</th><th>MAC Address</th><th>Last User</th></tr></thead>";

                        while (reader.Read())
                        {
                            string invStatus = reader["InvStatus"].ToString();
                            string statusBtn;
                            switch (invStatus)
                            {
                                case "In Use":
                                    statusBtn = "</span><span class='badge text-info-light badge-info ml-1 badge-text '>" + invStatus + "</span>";
                                    break;
                                case "Decomissioned":
                                    statusBtn = "</span><span class='badge text-dark-light badge-dark ml-1 badge-text'>" + invStatus + "</span>";
                                    break;
                                case "Lost":
                                    statusBtn = "</span><span class='badge text-dark-light badge-dark ml-1 badge-text'>" + invStatus + "</span>";
                                    break;
                                case "Stolen":
                                    statusBtn = "</span><span class='badge text-dark-light badge-dark ml-1 badge-text'>" + invStatus + "</span>";
                                    break;
                                case "Unassigned":
                                    statusBtn = "</span><span class='badge text-secondary-light badge-secondary ml-1 badge-text'>" + invStatus + "</span>";
                                    break;
                                case "Repair Complete":
                                    statusBtn = "</span><span class='badge text-success-light badge-success ml-1 badge-text'>" + invStatus + "</span>";
                                    break;
                                default:
                                    statusBtn = "</span><span class='badge text-danger-light badge-danger ml-1 badge-text'>" + invStatus + "</span>";
                                    break;
                            }

                            ddlDeviceStatus.SelectedIndex = 1;// ddlDeviceStatus.Items.IndexOf(ddlDeviceStatus.Items.FindByText(invStatus));

                            RepairList.Text += "<tr class='invRow' id='" + reader["InventoryKey"] + "'><td>" + reader["Model"].ToString()
                                                     + "</td><td>" + reader["SerialNum"].ToString()
                                                     + "</td><td>" + reader["MAC"].ToString()
                                                     + "</td><td>" + reader["UserEmail"].ToString()
                                                     + "</td><td>" + statusBtn
                                                     + "</td></tr>";
                        }
                        i++;

                        RepairList.Text += "</table>";

                    } while (reader.NextResult());
                }
            }
                

            conn.Close();
        }
        else
        {
            Session["redirect"] = "admin-home.aspx";
            Response.Redirect("login.aspx");
        }
    }

    public static void SearchAssets(string invKey)
    {

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TrinoviContext"].ConnectionString);

            SqlCommand sqlcom = new SqlCommand("sv_usp_GetInventoryByKey", conn);
            sqlcom.CommandType = CommandType.StoredProcedure;
            sqlcom.Parameters.AddWithValue("@InventoryKey", invKey);
            conn.Open();

            DataTable asset = new DataTable();

            asset.Load(sqlcom.ExecuteReader());
            conn.Close();

            foreach (DataRow item in asset.Rows)
            {

                string InventoryKey = item["InventoryKey"].ToString();
                string model = item["Model"].ToString();
                string serialNum = item["SerialNum"].ToString();
                string mac = item["MAC"].ToString();
                string useremail = item["UserEmail"].ToString();
                string assetTag = item["AssetTag"].ToString();
                string statusID = item["StatusID"].ToString();
                string loanerFlag = item["LoanerFlag"].ToString();
                string homeUseFlag = item["HomeUseFlag"].ToString();
                string location = item["Location"].ToString();
                string fkStudentID = item["fkStudentID"].ToString();
                string imgLink = item["ImgLink"].ToString();


                //ReturnVal = "{'inventoryKey':" + "'" + invKey + "'"
                //    + ", 'model':" + "'" + model + "'"
                //    + ", 'serialNum':" + "'" + serialNum + "'"
                //    + ", 'MAC':" + "'" + mac + "'"
                //    + ", 'userEmail':" + "'" + useremail + "'"
                //    + ", 'assetTag':" + "'" + assetTag + "'"
                //    + ", 'statusID':" + "'" + statusID + "'"
                //    + ", 'loanerFlag':" + "'" + loanerFlag + "'"
                //    + ", 'homeUseFlag':" + "'" + homeUseFlag + "'"
                //    + ", 'location':" + "'" + location + "'"
                //    + ", 'fkStudentID':" + "'" + fkStudentID + "'"
                //    + ", 'imgLink':" + "'" + imgLink + "'"
                //    + "}";

                //JavaScriptSerializer j = new JavaScriptSerializer();
                //ObjJSON = j.Deserialize(ReturnVal, typeof(object));

            }
            

    }

}