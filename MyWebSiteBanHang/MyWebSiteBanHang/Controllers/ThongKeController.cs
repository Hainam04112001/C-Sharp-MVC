using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWebSiteBanHang.Models;

namespace MyWebSiteBanHang.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: ThongKe
        QuanLyBanHangEntities db = new QuanLyBanHangEntities(); 
        public ActionResult Index()
        {
            ViewBag.SoNguoiTruyCap = HttpContext.Application["SoNguoiTruyCap"].ToString();
            ViewBag.SoNguoiDangOnline = HttpContext.Application["SoNguoiDangOnline"].ToString();
            ViewBag.TongDoanhThu = ThongKeTongDoanhThu();
            ViewBag.TongDDH = ThongKeDonHang();
            ViewBag.TongThanhVien = ThongKeThanhVien();
            return View();
        }
        public double ThongKeDonHang()
        {
            //Đếm đơn đặt hàng
            double sLDDH = db.DonDatHangs.Count();
            return sLDDH;
        }

        public double ThongKeThanhVien()
        {
            //Đếm đơn đặt hàng
            double slTV = db.ThanhViens.Count();
            return slTV;
        }

        public decimal ThongKeTongDoanhThu()
        {
            //Thống kê theo tất cả doanh thu từ khi website thành lập
            decimal TongDanhThu = db.ChiTietDonDatHangs.Sum(n => n.SoLuong * n.DonGia).Value;
            return TongDanhThu;
        }

        public decimal ThongKeTongDoanhThuThang(int Thang, int Nam)
        {
            //Thống kê theo tất cả doanh thu từ khi website thành lập
            //List ra những đơn hàng nào có tháng, năm tương ứng
            var lstDDH = db.DonDatHangs.Where(n => n.NgayDat.Value.Month == Thang && n.NgayDat.Value.Year == Nam);
            decimal TongTien = 0;
            foreach(var item in lstDDH)
            {
                TongTien += decimal.Parse(item.ChiTietDonDatHangs.Sum(n => n.SoLuong * n.DonGia).Value.ToString());
            }
            return TongTien;
        }

        //Giải phóng biến cho vùng nhớ
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}