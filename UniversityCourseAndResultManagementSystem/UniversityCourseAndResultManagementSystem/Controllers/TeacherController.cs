﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystem.Manager;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Controllers
{
    public class TeacherController : Controller
    {
        private string message;
        TeacherManager teacherManager = new TeacherManager();
        DesignationManager designationManager = new DesignationManager();
        DepartmentManager departmentManager = new DepartmentManager();
        //
        // GET: /Teacher/
        public ActionResult Index()
        {
            List<Teacher> teachers = teacherManager.GetAllTeachers();
            return View(teachers);
        }

       

        //
        // GET: /Teacher/Create
        public ActionResult Save()
        {
           

            List<Designation> desinationList = designationManager.GetAllDesignations();
            List<Department> departments = departmentManager.GetAllDepts();
            ViewBag.Designations = desinationList;
            ViewBag.Departments = departments;
            return View();
        }

        //
        // POST: /Teacher/Create
        [HttpPost]
        public ActionResult Save(Teacher teacher)

        {
            IEnumerable<Designation> desinationList = designationManager.GetAllDesignations();
            IEnumerable<Department> departments = departmentManager.GetAllDepts();
            if (ModelState.IsValid)
            {
                message = teacherManager.Save(teacher);
                ViewBag.Message = message;
            }
      
                ViewBag.Designations = desinationList;
                ViewBag.Departments = departments;

                return View(teacher);
               
            }

        [HttpPost]
        public JsonResult CheckingExistingEmail(string Email)
        {
            return Json(!teacherManager.GetAllTeachers().Any(x => x.Email.Equals(Email, StringComparison.OrdinalIgnoreCase)), JsonRequestBehavior.AllowGet);
        }

	}
}