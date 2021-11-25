using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace real_estate.ClassData
{
    public class News
    {
        public string dateTo = "";
        public string dateFrom = "";

        public string username = "";
        public string password = "";
        public string firstname = "";
        public string lastname = "";

        public string listAllNews()
        {
            var db = new ConnectDB.DBClass();
            StringBuilder str = new StringBuilder();
            string strSql = "";
            SqlDataReader reader = db.GetSqlDataReader(strSql);
            while (reader.Read())
            {

            }
            return str.ToString(); 
        }
    }
}