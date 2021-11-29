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
                sqltext += " SELECT  a.user_name ";
                sqltext += " FROM [realestate].[dbo].[sa_user] a ";
                sqltext += " WHERE a.user_name = '" + stuff.user_name + "' ;";

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

            if (types == "AddRegisterUser")
            {
                string uid = PrefixID.RunPrefixID("gen_userId", "Add");
                string cid = PrefixID.RunPrefixID("gen_customerId", "Add");

                string hashPassword = ConvertMD5(stuff.user_password.ToString());

                //string res = $"{hashPassword} , {uid} "; 
                StringBuilder sqlInsert = new StringBuilder();
                sqlInsert.Clear();
                sqlInsert.Append("INSERT INTO [realestate].[dbo].[sa_user] ( ");
                sqlInsert.AppendLine("  user_id ");
                sqlInsert.AppendLine(" ,user_name ");
                sqlInsert.AppendLine(" ,user_password ");
                sqlInsert.AppendLine(" ,user_role_id ");
                sqlInsert.AppendLine(" ,create_date ");
                sqlInsert.AppendLine(" ,create_by ");
                sqlInsert.AppendLine(" ,cus_id ");
                sqlInsert.AppendLine(" ) ");


                sqlInsert.AppendLine(" VALUES ( ");
                sqlInsert.AppendLine(" '" + uid + "',");
                sqlInsert.AppendLine(" '" + stuff.user_name + "',");
                sqlInsert.AppendLine(" '" + hashPassword + "',");
                sqlInsert.AppendLine(" 2 ,");
                sqlInsert.AppendLine(" getdate(),");
                sqlInsert.AppendLine(" 'System', ");
                sqlInsert.AppendLine(" '" + cid + "'");
                sqlInsert.AppendLine(" ) ");
                try
                {
                    db.SqlExecute(sqlInsert.ToString());
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
                sqlUpdate.AppendLine("  WHERE [user_name] ='" + stuff.user_name + "'");
                try
                { 
                    db.SqlExecute(sqlUpdate.ToString()); 
                }
                catch (SqlException ex) { rs = ex.ToString(); }


                string dbPassword = ConvertMD5(stuff.user_password.ToString());

                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  a.[user_id] , a.[user_name] , a.user_role_id , a.user_status , b.role_name ";
                sqltext += " FROM [realestate].[dbo].[sa_user] a ";
                sqltext += " INNER JOIN realestate..sa_role b ON b.role_id = a.user_role_id";
                sqltext += " WHERE a.[user_name] = '" + stuff.user_name + "' "; 
                sqltext += " AND a.[user_password] = '" + dbPassword + "' ";
                sqltext += " AND a.user_status = 'N' ";



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
