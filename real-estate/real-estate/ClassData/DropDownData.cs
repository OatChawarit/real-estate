using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


namespace real_estate.ClassData
{
    public class DropDownData
    {
        public static void drdwProvince()
        {
            //txtDrDW.Items.Clear();
            //string strsql = "";
            //strsql += " SELECT province_id , province_name";
            //strsql += " FROM realestate..sa_AddressProvince ";
            //strsql += " Order By province_name Asc";

            //var db = new ConnectDB.DBClass();
            //SqlDataReader dr = db.GetSqlDataReader(strsql.ToString());
            //txtDrDW.DataSource = dr;
            //txtDrDW.DataTextField = "province_name";
            //txtDrDW.DataValueField = "province_id";
            //txtDrDW.DataBind();
            //txtDrDW.Items.Add(new ListItem("-- กรุณาเลือกจังหวัด --", ""));

            string strsql = "";
            strsql += " SELECT province_id , province_name";
            strsql += " FROM realestate..sa_AddressProvince ";
            strsql += " Order By province_name Asc";

            var db = new ConnectDB.DBClass();
            SqlDataReader dr = db.GetSqlDataReader(strsql.ToString());
            StringBuilder str = new StringBuilder();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<option value='" + dr["province_id"].ToString() + "'>" + dr["province_name"].ToString() + "</option>");
                }
            }
            System.Web.HttpContext.Current.Response.Write(str);
            
        }
    }
}