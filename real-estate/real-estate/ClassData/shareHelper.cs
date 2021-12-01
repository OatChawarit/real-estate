using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace real_estate.ClassData
{
    public class shareHelper
    {
        //แปลงเวลา 2021-11-30 12:00:00 AM เป็น 2021-11-30
        public static string nowDateString(string dates)
        {
            CultureInfo culture = new CultureInfo("es-ES");
            DateTime convetdate = DateTime.Parse(dates, culture);
            return convetdate.ToString("yyyy/MM/dd");
        }


        //เวลาปีปัจจุบัน คศ.
        public static string year4Now()
        {
            string currentYear = DateTime.Now.Year.ToString();
            string yyyy = "";
            if (Convert.ToInt64(currentYear) > 2500)
            {
                yyyy = (Convert.ToInt64(currentYear) - 543).ToString();
            }
            else
            {
                yyyy = currentYear.ToString();
            }
            return yyyy.ToString();
        }


        //แปลงตัวเลขเป็นคำตัวอักษรภาษาไทย
        public static string NumberToText(int numbers)
        {
            string txtNum = "";
            switch (numbers)
            {
                case 0:
                    txtNum = "ศูนย์";
                    break;
                case 1:
                    txtNum = "หนึ่ง";
                    break;
                case 2:
                    txtNum = "สอง";
                    break;
                case 3:
                    txtNum = "สาม";
                    break;
                case 4:
                    txtNum = "สี่";
                    break;
                case 5:
                    txtNum = "ห้า";
                    break;
                case 6:
                    txtNum = "หก";
                    break;
                case 7:
                    txtNum = "เจ็ด";
                    break;
                case 8:
                    txtNum = "แปด";
                    break;
                case 9:
                    txtNum = "เก้า";
                    break;
                default:
                    txtNum = "";
                    break;
            }
            return txtNum;
        }
    }
}