﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Gateway;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Manager
{
    public class TeacherManager
    {
        TeacherGateway teacherGateway = new TeacherGateway();

        public List<Teacher> GetAllTeachers()
        {

            return teacherGateway.GetAllTeachers();

        }


        public string Save(Teacher teacher)
        {
            if (!(IsEmailAddressValid(teacher.Email)))
            {
                return "Please! Enter a valid email address";
            }
            if (IsEmailAddressExits(teacher.Email))
            {
                return "Email address must be unique";
            }
            if (teacherGateway.Insert(teacher) > 0)
            {
                return "Saved Sucessfully";
            }
            return "Failed to save";
        }

        private bool IsEmailAddressExits(string email)
        {
            Teacher aTeacher = teacherGateway.GetTeacherByEmailAddress(email);
            if (aTeacher != null)
            {
                return true;
            }
            return false;
        }

        private bool IsEmailAddressValid(string email)
        {
            if (email.Contains(".com") && ((email.Contains("@gmail")) || (email.Contains("@yahoo"))))
            {
                return true;
            }
            return false;
        }


    }
}