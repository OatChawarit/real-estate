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

        public static void drdwCompany()
        { 
            string sqltext = "";
            sqltext += "    SELECT  [com_id]                                       ";
            sqltext += "        ,[com_name]                                      ";
            sqltext += "    FROM [realestate].[dbo].[re_CompanyTable]            ";
            sqltext += "    WHERE com_status = 'N'                               ";

            var db = new ConnectDB.DBClass();
            SqlDataReader dr = db.GetSqlDataReader(sqltext.ToString());
            StringBuilder str = new StringBuilder();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<option value='" + dr["com_id"].ToString() + "'>" + dr["com_name"].ToString() + "</option>");
                }
            }
            System.Web.HttpContext.Current.Response.Write(str);

        }

        public static void drdwProjectType()
        {
            string sqltext = "";
            sqltext += "    SELECT [pro_type_id]    ,[pro_type_name]                ";       
            sqltext += "    FROM [realestate].[dbo].[re_Project_Type_Table]         ";
            sqltext += "    WHERE pro_type_status = 'N'                             ";

            var db = new ConnectDB.DBClass();
            SqlDataReader dr = db.GetSqlDataReader(sqltext.ToString());
            StringBuilder str = new StringBuilder();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<option value='" + dr["pro_type_id"].ToString() + "'>" + dr["pro_type_name"].ToString() + "</option>");
                }
            }
            System.Web.HttpContext.Current.Response.Write(str);

        }

        public static void drdwProjectLocation()
        {
            string sqltext = "";
            sqltext += "    SELECT  [pro_location_id]  ,[pro_location_name]                ";
            sqltext += "    FROM [realestate].[dbo].[re_Project_Location_Table]                ";
            sqltext += "    WHERE [pro_ocation_status] = 'N'                             ";

            var db = new ConnectDB.DBClass();
            SqlDataReader dr = db.GetSqlDataReader(sqltext.ToString());
            StringBuilder str = new StringBuilder();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<option value='" + dr["pro_location_id"].ToString() + "'>" + dr["pro_location_name"].ToString() + "</option>");
                }
            }
            System.Web.HttpContext.Current.Response.Write(str);

        }

        public static void drdwProjectStatusType()
        {
            string sqltext = "";
            sqltext += "   SELECT  [pro_statusType_id]  ,[pro_statusType_name]               ";
            sqltext += "   FROM [realestate].[dbo].[re_Project_StatusType]                ";
            sqltext += "     where [pro_statusType_status] = 'N'                           ";

            var db = new ConnectDB.DBClass();
            SqlDataReader dr = db.GetSqlDataReader(sqltext.ToString());
            StringBuilder str = new StringBuilder();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<option value='" + dr["pro_statusType_id"].ToString() + "'>" + dr["pro_statusType_name"].ToString() + "</option>");
                }
            }
            System.Web.HttpContext.Current.Response.Write(str);

        }


        public static void drdwRoleType()
        {
            string sqltext = "";
            sqltext += "   SELECT  [role_id]  ,[role_name]        ";
            sqltext += "   FROM [realestate].[dbo].[sa_role]      ";

            var db = new ConnectDB.DBClass();
            SqlDataReader dr = db.GetSqlDataReader(sqltext.ToString());
            StringBuilder str = new StringBuilder();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    str.AppendLine("<option value='" + dr["role_id"].ToString() + "'>" + dr["role_name"].ToString() + "</option>");
                }
            }
            System.Web.HttpContext.Current.Response.Write(str);

        }

    }
}