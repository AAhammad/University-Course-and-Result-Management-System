USE [master]
GO
/****** Object:  Database [UniversityManagementSystem]    Script Date: 9/14/2018 3:40:29 AM ******/
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
/****** Object:  Table [dbo].[Course_tbl]    Script Date: 9/14/2018 3:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit] [decimal](6, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Day_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Designation_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semister_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [nchar](10) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Student_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher_tbl]    Script Date: 9/14/2018 3:40:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_tbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Email] [nchar](10) NOT NULL,
	[ContactNo] [nchar](10) NOT NULL,
	[Designation] [int] NOT NULL,
	[Department] [int] NOT NULL,
	[Credit] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Teacher_tbl] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course_tbl] ON 

INSERT [dbo].[Course_tbl] ([ID], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1, N'53455', N'C sharp', CAST(3.00 AS Decimal(6, 2)), N'dggdhgfh', 1, 4)
INSERT [dbo].[Course_tbl] ([ID], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (2, N'5345TTER', N'database', CAST(4.00 AS Decimal(6, 2)), N'dfgesgsd', 3, 2)
SET IDENTITY_INSERT [dbo].[Course_tbl] OFF
SET IDENTITY_INSERT [dbo].[Day_tbl] ON 

INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (5, N'Wednesday')
INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[Day_tbl] ([ID], [DayName]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day_tbl] OFF
SET IDENTITY_INSERT [dbo].[Department_tbl] ON 

INSERT [dbo].[Department_tbl] ([ID], [Code], [Name]) VALUES (1, N'101', N'Cste')
INSERT [dbo].[Department_tbl] ([ID], [Code], [Name]) VALUES (2, N'102', N'CSE')
INSERT [dbo].[Department_tbl] ([ID], [Code], [Name]) VALUES (3, N'222', N'ICT')
SET IDENTITY_INSERT [dbo].[Department_tbl] OFF
SET IDENTITY_INSERT [dbo].[Semester_tbl] ON 

INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (1, N'1st')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (2, N'2nd')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (3, N'3rd')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (4, N'4th')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (5, N'5th')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (6, N'6th')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (7, N'7th')
INSERT [dbo].[Semester_tbl] ([ID], [Title]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester_tbl] OFF
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Course_tbl_Department_tbl] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([ID])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK_Course_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Course_tbl_Semester_tbl] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester_tbl] ([ID])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK_Course_tbl_Semester_tbl]
GO
ALTER TABLE [dbo].[Student_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Student_tbl_Student_tbl] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department_tbl] ([ID])
GO
ALTER TABLE [dbo].[Student_tbl] CHECK CONSTRAINT [FK_Student_tbl_Student_tbl]
GO
ALTER TABLE [dbo].[Teacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_tbl_Department_tbl] FOREIGN KEY([Designation])
REFERENCES [dbo].[Designation_tbl] ([ID])
GO
ALTER TABLE [dbo].[Teacher_tbl] CHECK CONSTRAINT [FK_Teacher_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[Teacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_tbl_Teacher_tbl] FOREIGN KEY([ID])
REFERENCES [dbo].[Teacher_tbl] ([ID])
GO
ALTER TABLE [dbo].[Teacher_tbl] CHECK CONSTRAINT [FK_Teacher_tbl_Teacher_tbl]
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementSystem] SET  READ_WRITE 
GO
