using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebSiteBanHang.Models;

namespace MyWebSiteBanHang.Controllers
{
    [Authorize(Roles = "QuanTri, QuanLySanPham")]
    public class KhachHangController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: KhachHang
        [Authorize(Roles = "QuanLySanPham")]
        public ActionResult Index()
        {
            var lstKH= from KH in db.KhachHangs select KH;
            return View(lstKH);
        }
        [Authorize(Roles = "QuanTri")]
        public ActionResult Index1()
        {
            var lstKH = from KH in db.KhachHangs select KH;
            return View(lstKH);
        }

        public ActionResult TruyVan1DoiTuong()
        {
            var lstKH = from KH in db.KhachHangs where KH.MaKH == 1 select KH;
            KhachHang khang = lstKH.FirstOrDefault();
            return View();
        }
        public ActionResult SortDuLieu()
        {
            List<KhachHang> lstKH = db.KhachHangs.OrderBy(n => n.TenKH).ToList();
            return View(lstKH);
        }

        public ActionResult GroupDuLieu()
        {
            List<KhachHang> lstKH = db.KhachHangs.OrderBy(n => n.TenKH).ToList();
            return View();
        }
    }
}