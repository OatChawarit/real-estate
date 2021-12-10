using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using real_estate.ClassData;

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
            string strSql = "SELECT top 18 news_id,news_topic,news_content,news_image,create_date,create_by FROM realestate..re_news Order by create_date desc";
            SqlDataReader reader = db.GetSqlDataReader(strSql);
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    str.AppendLine("<div class='col-lg-4 col-sm-6 col-12'>");
                    str.AppendLine("<div class='ltn__blog-img ltn__blog-item-3'><div class='ltn__blog-img'>");
                    str.AppendLine("<a href='news-detail.aspx?newsid=" + reader["news_id"].ToString() + "'><img src='../../../image/news/" + reader["news_image"].ToString() + "' alt='" + reader["news_image"].ToString() + "'></a></div>");
                    str.AppendLine("<div class='ltn__blog-brief'>");
                    str.AppendLine("<div class='ltn__blog-meta'>");
                    str.AppendLine("<ul><li class='ltn__blog-author'><ul><li class='ltn__blog-author'><a href ='javascript:void(0)'><i class='far fa-user'></i>ผู้เขียน: " + reader["create_by"].ToString() + "</a></li></ul></div>");
                    str.AppendLine("<h3 class='ltn__blog-title'><a href='news-detail.aspx?newsid=" + reader["news_id"].ToString() + "'>" + reader["news_topic"].ToString() + "</a></h3>");
                    str.AppendLine("<div class='ltn__blog-meta-btn'><div class='ltn__blog-meta'><ul><li class='ltn__blog-date'><i class='far fa-calendar-alt'></i>" + shareHelper.nowDateString(reader["create_date"].ToString()) + "</li></ul></div>");
                    str.AppendLine("<div class='ltn__blog-btn'><a href='news-detail.aspx?newsid=" + reader["news_id"].ToString() + "'> อ่านเพิ่มเติม </a></div>");
                    str.AppendLine("</div></div></div></div>");
                }
            }
            return str.ToString(); 
        }
    }
}