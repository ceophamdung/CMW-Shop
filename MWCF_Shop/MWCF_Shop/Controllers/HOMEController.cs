﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using MWCF_Shop.Models;
using PagedList;


namespace MWCF_Shop.Controllers
{
    public class HOMEController : Controller
    {
        private MWC_Shop_UpEntities2 db = new MWC_Shop_UpEntities2();
        public ActionResult Index(int? id,int? page)
        {

            int iSize = 8;
            int iPageNum = (page ?? 1);
            var sp = from s in db.SANPHAMs where s.MaTTSP == 1 select s;
            return View(sp.OrderBy(s => s.MaDM).AsEnumerable().ToPagedList(iPageNum, iSize));
          
        }


        public ActionResult Trang_QA(int? id,int? page)
        {
            int iSize = 8;
            int iPageNum = (page ?? 1);
            var sp = from s in db.SANPHAMs  where s.MaDM == id select s;
            return View(sp.OrderBy(s => s.MaDM).AsEnumerable().ToPagedList(iPageNum, iSize));
        }

        public ActionResult LoaiQA(int? id)
        {
            var qa = from s in db.SANPHAMs where s.MaLoai == id select s;
            return View(qa);
        }

        public ActionResult LoaiQAPartial(int? id)
        {
            var qa = from s in db.LOAISANPHAMs where s.MaDM == id select s;
            ViewBag.QA = qa;
            return PartialView();
        }


        public ActionResult Chitietsanpham(int? id)
        {
            var ct = from s in db.SANPHAMs where s.MaSP == id select s;
            return View(ct.Single());
        }


        // GET: HOME/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

       
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult search(string search = "")
        {
            List<SANPHAM> sp = db.SANPHAMs.Where(n => n.TenSp.Contains(search)).ToList();
            return View(sp);
        }

        public ActionResult Gioithieu()
        {
            return View();
        }
        public ActionResult Lienhe()
        {
            return View();
        }
        public ActionResult Baiviet()
        {
            return View();
        }
        public ActionResult ChitietBV()
        {
            return View();
        }

        public ActionResult Trang_PK(int? id, int? page)
        {       
            int iSize = 8;
            int iPageNum = (page ?? 1);
            var sp = from s in db.SANPHAMs where s.MaDM == id select s;
            return View(sp.OrderBy(s => s.MaDM).AsEnumerable().ToPagedList(iPageNum, iSize));
        }

        public ActionResult LoaiPK(int? id)
        {
            var qa = from s in db.SANPHAMs where s.MaLoai == id select s;
            return View(qa);
        }

        public ActionResult LoaiPKPartial(int? id)
        {
            var qa = from s in db.LOAISANPHAMs where s.MaDM == id select s;
            ViewBag.QA = qa;
            return PartialView();
        }

        public ActionResult Trang_GD(int? id, int? page)
        {
            int iSize = 8;
            int iPageNum = (page ?? 1);
            var sp = from s in db.SANPHAMs where s.MaDM == id select s;
            return View(sp.OrderBy(s => s.MaDM).AsEnumerable().ToPagedList(iPageNum, iSize));
        }

        public ActionResult LoaiGD(int? id)
        {
            var qa = from s in db.SANPHAMs where s.MaLoai == id select s;
            return View(qa);
        }

        public ActionResult LoaiGDPartial(int? id)
        {
            var qa = from s in db.LOAISANPHAMs where s.MaDM == id select s;
            ViewBag.QA = qa;
            return PartialView();
        }

        public ActionResult SanphambanchayPartial(int? id,int? id1)
        {
            var sp = from s in db.SANPHAMs where s.MaTTSP == id where s.MaDM == id1 select s;
            return PartialView(sp.OrderBy(s => s.MaDM).AsEnumerable());
        }


    }
}
