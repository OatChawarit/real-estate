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
    public class saleDataController : ApiController
    {
        //GET: api/saleData
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        //GET: api/saleData/5
        public string Get(string jsonData, string types, string username)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "list_sale")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  [sale_id] ";
                sqltext += "  ,[user_id] ";
                sqltext += "  ,[sale_firstName] ";
                sqltext += "  ,[sale_lastName] ";
                sqltext += "  ,[sale_dateOfBirth] ";
                sqltext += "  ,[sale_idCard] ";
                sqltext += "  ,[sale_phone] ";
                sqltext += "  ,[sale_line] ";
                sqltext += "  ,[sale_mail] ";
                sqltext += "  ,[sale_company] ";
                sqltext += "  ,[sale_position] ";
                sqltext += "  ,[sale_AgentApproveNo] ";
                sqltext += "  ,[sale_status] ";
                sqltext += " FROM [realestate].[dbo].[re_SaleTable]  ";
                if (stuff.user_id == "" || stuff.user_id == null)
                {
                    sqltext += " Where cus_status !='C' Order by cus_id asc ";
                    sqltext += " Order by user_id asc ";
                }
                else
                {
                    sqltext += " Where user_id='" + stuff.user_id + "' ";
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
            else if (types == "update_sale")
            {
                string sqltext = "";

                sqltext += " Update [realestate].[dbo].[re_SaleTable] Set  ";
                sqltext += " sale_firstName='" + stuff.sale_firstName + "' ";
                sqltext += " ,sale_lastName='" + stuff.sale_lastName + "' ";
                sqltext += " ,sale_dateOfBirth='" + stuff.sale_dateOfBirth + "' ";
                sqltext += " ,sale_idCard='" + stuff.sale_idCard + "' ";
                sqltext += " ,sale_phone='" + stuff.sale_phone + "' ";
                sqltext += " ,sale_line='" + stuff.sale_line + "' ";
                //sqltext += " ,sale_mail='" + stuff.sale_mail + "' ";
                sqltext += " ,sale_company='" + stuff.sale_company + "' ";
                sqltext += " ,sale_position='" + stuff.sale_position + "' ";
                sqltext += " ,sale_AgentApproveNo='" + stuff.sale_AgentApproveNo + "' ";
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

        //POST: api/saleData
        public void Post([FromBody]string value)
        {
        }

        //PUT: api/saleData/5
        public void Put(int id, [FromBody]string value)
        {
        }

        //DELETE: api/saleData/5
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
