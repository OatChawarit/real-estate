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

        // GET: api/news
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        } 

        public string Get(string jsonData , string types)
        {
            var db = new DBClass();
            string rs = "";
            dynamic stuff = JsonConvert.DeserializeObject(jsonData);

            if (types == "listNews")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  a.*  ";
                sqltext += " FROM realestate..re_news a Order by create_date Desc";               

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
            else if(types == "getNews")
            {
                SqlDataReader dr;
                string sqltext = "";
                sqltext += " SELECT  a.*  ";
                sqltext += " FROM realestate..re_news a Where news_id='"+ stuff.id + "'";

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
            else if (types == "cancelNews")
            {
                string sqltext = "";
                sqltext += " Delete  ";
                sqltext += " FROM realestate..re_news Where news_id='" + stuff.id + "'";
                try
                {
                    db.SqlExecute(sqltext.ToString());
                    rs = "success";
                }
                catch (SqlException ex) { rs = ex.ToString(); }
            }
            else
            {
                rs = "ไม่ข้อมูล";
            }

            return rs;
        }






        public class save_result
        {
            public string data { get; set; }

        }

        // POST: api/news
        public string Post(save_result value)
        {
            dynamic stuff = JsonConvert.DeserializeObject(value.data.ToString());
 
            string types = Request.Headers.GetValues("types").FirstOrDefault().ToString(); 
            var db = new DBClass();
            string rs = "";
            if (types == "addNews")
            {
                string sqltext = "";
                sqltext += " Insert Into ";
                sqltext += " realestate..re_news (news_topic, news_content, news_image, create_date, create_by) Values ";
                sqltext += " ('" + stuff.news_topic + "', '" + stuff.news_content + "', '" + stuff.news_image + "', GETDATE(), '" + stuff.create_by + "');";
                try
                {
                    db.SqlExecute(sqltext.ToString());
                    rs = "success";
                }
                catch (SqlException ex) { rs = ex.ToString(); }
            }
            else if (types == "editNews")
            {
                string sqltext = "";
                sqltext += " Update realestate..re_news Set news_topic='" + stuff.news_topic + "', ";
                sqltext += " news_content='" + stuff.news_content + "', update_by='" + stuff.update_by + "', update_date=Getdate() ";
                sqltext += " Where news_id='" + stuff.id + "';";
                try
                {
                    db.SqlExecute(sqltext.ToString());
                    rs = "success";
                }
                catch (SqlException ex) { rs = ex.ToString(); }
            }
            else
            {
                rs = "ไม่ข้อมูล";
            }
            return rs;
        }

    }
}
