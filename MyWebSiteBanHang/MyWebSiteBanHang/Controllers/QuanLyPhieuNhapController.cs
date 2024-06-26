﻿using MyWebSiteBanHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyWebSiteBanHang.Controllers
{
    public class QuanLyPhieuNhapController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: QuanLyPhieuNhap
        [HttpGet]
        public ActionResult NhapHang()
        {
            ViewBag.MaNCC = db.NhaCungCaps;
            ViewBag.ListSanPham = db.SanPhams;
            
            return View();
        }
        [HttpPost]
        public ActionResult NhapHang(PhieuNhap model,IEnumerable<ChiTietPhieuNhap> lstModel)
        {
            ViewBag.MaNCC = db.NhaCungCaps;
            ViewBag.ListSanPham = db.SanPhams;
            model.DaXoa = false;
            db.PhieuNhaps.Add(model);
            db.SaveChanges();
            SanPham sp;
            foreach (var item in lstModel)
            {
                //Cập ngật số lượng tồn
                sp = db.SanPhams.Single(n => n.MaSP == item.MaSP);
                sp.SoLuongTon += item.SoLuongNhap;
                item.MaPN = model.MaPN;
            }
            db.ChiTietPhieuNhaps.AddRange(lstModel);
            db.SaveChanges();
            return View();
        }

        [HttpGet]
        public ActionResult DSSPHetHang()
        {
            //Danh sách sản phẩm gần hết hàng với số lượng tòn bé hơn hoặc bằng 5
            var lstSP = db.SanPhams.Where(n => n.DaXoa == false && n.SoLuongTon <= 5);
            return View(lstSP);
        }

        //Tạo 1 view phục vụ cho việc nhập từng sản phẩm
        [HttpGet]
        public ActionResult NhapHangDon(int? id)
        {
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(n=>n.MaSP == id);
            if(sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }
        //Xử lý nhập hàng từng sản phẩm
        [HttpPost]
        public ActionResult NhapHangDon(PhieuNhap model, ChiTietPhieuNhap ctpn)
        {
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", model.MaNCC);
            model.NgayNhap = DateTime.Now;
            model.DaXoa = false;
            db.PhieuNhaps.Add(model);
            db.SaveChanges();

            ctpn.MaPN = model.MaPN;
            //Cập nhật tồn
            SanPham sp = db.SanPhams.Single(n => n.MaSP == ctpn.MaSP);
            sp.SoLuongTon += ctpn.SoLuongNhap;
            db.ChiTietPhieuNhaps.Add(ctpn);
            db.SaveChanges();
            return View(sp);
        }

        //Giải phóng biến cho vùng nhớ
        protected override void Dispose(bool disposing)
        {
            if(disposing)
            {
                if (db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}