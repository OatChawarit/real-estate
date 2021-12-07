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


            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/image/project/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];
     


            //Fetch the File Name.
            string fileName = "BY_" + sale_id + "_" + time + "_" + Path.GetFileName(postedFile.FileName);
            


            //Save the File.
            postedFile.SaveAs(path +  fileName  );

            //Send OK Response to Client.
            return Request.CreateResponse(HttpStatusCode.OK, fileName);
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