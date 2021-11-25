using real_estate.ConnectDB;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;


namespace real_estate.Controllers.main
{
    public class newsController : ApiController
    {

        // GET: api/withdrawal
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        //string getdateNow = "GETDATE()";


        public string Get(string jsonData, string types)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "listNews")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  a.*  ";
                sqltext += " FROM realestate..re_news a ";               

                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());
                    }
                    //result.Add("check", check);
                    arr.Add(result);
                }
                rs = JsonConvert.SerializeObject(arr);
            }
            else if (types == "GetSeqCloseBKUP")
            {
                SqlDataReader dr;
                string sqltext = "";

                sqltext += "SELECT A.CloseNumber, A.close_code, A.sum_balance_book_close, FORMAT(Close_Date,'dd/MM/yyyy') as  CloseDate ";
                sqltext += "FROM New_Menaleasing..bc_close_bookBankHD A  ";
                sqltext += " WHERE A.loan_number = '" + stuff.loan_number + "'    ";
                sqltext += "ORDER BY  A.CloseNumber + 0 ASC ";

                dr = db.GetSqlDataReader(sqltext);
                ArrayList arr = new ArrayList();
                while (dr.Read())
                {
                    var result = new Dictionary<string, object>();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        result.Add(dr.GetName(i), dr[i].ToString());
                    }
                    arr.Add(result);
                }
                rs = JsonConvert.SerializeObject(arr);
            }
          
            return rs;
        }






        public class save_result
        {
            public string data_1 { get; set; }

        }

        // POST: api/withdrawal
        public string Post(save_result value)
        {
            dynamic stuff = JsonConvert.DeserializeObject(value.data_1.ToString());
 
            string types = Request.Headers.GetValues("types").FirstOrDefault().ToString(); 
            var db = new DBClass();
            string rs = "";

            if (types == "SaveDataBKUP")
            {
                rs = "success";
      
                dynamic arr = JsonConvert.DeserializeObject(stuff.arr.ToString());
                StringBuilder sql_insertHD = new StringBuilder();
                sql_insertHD.Append("INSERT INTO New_Menaleasing..bc_withdrawHD ("); //insert HD
                sql_insertHD.AppendLine(" wd_code,");
                sql_insertHD.AppendLine(" loan_number,");
                sql_insertHD.AppendLine(" wd_date,");
                sql_insertHD.AppendLine(" wd_money,");
                sql_insertHD.AppendLine(" full_wd_money,");
                sql_insertHD.AppendLine(" diff_wd_money,");
                sql_insertHD.AppendLine(" wd_seq,");
                sql_insertHD.AppendLine(" Create_by,");
                sql_insertHD.AppendLine(" Create_date,");
                sql_insertHD.AppendLine(" wd_ins");
                sql_insertHD.AppendLine(" ) VALUES ( "); //  value
                sql_insertHD.AppendLine("'" + stuff.Txt_Wd + "',"); //wd_code
                sql_insertHD.AppendLine("'" + stuff.Txt_loan_number + "',"); //loan_number
                sql_insertHD.AppendLine("'" + stuff.Txt_Wd_Date + "',"); //wd_date
                sql_insertHD.AppendLine("'" + stuff.TxtWd_Money + "',"); //wd_money
                sql_insertHD.AppendLine("'" + stuff.TxtWd_Sum_Money + "',"); //TxtWd_Sum_Money
                sql_insertHD.AppendLine("'" + stuff.diff_wd_money + "',"); //diff_wd_money
                sql_insertHD.AppendLine("'" + stuff.Txt_Wd_Seq + "',"); //wd_seq
                sql_insertHD.AppendLine("'" + stuff.fullname + "',"); //Create_by
                sql_insertHD.AppendLine(" getdate(), "); //Create_date
                sql_insertHD.AppendLine("'" + stuff.wd_ins + "' )"); //wd_ins


                for (int i = 0; i < arr.Count; i++)
                {
                    StringBuilder sql_insertDT = new StringBuilder();
                    sql_insertDT.Append("INSERT INTO New_Menaleasing..bc_withdrawDT ("); //insert รายละเอียด
                    sql_insertDT.AppendLine(" wd_loan_number,");
                    sql_insertDT.AppendLine(" wd_code,");
                    sql_insertDT.AppendLine(" wdt_no,");
                    sql_insertDT.AppendLine(" cust_code,");
                    sql_insertDT.AppendLine(" cust_firstname,");
                    sql_insertDT.AppendLine(" cust_surname,");
                    sql_insertDT.AppendLine(" wdt_pol_code,");
                    sql_insertDT.AppendLine(" pay_first_date,");
                    sql_insertDT.AppendLine(" pay_finish_date,");
                    sql_insertDT.AppendLine(" car_brand,");
                    sql_insertDT.AppendLine(" car_plate,");
                    sql_insertDT.AppendLine(" car_color,");
                    sql_insertDT.AppendLine(" car_year,");
                    sql_insertDT.AppendLine(" car_body_no,");
                    sql_insertDT.AppendLine(" car_motor_no,");
                    sql_insertDT.AppendLine(" ins,");
                    sql_insertDT.AppendLine(" money_approx,");
                    sql_insertDT.AppendLine(" pay_of_month,");
                    sql_insertDT.AppendLine(" pay_of_month_no_vat,");
                    sql_insertDT.AppendLine(" month_balance,");
                    sql_insertDT.AppendLine(" month_balance_paid,");
                    sql_insertDT.AppendLine(" balance,");
                    sql_insertDT.AppendLine(" balance_of_close_date,");
                    sql_insertDT.AppendLine(" pol_date,");
                    sql_insertDT.AppendLine(" asset_amount,");
                    sql_insertDT.AppendLine(" book_money,");
                    sql_insertDT.AppendLine(" down_money,");
                    sql_insertDT.AppendLine(" money_paid,");
                    sql_insertDT.AppendLine(" Create_by,");
                    sql_insertDT.AppendLine(" Create_date");
                    sql_insertDT.AppendLine(" ) VALUES ( "); //    value
                    sql_insertDT.AppendLine("'" + stuff.Txt_loan_number + "',"); //loan_number
                    sql_insertDT.AppendLine("'" + arr[i]["wd_code"] + "',"); //wd_code
                    sql_insertDT.AppendLine("'" + arr[i]["wdt_no"] + "',"); //wdt_no
                    sql_insertDT.AppendLine("'" + arr[i]["cust_code"] + "',"); //cust_code
                    sql_insertDT.AppendLine("'" + arr[i]["cust_firstname"] + "',"); //cust_firstname
                    sql_insertDT.AppendLine("'" + arr[i]["cust_surname"] + "',"); //cust_surname
                    sql_insertDT.AppendLine("'" + arr[i]["wdt_pol_code"] + "',"); //wdt_pol_code
                    sql_insertDT.AppendLine("'" + arr[i]["pay_first_date"] + "',"); //pay_first_date
                    sql_insertDT.AppendLine("'" + arr[i]["pay_finish_date"] + "',"); //pay_finish_date
                    sql_insertDT.AppendLine("'" + arr[i]["car_brand"] + "',"); //car_brand
                    sql_insertDT.AppendLine("'" + arr[i]["car_plate"] + "',"); //car_plate
                    sql_insertDT.AppendLine("'" + arr[i]["car_color"] + "',"); //car_color
                    sql_insertDT.AppendLine("'" + arr[i]["car_year"] + "',"); //car_year
                    sql_insertDT.AppendLine("'" + arr[i]["car_body_no"] + "',"); //car_body_no
                    sql_insertDT.AppendLine("'" + arr[i]["car_motor_no"] + "',"); //car_motor_no
                    sql_insertDT.AppendLine("'" + arr[i]["ins"] + "',"); //ins
                    sql_insertDT.AppendLine("'" + arr[i]["money_approx"] + "',"); //money_approx
                    sql_insertDT.AppendLine("'" + arr[i]["pay_of_month"] + "',"); //pay_of_month
                    sql_insertDT.AppendLine("'" + arr[i]["pay_of_month_no_vat"] + "',"); //pay_of_month_no_vat
                    sql_insertDT.AppendLine("'" + arr[i]["month_balance"] + "',"); //month_balance
                    sql_insertDT.AppendLine("'" + arr[i]["month_balance_paid"] + "',"); //month_balance_paid
                    sql_insertDT.AppendLine("'" + arr[i]["balance"] + "',"); //balance
                    sql_insertDT.AppendLine("'" + arr[i]["Balance_of_close_date70"] + "',"); //balance_of_close_date /////////////เลทตามธนาคาร
                    sql_insertDT.AppendLine("'" + arr[i]["pol_date"] + "',"); //pol_date
                    sql_insertDT.AppendLine("'" + arr[i]["asset_amount"] + "',"); //asset_amount
                    sql_insertDT.AppendLine("'" + arr[i]["book_money"] + "',"); //book_money
                    sql_insertDT.AppendLine("'" + arr[i]["down_money"] + "',"); //down_money
                    sql_insertDT.AppendLine("'" + arr[i]["money_paid"] + "',"); //money_paid
                    sql_insertDT.AppendLine("'" + stuff.fullname + "',"); //Create_by
                    sql_insertDT.AppendLine(" getdate() ) "); //Create_date

                    try
                    {
                        db.SqlExecute(sql_insertDT.ToString());
                        //rss2 = sql_insertDT.ToString();
                    }
                    catch (SqlException ex) { rs = ex.ToString(); }
                }

                try
                {
                    db.SqlExecute(sql_insertHD.ToString());
                    //rss1 = sql_insertHD.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }
                //rs = rss2;
            }
       
          
            return rs;
        }

    }
}
