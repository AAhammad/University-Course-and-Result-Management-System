﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Gateway;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Manager
{
    public class ClassRoomManager
    {
        ClassRoomGateway classRoomGateway = new ClassRoomGateway();

        public String Save(ClassRoom room)
        {
            if (room.StartTime > room.Endtime)
            {
                return "To time must be greater than From time )";
            }
            bool isTimeScheduleValid = IsTimeScheduleValid(room.RoomId, room.DayId, room.StartTime, room.Endtime);

            if (isTimeScheduleValid != true)
            {

                if (classRoomGateway.InsertClassRoom(room) > 0)
                {
                    return "Saved Successfully !";
                }
                return "Failed to save";

            }
            return "Overlapping not allowed";
        }

        private bool IsTimeScheduleValid(int roomId, int dayId, DateTime startTime, DateTime endTime)
        {
           
            List<ClassRoom> schedule = classRoomGateway.GetClassSchedulByStartAndEndingTime(roomId, dayId, startTime, endTime);
            foreach (var aSchedule in schedule)
            {
                
                if ((aSchedule.DayId == dayId && roomId == aSchedule.RoomId) && (startTime < aSchedule.StartTime && endTime > aSchedule.StartTime)
                                 || (startTime < aSchedule.StartTime && endTime > aSchedule.StartTime) ||
                                 (startTime == aSchedule.StartTime) || (aSchedule.StartTime < startTime && aSchedule.Endtime > startTime)
                                 )
                {
                    return true;
                }

            }
            return false;

        }

      

        public List<AllocateClassSchedule> GetAllClassSchedules()
        {
            return classRoomGateway.GetAllAllocateClassSchedules();
        }




        public string GetAllClassSchedulesByDeparmentId(int departmentId, int courseId)
        {
            IEnumerable<AllocateClassSchedule> classSchedules = classRoomGateway.GetAllClassSchedulesByDeparmentId(departmentId, courseId);

            string output = "";

            foreach (var acls in classSchedules)
            {

                if (acls.RoomName.StartsWith("R"))
                {
                    output += acls.RoomName + ", " + acls.DayName + ", " + acls.StartTime.ToShortTimeString() + " - " + acls.EndTime.ToShortTimeString() + ";<br />";
                }

                else if (acls.RoomName.StartsWith("N"))
                {
                    output = acls.RoomName;

                }


            }

            return output;
        }

        public String UnAllocateClassRoom()
        {
            if (classRoomGateway.UnAllocateClassRoom() > 0)
            {
                return "UnAllocated Successfully";
            }
            return "Failed to Unallocate";
        }
    }
}