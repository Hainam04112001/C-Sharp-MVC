using MyWebSiteBanHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace MyWebSiteBanHang.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();

        //Tạo 2 partial view sản phẩm 1 và 2 để hiển thị sản phẩm theo 2 style khác nhau
        [ChildActionOnly]        
        public ActionResult SanPhamStyle1Partial()
        {

            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult SanPhamStyle2Partial()
        {

            return PartialView();
        }

        //xay dung trang chi tiet
        public ActionResult XemChiTiet(int? id)
        {
            //kiểm tra tham số vào có rỗng hay không
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //nếu không thì truy xuất csdl ra sản phẩm tương ứng
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id && n.DaXoa == false);
            if(sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }

        //Xây dựng 1 actio load sản phẩm theo mã loại sản phẩm và mã nhà sản xuất
        public ActionResult SanPham(int? MaLoaiSP, int? MaNSX,int? page)
        {
            if (MaLoaiSP == null || MaNSX == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var lstSP = db.SanPhams.Where(n => n.MaLoaiSP == MaLoaiSP && n.MaNSX == MaNSX);
            if (lstSP.Count() == 0)
            {
                return HttpNotFound();
            }
            if(Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 4;
            //Tạo biến thứ 2: số trang hiện tại
            int PageNumber = (page ?? 1);
            ViewBag.MaLoaiSP = MaLoaiSP;
            ViewBag.MaNSX = MaNSX;
            return View(lstSP.OrderBy(n=>n.MaSP).ToPagedList(PageNumber,PageSize));
        }
    }
}