using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebSiteBanHang.Controllers
{
    public class DangKyController : Controller
    {
        [Authorize(Roles = "DangKy")]
        // GET: DangKy
        public ActionResult Index()
        {
            return View();
        }
    }
}