using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Web.Mvc;

using System.IO;
using System.Net;
using System.Net.Http; 
using System.Web.Http;

namespace real_estate.Controllers.imageApi
{
    public class ImageAPIController : ApiController
    {

        [Route("api/ImageAPI/UploadFiles")]
        [HttpPost]
        public HttpResponseMessage UploadFiles()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString(); 

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                  fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else {
                //Fetch the File Name.
                  fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }

             
            //Save the File.
            postedFile.SaveAs(path +  fileName  );

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }
        [Route("api/ImageAPI/UploadFiles1")]
        [HttpPost]
        public HttpResponseMessage UploadFiles1()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString();

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else if( type == "Array")
            {
                //Fetch the File Name.
                fileName = "1-BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else
            {
                //Fetch the File Name.
                fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }
        [Route("api/ImageAPI/UploadFiles2")]
        [HttpPost]
        public HttpResponseMessage UploadFiles2()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString();

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else if (type == "Array")
            {
                //Fetch the File Name.
                fileName = "2-BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else
            {
                //Fetch the File Name.
                fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }

            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }

        [Route("api/ImageAPI/UploadFiles3")]
        [HttpPost]
        public HttpResponseMessage UploadFiles3()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString();

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else if (type == "Array")
            {
                //Fetch the File Name.
                fileName = "3-BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else
            {
                //Fetch the File Name.
                fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }

            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }

        [Route("api/ImageAPI/UploadFiles4")]
        [HttpPost]
        public HttpResponseMessage UploadFiles4()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString();

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else if (type == "Array")
            {
                //Fetch the File Name.
                fileName = "4-BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else
            {
                //Fetch the File Name.
                fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }

            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }
        [Route("api/ImageAPI/UploadFiles5")]
        [HttpPost]
        public HttpResponseMessage UploadFiles5()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString();

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else if (type == "Array")
            {
                //Fetch the File Name.
                fileName = "5-BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else
            {
                //Fetch the File Name.
                fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }

            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }
        [Route("api/ImageAPI/UploadFiles6")]
        [HttpPost]
        public HttpResponseMessage UploadFiles6()
        {

            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string type = Request.Headers.GetValues("type").FirstOrDefault().ToString();

            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "";
            if (type == "Profile")
            {
                fileName = "ProFile_BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else if (type == "Array")
            {
                //Fetch the File Name.
                fileName = "6-BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }
            else
            {
                //Fetch the File Name.
                fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            }

            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }


        [Route("api/ImageAPI/UploadFilesNews")]
        [HttpPost]
        public HttpResponseMessage UploadFilesNews()
        {

            //string news_id = Request.Headers.GetValues("news_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString();
            string days = Request.Headers.GetValues("days").FirstOrDefault().ToString();
            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/news/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

            string fileName = "News_"+ days + "_" + time + "_" + Path.GetFileName(postedFile.FileName);

            //Save the File.
            postedFile.SaveAs(path + fileName);

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
        }


        [Route("api/ImageAPI/UploadFilesArray")]
        [HttpPost]
        public HttpResponseMessage UploadFilesArray(HttpContext context)
        { 
            string sale_id = Request.Headers.GetValues("sale_id").FirstOrDefault().ToString();
            string time = Request.Headers.GetValues("time").FirstOrDefault().ToString(); 
            string countIndex = Request.Headers.GetValues("countIndex").FirstOrDefault().ToString();

 


            return Request.CreateResponse(HttpStatusCode.OK, "OK");

           

        }


        [HttpPost]
        [Route("api/ImageAPI/GetFiles")]
        public HttpResponseMessage GetFiles()
        {
            string path = HttpContext.Current.Server.MapPath("~/Uploads/");

            //Fetch the Image Files.
            List<string> images = new List<string>();

            //Extract only the File Names to save data.
            foreach (string file in Directory.GetFiles(path))
            {
                images.Add(Path.GetFileName(file));
            }

            return Request.CreateResponse(HttpStatusCode.OK, images);
        }




        
    }
}