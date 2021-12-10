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
                if (stuff.forgot == "1")
                {
                    string hashPassword = ConvertMD5(stuff.user_password.ToString());

                    sqltext += "  Update [realestate].[dbo].[sa_user] Set  ";
                    sqltext += "  user_password = '" + hashPassword + "',  ";
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
            else if (types == "list_customer")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += "  SELECT c.* ";
                //sqltext += " ,c.[user_id] ";
                //sqltext += " ,c.[cus_firstName] ";
                //sqltext += " ,c.[cus_lastName] ";
                //sqltext += " ,c.[cus_dateOfBirth] ";
                //sqltext += " ,c.[cus_idCard] ";
                //sqltext += " ,c.[cus_phone] ";
                //sqltext += " ,c.[cus_income] ";
                //sqltext += " ,c.[cus_line] ";
                //sqltext += " ,c.[cus_nationality] ";
                //sqltext += " ,c.[cus_occupation] ";
                //sqltext += " ,c.[cus_marital_status] ";
                //sqltext += " ,c.[cus_status] ";
                sqltext += " ,s.[user_email] ";
                sqltext += " FROM [realestate].[dbo].[re_CustomerTable] c Left Join [realestate].[dbo].[sa_user] s On c.user_id=s.user_id ";
                if (stuff.user_id == "" || stuff.user_id == null)
                {
                    //sqltext += " Where cus_status !='C' Order by cus_id asc ";
                    sqltext += " Order by cus_id asc ";
                }
                else
                {
                    sqltext += " Where c.user_id='" + stuff.user_id + "' ";
                }
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
            else if (types == "update_customer")
            {
                string sqltext = "";
                if (stuff.typedata == "detail")
                {
                    sqltext += " Update [realestate].[dbo].[re_CustomerTable] Set  ";
                    sqltext += " cus_firstName='" + stuff.cus_firstName + "' ";
                    sqltext += " ,cus_lastName='" + stuff.cus_lastName + "' ";
                    sqltext += " ,cus_dateOfBirth='" + stuff.cus_dateOfBirth + "' ";
                    sqltext += " ,cus_idCard='" + stuff.cus_idCard + "' ";
                    sqltext += " ,cus_phone='" + stuff.cus_phone + "' ";
                    sqltext += " ,cus_income='" + stuff.cus_income + "' ";
                    //sqltext += " ,cus_line='" + stuff.cus_line + "' ";
                    sqltext += " ,cus_nationality='" + stuff.cus_nationality + "' ";
                    sqltext += " ,cus_occupation='" + stuff.cus_occupation + "' ";
                    sqltext += " ,cus_marital_status='" + stuff.cus_marital_status + "' ";
                    //sqltext += " ,cus_status='" + stuff.cus_status + "' ";
                    sqltext += "  ,update_date=getdate(), update_by='" + username + "'  ";
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
                    sqltext += " Update [realestate].[dbo].[re_CustomerTable] Set  ";
                    sqltext += "  cus_address='" + stuff.cus_address + "'  ";
                    sqltext += "  ,cus_sub_district_id='" + stuff.cus_sub_district_id + "'  ";
                    sqltext += "  ,cus_district_id='" + stuff.cus_district_id + "'  ";
                    sqltext += "  ,cus_province_id='" + stuff.cus_province_id + "'  ";
                    sqltext += "  ,cus_postal_code='" + stuff.cus_postal_code + "'  ";
                    sqltext += "  ,cus_home_address='" + stuff.cus_home_address + "'  ";
                    sqltext += "  ,cus_home_sub_district_id='" + stuff.cus_home_sub_district_id + "'  ";
                    sqltext += "  ,cus_home_district_id='" + stuff.cus_home_district_id + "'  ";
                    sqltext += "  ,cus_home_province_id='" + stuff.cus_home_province_id + "'  ";
                    sqltext += "  ,cus_home_postal_code='" + stuff.cus_home_postal_code + "'  ";
                    sqltext += "  ,update_date=getdate(), update_by='" + username + "'  ";
                    sqltext += "  Where user_id='" + stuff.user_id + "'  ";
                    try
                    {
                        db.SqlExecute(sqltext.ToString());
                        rs = "success";
                    }
                    catch (SqlException ex) { rs = ex.ToString(); }
                }
            }
            else if (types == "check_pass")
            {
                SqlDataReader dr;
                string sqltext = "";
                string hashPassword = ConvertMD5(stuff.user_password.ToString());

                sqltext = " SELECT [user_id] ";
                //sqltext += " ,[user_password] ";
                sqltext += " ,[user_firstName] ";
                sqltext += " ,[user_lastName]  ";
                sqltext += "  FROM [realestate].[dbo].[sa_user]  Where user_password ='" + hashPassword + "' ";
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
            else if (types == "up_sauser")
            {
                string sqltext = "";
                    sqltext += " Update [realestate].[dbo].[sa_user] Set  ";
                    sqltext += " user_firstName='" + stuff.user_firstName + "' ";
                    sqltext += " ,user_lastName='" + stuff.user_lastName + "' ";
                    sqltext += "  ,update_date=getdate(), update_by='" + username + "'  ";
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
