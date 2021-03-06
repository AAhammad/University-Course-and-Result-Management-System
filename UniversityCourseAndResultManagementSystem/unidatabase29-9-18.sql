USE [master]
GO
/****** Object:  Database [UniversityManagementSystem]    Script Date: 9/29/2018 12:05:08 PM ******/
CREATE DATABASE [UniversityManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityManagementSystem.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityManagementSystem_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementSystem]
GO
/****** Object:  Table [dbo].[AllocateClassRoom_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassRoom_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [varchar](50) NOT NULL,
	[EndTime] [varchar](50) NOT NULL,
	[AllocationStatus] [bit] NULL,
 CONSTRAINT [PK_AllocateClassRoom_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Credit] [decimal](6, 2) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssignToTeacher_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignToTeacher_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[IsAssign] [bit] NOT NULL,
 CONSTRAINT [PK_CourseAssignToTeacher_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Day_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Department_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
 CONSTRAINT [PK_Designation_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semister_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[RegisterationDate] [date] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Student_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentEnrollInCourse_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollInCourse_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollDate] [nvarchar](50) NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_StudentEnrollInCourse_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResult_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [nvarchar](10) NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_StudentResult_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher_tbl]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [decimal](10, 2) NOT NULL,
	[CreditTaken] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Teacher_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[GetStudentResultView]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetStudentResultView]

AS

SELECT en.StudentId, c.Code, c.Name, COALESCE (r.Grade, 'Not Graded yet') AS Grade, r.IsStudentActive
FROM dbo.StudentResult_tbl AS r RIGHT OUTER JOIN (SELECT Id, StudentId, CourseId FROM dbo.StudentEnrollInCourse_tbl AS e WHERE (IsStudentActive = 1)) AS en ON r.CourseId = en.CourseId AND r.StudentId = en.StudentId INNER JOIN
dbo.Course_tbl AS c ON en.CourseId = c.Id

GO
/****** Object:  View [dbo].[ScheduleOfClassView]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ScheduleOfClassView]

AS

SELECT d.Id as DepartmentId,c.Id AS CourseId,c.Code,c.Name,COALESCE(Room_tbl.Name,'Not sheduled yet') AS Room_Name,COALESCE(Day_tbl.Name,'Not sheduled yet') as Day_Name,



case when r.StartTime IS NULL THEN '00:00:00.0000000'

else CONVERT(varchar, r.StartTime) end as StartTime,

case when r.EndTime IS NULL THEN '00:00:00.0000000'

else CONVERT(varchar, r.EndTime) end as EndTime,

COALESCE(AllocationStatus,0) AS AllocationStatus

FROM Course_tbl c  LEFT OUTER JOIN AllocateClassRoom_tbl r

ON r.CourseId=c.Id LEFT OUTER JOIN Room_tbl  

ON r.RoomId=Room_tbl.Id LEFT OUTER JOIN Day_tbl 

ON r.DayId=Day_tbl.Id LEFT OUTER JOIN Department_tbl d ON c.DepartmentId=d.Id 

GO
/****** Object:  View [dbo].[StudentResultView]    Script Date: 9/29/2018 12:05:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentResultView]

AS

SELECT c.Id, c.Code, c.Name, r.Grade FROM dbo.Course_tbl AS c INNER JOIN (SELECT Id, StudentId, CourseId, Grade FROM dbo.StudentResult_tbl AS r
WHERE (StudentId = 2)) AS r ON c.Id = r.CourseId

GO
SET IDENTITY_INSERT [dbo].[AllocateClassRoom_tbl] ON 

INSERT [dbo].[AllocateClassRoom_tbl] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (27, 10, 14, 1, 1, N'9:57 AM', N'11:54 AM', 1)
INSERT [dbo].[AllocateClassRoom_tbl] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (28, 10, 14, 2, 2, N'10:57 AM', N'11:54 AM', 1)
SET IDENTITY_INSERT [dbo].[AllocateClassRoom_tbl] OFF
SET IDENTITY_INSERT [dbo].[Course_tbl] ON 

INSERT [dbo].[Course_tbl] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (14, N'Course101', N'Algorithom', CAST(3.00 AS Decimal(6, 2)), N'A course of programming skill development', 10, 2)
SET IDENTITY_INSERT [dbo].[Course_tbl] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher_tbl] ON 

INSERT [dbo].[CourseAssignToTeacher_tbl] ([Id], [DepartmentId], [TeacherId], [CourseId], [IsAssign]) VALUES (6, 10, 4, 14, 1)
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher_tbl] OFF
SET IDENTITY_INSERT [dbo].[Day_tbl] ON 

INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (1, N'Saturday')
INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (2, N'Sunday')
INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (3, N'Monday')
INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (5, N'Wednesday')
INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (6, N'Thursday')
INSERT [dbo].[Day_tbl] ([Id], [Name]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day_tbl] OFF
SET IDENTITY_INSERT [dbo].[Department_tbl] ON 

INSERT [dbo].[Department_tbl] ([Id], [Code], [Name]) VALUES (10, N'DEPT101', N'CSTE')
SET IDENTITY_INSERT [dbo].[Department_tbl] OFF
SET IDENTITY_INSERT [dbo].[Designation_tbl] ON 

INSERT [dbo].[Designation_tbl] ([Id], [Title]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation_tbl] ([Id], [Title]) VALUES (2, N'Assistent Professor')
INSERT [dbo].[Designation_tbl] ([Id], [Title]) VALUES (3, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation_tbl] OFF
SET IDENTITY_INSERT [dbo].[Room_tbl] ON 

INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (1, N'R1')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (2, N'R2')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (3, N'R3')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (4, N'R4')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (5, N'R5')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (6, N'R6')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (7, N'R7')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (8, N'R8')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (9, N'R9')
INSERT [dbo].[Room_tbl] ([Id], [Name]) VALUES (10, N'R10')
SET IDENTITY_INSERT [dbo].[Room_tbl] OFF
SET IDENTITY_INSERT [dbo].[Semester_tbl] ON 

INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (1, N'1st')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (2, N'2nd')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (3, N'3rd')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (4, N'4th')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (5, N'5th')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (6, N'6th')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (7, N'7th')
INSERT [dbo].[Semester_tbl] ([Id], [Title]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester_tbl] OFF
SET IDENTITY_INSERT [dbo].[Student_tbl] ON 

INSERT [dbo].[Student_tbl] ([Id], [RegNo], [Name], [Email], [ContactNo], [RegisterationDate], [Address], [DepartmentId]) VALUES (10, N'DEPT101-2018-001', N'Mohammad', N'mohammad@gmail.com', N'01534563534', CAST(0xC53E0B00 AS Date), N'Dhaka', 10)
SET IDENTITY_INSERT [dbo].[Student_tbl] OFF
SET IDENTITY_INSERT [dbo].[StudentEnrollInCourse_tbl] ON 

INSERT [dbo].[StudentEnrollInCourse_tbl] ([Id], [StudentId], [CourseId], [EnrollDate], [IsStudentActive]) VALUES (5, 10, 14, N'9/29/2018', 1)
SET IDENTITY_INSERT [dbo].[StudentEnrollInCourse_tbl] OFF
SET IDENTITY_INSERT [dbo].[StudentResult_tbl] ON 

INSERT [dbo].[StudentResult_tbl] ([Id], [StudentId], [CourseId], [Grade], [IsStudentActive]) VALUES (4, 10, 14, N'A+', 1)
SET IDENTITY_INSERT [dbo].[StudentResult_tbl] OFF
SET IDENTITY_INSERT [dbo].[Teacher_tbl] ON 

INSERT [dbo].[Teacher_tbl] ([Id], [Name], [Address], [Email], [Contact], [DesignationId], [DepartmentId], [CreditToBeTaken], [CreditTaken]) VALUES (4, N'Ali Ahammad', N'Dhaka', N'ali@gmail.com', N'01683237573', 1, 10, CAST(10.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Teacher_tbl] OFF
ALTER TABLE [dbo].[AllocateClassRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_tbl_Course_tbl] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course_tbl] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl] CHECK CONSTRAINT [FK_AllocateClassRoom_tbl_Course_tbl]
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_tbl_Day_tbl] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day_tbl] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl] CHECK CONSTRAINT [FK_AllocateClassRoom_tbl_Day_tbl]
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_tbl_Department_tbl] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl] CHECK CONSTRAINT [FK_AllocateClassRoom_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_tbl_Room_tbl] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room_tbl] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom_tbl] CHECK CONSTRAINT [FK_AllocateClassRoom_tbl_Room_tbl]
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Course_tbl_Department_tbl] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([Id])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK_Course_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Course_tbl_Semester_tbl] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester_tbl] ([Id])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK_Course_tbl_Semester_tbl]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_tbl_Course_tbl] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course_tbl] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher_tbl] CHECK CONSTRAINT [FK_CourseAssignToTeacher_tbl_Course_tbl]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_tbl_CourseAssignToTeacher_tbl] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher_tbl] CHECK CONSTRAINT [FK_CourseAssignToTeacher_tbl_CourseAssignToTeacher_tbl]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_tbl_Teacher_tbl] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher_tbl] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher_tbl] CHECK CONSTRAINT [FK_CourseAssignToTeacher_tbl_Teacher_tbl]
GO
ALTER TABLE [dbo].[Student_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Student_tbl_Student_tbl] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([Id])
GO
ALTER TABLE [dbo].[Student_tbl] CHECK CONSTRAINT [FK_Student_tbl_Student_tbl]
GO
ALTER TABLE [dbo].[StudentEnrollInCourse_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollInCourse_tbl_Course_tbl] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course_tbl] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollInCourse_tbl] CHECK CONSTRAINT [FK_StudentEnrollInCourse_tbl_Course_tbl]
GO
ALTER TABLE [dbo].[StudentEnrollInCourse_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollInCourse_tbl_Student_tbl] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student_tbl] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollInCourse_tbl] CHECK CONSTRAINT [FK_StudentEnrollInCourse_tbl_Student_tbl]
GO
ALTER TABLE [dbo].[StudentResult_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_tbl_Course_tbl] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course_tbl] ([Id])
GO
ALTER TABLE [dbo].[StudentResult_tbl] CHECK CONSTRAINT [FK_StudentResult_tbl_Course_tbl]
GO
ALTER TABLE [dbo].[StudentResult_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_tbl_StudentResult_tbl] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student_tbl] ([Id])
GO
ALTER TABLE [dbo].[StudentResult_tbl] CHECK CONSTRAINT [FK_StudentResult_tbl_StudentResult_tbl]
GO
ALTER TABLE [dbo].[Teacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_tbl_Department_tbl1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([Id])
GO
ALTER TABLE [dbo].[Teacher_tbl] CHECK CONSTRAINT [FK_Teacher_tbl_Department_tbl1]
GO
ALTER TABLE [dbo].[Teacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_tbl_Designation_tbl] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation_tbl] ([Id])
GO
ALTER TABLE [dbo].[Teacher_tbl] CHECK CONSTRAINT [FK_Teacher_tbl_Designation_tbl]
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementSystem] SET  READ_WRITE 
GO
