using icecream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace icecream_parlour.Controllers
{
    public class WebsiteController : Controller
    {
        private db_icecream_projectEntities db = new db_icecream_projectEntities();

        // GET: Website
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult product()
        {
            var recep = db.recipes.ToList();
            ViewBag.recepdata = recep;
            return View(db.recipes.ToList());
        }

        public ActionResult feedback()
        {
            return View();
        }
        [HttpPost]
        public ActionResult feedback(string name, string email, string subject, string message)
        {
            var feedback = new feedback();
            feedback.name = name;
            feedback.email = email;
            feedback.subject = subject;
            feedback.mesage = message;

            if (ModelState.IsValid)
            {
                db.feedbacks.Add(feedback);
                db.SaveChanges();
            }
            TempData["msg"] = "Thank you for Your Feedback";
            return View();
        }

        public ActionResult order()
        {
            var book = db.books.ToList();
            ViewBag.bookdata = book;
            return View(db.books.ToList());
        }

        //[HttpPost]
        //public ActionResult order()
        //{
        //    return View();
        //}
    }
}