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

public partial class repair : System.Web.UI.Page
{

    
    static string ReturnVal { get; set; }
    static object ObjJSON { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

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
}