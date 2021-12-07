using real_estate.ConnectDB;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Security.Cryptography;

namespace real_estate.Controllers.main
{
    public class userDataController : ApiController
    {
        // GET: api/userData
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/userData/5
        public string Get(string jsonData, string types, string username)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "list_user")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext = " SELECT[user_id] ";
                sqltext += " ,[user_email] ";
                sqltext += " ,[user_password] ";
                sqltext += " ,[user_role_id] ";
                sqltext += " ,[user_status] ";
                sqltext += " ,[last_login] ";
                sqltext += " ,[user_image] ";
                sqltext += " ,[user_firstName] ";
                sqltext += " ,[user_lastName]  ";
                sqltext += "  FROM [realestate].[dbo].[sa_user] Order By user_id Asc ";
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
            else if (types == "list_customer")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "  SELECT[cus_id] ";
                sqltext += " ,[user_id] ";
                sqltext += " ,[cus_firstName] ";
                sqltext += " ,[cus_lastName] ";
                sqltext += " ,[cus_dateOfBirth] ";
                sqltext += " ,[cus_idCard] ";
                sqltext += " ,[cus_phone] ";
                sqltext += " ,[cus_status] ";
                sqltext += " FROM [realestate].[dbo].[re_CustomerTable] Order by cus_id asc ";
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
            else if (types == "get_user")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext = " SELECT [user_id] ";
                sqltext += " ,[user_email] ";
                //sqltext += " ,[user_password] ";
                sqltext += " ,[user_role_id] ";
                sqltext += " ,[user_status] ";
                sqltext += " ,[last_login] ";
                sqltext += " ,[user_image] ";
                sqltext += " ,[user_firstName] ";
                sqltext += " ,[user_lastName]  ";
                sqltext += "  FROM [realestate].[dbo].[sa_user]  Where user_id='" + stuff.user_id + "' Order By user_id Asc ";
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
            else if (types == "update_user")
            {
                //SqlDataReader dr;
                //StringBuilder str = new StringBuilder();
                string sqltext = "";
                if(stuff.forgot == "1")
                {
                    string hashPassword = ConvertMD5(stuff.user_password.ToString());

                    sqltext += "  Update [realestate].[dbo].[sa_user] Set  ";
                    sqltext += "  user_password = '"+ hashPassword + "',  ";
                    sqltext += "  user_status='" + stuff.user_status + "', update_date=GETDATE(),  ";
                    sqltext += "  update_by='" + username + "'  ";
                    sqltext += "  Where user_id='" + stuff.user_id + "'  ";
                    try
                    {
                        db.SqlExecute(sqltext.ToString());
                        rs = "success";
                    }
                    catch (SqlException ex) { rs = ex.ToString(); }
                }
                else
                {
                    sqltext += "  Update [realestate].[dbo].[sa_user] Set  ";
                    sqltext += "  user_status='" + stuff.user_status + "',  ";
                    sqltext += "  update_date=GETDATE(),  ";
                    sqltext += "  update_by='" + username + "'  ";
                    sqltext += "  Where user_id='" + stuff.user_id + "'  ";
                    try
                    {
                        db.SqlExecute(sqltext.ToString());
                        rs = "success";
                    }
                    catch (SqlException ex) { rs = ex.ToString(); }
                }
            }
            else if (types == "cancel_user")
            {
                //SqlDataReader dr;
                //StringBuilder str = new StringBuilder();
                string sqltext = "";
                sqltext += "  Update [realestate].[dbo].[sa_user] Set  ";
                sqltext += "  user_status='C', update_date=GETDATE(),  ";
                sqltext += "  update_by='" + username + "'  ";
                sqltext += "  Where user_id='" + stuff.user_id + "'  ";
                try
                {
                    db.SqlExecute(sqltext.ToString());
                    rs = "success";
                }
                catch (SqlException ex) { rs = ex.ToString(); }
            }
            else
            {
                rs = "ระบบผิดพลาด ไม่สามารถแก้ไขได้";
            }
            return rs;
        }

        // POST: api/userData
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/userData/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/userData/5
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
