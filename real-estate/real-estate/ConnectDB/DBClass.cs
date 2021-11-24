using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace real_estate.ConnectDB
{
    public class ConnectDB
    {
        //SQL Server
        public SqlConnection SqlStrCon(string app = "main")
        {
            if (app == "main")
            {
                return new SqlConnection("Data Source=127.254.174.73;Initial Catalog=realestate" +
                    ";Persist Security Info=True;User ID=adminsa;Password=C0mm@nd@1234;Max Pool Size=36000;Enlist=true;");
            }
            else
            {
                return new SqlConnection("Data Source=127.254.174.73;Initial Catalog=realestate" +
                   ";Persist Security Info=True;User ID=adminsa;Password=C0mm@nd@1234;Max Pool Size=36000;Enlist=true;");
            }
        }
        //Access
        public OleDbConnection AccessStrCon()
        {
            return new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\xxxx.mdb");
        }
    }

    public class DBClass
    {
        public int cmdTimeOut = 100;
        public DataTable GetDataTable()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cm = new SqlCommand();
            da.Fill(dt);
            return dt;
        }

        /// <summary>
        /// เรียก Dataset แบบใช้ Sql อย่างเดียว
        /// </summary>
        /// <param name="sql">คำสั่ง Sql</param>
        /// <returns></returns>
        public DataSet GetDataSet(string sql)
        {
            SqlConnection conn = new ConnectDB().SqlStrCon();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        //SQL Server Class
        #region
        /// <summary>
        /// เรียก Datase
        /// </summary>
        /// <param name="sql">คำสั่ง Sql</param>
        /// <param name="tblName">ตาราง</param>
        /// <returns></returns>
        public DataSet SqlGet(string sql, string tblName)
        {
            SqlConnection conn = new ConnectDB().SqlStrCon();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, tblName);
            return ds;
        }

        /// <summary>
        /// เรียก Dataset
        /// </summary>
        /// <param name="sql">คำสั่ง Sql</param>
        /// <param name="tblName">ตาราง</param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public DataSet SqlGet(string sql, string tblName, SqlParameterCollection parameters)
        {
            SqlConnection conn = new ConnectDB().SqlStrCon();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            foreach (SqlParameter param in parameters)
            {
                da.SelectCommand.Parameters.AddWithValue(param.ParameterName, param.SqlDbType).Value = param.Value;
            }
            da.Fill(ds, tblName);
            return ds;
        }

        /// <summary>
        /// เรียก Datareader default main, leaseviz
        /// </summary>
        /// <param name="sql">คำสั่ง SQL</param>
        /// <param name="app">ส่ง smartleasing เพื่อดึงข้อมูล Smart, leaseviz </param>
        /// <returns></returns>
        public SqlDataReader GetSqlDataReader(string sql, string app = "main")
        {
            SqlConnection conn = new ConnectDB().SqlStrCon(app);

            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.CommandTimeout = cmdTimeOut;
            SqlDataReader reader = cmd.ExecuteReader();

            return reader;
        }

        /// <summary>
        /// ประมวลผล คำสั่ง SQL
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public int SqlExecute(string sql, string app = "main")
        {
            int i;
            SqlConnection conn = new ConnectDB().SqlStrCon(app);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
            return i;
        }
        public int SqlExecute(string sql, SqlParameterCollection parameters)
        {
            int i;
            SqlConnection conn = new ConnectDB().SqlStrCon();
            SqlCommand cmd = new SqlCommand(sql, conn);
            foreach (SqlParameter param in parameters)
            {
                cmd.Parameters.AddWithValue(param.ParameterName, param.SqlDbType).Value = param.Value;
            }
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
            return i;
        }
        public DataSet SqlExcSto(string stpName, string tblName, SqlParameterCollection parameters)
        {
            SqlConnection conn = new ConnectDB().SqlStrCon();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = stpName;
            foreach (SqlParameter param in parameters)
            {
                cmd.Parameters.AddWithValue(param.ParameterName, param.SqlDbType).Value = param.Value;
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, tblName);
            return ds;
        }
        #endregion
    }
}