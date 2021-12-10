using real_estate.ConnectDB;
using real_estate.ClassData;
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

using System.Security.Cryptography;
 

namespace real_estate.Controllers.register
{
    public class registerController : ApiController
    {
        // GET: api/register
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" , "value3" };
        }

        // GET: api/register/5
        public string Get(string jsonData, string types)
        {

            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "chkDuplicateEmail")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  a.user_email , a.user_role_id ";
                sqltext += " FROM [realestate].[dbo].[sa_user] a ";
                sqltext += " WHERE a.user_email = '" + stuff.user_email + "' ";
                sqltext += " AND a.user_role_id = '" + stuff.user_role_id + "' ;";


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
            else
            {
                rs = "ไม่ข้อมูล";
            }

            return rs; 
            //return  $"value {id}";
        }



        public class Register_Result
        {
            public string data { get; set; }
        }


        // POST: api/register
        public string Post(Register_Result value)
        {
            dynamic stuff = JsonConvert.DeserializeObject(value.data.ToString());
            string types = Request.Headers.GetValues("types").FirstOrDefault().ToString();
            var db = new DBClass();
            string rs = "";

            if (types == "AddRegisterUserCustomer")//สมัครสมาชิก
            {
                string uid = PrefixID.RunPrefixID("gen_userId", "Add");
                string cid = PrefixID.RunPrefixID("gen_customerId", "Add");

                string hashPassword = ConvertMD5(stuff.user_password.ToString());

                //string res = $"{hashPassword} , {uid} "; 
                StringBuilder sqlInsert = new StringBuilder();
                sqlInsert.Clear();
                sqlInsert.Append("INSERT INTO [realestate].[dbo].[sa_user] ( ");
                sqlInsert.AppendLine("  user_id                         ");
                sqlInsert.AppendLine(" ,user_email                      ");
                sqlInsert.AppendLine(" ,user_password                   ");
                sqlInsert.AppendLine(" ,user_role_id                    "); 
                sqlInsert.AppendLine(" ,user_status                     ");
                sqlInsert.AppendLine(" ,user_firstName                  ");
                sqlInsert.AppendLine(" ,user_lastName                   ");
                sqlInsert.AppendLine(" ,create_date                     ");
                sqlInsert.AppendLine(" ,create_by                       "); 
                sqlInsert.AppendLine(" )                                "); 
                sqlInsert.AppendLine(" VALUES (                         ");
                sqlInsert.AppendLine(" '" + uid + "',                   ");
                sqlInsert.AppendLine(" '" + stuff.user_email + "',      ");
                sqlInsert.AppendLine(" '" + hashPassword + "',          ");
                sqlInsert.AppendLine(" 2 ,                              ");
                sqlInsert.AppendLine(" 'A' ,                            ");
                sqlInsert.AppendLine(" '" + stuff.cus_firstName + "',  ");
                sqlInsert.AppendLine(" '" + stuff.cus_lastName + "',   ");
                sqlInsert.AppendLine(" getdate(),");
                sqlInsert.AppendLine(" 'System'  ");         
                sqlInsert.AppendLine(" ) "); 

                StringBuilder sqlInsertCus = new StringBuilder();
                sqlInsertCus.Clear();
                sqlInsertCus.Append("INSERT INTO  [realestate].[dbo].[re_CustomerTable] ( ");
                sqlInsertCus.AppendLine("  cus_id                           ");
                sqlInsertCus.AppendLine("  ,user_id                         ");
                sqlInsertCus.AppendLine(" ,cus_firstName                    ");
                sqlInsertCus.AppendLine(" ,cus_lastName                     ");
                sqlInsertCus.AppendLine(" ,cus_dateOfBirth                  ");
                sqlInsertCus.AppendLine(" ,cus_idCard                       ");
                sqlInsertCus.AppendLine(" ,cus_phone                        "); 
                sqlInsertCus.AppendLine(" ,create_date                      ");
                sqlInsertCus.AppendLine(" ,create_by                        ");   
                sqlInsertCus.AppendLine(" ,cus_status                       ");
                sqlInsertCus.AppendLine(" )                                 ");
                sqlInsertCus.AppendLine(" VALUES (                          ");
                sqlInsertCus.AppendLine(" '" + cid + "',                    ");
                sqlInsertCus.AppendLine(" '" + uid + "',                    ");
                sqlInsertCus.AppendLine(" '" + stuff.cus_firstName + "',    ");
                sqlInsertCus.AppendLine(" '" + stuff.cus_lastName + "',     ");
                sqlInsertCus.AppendLine(" '" + stuff.cus_dateOfBirth + "',  ");
                sqlInsertCus.AppendLine(" '" + stuff.cus_idCard + "',       ");
                sqlInsertCus.AppendLine(" '" + stuff.cus_phone + "',        "); 
                sqlInsertCus.AppendLine(" getdate(),                        ");
                sqlInsertCus.AppendLine(" 'System' ,                        ");
                sqlInsertCus.AppendLine(" 'A'                               ");
                sqlInsertCus.AppendLine(" )                                 ");
                try
                {
                    db.SqlExecute(sqlInsert.ToString());
                    db.SqlExecute(sqlInsertCus.ToString());
                    rs = "success";
                    //rs = sqlInsert.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }

            }
            else if (types == "AddRegisterUserSale")//สมัครสมาชิก
            {
                string uid = PrefixID.RunPrefixID("gen_userId", "Add");
                string sid = PrefixID.RunPrefixID("gen_saleId", "Add");

                string hashPassword = ConvertMD5(stuff.user_password.ToString());

                //string res = $"{hashPassword} , {uid} "; 
                StringBuilder sqlInsert = new StringBuilder();
                sqlInsert.Clear();
                sqlInsert.Append("INSERT INTO [realestate].[dbo].[sa_user] ( ");
                sqlInsert.AppendLine("  user_id                         ");
                sqlInsert.AppendLine(" ,user_email                      ");
                sqlInsert.AppendLine(" ,user_password                   ");
                sqlInsert.AppendLine(" ,user_role_id                    ");
                sqlInsert.AppendLine(" ,user_status                     ");
                sqlInsert.AppendLine(" ,user_firstName                  ");
                sqlInsert.AppendLine(" ,user_lastName                   "); 
                sqlInsert.AppendLine(" ,create_date                     ");
                sqlInsert.AppendLine(" ,create_by                       ");
                sqlInsert.AppendLine(" )                                ");
                sqlInsert.AppendLine(" VALUES (                         ");
                sqlInsert.AppendLine(" '" + uid + "',                   ");
                sqlInsert.AppendLine(" '" + stuff.user_email + "',      ");
                sqlInsert.AppendLine(" '" + hashPassword + "',          ");
                sqlInsert.AppendLine(" 3 ,                              ");
                sqlInsert.AppendLine(" 'N' ,                            ");
                sqlInsert.AppendLine(" '" + stuff.sale_firstName + "',  ");
                sqlInsert.AppendLine(" '" + stuff.sale_lastName + "',   ");
                sqlInsert.AppendLine(" getdate(),");
                sqlInsert.AppendLine(" 'System'  ");
                sqlInsert.AppendLine(" ) ");

                StringBuilder sqlInsertSale = new StringBuilder();
                sqlInsertSale.Clear();
                sqlInsertSale.Append("INSERT INTO  [realestate].[dbo].[re_SaleTable] ( ");
                sqlInsertSale.AppendLine("  sale_id                             ");
                sqlInsertSale.AppendLine("  ,user_id                            ");
                sqlInsertSale.AppendLine(" ,[sale_firstName]                    ");
                sqlInsertSale.AppendLine(" ,[sale_lastName]                     ");
                sqlInsertSale.AppendLine(" ,[sale_dateOfBirth]                  ");
                sqlInsertSale.AppendLine(" ,[sale_idCard]                       ");
                sqlInsertSale.AppendLine(" ,[sale_phone]                        ");
                sqlInsertSale.AppendLine(" ,[sale_line]                         ");
                sqlInsertSale.AppendLine(" ,[sale_mail]                         ");
                sqlInsertSale.AppendLine(" ,[sale_company]                      ");
                sqlInsertSale.AppendLine(" ,[sale_position]                     ");
                sqlInsertSale.AppendLine(" ,[sale_AgentApproveNo]               ");  
                sqlInsertSale.AppendLine(" ,create_date                         ");
                sqlInsertSale.AppendLine(" ,create_by                           ");
                sqlInsertSale.AppendLine(" ,sale_status                         ");

                sqlInsertSale.AppendLine(" )                                    ");
                sqlInsertSale.AppendLine(" VALUES (                             ");
                sqlInsertSale.AppendLine(" '" + sid + "',                       ");
                sqlInsertSale.AppendLine(" '" + uid + "',                       ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_firstName + "',      ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_lastName + "',       ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_dateOfBirth + "',    ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_idCard + "',         ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_phone + "',          ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_line + "',           ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_mail + "',           ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_company + "',        ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_position + "',       ");
                sqlInsertSale.AppendLine(" '" + stuff.sale_AgentApproveNo + "', "); 
                sqlInsertSale.AppendLine(" getdate() ,                          ");
                sqlInsertSale.AppendLine(" 'System' ,                           ");
                sqlInsertSale.AppendLine(" 'A'                                  ");
                sqlInsertSale.AppendLine(" )                                    ");
                try
                {
                    db.SqlExecute(sqlInsert.ToString());
                    db.SqlExecute(sqlInsertSale.ToString());
                    rs = "success";
                    //rs = sqlInsert.ToString();
                }
                catch (SqlException ex) { rs = ex.ToString(); }

            }
            else if (types == "login") {

                StringBuilder sqlUpdate = new StringBuilder();
                sqlUpdate.Clear();
                sqlUpdate.Append("UPDATE [realestate].[dbo].[sa_user] SET "); 
                sqlUpdate.AppendLine("   last_login = getdate() ");
                sqlUpdate.AppendLine("  WHERE [user_email] ='" + stuff.user_email + "'");
                sqlUpdate.AppendLine("  AND [user_role_id] in('" + stuff.user_role_id + "', '1' ) ");
                sqlUpdate.AppendLine("  AND [user_status] ='A'"); 

                try
                { 
                    db.SqlExecute(sqlUpdate.ToString()); 
                }
                catch (SqlException ex) { rs = ex.ToString(); }


                string dbPassword = ConvertMD5(stuff.user_password.ToString());

                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  a.[user_id] , a.[user_email] , a.user_role_id , a.user_status , b.role_name    ";
                sqltext += "        ,  a.user_firstName , a.user_lastName                                           ";
                sqltext += "        , ISNULL( c.sale_id,'' ) as sale_id , ISNULL( d.cus_id , '' ) as  cus_id        ";
                sqltext += " FROM [realestate].[dbo].[sa_user] a                                                    ";
                sqltext += " INNER JOIN realestate..sa_role b ON b.role_id = a.user_role_id                         ";
                sqltext += " LEFT JOIN realestate..re_SaleTable c ON c.user_id = a.user_id  and c.sale_status = 'A' ";
                sqltext += " LEFT JOIN realestate..re_CustomerTable d ON d.user_id = a.user_id                      ";
                sqltext += " WHERE a.[user_email] = '" + stuff.user_email + "'                                      "; 
                sqltext += " AND a.[user_password] = '" + dbPassword + "'                                           ";
                sqltext += " AND a.[user_role_id] in('" + stuff.user_role_id + "', '1' )                            ";
                sqltext += " AND a.[user_status] ='A'                                                               ";



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

        // PUT: api/register/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/register/5
        public void Delete(int id)
        {
        }

        //Encrypt MD5
        public string ConvertMD5(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
    }
}
