using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using real_estate.ConnectDB;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace real_estate.ClassData
{
    public class PrefixID
    {

        public static string last_number;

        //ข้อมูลรันเลขที่ return กลับไปเป็นเลขที่แบบ String Ex.FL19080001
        public static string RunPrefixID(string prefixtype, string types)
        {
            //type : Add เพิ่มจำนวน +1 , Del ลดจำนวน -1
            string runId = "";
            string prefixid = "", prefixname = "";
            string year_format = "", month_form = "", day_format = "";
            string mm;
            string dd;
            int runnumber = 0;
            last_number = "";
            StringBuilder sql = new StringBuilder();
            var db = new DBClass();
            sql.Append("Select * From [realestate].[dbo].[sa_prefix] ");
            sql.AppendLine(" Where prefix_type='" + prefixtype + "' AND prefix_status !='InActive'");
            SqlDataReader dr = db.GetSqlDataReader(sql.ToString());
            while (dr.Read())
            {
                prefixid = dr["prefix_id"].ToString();
                prefixname = dr["prefix_name"].ToString();
                year_format = dr["year_format"].ToString();
                month_form = dr["month_format"].ToString();
                day_format = dr["day_format"].ToString();
                runnumber = Convert.ToUInt16(dr["run_number"]);
                last_number = dr["last_number"].ToString();
            }

            if (month_form == "mm")
            {
                mm = DateTime.Now.Month.ToString("d2");
            }
            else
            {
                mm = "";
            }

            if (day_format == "dd")
            {
                dd = DateTime.Now.Day.ToString("d2");
            }
            else
            {
                dd = "";
            }

            string numformat = "";
            if (year_format == "yy")
            {
                string y2 = DateTime.Now.Year.ToString();
                if (Convert.ToUInt32(last_number.Length) > 0 && last_number != "")
                {
                    numformat = Convert.ToString(Convert.ToInt32(last_number) + 1).ToString();
                }
                else
                {
                    numformat = "1";
                }
                runId = prefixid + y2.Substring(2) + mm + dd + numformat.PadLeft(runnumber, '0');
            }
            else if (year_format == "yyyy")
            {
                string y4 = DateTime.Now.Year.ToString();
                if (Convert.ToUInt32(last_number.Length) > 0 && last_number != "")
                {
                    numformat = Convert.ToString(Convert.ToInt32(last_number) + 1).ToString();
                }
                else
                {
                    numformat = "1";
                }
                runId = prefixid + y4 + mm + dd + numformat.PadLeft(runnumber, '0');
            }

            string sql2 = "";
            if (types == "Add")
            {
                sql2 = "update [realestate].[dbo].[sa_prefix] set last_number = last_number+1 where prefix_type ='" + prefixtype + "'";
            }
            else
            {
                sql2 = "update [realestate].[dbo].[sa_prefix] set last_number = last_number-1 where prefix_type ='" + prefixtype + "'";
            }
            db.SqlExecute(sql2.ToString());

            return runId;
        }
}
}