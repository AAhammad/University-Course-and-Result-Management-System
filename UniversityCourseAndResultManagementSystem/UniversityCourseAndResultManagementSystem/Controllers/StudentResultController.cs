﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystem.Manager;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Controllers
{
    public class StudentResultController : Controller
    {
        StudentManager studentManager = new StudentManager();
        CourseManager courseManager = new CourseManager();

        // GET: /StudentResult/Create
        public ActionResult Save()
        {
            IEnumerable<Student> students = studentManager.GetAllStudents();
            IEnumerable<Course> courses = courseManager.GetAllCourses();
            ViewBag.Students = students;
            ViewBag.Courses = courses;
            return View();
        }

        //
        // POST: /StudentResult/Create
        [HttpPost]
        public ActionResult Save(StudentResult studentResult)
        {
            try
            {
                ViewBag.Message = studentManager.Save(studentResult);
                IEnumerable<Student> students = studentManager.GetAllStudents();
                IEnumerable<Course> courses = courseManager.GetAllCourses();
                ViewBag.Students = students;
                ViewBag.Courses = courses;

                return View();
                //return RedirectToAction("Index");
            }
            catch (Exception exception)
            {
                ViewBag.Message = exception.InnerException.Message;
                return View();
            }
        }


        public JsonResult GetStudentById(int studentId)
        {
            StudentViewModel student = studentManager.GetStudentInformationById(studentId);
            return Json(student, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCoursesTakebByStudent(int studentId)
        {
            IEnumerable<Course> courses = courseManager.GetCoursesTakenByaStudentById(studentId);
            return Json(courses, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult ViewStudentResult()
        {
            IEnumerable<Student> students = studentManager.GetAllStudents();
            ViewBag.Students = students;
            return View();
        }

        public JsonResult GetStudentResultByStudentId(int studentId)
        {
            IEnumerable<StudentResultViewModel> studentResults = studentManager.GetStudentResultByStudentId(studentId);
            return Json(studentResults, JsonRequestBehavior.AllowGet);
        }
	}
}