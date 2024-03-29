USE [master]
GO
/****** Object:  Database [gym_management]    Script Date: 1/12/2023 8:48:14 AM ******/
CREATE DATABASE [gym_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gym_management', FILENAME = N'C:\Users\turgutmuslu\gym_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gym_management_log', FILENAME = N'C:\Users\turgutmuslu\gym_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gym_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gym_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gym_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gym_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gym_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gym_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gym_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [gym_management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [gym_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gym_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gym_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gym_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gym_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gym_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gym_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gym_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gym_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gym_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gym_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gym_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gym_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gym_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gym_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gym_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gym_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [gym_management] SET  MULTI_USER 
GO
ALTER DATABASE [gym_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gym_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gym_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gym_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gym_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gym_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [gym_management] SET QUERY_STORE = OFF
GO
USE [gym_management]
GO
/****** Object:  Schema [gym]    Script Date: 1/12/2023 8:48:15 AM ******/
CREATE SCHEMA [gym]
GO
/****** Object:  Table [gym].[classes]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[classes](
	[class_id] [int] NOT NULL,
	[class_name] [varchar](255) NULL,
	[asc_trainerid] [int] NULL,
	[class_duration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[employees]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[employees](
	[employee_id] [int] NOT NULL,
	[e_name] [varchar](255) NULL,
	[e_email] [varchar](255) NULL,
	[e_gender] [varchar](255) NULL,
	[e_birth] [date] NULL,
	[e_contact] [int] NULL,
	[salary] [float] NULL,
	[join_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[e_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[equipment]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[equipment](
	[equipment_id] [int] NOT NULL,
	[equipment_brand] [varchar](255) NULL,
	[equipment_type] [varchar](255) NULL,
	[condition] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[events]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[events](
	[event_id] [int] NOT NULL,
	[event_name] [varchar](255) NULL,
	[event_date] [date] NULL,
	[event_location] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[fees_and_payments]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[fees_and_payments](
	[payment_id] [int] NOT NULL,
	[pay_memberid] [int] NULL,
	[asc_planid] [int] NULL,
	[payment_amount] [float] NULL,
	[payment_date] [date] NULL,
	[payment_method] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[lockers]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[lockers](
	[locker_id] [int] NOT NULL,
	[asgn_memberid] [int] NULL,
	[locker_combination] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[locker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[members]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[members](
	[member_id] [int] NOT NULL,
	[m_name] [varchar](255) NULL,
	[m_email] [varchar](255) NULL,
	[membership_type] [varchar](255) NULL,
	[m_contact] [int] NULL,
	[m_gender] [varchar](255) NULL,
	[m_birth] [int] NULL,
	[height] [float] NULL,
	[weight] [float] NULL,
	[enrollment_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[m_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[membership_plans]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[membership_plans](
	[plan_id] [int] NOT NULL,
	[plan_name] [varchar](255) NULL,
	[plan_duration] [int] NULL,
	[plan_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[schedule]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[schedule](
	[schedule_id] [int] NOT NULL,
	[sch_classid] [int] NULL,
	[class_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [gym].[trainers]    Script Date: 1/12/2023 8:48:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gym].[trainers](
	[trainer_id] [int] NOT NULL,
	[t_name] [varchar](255) NULL,
	[t_gender] [varchar](255) NULL,
	[experience] [int] NULL,
	[certifications] [varchar](255) NULL,
	[t_email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[trainer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[t_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [gym].[classes]  WITH CHECK ADD FOREIGN KEY([asc_trainerid])
REFERENCES [gym].[trainers] ([trainer_id])
GO
ALTER TABLE [gym].[fees_and_payments]  WITH CHECK ADD FOREIGN KEY([asc_planid])
REFERENCES [gym].[membership_plans] ([plan_id])
GO
ALTER TABLE [gym].[fees_and_payments]  WITH CHECK ADD FOREIGN KEY([pay_memberid])
REFERENCES [gym].[members] ([member_id])
GO
ALTER TABLE [gym].[lockers]  WITH CHECK ADD FOREIGN KEY([asgn_memberid])
REFERENCES [gym].[members] ([member_id])
GO
ALTER TABLE [gym].[schedule]  WITH CHECK ADD FOREIGN KEY([sch_classid])
REFERENCES [gym].[classes] ([class_id])
GO
USE [master]
GO
ALTER DATABASE [gym_management] SET  READ_WRITE 
GO
