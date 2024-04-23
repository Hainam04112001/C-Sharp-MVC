using MyWebSiteBanHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;

using System.Web.Mvc;
using System.Web.Security;

namespace MyWebSiteBanHang.Controllers
{

    public class HomeController : Controller
    {

        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Home
        public ActionResult Index()
        {
            //Lan luot tao cac viewbag de lay list san pham tu co so du lieu
            //list dien thoai moi nhat
            var lstDTM = db.SanPhams.Where(n => n.MaLoaiSP == 1 && n.Moi == 1 && n.DaXoa == false);
            //gan bien vao viewbang
            ViewBag.ListDTM = lstDTM;

            //list Laptop moi nhat
            var lstLTM = db.SanPhams.Where(n => n.MaLoaiSP == 2 && n.Moi == 1 && n.DaXoa == false);
            //gan bien vao viewbang
            ViewBag.ListLTM = lstLTM;

            //list may tinh bang moi nhat
            var lstMTBM = db.SanPhams.Where(n => n.MaLoaiSP == 3 && n.Moi == 1 && n.DaXoa == false);
            //gan bien vao viewbang
            ViewBag.ListMTBM = lstMTBM;

            return View();
        }

        public ActionResult MenuPartial()
        {
            // truy van lay ve 1 list cac san pham
            var lstSP = db.SanPhams;
            return PartialView(lstSP);
        }

        [HttpGet]
        public ActionResult DangKy()
        {
            ViewBag.CauHoi = new SelectList(LoadCauHoi());
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(ThanhVien tv, FormCollection f)
        {
            ViewBag.CauHoi = new SelectList(LoadCauHoi());
            if (this.IsCaptchaValid("Captcha is not valid"))
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ThongBao = "Thêm thành công";
                    db.ThanhViens.Add(tv);
                    db.SaveChanges();
                }
                else
                {
                    ViewBag.ThongBao = "Thêm thất bại";
                }
              
                return View();
            }
            ViewBag.ThongBao = "Sai mã captcha";
            return View();
        }

        public List<string> LoadCauHoi()
        {
            List<string> lstCauHoi = new List<string>();
            lstCauHoi.Add("Con vật mà bạn yêu thích?");
            lstCauHoi.Add("Ca sĩ mà bạn yêu thích?");
            lstCauHoi.Add("Hiện tại bạn đang làm công việc gì?");
            return lstCauHoi;
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            //string sTaiKhoan = f["txtTenDangNhap"].ToString();
            //string sMatKhau = f["txtMatKhau"].ToString();

            //ThanhVien tv = db.ThanhViens.SingleOrDefault(n=>n.TaiKhoan==sTaiKhoan && n.MatKhau == sMatKhau);
            //if(tv!=null)
            //{
            //    Session["TaiKhoan"] = tv;
            //    return Content("<script>window.location.reload();</script>");
            //}

            //return Content("Tài khoản hoặc mật khẩu không đúng");

            string taikhoan = f["txtTenDangNhap"].ToString();
            string matkhau = f["txtMatKhau"].ToString();
            //Truy vấn kiểm tra đăng nhập lấy thông tin thành viên
            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == taikhoan && n.MatKhau == matkhau);
            if(tv != null)
            {
                //Lấy ra list quyền của thành viên tương ứng với loại thành viên
                var lstQuyen = db.LoaiThanhVien_Quyen.Where(n => n.MaLoaiTV == tv.MaLoaiTV);
                //Duyệt list quyền
                string Quyen = "";
                if(lstQuyen.Count() > 0)
                {
                    foreach (var item in lstQuyen)
                    {
                        Quyen += item.Quyen.MaQuyen + ",";
                    }
                    Quyen = Quyen.Substring(0, Quyen.Length - 1);//cắt dấu
                    PhanQuyen(tv.TaiKhoan.ToString(), Quyen);
                    Session["TaiKhoan"] = tv;
                    return Content("<script>window.location.reload();</script>");
                }
                
            }
            return Content("Tài khoản hoặc mật khẩu không đúng!");

        }

        public void PhanQuyen(string TaiKhoan, string Quyen)
        {
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1,
                                                        TaiKhoan,//user
                                                        DateTime.Now, //begin
                                                        DateTime.Now.AddHours(3),//timeout
                                                        false,//remember
                                                        Quyen,//permission.."admin" or for more than one
                                                        FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
            Response.Cookies.Add(cookie);
        }

        //Tạo trang ngăng chặn quyền truy cập
        public ActionResult LoiPhanQuyen()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index"); 
        }
    }
}