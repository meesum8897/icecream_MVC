USE [master]
GO
/****** Object:  Database [db_icecream_project]    Script Date: 8/31/2023 8:22:26 PM ******/
CREATE DATABASE [db_icecream_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_icecream_project', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\db_icecream_project.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_icecream_project_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\db_icecream_project_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_icecream_project] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_icecream_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_icecream_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_icecream_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_icecream_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_icecream_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_icecream_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_icecream_project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_icecream_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_icecream_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_icecream_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_icecream_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_icecream_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_icecream_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_icecream_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_icecream_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_icecream_project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_icecream_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_icecream_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_icecream_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_icecream_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_icecream_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_icecream_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_icecream_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_icecream_project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_icecream_project] SET  MULTI_USER 
GO
ALTER DATABASE [db_icecream_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_icecream_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_icecream_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_icecream_project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [db_icecream_project]
GO
/****** Object:  Table [dbo].[books]    Script Date: 8/31/2023 8:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[image] [varchar](50) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 8/31/2023 8:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[subject] [varchar](100) NULL,
	[mesage] [text] NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 8/31/2023 8:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[cost] [varchar](50) NULL,
	[payment_mode] [varchar](50) NULL,
	[book_id] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe]    Script Date: 8/31/2023 8:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[price] [float] NULL,
	[image] [varchar](50) NULL,
 CONSTRAINT [PK_recipe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subscription]    Script Date: 8/31/2023 8:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscription](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subscription] [varchar](50) NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_subscription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/31/2023 8:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
	[subscription_id] [int] NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([id], [title], [description], [image], [price]) VALUES (1, N'abc', N'ac', N'b', 10)
INSERT [dbo].[books] ([id], [title], [description], [image], [price]) VALUES (2, N'chocolate', N'abc', N'homemade-chocolate-ice-cream-recipe-7.jpg', 10)
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[feedback] ON 

INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (1, N'abc', N'abc@gmail.com', N'abc', N'abc')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (2, N'abc', N'abc@gmail.com', N'123', N'kn')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (3, N'mm', N'mm@gmail.com', N'm', N'm')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (4, N'm', N'm@gmail.com', N'm', N'm')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (5, N'm', N'm@gmail.com', N'1', N'12')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (6, N'nm', N'nm@gmail.com', N'12', N'12
')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (7, N'abc', N'ab@gmail.com', N'12', N'o')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (8, N'm', N'm@gmail.com', N'snkk', N'nknk')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (9, N'k', N'k@gmail.com', N'kk', N'k
')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (10, N'jk', N'nk@gmail.com', N'24', N'23e')
INSERT [dbo].[feedback] ([id], [name], [email], [subject], [mesage]) VALUES (11, N'n', N'n@gmail.com', N'1klk', N'lk')
SET IDENTITY_INSERT [dbo].[feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [name], [email], [address], [cost], [payment_mode], [book_id]) VALUES (1, N'fizza', N'fizza@gmail.com', N'johar', N'5', N'credit card', 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[recipe] ON 

INSERT [dbo].[recipe] ([id], [Title], [price], [image]) VALUES (1, N'Chocolate', 5, NULL)
INSERT [dbo].[recipe] ([id], [Title], [price], [image]) VALUES (2, N'Vanilla', 5, NULL)
INSERT [dbo].[recipe] ([id], [Title], [price], [image]) VALUES (3, N'Chocolate', 5, N'chocolate.jpg')
INSERT [dbo].[recipe] ([id], [Title], [price], [image]) VALUES (4, N'Strawberry', 7, N'Strawberry-Ice-Cream-No-Churn_3b.jpg')
SET IDENTITY_INSERT [dbo].[recipe] OFF
GO
SET IDENTITY_INSERT [dbo].[subscription] ON 

INSERT [dbo].[subscription] ([id], [subscription], [amount]) VALUES (1, N'Monthly', 15)
INSERT [dbo].[subscription] ([id], [subscription], [amount]) VALUES (2, N'Yearly', 150)
SET IDENTITY_INSERT [dbo].[subscription] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (1, N'admin', N'admin@gmail.com', N'123', NULL, NULL, N'1')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (2, N'user', N'user@gmail.com', N'123', N'123456', 1, N'2')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (4, N'user2', N'user2@gmail.com', N'123', N'123456', 2, N'2')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (5, N'xyz', N'xyz@gmail.com', N'123', N'123456', 1, N'2')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (6, N'wardah', N'wardah@gmail.com', N'123', N'123', 2, N'2')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (7, N'hassan', N'hassan@gmail.com', N'12345', N'0341-3456324', 1, N'2')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (8, N'zara', N'zara@gmail.com', N'12345', N'03421234435', 1, N'2')
INSERT [dbo].[users] ([id], [name], [email], [pass], [contact], [subscription_id], [role]) VALUES (9, N'alif', N'alif@gmail.com', N'12345', N'343534512', 1, N'2')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_role]  DEFAULT ((2)) FOR [role]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_books]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_subscription1] FOREIGN KEY([subscription_id])
REFERENCES [dbo].[subscription] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_subscription1]
GO
USE [master]
GO
ALTER DATABASE [db_icecream_project] SET  READ_WRITE 
GO
