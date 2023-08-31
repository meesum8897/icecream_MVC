using icecream_parlour.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace icecream_parlour.Controllers
{
    public class AccountsController : Controller
    {
        db_icecream_projectEntities db = new db_icecream_projectEntities();
        // GET: Accounts
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string pass)
        {
            var user = db.users.FirstOrDefault(u => u.email == email && u.pass == pass && u.role=="2");
            if (user != null)
            {
                Session["Id"] = user.id;
                Session["email"] = user.email;
                Session["name"] = user.name;

                return RedirectToAction("Index", "Website");

            }
            else
            {
                TempData["message"] = "Invalid Login";
                return RedirectToAction("Login", "Accounts");
            }
        }

        public ActionResult AdminLogin()
        {
            return View();
        }

        [HttpPost]

        public ActionResult AdminLogin(string email, string pass)
        {
            var user = db.users.FirstOrDefault(u => u.email == email && u.pass == pass && u.role == "1");
            if (user != null)
            {
                Session["adminid"] = user.id;
                Session["adminemail"] = user.email;
                Session["adminname"] = user.name;
                return RedirectToAction("Index", "Admin");

            }
            else
            {
                TempData["message"] = "Invalid Login";
                return RedirectToAction("AdminLogin", "Accounts");
            }
            
        }
        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Signup(string name, string email, string pass, string contact, int subslist)
        {
            var user = new user();
            user.name = name;
            user.email = email;
            user.pass = pass;
            user.contact = contact;
            user.subscription_id = subslist;
            user.role = "2";

            var checkEmail = db.users.FirstOrDefault(e => e.email == email);

            if (checkEmail == null) // Email is unique
            {
                if (ModelState.IsValid)
                {
                    db.users.Add(user);
                    db.SaveChanges();
                }
                else
                {
                    TempData["msg"] = "There were validation errors.";
                }
            }
            else
            {
                TempData["msg"] = "Email Is Already Registered.";
                return View();
            }
            TempData["success"] = "Account Created Successfully";
            return RedirectToAction("Login");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            Session.RemoveAll();
            return RedirectToAction("Index", "website");
        }
        public ActionResult AdminLogout()
        {
            Session.Clear();
            Session.RemoveAll();
            return RedirectToAction("AdminLogin", "Accounts");
        }


    }
}