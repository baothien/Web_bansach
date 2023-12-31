USE [master]
GO
/****** Object:  Database [BookStore]    Script Date: 7/6/2023 12:11:02 AM ******/
CREATE DATABASE [BookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PHU\MSSQL\DATA\BookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PHU\MSSQL\DATA\BookStore_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStore] SET  MULTI_USER 
GO
ALTER DATABASE [BookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStore', N'ON'
GO
ALTER DATABASE [BookStore] SET QUERY_STORE = OFF
GO
USE [BookStore]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[District] [nvarchar](50) NOT NULL,
	[Ward] [nvarchar](50) NOT NULL,
	[Detail] [nvarchar](200) NOT NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Logo] [nvarchar](100) NOT NULL,
	[UploadDay] [date] NOT NULL,
	[Banner] [nvarchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
	[NameSearch] [varchar](50) NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Logo] [varchar](100) NOT NULL,
	[Banner] [varchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
	[NameSearch] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](255) NOT NULL,
	[Star] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Price] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[ApplyDay] [date] NOT NULL,
	[Expiration] [date] NOT NULL,
	[MoneyLimit] [int] NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[StartDay] [date] NOT NULL,
	[Salary] [int] NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
	[User_Id] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformationShop]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformationShop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Active] [bit] NULL,
	[TimeOpen] [nvarchar](50) NOT NULL,
	[Logo] [varchar](100) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Fax] [varchar](15) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[LogoFooter] [varchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Logo] [varchar](100) NOT NULL,
	[Banner] [varchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuOne]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuOne](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameSearch] [nvarchar](50) NOT NULL,
	[Cate_Id] [int] NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuTwo]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuTwo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameSearch] [nvarchar](50) NOT NULL,
	[Menu1_Id] [int] NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](6) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Address_Id] [int] NOT NULL,
	[Discount_Id] [int] NULL,
	[Quality] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Method] [char](1) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Comment] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Quality] [int] NOT NULL,
	[Views] [int] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Specification] [nvarchar](max) NOT NULL,
	[Image1] [nvarchar](100) NOT NULL,
	[Image2] [nvarchar](100) NOT NULL,
	[Image3] [nvarchar](100) NOT NULL,
	[Image4] [nvarchar](100) NOT NULL,
	[Image5] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[Manu_Id] [int] NOT NULL,
	[Cate_Id] [int] NOT NULL,
	[NameSearch] [varchar](50) NOT NULL,
	[CreateDay] [datetime] NULL,
	[PersonCreate] [int] NOT NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
	[UpdateDay] [datetime] NULL,
	[PersonUpdate] [int] NULL,
	[Sales] [int] NULL,
 CONSTRAINT [PK__Products__3214EC07C31AD900] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/6/2023 12:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](125) NOT NULL,
	[FullName] [nvarchar](125) NOT NULL,
	[Sex] [bit] NULL,
	[Birthday] [date] NULL,
	[Subscribe] [bit] NULL,
	[CreateDay] [datetime] NULL,
	[DeleteDay] [datetime] NULL,
	[PersonDelete] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (1, N'Phu Nguyen', N'0832977767', N'Hồ Chí Minh', N'Thủ Đức', N'Hiệp Bình Phước', N'123 quốc lộ 13, phường Hiệp Bình Phước, quận Thủ Đức, TP.Hồ Chí Minh', 3)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (61, N'Trinh Khanh', N'0923444221', N'Hà Nội', N'Thanh Oai', N'Thanh Cao', N'dadasdaddasdasdas', 3)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (62, N'Trinh Khanh', N'0922244422', N'Bình Thuận  ', N'Bắc Bình', N'Lương Sơn', N'420 ql 13, phường 123, quận Thủ Đức', 3)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (63, N'pham minh tuan', N'0355000276', N'Bắc Ninh', N'Lương Tài', N'Quảng Phú', N'qưewqeqweq', 1053)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (64, N'pham minh tuan', N'0355000276', N'Hồ Chí Minh', N'Quận 12', N'Hiệp Thành', N'qưewqeqweq', 1)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (68, N'Trần Thị Nở', N'0832977767', N'Bình Thuận  ', N'Bắc Bình', N'Phan Hiệp', N'520 ql 13, phường Hiệp Bình Phước, Q.Thủ Đức, TP.HCM', 50)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (69, N'Trinh Khanh', N'0832977767', N'Bình Thuận  ', N'Bắc Bình', N'Phan Lâm', N'520 ql 13, phường Hiệp Bình Phước, Q.Thủ Đức, TP.HCM', 3)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (76, N'Nguyễn Anh Phú', N'0338176696', N'Hồ Chí Minh', N'Thủ Đức', N'Linh Trung', N'123/1 đường Hoàng Diệu 2, phường Linh Trung, thành phố Thủ Đức, thành phố Hồ Chí Minh', 2)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (77, N'Nguyễn Anh Phú', N'0338176696', N'Quảng Ngãi', N'Quảng Ngãi', N'Nghĩa Chánh', N'Tổ 2 phường Nghĩa Chánh, thành phố Quảng Ngãi, tỉnh Quảng Ngãi', 2)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (78, N'Nguyễn Anh Phú', N'0338176696', N'Bà Rịa Vũng Tàu', N'Vũng Tàu', N'Rạch Dừa', N'120 đường 30/4', 3)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (79, N'Nguyễn Anh Phú', N'0338176696', N'Hồ Chí Minh', N'Gò Vấp', N'7', N'71 đường số 3 kdc cityland center', 3)
INSERT [dbo].[Address] ([Id], [FullName], [Phone], [Province], [District], [Ward], [Detail], [User_Id]) VALUES (80, N'Nguyễn Thị Phú', N'0338176696', N'Hồ Chí Minh', N'Quận 9', N'Hiệp Phú', N'Sài Gòn Gate Way, 702 Xa Lộ Hà Nội', 1057)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (1, N'Thi nhân Việt Nam – Dấu gạch nối quá khứ', N'<h3>Thi nhân Việt Nam – Dấu gạch nối quá khứ</h3>
                                <br>
                                <span>
                                    <b>“Thi nhân Việt Nam” là tuyển tập Thơ mới có chọn lọc (1932-1941) của hai nhà phê
                                        bình văn học nổi tiếng Hoài Thanh- Hoài Chân. Trong những tập thơ của mỗi tác
                                        giả
                                        đều có những lời bình hết sức sâu sắc và tinh tế, kéo con người gần hơn với thơ
                                        ca.</b>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Cuốn sách “Thi nhân Việt Nam” là một trong những tác phẩm nổi tiếng gắn liền với
                                    thành công của hai nhà phê bình văn học Hoài Thanh- Hoài Chân. Hoài Thanh
                                    (1909-1982) là một nhà phê bình văn học uyên bác và tinh tế. Ông đã đóng góp một
                                    phần công sức không nhỏ về mặt phê bình, lý luận để khẳng định phong trào Thơ mới
                                    trong lịch sử văn học Việt Nam thế kỉ 20.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Hoài Chân ( sinh năm 1914) em ruột Hoài Thanh. Ông và anh trai đã cùng chắp bút nên
                                    tác phẩm bất hủ “Thi nhân Việt Nam”. Chính tác phẩm này đã đưa tác giả lên vị trí
                                    rất cao xứng tầm với những nhà phê bình văn học lớn của nền văn học Việt Nam đầu thế
                                    kỉ 20. Cuốn sách là tuyển tập những bài thơ hay, giá trị của thời kì “ Thơ mới” được
                                    tác giả tìm hiểu, chọn lọc qua hàng ngàn, hàng vạn bài thơ. Qua đó đưa ra những lời
                                    phê bình rất tâm đắc, lấy “lấy hồn tôi để hiểu hồn người”, đó là những lời bình từ
                                    cái nhìn thấu cảm, từ trái tim của một người nghệ sĩ “say thơ” cho người đọc một cảm
                                    nhận mới mẻ, sâu sắc hơn với Thơ mới. Cuốn sách chính là nhân chứng lịch sử đánh dấu
                                    cho một thời đại vàng son trong nền văn học cách mạng Việt Nam.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/Z14Nrbx/thi-nhan-viet-nam-blog-image1.png" alt="thi-nhan-viet-nam-blog-image1" border="0">
                                        <span style="color: #777777;"><i>Ảnh: Instagram @songnhudoisong</i></span>
                                    </div>
                                </div>
                                <h3>Thời đại huy hoàng của những nhà thơ xuất chúng</h3>
                                <br>
                                <span>
                                    Đọc “Thi nhân Việt Nam” ta mới cảm nhận rõ nét về sự thay đổi của nền văn học trong
                                    một thời đại mới. Như những cuộc thay đổi khác, văn học cũng vậy, nó cũng cần có
                                    thời gian, có được sự đồng thuận, có được sự công nhận của đông đảo nhân dân quần
                                    chúng. Để cởi bỏ được những khuôn khổ cứng nhắc của thời kì văn học xưa cũ, những
                                    nguyên tắc, những luật lệ, những quan niệm hủ tục phong kiến đã trải qua hàng nghìn
                                    năm trước chẳng phải điều dễ dàng cho những nhà thơ thời đại Thơ mới.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Nhờ đem lại một tiếng nói mới, phản ánh một cách chân thực cảm xúc, tâm trạng trăn
                                    trở, buồn đau trước những bế tắc của cuộc sống trong thời kì trước Cách mạng tháng
                                    Tám. “Nói về “Thơ mới”, Xuân Diệu thường nhắc đến hai chữ đau đời. Đau vì nỗi đời
                                    vất vả. Đau vì kiếp làm dân một nước nô lệ. Đau vì tủi nhục, nghèo hèn cứ gắn hoài
                                    với thân phận”. Thơ mới bước ra từ tâm hồn của những người nghệ sĩ trẻ tuổi xuất
                                    chúng trong lớp thanh niên tiểu tư sản, đã thực sự thu hút được người đọc và đóng
                                    góp một phần công sức trong sự phát triển khả năng biểu đạt phong phú của tiếng
                                    Việt.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Nhưng trong thời kì loạn lạc ấy, Thơ mới bị giam hãm trong một môi trường thiếu năng
                                    lượng, thiếu ánh sáng. Bời vậy, những tác phẩm dù đa dạng về chủ đề, về phong cách
                                    sáng tác nhưng lại chung một nỗi buồn phiền, tiếc nuối của một cái “ tôi” rất riêng.
                                    Và thực ra cái nỗi buồn ấy lại làm mất đi cái bình yên của thời trước. “Chưa bao giờ
                                    như bây giờ học cảm thấy tinh thần nòi giống cũng như các thể thơ xưa chỉ biến thiên
                                    chứ không sao tiêu diệt được.” Đó cũng là một sự ra đi của Thơ mới như cái cách nó
                                    bắt đầu thật sự rất buồn.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/hMcq6Gy/thi-nhan-viet-nam-blog-image2.png" alt="thi-nhan-viet-nam-blog-image2" border="0">
                                        <span style="color: #777777;"><i>Ảnh: Instagram @iam_neih</i></span>
                                    </div>
                                </div>
                                <h3>“Lấy hồn tôi để hiểu hồn người”</h3>
                                <br>
                                <span>
                                    “Phải đọc Thi nhân Việt Nam ở đó, ta không chỉ thấy thơ ca, không chỉ thấy nghệ
                                    thuật, không chỉ thấy tài năng, không chỉ thấy sự chuyển mình của một thời đại mà ta
                                    còn thấy lòng người – một tấm lòng trân trọng mà say mê cái Đẹp. Đây chính là một
                                    hợp tuyển xuất sắc, một tầm nhìn thấu suốt và mở rộng với con đường Thơ mới khi ấy
                                    hẵng còn quá “mới” và hơn tất cả, cũng là nguyên do cho tất cả, đó chính là khả năng
                                    cảm thụ thơ vô cùng tinh tế của Hoài Thanh và Hoài Chân.”
                                </span>
                                <br>
                                <br>
                                <span>
                                    Đúng vậy, với những người có niềm đam mê và muốn tìm hiểu Thơ mới thì không thể nào
                                    bỏ qua “Thi nhân Việt Nam”. Bởi đây không chỉ đơn giản là cuốn tuyển tập thơ mới có
                                    chọn lọc từ một người nghệ sĩ có kinh nghiệm mà qua đó còn được hiểu một cách sâu
                                    sắc về con người, phong cách sáng tác, về cảm xúc , về những điều mới mẻ khác nữa
                                    trong mỗi nhà thơ. Lời bình hướng cho độc giả đến cái Đẹp mà mỗi nhà thơ muốn gửi
                                    gắm qua mỗi tác phẩm của mình.
                                </span>', N'thi-nhan-viet-nam-blog-logo.png', CAST(N'2021-12-09' AS Date), N'thi-nhan-viet-nam-blog-banner.png', 1, CAST(N'2021-12-09T08:53:04.853' AS DateTime), 3, NULL, 0, CAST(N'2021-12-09T11:08:13.053' AS DateTime), 3, N'thi-nhan-viet-nam', N'Cuốn sách “Thi nhân Việt Nam” là một trong những tác phẩm nổi tiếng gắn liền với thành công của hai nhà phê bình văn học Hoài Thanh- Hoài Chân. Hoài Thanh(1909-1982) là một nhà phê bình văn học uyên bác và tinh tế.')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (2, N'Chó xanh lông dài – Chia ly không phải là điều tồi tệ nhất!', N'<h3>Chó xanh lông dài – Chia ly không phải là điều tồi tệ nhất!</h3>
                                <br>
                                <span>
                                    <b>“Chó xanh lông vàng” không kịch tính, cũng không chứa đựng quá nhiều bất ngờ,
                                        Hwang Sun-mi cứ bình bình đạm đạm kể qua hết chương này đến chương khác, có sinh
                                        ra có chết đi, từ gặp gỡ đến ly biệt… những câu chuyện thường nhật của con người
                                        và loài vật. Tác phẩm, một cách chậm rãi và sâu lắng, diễn dịch niềm vui và nỗi
                                        buồn của cuộc đời, theo một cách rất riêng.</b>
                                </span>
                                <br>
                                <br>
                                <h3>Chuyện về một chú chó lông dài.</h3>
                                <br>
                                <span>
                                    Một ngày cuối hạ năm 2012, Hwang Sun-mi hoàn thành những trang viết cuối cùng và ra
                                    mắt bạn đọc “Chó xanh lông dài”, tác phẩm nằm trong bộ sách “Văn học về loài vật” và
                                    được trao nhiều giải thưởng.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Vẫn chọn lối ẩn thân để đóng vai trò một nhân vật “biết tuốt”, vẫn sử dụng ngôi thứ
                                    ba như trong tác phẩm nổi tiếng <i style="color: royalblue;">“Cô gà mái xổng
                                        chuồng”</i>, lần này nữ nhà văn quen
                                    thuộc trong thế giới truyện thiếu nhi Hàn Quốc kể về nhân vật chính là Ja Ang – một
                                    chú chó lông dài khác biệt trong gia đình, đặt trong mối quan hệ với động vật cùng
                                    loài, khác loài, và với con người.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Vừa sinh ra đã mọc hết lông, đen tuyền từ đầu đến chân, không giống mẹ cũng chẳng
                                    giống cha, càng lớn lông lại càng dài thườn thượt, che cả mắt – Ja Ang bị chính anh
                                    em và Vàng mẹ ghét bỏ vì trông… chẳng gọn gàng gì! Nhưng Ja Ang lại là chú chó mở
                                    mắt sớm nhất, cũng có linh tính nhất, nên nó đã có thể tránh thoát bởi tay trộm chó,
                                    nhưng cũng vì thế mà nó biết được nỗi buồn của sự chia ly, với mẹ, với anh em, với
                                    những đứa con của mình, và với cả mụ mèo dù đáng ghét nhưng vẫn là bạn. Chỉ có ông
                                    lão là luôn ở bên, dẫu có đánh mắng, có giận hờn:
                                </span>
                                <br>
                                <br>
                                <span>
                                    <i>
                                        “Lông Dài chưa một lần vừa lòng với lão To Giọng. Lông Dài chưa từng thích lão,
                                        người đã làm nó buồn, làm nó giận, làm nó chỉ còn một mình hết lần này đến lần
                                        khác. Nhưng dù vậy, nó không thể rời xa lão, cũng không thể ghét lão đến cùng
                                        được. Đúng là chuyện kỳ quặc.”
                                    </i>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Song song chuyện loài vật là chuyện con người, đó là những năm tháng cuối đời của
                                    lão To Giọng, cuộc sống về già trong nỗi cô đơn phiền muộn sống xa con cháu, kiếm
                                    tìm niềm an ủi từ vật nuôi. Giữa Ja Ang và lão To Giọng đã không đơn thuần là mối
                                    quan hệ giữa chủ và vật nuôi nữa, mà đã hình thành sợi dây liên kết, là điểm tựa
                                    tinh thần cho nhau, còn có thể… uống rượu cùng nhau nữa.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Dựa trên những chất liệu từ chính thời thơ ấu của mình, với ngôi nhà và chiếc cầu
                                    thang ốc sên, tác giả Hwang Sun-mi đã viết câu chuyện “Chó xanh lông dài”, mang theo
                                    nhiều hoài niệm, lòng trắc ẩn và góc nhìn chiêm nghiệm cuộc đời.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/7SsmL1D/cho-xanh-long-dai-1.png"
                                            alt="cho-xanh-long-dai-1" border="0">
                                        <span style="color: #777777;"><i>Ảnh: Nhã Nam</i></span>
                                    </div>
                                </div>
                                <h3>Chia ly không phải là điều tồi tệ nhất!</h3>
                                <br>
                                <span>
                                    Nỗi buồn chia ly ập đến làm lòng Ja Ang vỡ nát hết lần này đến lần khác, cho đến khi
                                    nó gặp lại Trắng con.
                                </span>
                                <br>
                                <br>
                                <span>
                                    <i>
                                        “Lông Dài lấy làm biết ơn vì Trắng con không gặp bất hạnh sau khi rời khỏi nhà
                                        như nó đã tưởng. Nó cứ lo sợ tất cả các con đều chết hết, nên biết được Trắng
                                        con đã lớn khôn tuyệt vời thế này, Lông Dài cảm thấy thật may mắn. Lông Dài chỉ
                                        biết cảm ơn trời đất vì suốt buối sáng nó cứ đi vòng vòng qua mấy con đường vậy
                                        mà vẫn gặp ngay được Trắng con ở một trong rất nhiều ngã rẽ ấy.”
                                    </i>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Chia ly rất buồn, nhưng đó là quy luật tất yếu của cuộc đời. Có gặp gỡ thì phải có
                                    chia ly. Bữa tiệc nào rồi cũng sẽ tàn. Thay vì quá đau buồn, nên suy nghĩ theo một
                                    hướng tích cực khác, nên cầu mong sau cuộc ly biệt là một hành trình mới nhiều sắc
                                    màu và nhiều may mắn. Thay vì bi quan, nên học cách chấp nhận và biết ơn.
                                </span>', N'cho-xanh-long-dai-logo.png', CAST(N'2021-12-09' AS Date), N'cho-xanh-long-dai-banner.png', 1, CAST(N'2021-12-09T19:11:18.997' AS DateTime), 3, NULL, 0, CAST(N'2021-12-10T08:31:58.080' AS DateTime), 3, N'cho-xanh-long-dai', N'“Lông Dài lấy làm biết ơn vì Trắng con không gặp bất hạnh sau khi rời khỏi nhà như nó đã tưởng. Nó cứ lo sợ tất cả các con đều chết hết,')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (3, N'Review sách: Hoa Tulip đen – Alexandre Dumas', N'<h3>Review sách: Hoa Tulip đen – Alexandre Dumas</h3>
                                <br>
                                <span>
                                    <b>Alexandre Dumas là một trong những cái tên bảo chứng cho bút lực tuyệt hảo vẽ nên
                                        hào nhoáng kinh diễm của dòng chảy văn học kinh điển, thông qua những tác phẩm
                                        đi vào lòng người như “Bá Tước Monte Cristo”, “Hoàng Hậu Magrot”, “Ba Chàng Lính
                                        Ngự Lâm”. Tiếp nối thành công vang dội đó, “Hoa Tulip Đen” được thai nghén và ra
                                        đời, không chỉ bung tỏa vẻ đẹp của người làm vườn đạt được thành tựu khi sáng
                                        tạo ra một giống loài cao quý, mà còn khiến đóa hoa tình ái nở rộ ngay cả trong
                                        điều kiện ngục tù.</b>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Hoa Tulip Đen là tác phẩm viết bằng tiếng Pháp xuất bản vào năm 1850 và là một
                                    trong những đứa con tinh thần có tiếng tăm lẫy lừng nhất của Văn Hào Pháp
                                    Alexandre Dumas – Dumas Cha. “Hoa Uất Kim Cương Đen” – bộ tiểu thuyết ngắn chưa
                                    đến 300 trang được chia thành 23 chương hồi, lấy bối cảnh chính tại thành phố La
                                    Haye, Hà Lan thế kỉ XVII, được tô điểm không phải với cối xay gió hay các cô gái
                                    nhà nông chăn bò, mà là căn ngục tối ẩm thấp, nơi những hạt giống Tulip Đen đầu
                                    tiên được khai tạo, nơi kết tinh một mối tình không tưởng giữa con gái cai ngục
                                    và kẻ tù tội vì hàm oan.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/tcKQbqd/hoa-tulip-den-1.png" alt="hoa-tulip-den-1"
                                            border="0">
                                        <span style="color: #777777;"><i>Ảnh: @mi.reader</i></span>
                                    </div>
                                </div>
                                <h3>Nghệ thuật đặt trên nền tảng niềm tin – Chúa và Định mệnh</h3>
                                <br>
                                <span>
                                    <i>“Vào định mệnh – Đức Ông hờ hững đáp – Có những con người vĩ đại đôi khi cũng là
                                        nạn nhân của định mệnh.”</i>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Lối viết của Dumas Cha là lối bút duy trì sự kết hợp hoàn hảo giữa chân lý hiện thực
                                    và những phép màu kì diệu nhân đạo hóa mỗi câu chuyện, mỗi linh hồn trong tiểu
                                    thuyết. Văn phong nhà văn chỉ ra rằng, dù là trong tâm tưởng của kẻ viết lách hay
                                    thực tế cuộc sống, luôn có những sự kiện được Chúa an bài, ấy gọi là Định mệnh.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Câu chuyện là làn gió thổi theo chân Conerlius Van Berla, một nhà làm vườn dịu dàng
                                    và tinh tế biết nhường nào khi dành cả nhiệt huyết tuổi trẻ để nghiên cứu giống loài
                                    tulip có màu đen tuyền đơn sắc. Khi Định mệnh ập đến, dòng xoáy chính trị, cái danh
                                    con đỡ đầu của Corneille de Witt, sự ganh ghét, đố kị của người hàng xóm xấu tính đã
                                    biến chuyển nơi chốn Van Berla ở từ căn gác kín có vườn hoa Tulip thành hầm ngục tối
                                    tăm.
                                </span>
                                <br>
                                <br>
                                <h3>Hoa Tulip Đen – Chính vật nằm giữa các chính kịch</h3>
                                <br>
                                <span>
                                    Mỗi tác phẩm của Alexandre Dumas đều là một tập các tản kịch, mỗi nhân vật trong đó
                                    đều có nét cá tính đặc sắc riêng. Nếu nói ai là nhân vật trung tâm của câu chuyện,
                                    tôi cho rằng không phải Cornerlius, mà chính giống loài “Uất kim cương đen”, từ khi
                                    chưa thành hình, cho đến củ ấu cành giâm bị chà đạp, được truyền tay, cho đến bông
                                    hoa Tulip Đen kiêu hãnh quyền quý xuất hiện giữa hội chợ, chính là tụ hội của những
                                    sự kiện sườn cốt của tiểu thuyết, mà cũng là chính vật giữa các chính kịch.
                                </span>
                                <br>
                                <br>
                                <span>
                                    <i>
                                        “Khinh thường hoa là ghét Chúa. Khinh hoa đẹp bao nhiêu lại càng tỏ ra ghét Chúa
                                        bấy nhiêu. Hoa Tulip là thứ hoa đẹp nhất. Vậy kẻ nào ghét hoa Tulip là kẻ khinh
                                        Chúa nhiều nhất.”
                                    </i>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Hoa Tulip Đen trong truyện không chỉ là vị nữ hoàng đầu đội triều thiên của giống
                                    loài tulip, mà còn là tượng trưng cố gắng, cho hy vọng thấp lên từ nơi những người
                                    bình thường nhất ở trong điều kiện khắc khổ nhất. Là si quyến, là ích kỉ, là mưu đồ,
                                    tham lam, là hèn nhát và ghen tị của những kẻ vì lợi ích sẵn sàng chà đạp lên công
                                    sức của người khác. Tulip đen là hận, mà cũng là tình, là lãng mạn và ngây thơ mà
                                    Van Berla trao đến Rosa, là hy sinh và cố gắng mà nàng – con gái cai ngục trao trả
                                    lại tù nhân mà nàng yêu, là chút gia vị ghen tuôn mà tulip gieo vào cung đàn tình
                                    ái, là sửng sốt, là mê luyến, là trầm tư cùng chờ đợi xuất phát từ một loài hoa, duy
                                    trì bởi một loài hoa, mà cũng kết thúc ở nơi đóa Tulip Đen ngự trị.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/nb3YT8w/hoa-tulip-den-2.png" alt="hoa-tulip-den-2"
                                            border="0">
                                        <span style="color: #777777;"><i>Ảnh: @journeywithbooks7</i></span>
                                    </div>
                                </div>
                                <h3>Rosa – Tín ngưỡng thứ hai của Cornerlius</h3>
                                <br>
                                <span>
                                    Rosa là nhân vật nữ duy nhất xuyên suốt tác phẩm, và cũng là nhân vật móc xích các
                                    sự kiện Alexandre Dumas đã khéo léo xây dựng. Hình tượng Rosa xinh đẹp, thông minh,
                                    can đảm và dứt khoác được làm bật lên, trái ngược hoàn toàn với người bố Gryphus
                                    quản ngục của nàng, một người đàn ông tàn nhẫn và thiếu hiểu biết.
                                </span>
                                <br>
                                <br>
                                <span>
                                    <i>
                                        “Không phải lo lắng đến hoa tulip mà anh bị ốm, mà chính là nỗi u sầu không được
                                        nhìn thấy em.”
                                    </i>
                                </span>
                                <br>
                                <br>
                                <span>
                                    Cuộc đời Cornerlius được đính chung một chỗ với hai tầng tín ngưỡng: Hoa Tulip Đen
                                    và Rosa. Nàng yêu Van Berla vì Tulip Đen, nàng ghen tị dỗi hờn vì Tulip Đen, nàng
                                    cũng cố chấp hành động vì Tulip Đen.
                                </span>', N'hoa-tulip-den-logo.png', CAST(N'2021-12-11' AS Date), N'hoa-tulip-den-banner.png', 1, CAST(N'2021-12-11T07:33:37.560' AS DateTime), 3, NULL, 0, NULL, 0, N'hoa-tuli-den', N'Lối viết của Dumas Cha là lối bút duy trì sự kết hợp hoàn hảo giữa chân lý hiện thực và những phép màu kì diệu nhân đạo hóa mỗi câu chuyện, mỗi linh hồn trong tiểu thuyết. Văn phong nhà văn chỉ ra rằng, dù là trong tâm tưởng của kẻ viết lách hay')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (4, N'Kẻ trộm giấc mơ (Yasutaka Tsutsui) – Trận chiến giữa lằn ranh mơ – thực', N'<h3>Kẻ trộm giấc mơ (Yasutaka Tsutsui) – Trận chiến giữa lằn ranh mơ – thực</h3>
                                <br>
                                <span>
                                    <i>Hai nhà khoa học trẻ thiên tài: Tokita Kousaku và Chiba Atsuko được đồng đề cử
                                        cho giải Nobel về Sinh lý và Y khoa vì bước đột phá trong việc điều trị chứng
                                        tâm thần phân liệt khi sử dụng một thiết bị có tên PT xâm nhập vào tiềm thức
                                        người bệnh, trực tiếp chữa bệnh cho họ qua những giấc mơ. Một ngày, Tokita phát
                                        triển hệ thống trên thành thiết bị nhỏ gọn với nhiều tính năng nổi trội hơn và
                                        gọi là DC Mini. Tuy nhiên, thiết bị mới còn chưa hoàn thiện, nó đã bị đánh cắp.
                                        Và lúc này, sự chưa hoàn thiện của DC Mini đã làm dấy lên cơn ác mộng kinh hoàng
                                        mà chính bản thân người sáng chế ra nó: Tokita Kousaku cũng chưa bao giờ có thể
                                        tưởng tượng nổi.</i>
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/WtPSXK7/ke-trom-giac-mo-1.png"
                                            alt="ke-trom-giac-mo-1" border="0">
                                    </div>
                                </div>
                                <h3>Cuốn tiểu thuyết được viết trên nền tảng tâm lý học</h3>
                                <br>
                                <span>
                                    Là bộ truyện tâm lý viễn tưởng nổi tiếng của tác giả Yasutaka Tsutsui, <i>Kẻ trộm
                                        giấc
                                        mơ</i> chứa nhiều yếu tố, tình tiết đến hoang đường nhưng tới cuối cùng, câu
                                    chuyện vẫn
                                    dựa trên điểm cốt lõi, tính khoa học của nền tảng tâm lý: lý thuyết phân tâm học mà
                                    Sigmund Freud là cha đẻ. Bởi thế, để có thể hiểu được triểu thuyết Kẻ trộm giấc mơ
                                    một cách sâu sắc nhất, hiểu được những thuật ngữ chuyên môn tác giả viết trên trang
                                    sách, độc giả cũng cần có một cái nhìn tổng quan về phân tâm học. Bởi nếu không,
                                    người đọc hẳn sẽ cảm giác choáng ngợp trước hàng loạt khái niệm chuyên ngành xa lạ
                                    như tầng vô thức hay liệu pháp chữa bệnh tâm lý bằng phân tích giấc mơ hoặc xâm nhập
                                    vào tiềm thức của người bệnh.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Phân tâm học bắt nguồn từ thực tiễn nghiên cứu tâm lý học, có thể được định nghĩa
                                    như một phương pháp nghiên cứu và chữa trị chứng bệnh tâm thần (Hysteria,
                                    Depression) với cha đẻ là bác sĩ, nhà tâm lý học người Áo Sigmund Freud (1856 –
                                    1939). Về sau lí thuyết phân tâm học phát triển thành nhiều khuynh hướng nghiên cứu
                                    khác nhau nhưng có thể chia phân tâm học ra thành ba vấn đề chính: lý thuyết về cấu
                                    trúc nhân cách, lý thuyết về libido, quan niệm về sự dồn nén và con đường giải tỏa
                                    dồn nén.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Với lý thuyết về cấu trúc nhân cách, Freud phác họa cấu trúc nhân cách gồm ba phần
                                    cơ bản: phân tầng cái Nó hay còn được gọi là Vô thức, phân tầng cái Tôi hay còn gọi
                                    là Ý thức, phân tầng cái Siêu Tôi hay còn gọi là Tiềm thức. Và theo Freud, phần
                                    chính tâm lý con người được ẩn giấu vào vô thức – cái Nó, còn ý thức chỉ chiếm một
                                    phần nhỏ. Kế đó là lý thuyết về Libido hay còn được biết đến là dục năng của con
                                    người. Cuối cùng là quan niệm về sự dồn nén và con đường giải tỏa dồn nén, rằng khát
                                    vọng của con người trong cuộc sống, đặc biệt là năng lượng Libido đòi hỏi phải được
                                    thực hiện hay giải tỏa. Nhưng trong thực tế, sự giải tỏa không phải lúc nào cũng
                                    thực hiện được nên sinh ra sự dồn nén, cần thiết được giải tỏa bằng các con đường
                                    khác nhau.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Khi đã có hiểu biết nhất định và soi chiếu vào tiểu thuyết Kẻ trộm giấc mơ, độc giả
                                    sẽ hiểu tại sao Tokita và Atsuko có thể chữa trị những chứng bệnh tâm lý nói chung,
                                    chứng tâm thần phân liệt nói riêng bằng cách xâm nhập vào tiềm thức, phân tích giấc
                                    mơ của người bệnh. Và cũng sẽ không quá đỗi ngạc nhiên trước khả năng, sức mạnh vô
                                    tận của giấc mơ con người. Khi giấc mơ càng biến thái vặn vẹo, dục năng libido càng
                                    lớn thì lúc được hiện thực hóa, giấc mơ đó càng trở nên kinh hoàng.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Cùng với đấy, qua quá trình điều trị của Atsuko dành cho Konakawa và Noda, Kẻ trộm
                                    giấc mơ còn như một sự tái hiện lại những buổi thực nghiệm chữa trị tâm lý bằng lý
                                    thuyết phân tâm Freud đã từng làm xưa kia nhưng với trình độ cao hơn: có sự hỗ trợ
                                    từ thiết bị hiện đại. Vì thế, nhà tâm lý học có thể trực tiếp đồng hành cùng người
                                    bệnh trong miền vô thức, khám phá, giải mã những giấc mơ, qua đó làm sáng tỏ những
                                    ẩn ức họ mang theo. Những nỗi đau, sự dằn vặt, niềm ăn năn… mà người muốn chối bỏ,
                                    tìm mọi cách đẩy nó vào tầng sâu vô thức bằng phương thức quên lãng. Nhưng sự thật,
                                    càng cố quên, nỗi đau lại càng đè nặng, và thực tại, người ta lại càng thêm khổ đau.
                                    Về lâu về dài, mà sinh ra những chứng bệnh tâm lý
                                </span>
                                <br>
                                <br>
                                <span>
                                    Vì vậy, giải quyết “tâm bệnh”, chính là làm sáng tỏ những ẩn ức, gợi dậy quá khứ để
                                    con người đối mặt trực tiếp bằng tất cả sự dũng cảm không chạy trốn. Cho nên, dù Kẻ
                                    trộm giấc mơ là một tiểu thuyết hư cấu thì lý thuyết phân tâm cùng sự điều trị tâm
                                    lý cho con người qua việc giải mã giấc mơ ở tầng vô thức lại thuộc về hiện thực. Vì
                                    thế, tình tiết câu chuyện vẫn đảm bảo tính chân thực, khoa học bên cạnh sự hư cấu,
                                    kì ảo, viễn tưởng. Từ đó giác trị nội dung, tư tưởng được mở rộng, không đơn thuần
                                    chỉ là sự đối đầu lợi ích giữa các phe phái trong một cộng đồng hẹp mà hơn cả, là
                                    tính nhân văn của các phát minh sáng chế, lương tâm người thầy thuốc hay những ẩn ức
                                    con người thời hiện đại…
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/1rr1wQj/ke-trom-giac-mo-2.png"
                                            alt="ke-trom-giac-mo-2" border="0">
                                        <span style="color: #777777;"><i>Ảnh: @journeywithbooks7</i></span>
                                    </div>
                                </div>', N'ke-trom-giac-mo-logo.png', CAST(N'2021-12-11' AS Date), N'ke-trom-giac-mo-banner.png', 1, CAST(N'2021-12-11T09:52:11.830' AS DateTime), 3, NULL, 0, NULL, 0, N'ke-trom-giac-mo', N'Hai nhà khoa học trẻ thiên tài: Tokita Kousaku và Chiba Atsuko được đồng đề cử cho giải Nobel về Sinh lý và Y khoa vì bước đột phá trong việc điều trị chứng tâm thần phân liệt khi sử dụng một thiết bị có tên PT xâm nhập vào tiềm thức người bệnh')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (5, N'Gánh hàng hoa – Một cuốn sách khá… hiền lành!', N'<h3>Gánh hàng hoa – Một cuốn sách khá… hiền lành!</h3>
                                <br>
                                <span>
                                    <b>Cùng với “Đời mưa gió”, “Anh phải sống”, tiểu thuyết “Gánh hàng hoa” là thành quả
                                        kết hợp của đôi bạn thân Nhất Linh và Khái Hưng. Tác phẩm thông qua đề tài tình
                                        yêu đặt trên lòng cao thượng và nỗi tuyệt vọng đậm chất lãng mạn, ca tụng những
                                        nét đẹp bình dân của phụ nữ nông thôn Việt Nam, đồng thời thể hiện quan niệm về
                                        cải cách văn chương.</b>
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/k5sbkLH/ganh-hang-hoa-1.png" alt="ganh-hang-hoa-1" border="0">
                                        <span style="color: #777777;"><i>Ảnh: nhanambooks</i></span>
                                    </div>
                                </div>
                                <span>
                                    Tiểu thuyết “Gánh hàng hoa” ra mắt độc giả lần đầu trên báo Phong Hóa, nhân dịp kỷ
                                    niệm tròn một năm Tự Lực văn đoàn ra số báo đầu tiên, được đăng dài kỳ từ số 66
                                    (29/09/1933) đến số 88 (09/03/1934), có kèm theo tranh minh họa của Đông Sơn – tức
                                    bút danh khi vẽ của Nhất Linh.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Cùng với “Dòng nước ngược” – tập thơ trào phúng của Tú Mỡ, “Gánh hàng hoa” trở thành
                                    một trong hai cuốn sách đầu tiên của Nhà xuất bản Đời Nay do Tự Lực văn đoàn chủ
                                    trương (06/1934), là bước ngoặt trong tiến trình văn chương của nhóm.
                                </span>
                                <br>
                                <br>
                                <h3>Chuyện … ba người.</h3>
                                <br>
                                <span>
                                    <i>“Thân em như gánh hàng hoa,</i>
                                </span>
                                <br>
                                <span>
                                    <i>Sớm qua chợ sớm, chiều qua chợ chiều.”</i>
                                </span>
                                <br>
                                <span>
                                    (Cao Bá Nhạ)
                                </span>
                                <br>
                                <br>
                                <span>
                                    Liên là một cô gái quê trẻ đẹp, tảo tần, sáng bán hoa, chiều làm vườn, hết lòng hy
                                    sinh, hỗ trợ cho con đường học vấn của chồng. Minh là một học trò giỏi. Hai người từ
                                    thanh mai trúc mã trở thành vợ chồng. Giữa họ là tình bạn, tình yêu hóa thành tình
                                    thân. Minh và Văn là đôi bạn thân cùng lớp.
                                </span>
                                <br>
                                <br>
                                <span>
                                    “Gánh hàng hoa” chính là câu chuyện xoay quanh ba con người ấy.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Nhắc đến chuyện ba người, trí tưởng tượng thường hay vẽ ra một chút gì đó kịch tính,
                                    như cuộc tình tay ba đầy lâm ly bi đát chẳng hạn. Nhưng những gì Nhất Linh Khái Hưng
                                    dựng nên đã lồng ghép lòng cao thượng và nỗi tuyệt vọng vào trong mối quan hệ tình
                                    yêu và tình bạn, tạo ra một cốt truyện đơn giản mà khá thú vị. Và bởi vì đơn giản,
                                    nên bài viết này xin phép không nói quá nhiều về tình tiết câu chuyện.
                                </span>
                                <br>
                                <br>
                                <h3>
                                    Một cuốn sách khá… hiền lành!
                                </h3>
                                <br>
                                <span>
                                    Dùng tính từ “hiền lành” để miêu tả một cuốn sách thì có gì đó nghe sai sai! Nhưng
                                    đặt trong chủ trương duy tân, cấp tiến cùng những nỗ lực cải cách xã hội của Nhất
                                    Linh – thì “Gánh hàng hoa” bỗng hóa hiền lành khó tả – khi không thách thức thế lực
                                    phong kiến hay đả phá đạo Khổng. Xuất hiện đặc tính này có lẽ phần lớn là nhờ sự
                                    trung hòa khi văn phong Nhất Linh kết hợp với ngòi bút của Khái Hưng.
                                </span>
                                <br>
                                <br>
                                <span>
                                    “Gánh hàng hoa” là sự đan xen của tinh tế và lãng mạn, của dịu êm nhưng cũng đầy
                                    quyết đoán. Cuốn tiểu thuyết khắc họa sự diễm lệ đơn thuần của tình yêu, và mong
                                    muốn độc giả tin vào sự tinh khôi ấy. Nhưng rồi, có tin được không?
                                </span>
                                <br>
                                <br>
                                <span>
                                    “Gánh hàng hoa” hiền lành, vì Liên hiền lành. Nhưng Liên không đại diện cho ai cả.
                                    Nàng sống cuộc đời của riêng nàng, hiểu chuyện, nhu mì và bao dung.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Có thể nói, Nhất Linh Khái Hưng ca tụng Liên là ca tụng những nét đẹp bình dân của
                                    người phụ nữ nông thôn Việt Nam thời kỳ trước, nhưng không thể xây dựng Liên thành
                                    một hình tượng áp đặt để làm gương, làm hình mẫu cho những người khác. Bởi vì, một
                                    người vợ có thể lựa chọn nhẫn nhịn như Liên, cũng có thể lựa chọn từ bỏ một người
                                    chồng phản bội.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Liên tha thiết với tình yêu, đặt tình yêu lên trên hết thảy những dục vọng tầm
                                    thường, để rồi đọc chuyện về nàng, thấy lòng người đằm thắm lạ. Nhưng khách quan thì
                                    đức tính ấy, có lẽ mang đôi phần “thánh mẫu”, quá lãng mạn và thiếu phần thực tế.
                                </span>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/dpfjQBD/ganh-hang-hoa-2.png" alt="ganh-hang-hoa-2" border="0">
                                        <span style="color: #777777;"><i>Ảnh: trangmaru</i></span>
                                    </div>
                                </div>', N'ganh-hang-hoa-logo.png', CAST(N'2021-12-11' AS Date), N'ganh-hang-hoa-banner.png', 1, CAST(N'2021-12-11T10:09:13.437' AS DateTime), 3, NULL, 0, NULL, 0, N'ganh-hang-hoa', N'Cùng với “Đời mưa gió”, “Anh phải sống”, tiểu thuyết “Gánh hàng hoa” là thành quả kết hợp của đôi bạn thân Nhất Linh và Khái Hưng. Tác phẩm thông qua đề tài tình yêu đặt trên lòng cao thượng và nỗi tuyệt vọng đậm chất lãng mạn, ca tụng những')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (6, N'Review sách: Người tình – Marguerite Duras', N'<h3>Review sách: Người tình – Marguerite Duras</h3>
                                <br>
                                <span>
                                    “Hoàn cảnh”, hai chữ định hình cuộc sống con người, vì hoàn cảnh mà đôi khi chẳng có
                                    lựa chọn nào khác. Với “Người tình”, Marguerite Duras đưa người đọc cảm nhận rõ thế
                                    nào là sức ảnh hưởng của “hoàn cảnh” đối với cuộc đời của mỗi người, cụ thể là một
                                    cô gái mới mười lăm tuổi. Vì cuộc sống xa xứ nghèo khổ, vì những ám ảnh của bà mẹ và
                                    của người tình, chính nhân vật trong truyện – tác giả, đã đi qua quá nhiều nấc thăng
                                    trầm so với cuộc sống của một cô gái đương tuổi thiếu niên.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/p1VmnfG/nguoi-tinh-1.png" alt="nguoi-tinh-1"
                                            border="0">
                                    </div>
                                </div>
                                <h3>Cuộc sống ám ảnh của Duras ở Sa Đéc (Vĩnh Long) cùng với gia đình của mình</h3>
                                <br>
                                <span>
                                    Khi con người rời xa quê hương, họ ít nhiều đều cảm thấy cô đơn và lạc lõng. Duras
                                    không còn cha ở bên cạnh, ông chọn trở về Pháp để ra đi. Ở lại Việt Nam cùng với mẹ
                                    và hai anh trai của mình, tuổi thơ của cô hiện lên ngột ngạt qua từng con chữ. Vì
                                    nghèo khổ, vì cô đơn, mẹ của Duras luôn đặt cô vào khuôn khổ bà sắp xếp sẵn. Qua
                                    những tự sự của nhà văn, bạn đọc cảm nhận sự dồn nén của nhân vật – con người khi
                                    mất tự do thường sẽ vẫy vùng. Cái nghèo đói đã làm mẹ Duras và cả cô ấy mệt mỏi,
                                    không chỉ có thế, trong cô còn là sự hỗn tạp của những cảm xúc như thù ghét hay xót
                                    thương người mẹ làm nghề giáo.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Những người mẹ, bằng một cách nào đó, họ luôn dành sự ưu tiên cho con trai cả. Đây
                                    là lối mòn suy nghĩ từ Đông sang Tây của các bà mẹ, điều này làm Duras và anh kế của
                                    cô đau khổ, vì người anh cả chỉ mang lại nợ nần và giả tạo. Theo lời nhà văn, giữa
                                    cái nóng hừng hực ở xứ miền Tây sông nước xa lạ chốn Đông Dương, sự đói khổ nhưng
                                    luôn tỏ ra thanh cao một cách đáng thương của người mẹ, cùng với sự áp đặt nặng nề
                                    khi bà gạt phăng giấc mơ viết lách của con bé, đã làm những trang đầu quyển sách
                                    ngập trong sự mỏi mệt, bức bối và giằng xé của người con gái.
                                </span>
                                <br>
                                <br>
                                <h3>Người tình xuất hiện</h3>
                                <br>
                                <span>
                                    Trên một con phà đang sang sông vào một ngày nắng nóng, người tình của nữ nhà văn
                                    xuất hiện cùng với một chiếc limousine đen sang trọng và người tài xế mặc đồ trắng.
                                    Khác với ngôi thứ nhất khi tác giả xưng hô để kể về mẹ và chính mình, những câu
                                    chuyện về người đàn ông Trung Hoa này luôn được kể lại bằng ngôi thứ ba. Duras gọi
                                    bản thân là “cô” và người đàn ông kia là “anh”.
                                </span>
                                <br>
                                <span>
                                    Những trang truyện về cuộc tình này luôn có gì đó ngăn trở, dù tác giả chẳng nói về
                                    bản thân mình là bao. Duras nói cô yêu tiền của “anh”, nhưng trong lòng người thiếu
                                    nữ mới lớn lại có nhiều điều giằng xé, một thứ cảm xúc mới lạ chớm nở trong tâm hồn
                                    khô cằn của cô. Cảm xúc ấy mạnh mẽ đến mức như ra bật ra khỏi trang sách. Nữ nhà văn
                                    nói về lần mời thuốc làm quen của “anh”, về cuộc làm tình đầu tiên và những cuộc làm
                                    tình đều đặn sau này. Và trong từng hành động của người đàn ông đó, có một chi tiết
                                    mà Duras miêu tả rất kỹ lưỡng, đó là sự run rẩy của “anh” trong những lần nói về
                                    tình yêu.
                                </span>
                                <br>
                                <span>
                                    Khác với sự nâng niu và né tránh của người đàn ông ba mươi mốt tuổi, Duras đã thẳng
                                    thừng từ chối ngay từ đầu: “Anh hãy làm tình với em như cách anh làm với bao người
                                    đàn bà khác”. Vì những tự sự về người tình này được viết theo ngôi thứ ba, người đọc
                                    mơ hồ cảm thấy nữ nhà văn đến với “anh” chỉ vì tiền, nhưng những trang giấy tiếp về
                                    sau đã cho thấy chuyến phà định mệnh ấy thật sự là khởi đầu cho thứ tình cảm của hai
                                    con người dễ bị tổn thương. Cô gái mới mười lăm, mang trong mình bao suy tư muộn
                                    phiền, nghĩ rằng cuộc đời thật tẻ nhạt, nhưng khi đối mặt với thứ cảm xúc dễ chịu
                                    thì không dễ tiếp nhận. Có lẽ vì vậy đến khi đánh mất cảm xúc đó, cô mới hiểu và
                                    tiếc nuối.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/BgDcw0L/nguoi-tinh-2.png" alt="nguoi-tinh-2"
                                            border="0">
                                    </div>
                                </div>
                                <h3>Những tự sự cuối cùng của nữ nhà văn</h3>
                                <br>
                                <span>
                                    Đến mãi khi xấp trang còn lại của quyển sách đã mỏng, nhà văn mới nói nhiều hơn về
                                    chính bản thân mình, một cách trực tiếp. Duras thể hiện tình yêu của mình với người
                                    anh thứ – người anh trai luôn yêu thương cô thay vì chửi bới như người anh cả; Duras
                                    kể về nỗi ám ảnh thuở bé, kể về mẹ già bằng một chất giọng trìu mến yêu thương thay
                                    vì những vật vã giữa hai mẹ con trong kí ức ở Sa Đéc, và kể về người tình khi cả hai
                                    quyết định chia xa. Cuộc chia tay nằm trong khoảng tầm hai đến ba trang giấy cuối
                                    cùng, khi anh quay mặt đi để né tránh trong lần chào tạm biệt, và cũng tại chiếc
                                    limousine ấy mà anh chăm chú nhìn cô trên chuyến tàu trở về Pháp, và lần đầu tiên,
                                    nữ nhà văn nói về nỗi đau của mình, cô khóc. Cuối cùng, quyển sách kết thúc bằng sự
                                    liên lạc qua điện thoại của cả hai khi “hoàn cảnh” đã chẳng thể đổi thay con người
                                    thêm một lần nào nữa.
                                </span>', N'nguoi-tinh-logo.png', CAST(N'2021-12-11' AS Date), N'nguoi-tinh-banner.png', 1, CAST(N'2021-12-11T16:07:26.743' AS DateTime), 3, NULL, 0, NULL, 0, N'nguoi-tinh', N'“Hoàn cảnh”, hai chữ định hình cuộc sống con người, vì hoàn cảnh mà đôi khi chẳng có lựa chọn nào khác. Với “Người tình”, Marguerite Duras đưa người đọc cảm nhận rõ thế nào là sức ảnh hưởng của “hoàn cảnh” đối với')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (7, N'Đám cưới không có giấy giá thú: Bi kịch của tri thức', N'<h3>Đám cưới không có giấy giá thú: Bi kịch của tri thức</h3>
                                <br>
                                <span>
                                    <i>
                                        Câu chuyện về một nhà giáo muốn được xã hội công nhận “nên duyên” với khát khao
                                        đời mình, nhưng bị cự tuyệt thẳng thừng bởi những kẻ tự xưng là đại diện “họ nhà
                                        gái”. Qua những lát cắt về cuộc đời Tự và cả những người xung quanh, Ma Văn
                                        Kháng đã làm ta ấn tượng với những lời lẽ chua chát rằng đời là một vại dưa muối
                                        hỏng, nếu cuộc sống là một người mẹ thì nó chỉ là một người mẹ ghẻ mà thôi.
                                    </i>
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/M79sVWm/dam-cuoi-khong-co-gia-thu-1.png"
                                            alt="dam-cuoi-khong-co-gia-thu-1" border="0">
                                    </div>
                                </div>
                                <h3>“Đời là một vại dưa muối hỏng”</h3>
                                <br>
                                <span>
                                    Một hôm khi bước vào lớp học, Tự nhìn thấy trên bảng viết dòng chữ “Đời là một vại
                                    dưa muối hỏng”, không giống một trò đùa, dòng chữ lớn được viết ngay ngắn một cách
                                    đầy ý thức và anh đã thảo luận với học trò về chủ đề này.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Câu nói dường như bông đùa lại rất có tính khái quát về xã hội hiện thời. Nhà văn
                                    không để Tự, Kha, hoặc một nhân vật nào khác đề cập đến luận điểm này, mà để chính
                                    những học sinh nói lên điều này, có dụng ý gì chăng? Phải chăng, xã hội này đã băng
                                    hoại đến mức cả những học sinh còn ngồi trên ghế nhà trường cũng nhận thức được chứ
                                    không cần đến những người sâu sắc như Tự? Nên buồn vì thực tại xã hội khắc nghiệt
                                    hay vui vì những học sinh đều ý thức được xã hội này đã “hỏng”?
                                </span>
                                <br>
                                <br>
                                <span>
                                    Sau những gì Tự chứng kiến và trải qua, xã hội này đã thực sự trở thành một vại dưa
                                    hỏng khi “kẻ xấu thịnh đạt, người tốt ôm hận và chỉ biết trách mình.”
                                </span>
                                <br>
                                <br>
                                <span>
                                    Khi Tự vẫn còn dạy học ở một trường tại vùng cao, chỉ vì “đắc tội” bí thư thị ủy mà
                                    Tự bị đưa ra chiến trường, những tội danh được ra ra như “kiêu căng, tự phụ, luyến
                                    ái bất chính, quan điểm lập trường giai cấp rất kém cỏi, lại có nhiều điều tiếng về
                                    các vụ việc nghi vấn. Kỷ luật thì chưa được.”. Tội danh được ra mà không cần bằng
                                    chứng, kết tội mà không cần phiên tòa; đó chính là “thiện ý” của ngài bí thư thị ủy.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Tại trường học, nơi dùng để trồng người, những nhà giáo lại là những người có vấn đề
                                    nhất về mặt đạo đức. Cẩm, hiệu trưởng nhà trường, xuất thân thì khỏi chê, ba đời là
                                    mõ, chỉ mới học hết lớp 7, sau đó trở thành thầy giáo thể dục, rồi hiệu trưởng
                                    trường cấp hai, giáo viên cấp ba, rồi cuối cùng thành hiệu trưởng trường trung học
                                    số 5 này. Một đường thăng tiến, Cẩm vẫn không bỏ được cái “tư cách mõ” của mình;
                                    “tham lam vô độ, bần tiện và liều lĩnh”. Nhưng khi Cẩm được bổ nhiệm làm hiệu trưởng
                                    ai mà quan tâm điều đó chứ, người ta chỉ nghĩ “đã là Đảng viên thì làm lãnh đạo
                                    được. Lãnh đạo khó nhất mà còn làm được thì có việc gì mà chịu bó tay”. Một niềm tin
                                    ngây thơ tạo nên một cuộc “cưỡng hôn thô lỗ” và điều này có thể giết chết tương lai
                                    của cả một thế hệ học sinh dưới mái trường trung học số 5. Dương, bí thư chi bộ nhà
                                    trường, một con người cổ hủ, chỉ luôn miệng những nguyên tắc cứng nhắc và những giáo
                                    điều đôi khi đến chính ông ta cũng không hiểu. Thuật, giáo viên toán học, một thiên
                                    tài toán học nhưng bị cuốn vào guồng quay của tiền tài. Thảnh, giáo viên hóa học,
                                    người luôn chỉ biết bảo vệ lợi ích bản thân và cố chiếm nhiều món hời nhất có thể.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Tại khu nhà Tự sống, Xuyến, vợ của anh là một người chỉ biết quan tâm đến tiền tài,
                                    khinh khi chồng vì không kiếm được tiền. Trình, một cô bé tật nguyền giờ trở thành
                                    một người đầy ác ý. Quỳnh, người mới dọn đến thì dụ dỗ Xuyến ngoại tình với gã.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Ma Văn Kháng đã khắc hoạ một xã hội băng hoại đạo đức, một thời đại “thịnh thế của
                                    cái ác”, trong mỗi sự kiện, mỗi lát cắt của cuộc sống đều hiện hữu cái xấu, cái ác.
                                    Dù sự miêu tả của ông có đôi phần thái quá, nhưng nó làm ta nhận ra cái xấu vẫn luôn
                                    tồn tại và không thể nào xóa bỏ. Không có gì là tuyệt đối, và sẽ không có một xã hội
                                    toàn những điều tốt đẹp. Và vì cuộc đời là một cái vại, chúng ta luôn ở cùng nhau,
                                    nên chỉ cần còn tồn tại một nhân tố xấu thì cái xấu ấy sẽ lây lan mạnh mẽ. Cũng như
                                    Xuyến và Trình, hai nhân vật này đã bị thay đổi từ hai người hiền lành, chất phác
                                    trở thành người hám lợi, quái ác. Và thế là cuộc đời trở thành “một vại dưa muối
                                    hỏng”. Nhận thức được thực tại bi kịch nhưng không cách nào thay đổi, câu bông đùa
                                    “đời là một vại dưa muối hỏng” là một cách nói có vẻ tinh nghịch nhưng cũng đầy chua
                                    chát về về cuộc đời.
                                </span>
                                <h3>“Một cuốn sách hay đặt lầm chỗ”</h3>
                                <br>
                                <span>
                                    Thuật đã nhận xét cuộc đời Tự như thế này: “Ông là một cuốn sách hay để lầm chỗ. Một
                                    đám cưới không thành. Một bữa tiệc dang dở.” Tính cách của Tự không hợp với trường
                                    trung học số 5 và với cả vợ mình. Tự là một số phận bi kịch khi là một trí thức
                                    nhưng suốt ngày bị vây quanh bởi cơm áo gạo tiền, bị vợ chì chiết vì đồng lương còm
                                    cõi.
                                </span>
                                <br>
                                <span>
                                    Trong quyển sách này, bị đặt sai chỗ không chỉ có Tự, mà là tất cả những người trí
                                    thức vào thời điểm ấy. Người trí thức trong câu chuyện được miêu tả là không được
                                    thừa nhận, chỉ là kẻ đứng bên lề của mọi sự. Đó là ông giáo Biểu, cha của Tự: “ông
                                    giáo Biểu tuy đứng cùng một đội ngũ với ông bí thư huyện ủy, anh cán bộ thuế nông
                                    nghiệp, chị huyện hội phụ nữ, chú giám mã huyện đội… nhưng trong đối xử, vẫn bị gạt
                                    ngầm sang một phía khác, nếu không bị coi là kẻ có vấn đề nghi vấn về chính trị, thì
                                    giỏi lắm cũng chỉ là một “nhân sĩ tiến bộ” – một tầng lớp bị cười mũi và miệt thị
                                    ngầm.”
                                </span>', N'dam-cuoi-khong-co-gia-thu-logo.png', CAST(N'2021-12-11' AS Date), N'dam-cuoi-khong-co-gia-thu-banner.png', 1, CAST(N'2021-12-11T16:15:59.487' AS DateTime), 3, NULL, 0, NULL, 0, N'dam-cuoi-khong-co-gia-thu', N'Câu chuyện về một nhà giáo muốn được xã hội công nhận “nên duyên” với khát khao đời mình, nhưng bị cự tuyệt thẳng thừng bởi những kẻ tự xưng là đại diện “họ nhà gái”. Qua những lát cắt về cuộc đời Tự và cả những người xung quanh')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (8, N'Lũy hoa – Chiến lũy trên bạt ngàn hoa.', N'<h3>Lũy hoa – Chiến lũy trên bạt ngàn hoa.</h3>
                                <br>
                                <span>
                                    Tuy không thể thực hiện trọn vẹn áng văn chương mang tầm vóc lớn lao về Chín năm
                                    kháng chiến trường kỳ đầy oanh liệt, nhưng nhà văn Nguyễn Huy Tưởng đã kịp viết kịch
                                    bản phim “Lũy hoa” bù đắp phần nào tiếc nuối mà cuốn tiểu thuyết “Sống mãi với thủ
                                    đô” đã để lại.
                                </span>
                                <br>
                                <br>
                                <span>
                                    “Trung đoàn in dấu Lũy Hoa,
                                </span>
                                <br>
                                <span>
                                    Hồ Gươm ngấn nước chưa nhòa bóng anh.”
                                </span>
                                <br>
                                <span>
                                    (Hằng Phương)
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/BCqc8Fv/luy-hoa-1.png" alt="luy-hoa-1" border="0">
                                    </div>
                                </div>
                                <span>
                                    Năm 1960, Nguyễn Huy Tưởng công bố truyện phim “Lũy hoa”, dẫu hoàn thành sau nhưng
                                    được ra mắt độc giả trước tiểu thuyết “Sống mãi với thủ đô”. Nếu cuốn tiểu thuyết
                                    tái hiện Hà Nội những ngày đầu Toàn quốc kháng chiến, thì tập truyện phim phác thảo
                                    toàn cảnh 60 ngày đêm Hà Nội quyết tử cho Tổ quốc quyết sinh.
                                </span>
                                <h3>60 ngày đêm khói lửa, hẹn ngày về lấy lại Thủ đô!</h3>
                                <span>
                                    Chỉ với ba phần nhưng dày đặc các tình tiết điện ảnh, “Lũy hoa” làm sống dậy trận Hà
                                    Nội đông xuân 1946–1947, sự kiện khởi động Chiến tranh Đông Dương giữa lực lượng
                                    Việt Minh và tập đoàn quân viễn chinh Pháp từ đêm 19/12/1946 đến trưa 18/02/1947.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Vì là kịch bản phim, tác phẩm hướng đến một mục tiêu khác với tiểu thuyết, ở đây là
                                    tính khả thi của các mảng khối hành động, tập trung vào hai tuyến chính: tản cư và
                                    cố thủ. Giữa hai mảng khối lớn của hành động mang trong mình mọi nghĩ suy, tâm
                                    trạng, hoạt động của con người, là sự chuyển cảnh đầy linh hoạt trên hàng loạt các
                                    địa danh Hà Nội, với đủ các tầng lớp người và nghề nghiệp. Hà Nội vừa lãng mạn vừa
                                    hào hùng, hiện ra trọn vẹn từ một trái tim ôm mối tình si với mảnh đất ngàn năm văn
                                    vật.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Cuộc tản cư, rút ra khỏi Hà Nội của bộ phận người già, phụ nữ và trẻ con, trong sự
                                    hộ tống của các anh bộ đội và Nhân – cô gái làng hoa Ngọc Hà. Đồng bào tản cư vượt
                                    qua gầm cầu Long Biên, trong đêm tối mênh mông, dày đặc, hãi hùng. Tất cả đều cố
                                    gắng lặng im, nhưng tiếng ho của người bệnh người già và tiếng khóc của trẻ sơ sinh
                                    chẳng thể nào kìm nổi đã đánh động địch. Tiếng súng nổ vang. Bóng người ngã vật
                                    xuống, mắt dại đờ, thê lương…
                                </span>
                                <br>
                                <br>
                                <span>
                                    Cuộc cố thủ, bám trụ với Hà Nội của bộ phận các đơn vị tự vệ chiến đấu, công an xung
                                    phong và vệ quốc đoàn phối hợp với nhân dân Hà Nội tổ chức đánh trả và kìm chân quân
                                    Pháp. Nổi bật những gương mặt của Kiên, Dân, Thắng, Thu Phong, Loan, Quyên… Đa phần
                                    là thanh niên trai tráng, nhưng cũng có thiếu nữ, trẻ con đòi ở lại, không đánh được
                                    thì hô xung phong để trợ uy. Họ là đội cảm tử quân thủ đô. Họ tìm và tạo vũ khí. Họ
                                    cầm súng và lựu đạn chờ giặc. Họ nổ súng giữ từng ngôi nhà, góc phố. Trước mặt là
                                    đối phó với giặc, phía trong và sau là lo lắng tổ chức cho đồng bào tản cư. Trong
                                    tiếng súng đạn hòa lẫn tiếng đàn ca, trong cái Tết đặc biệt của đời người, tất thảy
                                    đồng lòng, đoàn kết cùng nhau chiến đấu giữa thủ đô suốt 60 ngày đêm, đập tan kế
                                    hoạch đánh nhanh, thắng nhanh, “một đêm hoàn toàn làm chủ Hà Nội” của quân địch.
                                </span>
                                <br>
                                <br>
                                <span>
                                    60 ngày đêm khói lửa của quân dân Hà Nội mở đầu oanh liệt thời kỳ Toàn quốc kháng
                                    chiến đã kết thúc thắng lợi, Trung đoàn Thủ đô an toàn rút khỏi Hà Nội, để cùng toàn
                                    dân tiến hành cuộc kháng chiến trường kỳ, theo lời kêu gọi của Hồ Chủ Tịch. Trận Hà
                                    Nội đông xuân 1946–1947 đã góp phần quan trọng trong việc bảo vệ cơ quan đầu não của
                                    Việt Minh rút lên chiến khu an toàn, hoàn thành nhiệm vụ đánh trả, cầm cự, kìm chân
                                    quân địch, buộc thực dân Pháp rơi vào thế bị động cả về chiến lược và chiến thuật,
                                    chịu nhiều tổn thất và không đạt được mục tiêu đề ra.
                                </span>
                                <br>
                                <br>
                                <span>
                                    60 ngày đêm lịch sử đầy bi hùng, như một khúc tráng ca được Nguyễn Huy Tưởng phục
                                    dựng rất đỗi hoa lệ, trong sự giao thoa giữa cái dữ dội, kịch liệt của chiến tranh,
                                    với cái lãng mạn, hào hoa rất riêng của người Hà Nội.
                                </span>', N'luy-hoa-logo.png', CAST(N'2021-12-11' AS Date), N'luy-hoa-banner.png', 1, CAST(N'2021-12-11T16:40:44.623' AS DateTime), 3, NULL, 0, NULL, 0, N'luy-hoa', N'Tuy không thể thực hiện trọn vẹn áng văn chương mang tầm vóc lớn lao về Chín năm kháng chiến trường kỳ đầy oanh liệt, nhưng nhà văn Nguyễn Huy Tưởng đã kịp viết kịch bản phim “Lũy hoa” bù đắp phần nào tiếc nuối mà cuốn tiểu')
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [Logo], [UploadDay], [Banner], [Active], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch], [Description]) VALUES (9, N'Mùa thu của cây dương: Khi ta mở lòng với thế giới, có biết bao điều từ thế giới ấy chảy vào ta', N'<h3>Mùa thu của cây dương: Khi ta mở lòng với thế giới, có biết bao điều từ thế giới ấy
                                    chảy vào ta</h3>
                                <br>
                                <span>
                                    <b>Sau thành công được đón nhận của “Khu vườn mùa hạ”, Kazumi Yumoto tiếp tục mang
                                        đến cho người đọc những câu chuyện về trẻ nhỏ và quá trình trưởng thành của
                                        chúng. Bằng giọng văn tinh tế và thông điệp nhân sinh sâu sắc, tác phẩm của cô
                                        tiếp tục là bài ca dịu dàng, nhắc nhở mỗi người về ý nghĩa đích thực của tình
                                        thương, của thời gian và của sự trưởng thành.</b>
                                </span>
                                <h3>
                                    Trang viên Cây Dương
                                </h3>
                                <br>
                                <span>
                                    Chiaki mới lên sáu tuổi khi bố cô bé qua đời. Chỉ còn hai mẹ con nương tựa lẫn nhau,
                                    cùng nhau lặng lẽ nếm trải nỗi cô độc của người bị bỏ lại. Cuộc sống của hai mẹ con
                                    kéo dài tưởng chừng như vô tận, cho đến ngày họ chuyển đến Trang viên Cây Dương. Ở
                                    đây, họ bắt đầu cuộc sống mới với bà cụ chủ nhà móm mém nấu ăn dở tệ, ưa sạch sẽ,
                                    khó tính khó nết. Ba năm ở đó là ba năm Chiaki dần hồi phục và tìm được những niềm
                                    vui tuổi thơ. Cho đến mãi hơn hai mươi năm sau, trong hành trình trở về dự đám tang
                                    bà cụ, Chiaki có cơ hội được sống lại những ký ức ngọt ngào khi ấy, khám phá ra được
                                    nhiều sự thật đau đớn còn ẩn giấu và lặng lẽ tìm lại được chính bản thân mình.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/X4JWxY5/mua-thu-cua-cay-duong-1.png"
                                            alt="mua-thu-cua-cay-duong-1" border="0">
                                        <span style="color: #777777;"><i>Ảnh: @kesachnho</i></span>
                                    </div>
                                </div>
                                <h3>
                                    Hành trình chữa lành bằng tình thương giản dị và ấm áp
                                </h3>
                                <br>
                                <span>
                                    Với một cô bé sáu tuổi, việc bố đột ngột qua đời, mẹ ngày càng xa cách vì nỗi buồn
                                    xâm lấn, lại phải chuyển đến sống ở một nơi xa lạ là một việc hết sức khó khăn. Có
                                    những nỗi bất an lo lắng xâm chiếm đầu óc cô gái bé nhỏ. Nỗi sợ quên khoá cửa, quên
                                    không mang sách vở lúc nào cũng choán hết tâm trí Chiaki. Một cô bé mới 6 tuổi đã
                                    biết nghĩ phải “luôn cẩn trọng và không phạm lỗi”, để “không bị lôi tuột vào những
                                    hố đen mà chẳng biết ở đâu và khi nào sẽ xuất hiện”.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Lần này tác giả đã đề cập thẳng thắn đến những rối loạn lo âu ở trẻ nhỏ, những tình
                                    huống tâm lý chúng có thể phải đối mặt khi có người thân qua đời. Lại một lần nữa,
                                    ta thấy sự xuất hiện và đồng hành của những người lớn tuổi. Sự chậm rãi, thinh lặng
                                    của người già có thể là một khoảng trống yên ả cho lũ trẻ non nớt tựa vào, vừa tò mò
                                    khám phá, vừa tin tưởng dựa dẫm. Những câu chuyện kể ngắt quãng, những quan tâm
                                    thường nhật của bà cụ tuy không vồn vã ân cần cho lắm nhưng lại là những quan tâm vô
                                    cùng tinh tế. Chính bằng cách viết thư cho người trên thiên đường của bà, Chiaki đã
                                    có nơi để chia sẻ, để trút bỏ những suy nghĩ rối ren trong đầu, tự tin trò chuyện
                                    cùng người cha đã khuất, yên tâm an ủi đồng cảm với sự lặng yên của mẹ.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Bà cụ, cả cô hàng xóm Sasaki, anh bạn nhỏ Osamu và những sự việc diễn ra ở Trang
                                    viên Cây Dương năm ấy chẳng khác nào một đốm lửa nhỏ, nhen nhóm lên những tình cảm
                                    ấm áp, chân thật. Ngọn lửa ấy là khởi nguồn của một hành trình trưởng thành tuy đơn
                                    độc và có nước mắt, nhưng lại đủ ấm áp để cảm thấy được vỗ về, như buổi chiều mùa
                                    thu chớm lạnh, mấy bà cháu cùng ngồi nướng khoai ngoài sân.
                                </span>
                                <h3>Sự kết nối là mạch máu chảy ngầm trong cuộc sống</h3>
                                <br>
                                <span>
                                    Bằng cách chỉ cho Chiaki viết thư, bà cụ chủ nhà không những xoa dịu và khoả lấp nỗi
                                    buồn cho cô bé Chiaki 6 tuổi năm ấy, mà còn giúp cô gái Chiaki 26 tuổi bây giờ tìm
                                    lại được chính bản thân mình. Trong những khủng hoảng tuổi trưởng thành, Chiaki đã
                                    từng nghĩ đến cái chết như một sự cứu cánh cuối cùng. Có lẽ với cô, những ám ảnh về
                                    cái chết của bố và nỗi oán giận mẹ cũng đã trở thành một bóng ma nặng nề, dần dần
                                    cuốn lấy tâm tưởng của mình.
                                </span>
                                <br>
                                <br>
                                <span>
                                    Nhưng chính trong hành trình tìm về với bà cụ lần cuối, cô đã được đọc lá thư của
                                    mẹ. Lá thư gửi cho người chồng đã lựa chọn cái chết tự nguyện, lựa chọn tự vẫn mà để
                                    lại hai mẹ con cô. Chiaki đã thấu hiểu được sự im lặng đầy giận dữ của mẹ, cảm nhận
                                    được tình yêu thương mãnh liệt mà bấy lâu mẹ cô đã dằn lòng đè nén. Tất cả đều vì
                                    muốn chở che Chiaki khỏi sự thật quá đỗi khốc liệt này. Bằng lá thư để lại, Trang
                                    viên Cây Dương và bà cụ đã lại “cứu sống” cô thêm một lần nữa.
                                </span>
                                <br>
                                <br>
                                <div class="image">
                                    <div class="thumbnail" style="border: none; text-align: center;">
                                        <img src="https://i.ibb.co/WsZLRXd/mua-thu-cua-cay-duong-2.png" alt="mua-thu-cua-cay-duong-2" border="0">
                                        <span style="color: #777777;"><i>Ảnh: @hey.quinn06</i></span>
                                    </div>
                                </div>
                                <span>
                                    Khoảnh khắc ấy, Chiaki biết mình phải sống. Cô biết rằng những kết nối giữa con
                                    người với con người mới là những mạch máu chảy ngầm trong bản thể, là nguồn dưỡng
                                    nuôi sự sống đời đời. Không chỉ những kết nối của người sống với người chết, mà cả
                                    những người thân vốn đã dần trở nên xa lạ vì chưa đủ thấu hiểu, chưa đủ cơ hội để
                                    giãi bày, chính sự kết nối ấy, mạch máu ấy sẽ trường tồn cùng với thời gian. Như cây
                                    dương trong vườn bà cụ, dù thời gian có qua, Chiaki lớn lên, bà cụ qua đời, thì cây
                                    dương hẳn vẫn còn đứng mãi đó, vươn người hãnh diện tự hào cho những điều tử tế tốt
                                    đẹp sẽ còn mãi trong cuộc sống này.
                                </span>', N'mua-thu-cua-cay-duong-logo.png', CAST(N'2021-12-11' AS Date), N'mua-thu-cua-cay-duong-banner.png', 1, CAST(N'2021-12-11T16:50:07.607' AS DateTime), 3, NULL, 0, NULL, 0, N'mua-thu-cua-cay-duong', N'Sau thành công được đón nhận của “Khu vườn mùa hạ”, Kazumi Yumoto tiếp tục mang đến cho người đọc những câu chuyện về trẻ nhỏ và quá trình trưởng thành của chúng. Bằng giọng văn tinh tế')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (2, N'Tâm Lý - Kỹ Năng Sống', N'9-20x20.png', N'TamLyKiNangSong.jpg', N'Sách tâm lý - kỹ năng sống là loại sách tập trung vào việc phát triển và nâng cao những khía cạnh tâm lý và kỹ năng cần thiết để sống một cuộc sống khỏe mạnh, hạnh phúc và thành công. Chúng cung cấp các phương pháp, nguyên tắc và lời khuyên để giúp bạn hiểu rõ hơn về bản thân, tạo ra một tư duy tích cực, xây dựng mối quan hệ tốt, quản lý stress, đạt được mục tiêu và phát triển sự tự tin và sự lãnh đạo.', CAST(N'2021-09-20T19:09:20.993' AS DateTime), 3, NULL, 0, CAST(N'2021-11-12T14:59:21.427' AS DateTime), 1, N'tam-ly-ki-nang-song')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (3, N'Kinh Tế', N'5-20x20.png', N'KinhTe.jpg', N'
Sách kinh tế là các tài liệu về lĩnh vực kinh tế, nghiên cứu về cách các cá nhân, tổ chức và quốc gia sử dụng các tài nguyên có hạn để sản xuất, phân phối và tiêu dùng các hàng hóa và dịch vụ. Sách kinh tế cung cấp các kiến thức và lý thuyết về hệ thống kinh tế, quy luật kinh tế, và các phương pháp và công cụ để phân tích và hiểu về hiện tượng kinh tế.', CAST(N'2021-09-21T20:17:20.360' AS DateTime), 3, NULL, 0, CAST(N'2021-12-20T22:28:24.620' AS DateTime), 3, N'kinh-te')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (4, N'Nuôi Dạy Con', N'2-20x20.png', N'NuoiDayCon.jpg', N'Sách nuôi dạy con là các tài liệu về việc nuôi dạy và giáo dục trẻ em. Chúng cung cấp hướng dẫn, nguyên tắc, phương pháp và lời khuyên để cha mẹ và người chăm sóc trẻ em có thể hiểu rõ hơn về quá trình phát triển của trẻ, tạo ra môi trường thuận lợi và đáng yêu để trẻ phát triển toàn diện, xây dựng quan hệ tốt với trẻ và giải quyết các vấn đề trong việc nuôi dạy con.', CAST(N'2021-09-21T20:18:06.043' AS DateTime), 3, NULL, 0, CAST(N'2021-10-12T19:56:49.137' AS DateTime), 3, N'nuoi-day-con')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (5, N'Văn Học Nghệ Thuật', N'6-20x20.png', N'VanHoc.jpg', N'Sách văn học nghệ thuật là những tác phẩm văn học tập trung vào mỹ thuật và sự sáng tạo trong việc sử dụng ngôn ngữ để tạo nên câu chuyện, diễn đạt cảm xúc và khám phá những ý nghĩa sâu sắc về con người và cuộc sống. Các tác phẩm văn học nghệ thuật thường mang tính chất nghệ thuật và tinh tế, thể hiện qua cách viết, cấu trúc câu chuyện, tạo hình nhân vật, sử dụng ngôn từ và tạo cảm xúc.', CAST(N'2021-09-21T20:19:40.737' AS DateTime), 3, NULL, 0, CAST(N'2021-10-12T19:57:36.573' AS DateTime), 3, N'van-hoc-nghe-thuat')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (6, N'Giáo Khoa - Tham Khảo', N'11-20x20.png', N'GiaoKhoa.jpg', N'Sách giáo khoa - tham khảo là các tài liệu được sử dụng trong lĩnh vực giáo dục để cung cấp kiến thức, thông tin và tài liệu tham khảo cho học sinh, sinh viên và giáo viên. Chúng được thiết kế để hỗ trợ quá trình giảng dạy và học tập trong các cấp học, từ mầm non cho đến trường đại học và các khóa học chuyên ngành.', CAST(N'2021-09-21T20:22:23.947' AS DateTime), 3, NULL, 0, CAST(N'2021-10-12T19:57:48.607' AS DateTime), 3, N'giao-khoa-tham-khao')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (7, N'Light Novel', N'4-20x20.png', N'LightNovel.jpg', N'Sách Light Novel (viết tắt LN) là một thể loại văn học phát triển từ Nhật Bản. Đây là các tiểu thuyết dài hơn các truyện ngắn và thường có một phong cách viết nhẹ nhàng, dễ tiếp cận và phù hợp cho việc đọc giải trí. Đặc điểm của Light Novel là sự kết hợp giữa văn hóa văn học truyền thống và yếu tố đồ họa, thường được minh họa bởi các họa sĩ chuyên nghiệp.', CAST(N'2021-09-21T20:24:22.287' AS DateTime), 3, NULL, 0, CAST(N'2021-12-20T22:27:04.633' AS DateTime), 3, N'light-novel')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (8, N'Tâm Linh', N'10-20x20.png', N'TamLinh.jpg', N'Sách Tâm Linh là các tài liệu về các khía cạnh tâm linh, tôn giáo, triết học và các vấn đề liên quan đến sự hiểu biết về tâm hồn, ý nghĩa cuộc sống và các khía cạnh không vật chất của thế giới. Các sách tâm linh thường khám phá vấn đề về ý nghĩa và mục đích của cuộc sống, sự tồn tại của thế giới tâm linh, tình yêu, hạnh phúc, sự phát triển cá nhân và những giá trị đạo đức.', CAST(N'2021-09-22T06:02:54.557' AS DateTime), 3, NULL, 0, CAST(N'2021-09-22T10:01:44.787' AS DateTime), 3, N'tam-linh')
INSERT [dbo].[Categories] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [NameSearch]) VALUES (9, N'Thiếu Nhi', N'10-20x20.png', N'ThieuNhi.jpg', N'Sách thiếu nhi là các tác phẩm văn học được viết dành riêng cho độc giả nhỏ tuổi, thường là trẻ em từ độ tuổi mẫu giáo đến độ tuổi học tiểu học. Các sách thiếu nhi được thiết kế với ngôn ngữ đơn giản, hình ảnh sinh động và nội dung phù hợp với lứa tuổi của trẻ.', CAST(N'2021-09-22T06:03:43.933' AS DateTime), 3, NULL, 0, CAST(N'2021-12-20T22:27:50.997' AS DateTime), 3, N'thieu-nhi')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (1, N'sád', 5, 1, 14, CAST(N'2021-11-25' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (2, N'vAlnecuong', 5, 3, 15, CAST(N'2021-12-04' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (3, N'ádhakshdkajshdkj', 3, 3, 15, CAST(N'2021-12-04' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (4, N'Sách hay', 4, 2, 34, CAST(N'2021-12-21' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (5, N'sản phẩm tốt giá tốt giao hàng nhanh lần sau sẽ ủng hộ shop tiếp', 5, 2, 34, CAST(N'2021-12-21' AS Date), N'0')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (6, N'Sách vẫn còn seal, có bonus như miêu tả, mà do lá thư màu mực đậm quá nên màu xanh của thư in hẳn lên sách tạo thàng 1 đường màu khá đặc biệt :(((', 4, 2, 34, CAST(N'2021-12-21' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (7, N'Chất lượng sản phẩm tuyệt vời. Đóng gói sản phẩm đẹp và chắc chắn. Sách đẹp
', 5, 2, 34, CAST(N'2021-12-21' AS Date), N'0')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (8, N'Rất tốt, không bị đình trệ, mong là nội dung sẽ không làm mình thất vọng.', 4, 1, 34, CAST(N'2021-12-21' AS Date), N'0')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (9, N'Truyện đẹp lắm, đầy đủ ct nma chỗ lá thư bị tróc :((', 4, 1, 34, CAST(N'2021-12-21' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (10, N'Hàng rất rất là đẹp gói hàng chắc chắn giao nhanh sp chất lượng', 4, 1, 34, CAST(N'2021-12-21' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (11, N'Hàng đẹp, gói hàng cũng đc, nhiều quà, giá khá là rẻ :)))))))))', 5, 1, 34, CAST(N'2021-12-21' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (12, N'demo', 4, 3, 37, CAST(N'2021-12-21' AS Date), N'1')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (13, N'sách hay quá', 5, 2, 78, CAST(N'2023-06-14' AS Date), N'0')
INSERT [dbo].[Comments] ([Id], [Content], [Star], [User_Id], [Product_Id], [Date], [Status]) VALUES (14, N'hay thiệt', 5, 2, 78, CAST(N'2023-06-14' AS Date), N'0')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (2, N'Văn Cường', N'cuongps12556@fpt.edu.vn', N'Trang web sịn sò', CAST(N'2021-12-05' AS Date), N'1')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (3, N'Cường', N'cuonglvps12556@fpt.edu.vn', N'Page OK', CAST(N'2021-12-05' AS Date), N'0')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (4, N'Khoa ', N'cuonglvps12556@fpt.edu.vn', N'OKOK', CAST(N'2021-12-05' AS Date), N'0')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (5, N'Cường', N'cuonglvps12556@fpt.edu.vn', N'OKOK', CAST(N'2021-12-05' AS Date), N'1')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (6, N'Khoa Pham', N'khoahoangyahoo@gmail.com', N'dgdgfgdfgdf', CAST(N'2021-12-21' AS Date), N'0')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (7, N'Nguyễn Anh Phú', N'phunahcmute@gmail.com', N'Trang web tạm được', CAST(N'2023-06-14' AS Date), N'0')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Content], [Date], [Status]) VALUES (8, N'Nguyen Anh Phu', N'phunahcmute@gmail.com', N'cũng được', CAST(N'2023-06-23' AS Date), N'1')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([Id], [Name], [Code], [Price], [Quality], [ApplyDay], [Expiration], [MoneyLimit], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (4, N'Giảm giá 20.000đ cho đơn hàng trên 100.000đ', N'TAKH111', 20000, 96, CAST(N'2022-12-09' AS Date), CAST(N'2023-12-23' AS Date), 100000, CAST(N'2021-12-09T19:25:20.550' AS DateTime), 3, NULL, 0, CAST(N'2023-06-06T10:49:18.933' AS DateTime), 3)
INSERT [dbo].[Discount] ([Id], [Name], [Code], [Price], [Quality], [ApplyDay], [Expiration], [MoneyLimit], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (5, N'Giảm giá 40.000đ cho đơn hàng trên 200.000đ', N'OTP1111', 40000, 2, CAST(N'2022-12-15' AS Date), CAST(N'2023-12-17' AS Date), 200000, CAST(N'2021-12-15T21:45:18.503' AS DateTime), 3, NULL, 0, CAST(N'2023-06-24T00:30:55.390' AS DateTime), 3)
INSERT [dbo].[Discount] ([Id], [Name], [Code], [Price], [Quality], [ApplyDay], [Expiration], [MoneyLimit], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (16, N'Giảm giá 30.000đ cho đơn hàng trên 150.000đ', N'GSVV202112', 30000, 5, CAST(N'2022-12-17' AS Date), CAST(N'2023-12-23' AS Date), 150000, CAST(N'2021-12-17T15:22:14.587' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[Discount] ([Id], [Name], [Code], [Price], [Quality], [ApplyDay], [Expiration], [MoneyLimit], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (17, N'demoasdsda', N'OT0111', 20000, 5, CAST(N'2022-12-21' AS Date), CAST(N'2023-12-24' AS Date), 30000, CAST(N'2021-12-21T08:19:17.507' AS DateTime), 3, CAST(N'2023-06-06T10:46:27.283' AS DateTime), 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (1, N'Software 4.2', N'Fresher Development', N'0123456789', CAST(N'2021-03-05' AS Date), 13000000, CAST(N'2021-09-10T10:50:18.707' AS DateTime), 0, NULL, 0, NULL, 0, 3, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (2, N'Software 3.1', N'Web Development', N'0333666111', CAST(N'2021-01-08' AS Date), 9300000, CAST(N'2021-09-10T11:14:51.997' AS DateTime), 3, NULL, 0, NULL, 0, 1, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (24, N'Software 4.5', N'Fresher Java', N'0832977777', CAST(N'2021-09-23' AS Date), 4500000, CAST(N'2021-09-16T11:52:00.997' AS DateTime), 3, CAST(N'2023-05-25T19:05:56.077' AS DateTime), 3, CAST(N'2021-09-17T18:03:33.487' AS DateTime), 3, 39, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (25, N'Software 4.2', N'Fresher Java', N'0832977767', CAST(N'2021-08-31' AS Date), 4000000, CAST(N'2021-09-16T11:53:18.593' AS DateTime), 3, CAST(N'2021-09-17T06:24:51.960' AS DateTime), 3, NULL, 0, 40, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (26, N'Team Android 5.4', N'Manager Project', N'0923456789', CAST(N'2021-09-15' AS Date), 9000000, CAST(N'2021-09-17T19:08:26.167' AS DateTime), 39, CAST(N'2023-05-25T19:06:04.397' AS DateTime), 3, NULL, 0, 41, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (27, N'Developer Website', N'Fresher C#', N'0932222222', CAST(N'2021-09-16' AS Date), 7000000, CAST(N'2021-09-17T19:13:14.837' AS DateTime), 39, NULL, 0, NULL, 0, 42, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (30, N'Software 6.2', N'Fresher 6.7', N'0922115552', CAST(N'2021-10-03' AS Date), 8900000, CAST(N'2021-09-17T19:17:31.787' AS DateTime), 39, CAST(N'2023-05-25T19:05:44.063' AS DateTime), 3, NULL, 0, 45, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (31, N'dasdadsada', N'dsadadasda', N'0577777447', CAST(N'2021-10-03' AS Date), 8300000, CAST(N'2021-09-17T19:18:08.257' AS DateTime), 39, CAST(N'2023-05-25T19:05:50.430' AS DateTime), 3, NULL, 0, 46, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (32, N'dasdasda', N'sdasdad', N'0922233154', CAST(N'2021-09-25' AS Date), 5000000, CAST(N'2021-09-17T19:18:31.427' AS DateTime), 39, CAST(N'2021-09-17T19:22:53.700' AS DateTime), 39, CAST(N'2021-09-17T19:22:43.527' AS DateTime), 39, 47, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (33, N'dasdadas', N'dasdadsds', N'0832944222', CAST(N'2021-10-01' AS Date), 70000000, CAST(N'2021-09-17T19:19:09.147' AS DateTime), 39, NULL, 0, NULL, 0, 48, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (34, N'asdasdad', N'asdsadasda', N'0922277444', CAST(N'2021-09-21' AS Date), 4999999, CAST(N'2021-09-17T19:21:32.937' AS DateTime), 39, NULL, 0, CAST(N'2023-06-22T14:00:38.607' AS DateTime), 3, 49, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (35, N'dasdada', N'efesdfsdsf', N'0967734331', CAST(N'2021-09-18' AS Date), 7800000, CAST(N'2021-09-17T19:21:57.880' AS DateTime), 39, NULL, 0, NULL, 0, 50, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (36, N'dsadadasd', N'dfsfsdfsds', N'0766222211', CAST(N'2021-09-18' AS Date), 8900000, CAST(N'2021-09-17T19:23:43.470' AS DateTime), 39, CAST(N'2023-05-25T19:05:47.887' AS DateTime), 3, NULL, 0, 51, NULL)
INSERT [dbo].[Employees] ([Id], [Department], [Position], [Phone], [StartDay], [Salary], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [User_Id], [Image]) VALUES (37, N'IT12345', N'Thực tập', N'0338176696', CAST(N'2023-07-03' AS Date), 5000000, CAST(N'2023-07-03T08:47:07.233' AS DateTime), 3, CAST(N'2023-07-03T08:51:54.383' AS DateTime), 3, NULL, 0, 1059, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (2, 3, 7, CAST(N'2021-12-07' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (5, 3, 25, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (6, 3, 23, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (7, 2, 23, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (8, 2, 27, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (9, 1, 23, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (10, 1, 22, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (11, 1, 25, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (12, 3, 22, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (14, 2, 34, CAST(N'2021-12-21' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (15, 2, 26, CAST(N'2021-12-21' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (16, 3, 37, CAST(N'2021-12-21' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (18, 3, 41, CAST(N'2023-06-22' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[InformationShop] ON 

INSERT [dbo].[InformationShop] ([Id], [Name], [Active], [TimeOpen], [Logo], [Phone], [Fax], [Email], [LogoFooter], [Address], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (1, N'Ecart Shop', 1, N'7:00 AM đến 11:00 PM', N'logo.jpg', N'0923355522', N'0923456789', N'cskh@hotro.ecart.vn', N'logo.jpg', N'1 Võ Văn Ngân, Phường Linh Chiểu, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', CAST(N'2021-09-29T15:58:27.223' AS DateTime), 3, NULL, 0, CAST(N'2021-09-30T16:48:41.937' AS DateTime), 3)
INSERT [dbo].[InformationShop] ([Id], [Name], [Active], [TimeOpen], [Logo], [Phone], [Fax], [Email], [LogoFooter], [Address], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (2, N'Shop Cart', 0, N'11:00 AM đến 11:00 PM', N'logo.jpg', N'0912233498', N'0901230406', N'demo@gmail.com', N'logo.jpg', N'520/3/1 quốc lộ 13, phường Hiệp Bình Phước, Thủ Đức, Tp.HCM', CAST(N'2021-09-29T15:59:52.360' AS DateTime), 3, NULL, 0, CAST(N'2021-09-30T16:40:53.460' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[InformationShop] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufactures] ON 

INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (1, N'NXB Kim Đồng', N'nxb-kim-dong.png', N'nxb-kim-dong-banner.jpg', N'Nhà xuất bản Kim Đồng trực thuộc Trung ương Đoàn TNCS Hồ Chí Minh là Nhà xuất bản tổng hợp có chức năng xuất bản sách và văn hóa phẩm phục vụ thiếu nhi và các bậc phụ huynh trong cả nước, quảng bá và giới thiệu văn hóa Việt Nam ra thế giới. Nhà xuất bản có nhiệm vụ tổ chức bản thảo, biên soạn, biên dịch, xuất bản và phát hành các xuất bản phẩm có nội dung: giáo dục truyền thống dân tộc, giáo dục về tri thức, kiến thức… trên các lĩnh vực văn học, nghệ thuật, khoa học', CAST(N'2021-09-21T20:08:21.840' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T07:51:32.643' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (2, N'Thái Hà', N'thai-ha.jpg', N'thai-ha-banner.jpg', N'Thái Hà Books mong muốn mang tri thức trong những cuốn sách ở khắp nơi trên thế giới đến với độc giả Việt Nam. Những cuốn sách có giá trị, có tính ứng dụng và thực tiễn cao của Thái Hà Books sẽ làm cho cuộc sống tươi đẹp hơn, phong phú hơn. Trong tương lai, với xu thế hội nhập toàn cầu, Thái Hà Books mong muốn trở thành con chim đầu đàn đi ra biển lớn.', CAST(N'2021-09-21T20:10:50.670' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T08:07:02.560' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (3, N'FIRST NEWS', N'first-new.jpg', N'first-new-banner.png', N'Được thành lập vào ngày 10/12/1994 với tên gọi ban đầu là “Ban Biên Dịch First News”, trải qua 25 năm luôn nỗ lực và sáng tạo, đến nay First News – Trí Việt đã khẳng định được vị thế cũng như uy tín của mình trong lòng bạn đọc, không những bởi sự phong phú của những dòng sách giá trị trên thế giới mà First News đã nhạy bén chuyển ngữ phục vụ người Việt Nam, mà còn vì chất lượng cũng như sự chỉn chu trong từng quyển sách mà First News mong muốn mang đến cho bạn đọc.', CAST(N'2021-09-22T05:32:29.543' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T08:17:43.993' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (4, N'AZ Việt Nam', N'az-viet-nam.jpg', N'az-viet-nam-banner.jpg', N'Khởi nguồn của AZ Việt Nam ngày nay là Công ty TNHH Trung tâm Sách và Thiết bị Thư viện, với hoạt động đầu tiên là cung cấp sách, trang thiết bị, văn hóa phẩm cho các thư viện và trung tâm sách trên cả nước. Từ cuối năm 2010 đến nay, chúng tôi đã không ngừng nỗ lực khai phá và phát triển các dòng sản phẩm mới với 8 thương hiệu uy tín.', CAST(N'2021-09-22T05:35:32.713' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T06:45:43.560' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (5, N'IPM', N'ipm.jpg', N'ipm-sach-banner.jpg', N'Công ty Cổ phần Xuất bản và Truyền thông IPM được thành lập tháng 02 năm 2004 bới một nhóm sáng lập viên trẻ tuổi, nhiệt tình và năng động và có nhiều năm kinh nghiệm hoạt động trong lĩnh vực xuất bản Việt Nam. Ngay sau khi Việt Nam chính thức tham gia công ước Berne (Công ước quốc tế về bảo hộ các tác phẩm văn học nghệ thuật) vào ngày 24/10/2004, IPM là một trong số ít các công ty Việt Nam đi tiên phong trong việc tìm kiếm, khai thác và mua bản quyền sách nước ngoài.', CAST(N'2021-09-22T05:36:28.887' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T06:50:37.163' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (6, N'Amak Books', N'amak-book.png', N'amak-book-banner.png', N'Amak Books, hiện đã trở thành một nhãn sách độc lập thuộc về công ty X.Y.Z. Chúng tôi tự hào là một trong những người tiên phong thương hiệu trong lĩnh vực chính sách bản quyền tại Việt Nam. Qua nhiều năm, với những nỗ lực và sự đóng góp của đội ngũ nhân viên của chúng tôi, sự năng động và nhiệt tình của các cộng tác viên, AMAK BOOKS đã trở thành một thương hiệu sách đáng tin cậy với danh tiếng tốt cho tất cả các đối tác bên trong và ngoài nước.', CAST(N'2021-09-22T05:59:01.767' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T07:42:34.460' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (7, N'NXB Trẻ', N'nxb-tre.jpg', N'nxb-tre-banner.jpg', N'Sau gần năm năm hoạt động với nhiều nỗ lực và hiệu quả, ngày 3-2-1986, NXB Măng Non được UBND TP.HCM ký quyết định đổi tên thành NXB Trẻ với chức năng và nhiệm vụ được mở rộng là đơn vị xuất bản dành cho thanh thiếu nhi thành phố và khu vực Nam bộ.', CAST(N'2021-09-22T05:59:54.977' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T08:12:56.803' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (8, N'Alpha Books', N'alpha-book.png', N'alpha-book-banner.jpg', N'Công ty cổ phần Sách Alpha (Alpha Books Joint-Stock Company – gọi tắt là Alpha Books) do một nhóm trí thức trẻ thành lập ở Hà Nội năm 2005 với niềm tin: Tri thức là Sức mạnh. Thông qua việc giới thiệu các tác phẩm có giá trị của thế giới, Alpha Books mong muốn trở thành nhịp cầu nối nguồn tri thức nhân loại với dân tộc Việt Nam.', CAST(N'2021-09-22T06:01:33.803' AS DateTime), 3, NULL, 0, CAST(N'2021-12-15T07:56:15.557' AS DateTime), 3)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (9, N'SkyBooks', N'sky-book.png', N'sky-book-banner.jpg', N'Thương hiệu sách Skybooks là địa chỉ tin cậy cho các tác giả trẻ Việt Nam gửi gắm tác phẩm của mình. Với khẩu hiệu “Tôi trẻ, tôi đam mê”, chúng tôi luôn nỗ lực để mang đến cho độc giả những tác phẩm chất lượng từ các tác giả trẻ nổi bật cũng như giúp đỡ, tạo điều kiện cho các cây bút trẻ được đông đảo độc giả biết đến. Hãy để Skybooks trở thành người đưa đứa con tinh thần của bạn đến với công chúng!', CAST(N'2021-12-15T07:08:51.860' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[Manufactures] ([Id], [Name], [Logo], [Banner], [Description], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (10, N'Nhã Nam', N'nha-nam.jpg', N'nha-nam-banner.png', N'Tháng 2 năm 2005, Nhã Nam, tên đầy đủ là Công ty Cổ phần Văn hóa và Truyền thông Nhã Nam đã gia nhập thị trường sách. Tác phẩm "Balzac và cô bé thợ may Trung hoa" của Đới Tư Kiệt là cuốn sách đầu tiên được những người sáng lập Nhã Nam xuất bản cả trước khi công ty ra đời. Ngay lập tức từ cuốn sách đầu tiên, độc giả đã dành sự quan tâm và yêu mến cho một thương hiệu sách mới mẻ mang trong mình khát vọng góp phần tạo lập diện mạo mới cho xuất bản văn học tại Việt Nam.', CAST(N'2021-12-15T07:29:29.313' AS DateTime), 3, NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuOne] ON 

INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (1, N'Ngoại ngữ', N'ngoai-ngu', 6, CAST(N'2021-09-23T14:43:01.383' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (2, N'Tâm Lý', N'tam-ly', 2, CAST(N'2021-09-23T16:02:58.560' AS DateTime), 3, NULL, 0, CAST(N'2021-09-23T16:34:20.823' AS DateTime), 3)
INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (3, N'Tài liệu', N'tai-lieu', 6, CAST(N'2021-09-27T13:34:44.253' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (4, N'Kĩ Năng Sống', N'ki-nang-song', 2, CAST(N'2021-09-27T13:36:23.300' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (5, N'Quản Trị - Lãnh Đạo', N'quan-tri-lanh-dao', 3, CAST(N'2021-09-27T13:48:34.030' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (6, N'Marketing - Bán Hàng', N'marketing-ban-hang', 3, CAST(N'2021-09-27T13:49:03.473' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuOne] ([Id], [Name], [NameSearch], [Cate_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (7, N'Phân tích kinh tế', N'phan-tich-kinh-te', 3, CAST(N'2021-11-25T10:24:17.207' AS DateTime), 1, NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[MenuOne] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuTwo] ON 

INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (1, N'Tiếng Anh', N'tieng-anh', 1, CAST(N'2021-09-27T08:57:16.547' AS DateTime), 3, NULL, 0, CAST(N'2021-09-27T09:50:05.843' AS DateTime), 3)
INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (2, N'Tiếng Trung', N'tieng-trung', 1, CAST(N'2021-09-27T13:51:41.380' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (3, N'Tiếng Hàn', N'tieng-han', 1, CAST(N'2021-09-27T13:51:57.833' AS DateTime), 3, NULL, 0, CAST(N'2021-11-25T10:24:57.327' AS DateTime), 1)
INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (4, N'Tiếng Nhật', N'tieng-nhat', 1, CAST(N'2021-09-27T13:52:57.890' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (9, N'Chức năng quản trị', N'chuc-nang-quan-tri', 5, CAST(N'2021-09-27T13:55:09.010' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (10, N'Vai trò quản trị', N'vai-tro-quan-tri', 5, CAST(N'2021-09-27T13:55:41.077' AS DateTime), 3, NULL, 0, NULL, 0)
INSERT [dbo].[MenuTwo] ([Id], [Name], [NameSearch], [Menu1_Id], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate]) VALUES (11, N'Các khía cạnh khác', N'cac-khia-canh-khac', 5, CAST(N'2021-09-27T13:56:11.403' AS DateTime), 3, NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[MenuTwo] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (16, N'565067', 15, 1, NULL, 1, CAST(N'2023-01-01' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (17, N'179557', 15, 1, NULL, 1, CAST(N'2023-01-02' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (18, N'345868', 16, 1, NULL, 1, CAST(N'2023-01-03' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (19, N'345868', 21, 1, NULL, 1, CAST(N'2023-01-04' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (20, N'129524', 8, 1, NULL, 2, CAST(N'2023-01-05' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (21, N'990582', 17, 1, NULL, 2, CAST(N'2023-01-06' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (22, N'673447', 18, 1, NULL, 1, CAST(N'2023-01-07' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (23, N'638499', 23, 1, NULL, 1, CAST(N'2023-01-08' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (24, N'638499', 24, 1, NULL, 1, CAST(N'2023-01-09' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (25, N'638499', 28, 1, NULL, 1, CAST(N'2023-01-10' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (26, N'612596', 25, 1, NULL, 2, CAST(N'2023-05-11' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (27, N'635789', 22, 1, NULL, 3, CAST(N'2023-05-12' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (28, N'635789', 24, 1, NULL, 3, CAST(N'2023-05-13' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (29, N'635789', 27, 1, NULL, 2, CAST(N'2023-05-14' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (30, N'635789', 15, 1, NULL, 3, CAST(N'2023-05-15' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (31, N'461651', 28, 1, NULL, 1, CAST(N'2023-05-16' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (32, N'662729', 27, 1, NULL, 3, CAST(N'2023-02-01' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (33, N'461519', 15, 1, NULL, 1, CAST(N'2023-02-02' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (34, N'591827', 15, 1, NULL, 2, CAST(N'2023-02-03' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (35, N'890353', 24, 62, NULL, 1, CAST(N'2023-02-04' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (36, N'293583', 24, 1, 4, 1, CAST(N'2023-02-05' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (37, N'605977', 28, 1, NULL, 1, CAST(N'2023-02-06' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (38, N'349013', 23, 1, NULL, 1, CAST(N'2023-02-07' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (39, N'239502', 26, 1, NULL, 2, CAST(N'2023-02-08' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (40, N'633333', 23, 1, 5, 2, CAST(N'2023-02-09' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (41, N'406856', 24, 1, 5, 1, CAST(N'2023-06-20' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (42, N'524566', 28, 1, NULL, 1, CAST(N'2023-06-21' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (43, N'536819', 28, 1, NULL, 1, CAST(N'2023-06-22' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (44, N'594462', 28, 1, 5, 1, CAST(N'2023-06-23' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (45, N'896181', 25, 1, NULL, 1, CAST(N'2023-06-24' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (46, N'245535', 21, 1, NULL, 2, CAST(N'2023-06-25' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (47, N'507338', 26, 1, NULL, 1, CAST(N'2023-06-26' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (48, N'571131', 27, 1, NULL, 1, CAST(N'2023-07-01' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (52, N'402408', 22, 1, 4, 2, CAST(N'2023-07-02' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (53, N'916886', 33, 64, NULL, 1, CAST(N'2023-07-03' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (61, N'765106', 39, 1, NULL, 5, CAST(N'2023-03-04' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (62, N'773692', 32, 1, NULL, 1, CAST(N'2023-03-05' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (69, N'836370', 23, 63, NULL, 1, CAST(N'2023-03-06' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (70, N'284165', 29, 63, NULL, 2, CAST(N'2023-03-07' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (71, N'853361', 33, 63, NULL, 1, CAST(N'2023-03-08' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (72, N'736733', 32, 68, NULL, 1, CAST(N'2023-03-09' AS Date), N'0', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (73, N'736733', 30, 68, NULL, 2, CAST(N'2023-03-10' AS Date), N'0', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (74, N'957074', 25, 68, NULL, 4, CAST(N'2023-03-11' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (75, N'302712', 31, 68, NULL, 2, CAST(N'2023-03-12' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (76, N'277366', 37, 69, 4, 2, CAST(N'2023-03-13' AS Date), N'0', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (77, N'971854', 40, 1, 17, 1, CAST(N'2023-03-14' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (91, N'608638', 34, 76, 4, 1, CAST(N'2023-03-15' AS Date), N'0', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (92, N'949419', 25, 76, NULL, 1, CAST(N'2023-03-16' AS Date), N'1', N'0', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (93, N'328957', 32, 77, 4, 1, CAST(N'2023-04-01' AS Date), N'0', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (94, N'113553', 32, 76, 4, 1, CAST(N'2023-04-02' AS Date), N'0', N'2', N'Gửi hàng ở quầy lễ tân giúp e')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (95, N'651512', 33, 77, 4, 1, CAST(N'2023-04-03' AS Date), N'0', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (96, N'671237', 16, 77, NULL, 1, CAST(N'2023-04-04' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (97, N'671237', 17, 77, NULL, 1, CAST(N'2023-04-05' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (98, N'170348', 16, 77, NULL, 1, CAST(N'2023-04-06' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (99, N'813352', 3, 76, NULL, 1, CAST(N'2023-04-07' AS Date), N'0', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (100, N'396787', 30, 76, NULL, 1, CAST(N'2023-04-08' AS Date), N'0', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (101, N'148434', 77, 76, 4, 1, CAST(N'2023-07-03' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (102, N'148434', 78, 76, 4, 1, CAST(N'2023-04-10' AS Date), N'1', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (103, N'406365', 55, 77, 4, 2, CAST(N'2023-04-11' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (104, N'651424', 78, 76, 4, 3, CAST(N'2023-07-03' AS Date), N'1', N'0', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (105, N'318876', 51, 76, NULL, 2, CAST(N'2023-07-03' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (106, N'883696', 30, 76, NULL, 1, CAST(N'2023-07-03' AS Date), N'1', N'2', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (107, N'614005', 7, 76, NULL, 1, CAST(N'2023-04-15' AS Date), N'0', N'0', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (108, N'566091', 31, 76, NULL, 11, CAST(N'2023-06-22' AS Date), N'0', N'2', N'giao giờ hành chính')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (109, N'566091', 63, 76, NULL, 4, CAST(N'2023-06-22' AS Date), N'0', N'2', N'giao giờ hành chính')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (110, N'365563', 78, 1, 5, 6, CAST(N'2023-06-22' AS Date), N'0', N'0', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (111, N'184317', 41, 78, 5, 6, CAST(N'2023-06-22' AS Date), N'0', N'3', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (112, N'108986', 44, 80, NULL, 2, CAST(N'2023-06-25' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (113, N'568493', 56, 76, NULL, 2, CAST(N'2023-07-03' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (114, N'568493', 78, 76, NULL, 1, CAST(N'2023-07-03' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (115, N'108724', 48, 76, 4, 24, CAST(N'2023-07-03' AS Date), N'1', N'1', N'')
INSERT [dbo].[Orders] ([Id], [Code], [Product_Id], [Address_Id], [Discount_Id], [Quality], [Date], [Method], [Status], [Comment]) VALUES (116, N'298936', 78, 77, 4, 2, CAST(N'2023-07-04' AS Date), N'1', N'1', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (1, N'CTPL01', N'Hỏi - Đáp Bộ Luật Hình Sự 2015', 150000, 12, 9, N'Thế hệ trẻ trong một xã hội trải qua nhiều biến đổi trong hơn ba thập kỷ Đổi mới vừa qua sẵn sàng về mặt tâm lý xã hội đến mức nào? Nhằm làm rõ vấn đề này, Nhà xuất bản Khoa học xã hội xuất bản cuốn sách chuyên khảo “Thái độ của thanh niên với người già và mối quan hệ của họ với ông bà”, do PGS.TS Lê Văn Hảo chủ biên cùng tập thể tác giả.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'chinhtri1.PNG', N'chinhtri1.PNG', N'chinhtri1.PNG', N'chinhtri1.PNG', N'chinhtri1.PNG', 1, 1, 2, N'hoi-dap-bo-luat-hinh-su-2015', CAST(N'2021-10-10T17:30:25.843' AS DateTime), 3, CAST(N'2023-05-20T00:48:07.160' AS DateTime), 3, CAST(N'2021-12-07T19:45:01.423' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (3, N'CTPL02', N'Thế giới còn đổi thay, nhưng tư tưởng Hồ Chí Minh sống mãi', 190000, 33, 5, N'Nội dung sách gồm 2 phần:Phần thứ nhất: Câu hỏi trắc nghiệm bán tự luậnPhần thứ hai: Câu hỏi tự luậnCuốn sách không chỉ có ý nghĩa lý luận, ý nghĩa lịch sử mà còn có ý nghĩa chính trị, pháp lý và thực tiễn bổ ích giúp bạn đọc và những người quan tâm nghiên cứu luật như giảng viên, học viên, sinh viên ...', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>AMOLED6.43"Full HD+</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>Android 11</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>13 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>MediaTek Helio G95</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>8GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>128GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>2 Nano SIMHỗ trợ 4G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>5000 mAh33 W</td>
											</tr>
										</tbody>
									</table>', N'chinhtri2.PNG', N'chinhtri2.PNG', N'chinhtri2.PNG', N'chinhtri2.PNG', N'chinhtri2.PNG', 1, 4, 2, N'the gioi', CAST(N'2021-10-11T17:08:37.767' AS DateTime), 3, CAST(N'2023-05-20T22:12:18.100' AS DateTime), 3, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (5, N'KHCN-KT01', N'Thương mại điện tử căn bản, Toán Học, Một Thiên Tiểu Thuyết', 200000, 35, 7, N'Sự phát triển nhanh chóng của công nghệ thông tin và viễn thông đã tạo ra nền tảng cho hàng loạt ứng dụng và hoạt động kinh doanh thương mại thông qua sử dụng các thiết bị điện tử. Thực tế đó đã làm nảy sinh một hình thức thực thi thương mại hoàn toàn mới - thương mại điện tử.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>AMOLED6.43"Full HD+</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>Android 11</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>13 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>MediaTek Helio G95</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>8GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>128GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>2 Nano SIMHỗ trợ 4G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>5000 mAh33 W</td>
											</tr>
										</tbody>
									</table>', N'khcn1.PNG', N'khcn1.PNG', N'khcn1.PNG', N'khcn1.PNG', N'khcn1.PNG', 1, 2, 3, N'thuong mai', CAST(N'2021-10-11T17:14:08.300' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (6, N'KHCN-KT02', N'Toán học một thiên tiểu thuyết', 70000, 23, 12, N'Hầu hết mọi người đều thích toán, tiếc là họ không biết điều này!
Bởi ai mà chẳng thấy hấp dẫn với những mẩu chuyện kỳ thú về toán: như “giáo phái” toán học kỳ lạ của Pythagoras thời cổ đại hay những cuộc thăm dò hệ mặt trời bằng công cụ toán học đầy kịch tính thời cận đại, hoặc gần đây hơn là sự kiện máy tính AlphaGo giành chiến thắng trước kỳ thủ cờ vây số một thế giới Lee Sedol bằng những nước đi “thần thánh” sử dụng lý thuyết xác suất.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>AMOLED6.43"Full HD+</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>Android 11</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>13 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>MediaTek Helio G95</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>8GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>128GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>2 Nano SIMHỗ trợ 4G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>5000 mAh33 W</td>
											</tr>
										</tbody>
									</table>', N'khcn2.PNG', N'khcn2.PNG', N'khcn2.PNG', N'khcn2.PNG', N'khcn2.PNG', 1, 3, 3, N'toan', CAST(N'2021-10-11T17:19:15.027' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (7, N'VHXH-LS01', N'Ngàn năm áo mũ', 72900, 15, 15, N'Ngàn năm áo mũ là một nghiên cứu công phu và đầy tham vọng của Trần Quang Đức: dựng lại bức tranh trang phục Việt Nam trong cung đình và ngoài dân gian trong khoảng một nghìn năm từ thời Lý đến thời Nguyễn (1009-1945).', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>AMOLED6.43"Full HD+</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>Android 11</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>13 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>MediaTek Helio G95</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>8GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>128GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>2 Nano SIMHỗ trợ 4G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>5000 mAh33 W</td>
											</tr>
										</tbody>
									</table>', N'vhxh1.PNG', N'vhxh1.PNG', N'vhxh1.PNG', N'vhxh1.PNG', N'vhxh1.PNG', 1, 4, 4, N'ngan nam', CAST(N'2021-10-11T17:22:51.280' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (8, N'VHXH-LS02', N'Những điều chưa biết về thuốc phiện', 65000, 28, 3, N'Những điều chưa biết về thuốc phiện là tập hợp các số báo chuyên đề [tháng 4-5, 1938] của hai bác sĩ L. Gaide và L. Neuberger, in trên tập san nổi tiếng Bulletin des Amis du Vieux Hué (Những người bạn Cố đô Huế), một tạp chí khoa học xã hội có giá trị bậc nhất Đông Dương suốt ba thập niên (1914 - 1944).', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'vhxh2.PNG', N'vhxh2.PNG', N'vhxh2.PNG', N'vhxh2.PNG', N'vhxh2.PNG', 1, 2, 4, N'samsung-galaxy-s20-fe-256GB', CAST(N'2021-10-12T08:36:41.790' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (9, N'VHNT01', N'Chỉ để bay qua một bình minh', 77000, 23, 1, N'Chỉ để bay qua một bình minh là tập truyện ngắn của tác giả Đào Bá Đoàn hứa hẹn sẽ mang tới cho độc giả nhiều những cung bậc cảm xúc khác nhau đằng sau từng con chữ. Chắc chắn bạn đọc sẽ tìm thấy những lý lẽ rất riêng ngay cả khi khép sách lại. Chỉ để bay qua một bình minh tập truyện ngắn hay, giọng văn sắc sảo, đầy thiết tha mãnh liệt.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>AMOLED6.43"Full HD+</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>Android 11</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>13 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>MediaTek Helio G95</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>8GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>128GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>2 Nano SIMHỗ trợ 4G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>5000 mAh33 W</td>
											</tr>
										</tbody>
									</table>', N'vhnt1.PNG', N'vhnt1.PNG', N'vhnt1.PNG', N'vhnt1.PNG', N'vhnt1.PNG', 1, 6, 5, N'chi-de-bay-qua-mot-binh-minh', CAST(N'2021-10-12T08:43:24.690' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (10, N'VHNT02', N'CẢM ƠN NGƯỜI LỚN', 86000, 22, 3, N'Giới thiệu tóm tắt tác phẩm:Cảm Ơn Người Lớn - một áng văn lãng mạn trong giọng hài hước đặc biệt “dành cho trẻ em, và những ai từng là trẻ em”.Bạn sẽ gặp lại Mùi, Tủn, Tí sún, Hải cò… của Cho tôi xin một vé đi tuổi thơ, cùng chơi những trò chơi quen thuộc, và được đắm mình vào những ước mơ điên rồ, ngốc nghếch nhưng trong veo của tuổi mới lớn hồn nhiên và đầy ắp dự định.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>AMOLED6.43"Full HD+</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>Android 11</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>13 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>MediaTek Helio G95</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>8GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>128GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>2 Nano SIMHỗ trợ 4G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>5000 mAh33 W</td>
											</tr>
										</tbody>
									</table>', N'vhnt2.PNG', N'vhnt2.PNG', N'vhnt2.PNG', N'vhnt2.PNG', N'vhnt2.PNG', 1, 3, 5, N'cam-on-nguoi-lon', CAST(N'2021-10-12T08:55:41.287' AS DateTime), 3, NULL, 0, CAST(N'2021-10-12T15:38:00.430' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (12, N'GT01', N'Giáo trình giao tiếp ứng xử và kỹ năng bán hàng', 86000, 5, 46, N'Giáo trình Giao tiếp ứng xử và kỹ năng bán hàng đã được biên soạn, gồm 04 chương, nhằm trang bị cho học viên những kiến thức cơ bản về thị trường; về Marketing; các khái niệm cơ bản về giao tiếp ứng xử và kỹ năng bán hàng; các luận điểm cơ bản trong giao tiếp; những yêu cầu đối với người bán hàng bưu điện, rèn luyện kỹ năng bán hàng bưu điện.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'gt1.PNG', N'gt1.PNG', N'gt1.PNG', N'gt1.PNG', N'gt1.PNG', 1, 8, 6, N'giao-trinh-giao-tiep-ung-xu-va-ky-nang-ban-hang', CAST(N'2021-10-12T15:29:36.920' AS DateTime), 3, NULL, 0, CAST(N'2021-10-12T15:35:28.207' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (13, N'GT02', N'Giáo trình ngôn ngữ lập trình C/C++', 43000, 15, 6, N'Trải nghiệm kỷ nguyên 5G hoàn toàn mới, nơi là người làm chủ tốc độ và dẫn đầu cuộc chơi, Samsung Galaxy A52s 5G với kết nối 5G siêu tốc, sức mạnh hiệu năng tuyệt đỉnh cùng bộ tứ camera chống rung quang học OIS vượt trội sẽ đưa bạn đến từ bất ngờ này đến bất ngờ khác.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'gt2.PNG', N'gt2.PNG', N'gt2.PNG', N'gt2.PNG', N'gt2.PNG', 1, 2, 6, N'giao-trinh-ngon-ngu-lap-trinh-c/c++', CAST(N'2021-10-12T16:52:49.217' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (14, N'TLCN01', N'Thất Lạc Cõi Người', 99000, 30, 4, N'Thất Lạc Cõi Người là một tác phẩm kinh điển nổi tiếng của văn học Nhật Bản hiện đại và là cuốn tiểu thuyết cuối cùng của Dazai Osamu. Thất Lạc Cõi Người mang nhiều nét tự thuật, là một tiểu thuyết tự truyện. Sau khi hoàn thành tác phẩm này, Dazai cùng với người tình là Tomie trầm mình tự sát ở hồ nước ngọt Tamagawa, chấm dứt cuộc đời 39 năm ngắn ngủi.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'tt1.PNG', N'tt1.PNG', N'tt1.PNG', N'tt1.PNG', N'tt1.PNG', 1, 2, 7, N'that-lac-coi-nguoi', CAST(N'2021-10-12T17:01:21.923' AS DateTime), 3, NULL, 0, CAST(N'2021-12-12T11:00:18.593' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (15, N'TT01', N'Thị Dân Tiểu Thuyết', 100000, 19, 34, N'Thị dân tiểu thuyết là cuốn tiểu thuyết thứ 4 của Nguyễn Việt Hà. Vẫn là không gian phố - ngõ - phố trở đi trở lại trong các tác phẩm của anh, Nguyễn Việt Hà không chỉ đi dọc phố trong không gian đương thời mà còn đi dọc suốt con lộ lịch sử của nó, để tìm ra nguyên ủy hồn phố.
Và để hiện thực hóa một công việc lớn lao viết sử phố.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'tt2.jpg', N'tt2.jpg', N'tt2.jpg', N'tt2.jpg', N'tt2.jpg', 1, 5, 7, N'thi-dan-tieu-thuyet', CAST(N'2021-10-14T10:32:45.793' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (16, N'TLTC01', N'Lá thư cuối cùng của iwai', 55000, 22, 28, N'Iwai Shunji sinh năm 1963 tại Miyagi. Là một đạo diễn, tiểu thuyết gia, nhà soạn nhạc nổi tiếng. Năm 1995, ông ra mắt làng phim trong vai trò đạo diễn phim điện ảnh Thư tình. Các tác phẩm tiêu biểu khác của ông bao gồm phim Swallowtail Butterfly, All About Lily Chou-Chou; tiểu thuyết Người cá Wallace, Chó giữ vườn, Cô dâu của Rip Van Winkle... ', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'tltc1.PNG', N'tltc1.PNG', N'tltc1.PNG', N'tltc1.PNG', N'tltc1.PNG', 1, 5, 8, N'la-thu-cuoi-cung-cua-iwai', CAST(N'2021-10-14T12:41:42.923' AS DateTime), 3, NULL, 0, CAST(N'2021-10-14T13:31:18.393' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (17, N'TLTC02', N'Từng nốt nhạc ngân', 70000, 27, 11, N'Với kỹ năng điêu luyện và cảm xúc dạt dào, Richard đã quen tắm mình trong sự tung hô nhiệt liệt từ khán giả trong các buổi độc tấu piano do anh biểu diễn tại những nhà hát giao hưởng danh tiếng nhất thế giới. Cho đến một ngày, cuộc đời giáng xuống anh căn bệnh ALS – chứng xơ cứng teo cơ mà Stephen Hawking từng phải chiến đấu chống lại hơn nửa thế kỷ.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'tltc2.PNG', N'tltc2.PNG', N'tltc2.PNG', N'tltc2.PNG', N'tltc2.PNG', 1, 2, 8, N'tung-not-nhac-ngan', CAST(N'2021-10-14T13:37:18.700' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (18, N'TN01', N'Doraemon truyện dài', 30000, 23, 5, N'Cũng giống như bộ truyện ngắn, đây là bộ tuyển tập gồm những chuyến phiêu lưu của Doraemon, Nobita và các bạn đến những vùng đất mới, vốn đã rất quen thuộc với độc giả nhiều thế hệ: Tới vương quốc trên mây, nước Nhật thời nguyên thủy, Khai phá vũ trụ, hành tinh muông thú... ', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'tn1.PNG', N'tn1.PNG', N'tn1.PNG', N'tn1.PNG', N'tn1.PNG', 1, 2, 9, N'doraemon-truyen-dai', CAST(N'2021-10-14T13:43:01.147' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (19, N'TN02', N'Thợ làm vườn nhí', 50000, 28, 15, N'Thợ làm vườn nhí là cuốn cẩm nang dành cho các bạn nhỏ làm quen với công việc làm vườn. Bằng ngôn ngữ dễ hiểu kết hợp cùng hình ảnh minh họa đáng yêu, cuốn sách sẽ trang bị cho các bạn những hiểu biết cơ bản về làm vườn như chuẩn bị đất, chọn hạt giống, gieo hạt, tưới nước, bảo vệ cây.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Màn hình:</td>
												<td>OLED6.1"Super Retina XDR</td>
											</tr>
											<tr>
												<td>Hệ điều hành:</td>
												<td>iOS 14</td>
											</tr>
											<tr>
												<td>Camera sau:</td>
												<td>2 camera 12 MP</td>
											</tr>
											<tr>
												<td>Camera trước:</td>
												<td>12 MP</td>
											</tr>
											<tr>
												<td>Chip:</td>
												<td>Apple A14 Bionic</td>
											</tr>
											<tr>
												<td>Ram:</td>
												<td>4GB</td>
											</tr>
											<tr>
												<td>Bộ nhớ trong:</td>
												<td>64GB</td>
											</tr>
											<tr>
												<td>SIM:</td>
												<td>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</td>
											</tr>
											<tr>
												<td>Pin, Sạc:</td>
												<td>2815 mAh20 W</td>
											</tr>
										</tbody>
									</table>', N'tn2.png', N'tn2.png', N'tn2.png', N'tn2.png', N'tn2.png', 1, 2, 9, N'tho-lam-vuon-nhi', CAST(N'2021-10-14T13:49:03.253' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (21, N'5CM1S001', N'Truyện 5 Centimet Trên Giây', 39500, 17, 11, N'Bằng giọng văn tinh tế, truyền cảm, Năm centimet trên giây mang đến những khắc họa mới về tâm hồn và khả năng tồn tại của cảm xúc, bắt đầu từ tình yêu trong sáng, ngọt ngào của một cô bé và cậu bé. Ba giai đoạn, ba mảnh ghép, ba ngôi kể chuyện khác nhau nhưng đều xoay quanh nhân vật nam chính, người luôn bị ám ảnh bởi kí ức và những điều đã qua…
<br>
Khác với những câu chuyện cuốn bạn chạy một mạch, truyện này khó mà đọc nhanh. Ngón tay bạn hẳn sẽ ngừng lại cả trăm lần trên mỗi trang sách. Chỉ vì một cử động rất khẽ, một câu thoại, hay một xúc cảm bất chợt có thể sẽ đánh thức những điều tưởng chừng đã ngủ quên trong tiềm thức, như ngọn đèn vừa được bật sáng trong tâm trí bạn. Và rồi có lúc nó vượt quá giới hạn chịu đựng, bạn quyết định gấp cuốn sách lại chỉ để tận hưởng chút ánh sáng từ ngọn đèn, hay đơn giản là để vết thương trong lòng mình có thời gian tự tìm xoa dịu.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Shinkai Makoto</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>Văn Học</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>12/2014</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>300</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>13x18</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>188</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa Mềm</td>
											</tr>				
										</tbody>
									</table>', N'5-cm-tren-giay-1.jpg', N'5-cm-tren-giay-2.jpg', N'5-cm-tren-giay-3.jpg', N'5-cm-tren-giay-4.jpg', N'5-cm-tren-giay-5.jpg', 1, 1, 7, N'5-centimet-tren-giay', CAST(N'2021-12-08T06:01:59.943' AS DateTime), 3, NULL, 0, CAST(N'2021-12-12T10:13:23.157' AS DateTime), 3, 40000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (22, N'YOURNAME01', N'Truyện Your Name', 60000, 10, 19, N'Your Name
<br>
Mitsuha là nữ sinh trung học sống ở vùng quê hẻo lánh. Một ngày nọ, cô mơ thấy mình ở Tokyo trong một căn phòng xa lạ, biến thành con trai, gặp những người bạn chưa từng quen biết.
<br>
Trong khi đó ở một nơi khác, Taki, một nam sinh trung học người Tokyo lại mơ thấy mình biến thành con gái, sống ở vùng quê hẻo lánh.
<br>
Cuối cùng hai người họ nhận ra đang bị hoán đổi với nhau qua giấc mơ. Kể từ lúc hai con người xa lạ ấy gặp nhau, bánh xe số phận bắt đầu chuyển động.
<br>
Đây là phiên bản tiểu thuyết của bộ phim hoạt hình Your Name., do chính đạo diễn <b>Shinkai Makoto</b> chấp bút.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Shinkai Makoto</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Thúy An</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>Hồng Đức</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2017</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>280</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>13 x 18</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>256</td>
											</tr>
										</tbody>
									</table>', N'yourname-1.jpg', N'yourname-2.jpg', N'yourname-3.jpg', N'yourname-4.jpg', N'yourname-5.jpg', 1, 1, 7, N'truyen-your-name', CAST(N'2021-12-08T20:25:30.510' AS DateTime), 3, NULL, 0, CAST(N'2021-12-08T20:30:01.780' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (23, N'KVNT001', N'Khu Vườn Ngôn Từ', 76000, 16, 23, N'Khu vườn ngôn từ kể về một tình yêu còn xa xưa hơn cả tình yêu.
<br>
Khái niệm tình yêu trong tiếng Nhật hiện đại là luyến hoặc ái, nhưng vào thời xưa nó được viết là cô bi, nghĩa là nỗi buồn một mình. Shinkai Makoto đã cấu tứ Khu vườn ngôn từ theo ý nghĩa cổ điển này, miêu tả tình yêu theo khái niệm ban sơ của nó, tức là cô bi - nỗi buồn khi một mình thương nhớ một người.
Những ngày mưa triền miên....
<br>
Nơi hàng hiên ngập tràn màu xanh của một khu vườn Nhật Bản...
<br>
Có một cảm xúc êm dịu đến không thốt nên lời cứ thế manh nha, tựu hình và lửng lơ tồn tại.
Trong lúc dòng đời cuồn cuộn chảy trôi, tất cả hối hả tiến về phía trước, thì cậu và cô lại dừng chân, chìm xuống trong tĩnh lặng riêng mình, và ở cái vũng tĩnh lặng đó, họ tìm thấy nhau. Dần dần và mạo hiểm, quên đi cả các chênh lệch về tuổi tác và vị trí, họ thả hồn mình trôi về nhau hòa điệu.
Làm nền cho tất cả là mưa rơi không ngừng, là lá mướt mát rung rinh. Nhưng khi mưa tạnh và trời quang trở lại, mọi đường nét của hiện thực trở nên rõ rệt đến khắc nghiệt, thì những êm dịu và lửng lơ kia liệu còn khả năng tồn tại?
<br>
Khu vườn ngôn từ kể về một tình yêu còn xa xưa hơn cả tình yêu.
Khái niệm tình yêu trong tiếng Nhật hiện đại là luyến hoặc ái, nhưng vào thời xưa nó được viết là cô bi, nghĩa là nỗi buồn một mình. Shinkai Makoto đã cấu tứ Khu vườn ngôn từ theo ý nghĩa cổ điển này, miêu tả tình yêu theo khái niệm ban sơ của nó, tức là cô bi - nỗi buồn khi một mình thương nhớ một người.
<br>
Những ngày mưa triền miên....
Nơi hàng hiên ngập tràn màu xanh của một khu vườn Nhật Bản...
Có một cảm xúc êm dịu đến không thốt nên lời cứ thế manh nha, tựu hình và lửng lơ tồn tại.
Trong lúc dòng đời cuồn cuộn chảy trôi, tất cả hối hả tiến về phía trước, thì cậu và cô lại dừng chân, chìm xuống trong tĩnh lặng riêng mình, và ở cái vũng tĩnh lặng đó, họ tìm thấy nhau. Dần dần và mạo hiểm, quên đi cả các chênh lệch về tuổi tác và vị trí, họ thả hồn mình trôi về nhau hòa điệu.
Làm nền cho tất cả là mưa rơi không ngừng, là lá mướt mát rung rinh. Nhưng khi mưa tạnh và trời quang trở lại, mọi đường nét của hiện thực trở nên rõ rệt đến khắc nghiệt, thì những êm dịu và lửng lơ kia liệu còn khả năng tồn tại?', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Shinkai Makoto</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Thúy An</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>Hồng Đức</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2017</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>280</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>13 x 18</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>256</td>
											</tr>
										</tbody>
									</table>', N'khu-vuon-ngon-tu-1.jpg', N'khu-vuon-ngon-tu-2.jpg', N'khu-vuon-ngon-tu-3.jpg', N'khu-vuon-ngon-tu-4.jpg', N'khu-vuon-ngon-tu-5.jpg', 1, 1, 7, N'khu-vuon-ngon-tu', CAST(N'2021-12-08T20:39:13.457' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (24, N'BINHMINH01', N'Khi Bình Minh Tới Tớ Sẽ Đến Gặp Cậu Đầu Tiên', 113000, 24, 34, N'<b>TÁC PHẨM XUẤT SẮC ĐẠT GIẢI THƯỞNG LỚN NOICHIGO NĂM 2017!</b>
<br>
Sau một sự việc trong quá khứ, từ một cô gái hoạt bát và tràn đầy tinh thần chính nghĩa, Akane dần thu mình lại và sống dưới vỏ bọc một cô học sinh ngoan ngoãn, luôn cố gắng để không làm mất lòng ai, dù điều đó khiến cuộc sống của cô vô cùng mệt mỏi và bế tắc. Seiji - cậu bạn ngồi cùng bàn lại hoàn toàn trái ngược. Chàng trai với mái tóc bạch kim ấy luôn thoải mái sống theo cách của mình, dám nói thẳng nói thật, không bận tâm đến ánh nhìn của người khác. Chính cậu cũng là người duy nhất nhìn thấu nỗi lòng của Akane và cố gắng cứu cô ra khỏi vực sâu u tối. Thời gian ở bên Seiji, ngắm nhìn những bức tranh cậu vẽ, thế giới trong mắt Akane dần trở nên ngập tràn sắc màu, kéo theo sự rung động từ nơi sâu thẳm trái tim…
<br>
<b>Trích dẫn trong sách:</b>
<br>
“Người mà ta mong gặp lúc đêm khuya chỉ là đối tượng của dục vọng khiến ta lưu luyến bằng thể xác. Còn người mà ta mong gặp lúc bình minh mới là người ta yêu bằng cả trái tim.”
<br>
“Thứ đã cứu vớt tớ
<br>
Khỏi thế giới ngột ngạt, không màu này
<br>
Là những bức tranh của cậu, người mà tớ ghét cay ghét đắng.
<br>
Thế giới rực rỡ sắc màu do bàn tay cậu vẽ nên
<br>
Vô cùng tươi đẹp
<br>
Và rất đỗi dịu dàng.
<br>
Chẳng biết từ bao giờ
<br>
Chỉ khi bên cậu
<br>
Tớ mới thấy mọi thứ tỏa sáng lấp lánh…”', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Natsue Shiomi</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Hương Giang</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>Thế Giới</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2017</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>280</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>13 x 18</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>376</td>
											</tr>
										</tbody>
									</table>', N'binhminh_1.jpg', N'binhminh_2.jpg', N'binhminh_3.jpg', N'binhminh_4.jpg', N'binhminh_5.jpg', 1, 2, 7, N'khi-binh-minh-den-to-muon-gap-cau-dau-tien', CAST(N'2021-12-08T20:48:53.717' AS DateTime), 3, NULL, 0, CAST(N'2021-12-12T10:36:58.317' AS DateTime), 3, 150000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (25, N'TMATCC01', N'Tớ Muốn Ăn Tụy Của Cậu', 77000, 39, 14, N'<b>Tớ Muốn Ăn Tụy Của Cậu</b>
<br>
“Tôi không biết về ngày mai của tôi - người vẫn còn thời gian, nhưng tôi đã nghĩ ngày mai của cô ấy - người chẳng còn mấy thời gian đã được hẹn trước.
<br>
Cái lô-gíc xuẩn ngốc gì thế này.
<br>
Tôi đã nghĩ thế giới này sẽ ưu ái trước sinh mệnh của một cô gái mà những ngày sống chẳng còn là bao.
<br>
Đương nhiên, làm gì có chuyện như vậy. Đã không như vậy.
<br>
Thế giới không phân biệt một ai.
<br>
Nó không nương bàn tay tấn công bình đẳng ấy với bất kỳ ai, kể cả tôi - người có một thân thể khỏe mạnh, hay cô ấy - người sắp ra đi vì căn bệnh nan y.”
<br>
“Tôi không biết về ngày mai của tôi - người vẫn còn thời gian, nhưng tôi đã nghĩ ngày mai của cô ấy - người chẳng còn mấy thời gian đã được hẹn trước.
<br>
Cái lô-gíc xuẩn ngốc gì thế này.
<br>
Tôi đã nghĩ thế giới này sẽ ưu ái trước sinh mệnh của một cô gái mà những ngày sống chẳng còn là bao.
<br>
Đương nhiên, làm gì có chuyện như vậy. Đã không như vậy.
<br>
Thế giới không phân biệt một ai.
<br>
Nó không nương bàn tay tấn công bình đẳng ấy với bất kỳ ai, kể cả tôi - người có một thân thể khỏe mạnh, hay cô ấy - người sắp ra đi vì căn bệnh nan y.”', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Sumino Yoru</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Phong Tập</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>NXB Hội Nhà Văn</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2018</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>550</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>14 x 20.5</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>341</td>
											</tr>
										</tbody>
									</table>', N'to-muon-an-tuy-cua-cau-1.jpg', N'to-muon-an-tuy-cua-cau-2.jpg', N'to-muon-an-tuy-cua-cau-3.jpg', N'to-muon-an-tuy-cua-cau-4.jpg', N'to-muon-an-tuy-cua-cau-5.jpg', 1, 1, 7, N'to-muon-an-tuy-cua-cau', CAST(N'2021-12-08T21:03:29.600' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (26, N'TYEQHHRB01', N'Tôi Yêu Em Qua Hình Hài Robot', 69000, 36, 12, N'<b>Tôi Yêu Em Qua Hình Hài Robot</b>
<br>
<br>
<i>“Nếu có kiếp sau, anh muốn trở thành gì?”</i>
<br>
<i>“Bút.. thước… vở… sổ ghi chép… hoặc chậu hoa lưu ly kia.”</i>
<br>
<i>“Anh thật kỳ lạ!”</i>
<br>
Takeru lặng im, chỉ khẽ nói trong lòng: “Để có thể ở bên cạnh em.”
<br>
-
</br>
Năm 2060, khi Nhật Bản chuẩn bị cho kỳ Thế vận hội Olympic lần thứ 3, cả đất nước bỗng đứng trước nguy hiểm khi nhận được lời đe dọa từ các phần tử khủng bố. Trước tình cảnh cấp bách đó, một dự án tối mật mang tính quốc gia sử dụng các robot hình người đã được mang ra ánh sáng như một biện pháp cuối cùng để bảo vệ đất nước.

Và Takeru – một điều khiển viên chủ chốt – là người được giao nhiệm vụ quan trọng nhất, đó là hãy cùng những con robot của mình tìm ra bằng được kẻ khủng bố!

Run rủi thế nào, trong khi cố gắng hoàn thành nhiệm vụ, Takeru lại gặp lại Saki – người con gái mà cậu thầm yêu suốt nhiều năm liền.

Làm việc chung cùng nhau, dần dần Saki cũng mang trong mình thức cảm xúc đặc biệt… nhưng không phải là với Takeru, mà lại là với con robot do chính anh điều khiển…

“Chỉ cần được ở bên cạnh cô ấy là tốt rồi, mình cũng chẳng cần gì hơn.” – Takeru đã thầm nhủ như vậy. Đến làm bút, vở, sổ ghi chép… anh còn chẳng ngại nữa là.

Ngay cả khi không thể chạm vào cô, ngay cả khi chỉ có thể ngắm nhìn cô từ xa, ngay cả khi tồn tại như một người vô hình trong thế giới của cô… với anh đều không sao cả.

“Một kẻ vô vị như  tôi, chỉ biết yêu cô ấy theo cách như vậy mà thôi…”

Thế nhưng, tình yêu trên thế gian này vốn là thứ không thể dùng mắt là có thể nhìn thấy hay dùng tay là có thể chạm tới. Dù ở bất cứ hình hài nào, tình yêu của Takeru vẫn còn đó, vẫn vẹn nguyên như cái ngày đầu tiên khi anh trao cho Saki bó hoa lưu ly cùng những lời muốn nói:  “Xin đừng quên anh.”

Saki có thể không thể nhận ra hình hài của anh, nhưng sẽ nhận ra tình yêu ấy. Chắc chắn là vậy, chắc chắn là vậy…
Bằng chất văn nhẹ nhàng mà day dứt đến tận cùng, Yamada Yusuke đã đưa “Tôi yêu em qua hình hài robot” trải qua hàng ngàn những cung bậc cảm xúc khác nhau. Mối tình thầm lặng của Takeru, sự chờ đợi của Saki, tình yêu đẹp đến nao lòng tựa như ý nghĩa của loài hoa lưu ly… “Xin đừng quên anh”, “Cũng xin anh đừng quên em.”… tất cả đều nhẹ nhàng hiện lên qua những trang sách đầy rung cảm.
Nhắm mắt lại, Saki  đưa tay vào túi, vừa nắm chặt mảnh kim loại trong tay vừa lặp lại lời cầu nguyện mong Takeru bình an vô sự.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Yamada Yusuke</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Nguyễn Như</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>NXB Phụ Nữ</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2019</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>320</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>14 x 20.5</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>304</td>
											</tr>
										</tbody>
									</table>', N'toi-yeu-em-qua-hinh-hai-robot-1.jpg', N'toi-yeu-em-qua-hinh-hai-robot-2.jpg', N'toi-yeu-em-qua-hinh-hai-robot-3.jpg', N'toi-yeu-em-qua-hinh-hai-robot-4.jpg', N'toi-yeu-em-qua-hinh-hai-robot-5.jpg', 1, 5, 7, N'toi-yeu-em-qua-hinh-hai-robot', CAST(N'2021-12-08T21:12:36.300' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (27, N'T9DATOI01', N'Và Rồi, Tháng 9 Không Có Cậu Đã Tới', 85000, 19, 13, N'<b>VÀ RỒI, THÁNG 9 KHÔNG CÓ CẬU ĐÃ TỚI</b>
<br>
Tiểu thuyết thanh xuân bí ẩn xoay quanh những suy nghĩ bị giấu kín.
<br>
Vào mùa hè năm ấy, Keita đã qua đời.
<br>
Chưa vượt qua khỏi cú sốc đó, Miho, Taiki, Shun, Rino – những người bạn luôn bên cạnh Keita – đã trải qua một mùa hè đầy bất ngờ.
<br>
Một ngày nọ, Kei – một thiếu niên giống hệt Keita đã mất – xuất hiện trước mặt Miho.
<br>
<i>“Mình có việc muốn nhờ các cậu. Xin hãy đến nơi mà mình đã chết.”</i>
<br>
Dù cảm thấy bối rối, nhưng nhóm Miho vẫn bắt đầu cuộc hành trình đi theo dấu chân của Keita.
<br>
Trong suốt chuyến đi này, những lời nói dối, sự ganh tị, hối hận cùng tình cảm hướng đến Keita dần được hé lộ. Và rồi, kết cục ngoài dự đoán cũng xuất hiện ở phía cuối hành trình.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Yamada Yusuke</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Nguyễn Như</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>NXB Phụ Nữ</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2019</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>320</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>14 x 20.5</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>304</td>
											</tr>
										</tbody>
									</table>', N'thang-9-da-toi-1.jpg', N'thang-9-da-toi-2.jpg', N'thang-9-da-toi-3.jpg', N'thang-9-da-toi-4.jpg', N'thang-9-da-toi-5.jpg', 1, 2, 7, N'va-roi-thang-9-da-toi', CAST(N'2021-12-08T21:27:47.457' AS DateTime), 3, NULL, 0, CAST(N'2021-12-08T21:29:01.380' AS DateTime), 3, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (28, N'BKMTLNHU01', N'Bên Kia Mây Trời, Là Nơi Hẹn Ước', 115000, 36, 7, N'<b>Bên Kia Mây Trời, Là Nơi Hẹn Ước</b>
<br>
Tôi và cậu, đôi bạn thân rất thân, niềm thân ái thắm thiết bền lâu. Hai đứa hiểu nhau mà chẳng cần nói trọn một câu. Có chung nhau những sở thích vô cùng khác lạ.
<br>
Rồi tình thân tiêu tan sau một ngày mùa hạ, khi cô ấy đến rồi đi không để lại lời nào.
<br>
Giữa biển người mênh mông, Takuya và Hiroki trở nên gắn kết nhờ có chung những kĩ năng và sở thích khác hẳn cộng đồng.
<br>
Nghĩ nhiều, làm nhiều, nói ít… Mấy năm thân thiết của hai cậu được ghi dấu bằng những lúc âm thầm đứng cạnh nhau trên sân ga đợi tàu đi học, âm thầm cùng chế tác chiếc máy bay chở ước vọng tương lai, âm thầm sẻ chia những tật xấu phải che mắt người ngoài, âm thầm cảm nhận nét đẹp của một cô gái, và âm thầm cả khi phát hiện ra nhau lại tiếp tục chung sở thích về một người.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông tin sản phẩm</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tác giả:</td>
												<td>Yamada Yusuke</td>
											</tr>
											<tr>
												<td>Người Dịch:</td>
												<td>Nguyễn Như</td>
											</tr>
											<tr>
												<td>NXB:</td>
												<td>NXB Phụ Nữ</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2019</td>
											</tr>
											<tr>
												<td>Trọng lượng (gr):</td>
												<td>320</td>
											</tr>
											<tr>
												<td>Kích Thước Bao Bì:</td>
												<td>14 x 20.5</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>304</td>
											</tr>
										</tbody>
									</table>', N'ben-kia-may-troi-1.jpg', N'ben-kia-may-troi-2.jpg', N'ben-kia-may-troi-3.jpg', N'ben-kia-may-troi-4.jpg', N'ben-kia-may-troi-5.jpg', 1, 2, 7, N'ben-kia-may-troi-la-noi-hen-uoc', CAST(N'2021-12-08T21:39:34.743' AS DateTime), 3, NULL, 0, CAST(N'2021-12-12T10:55:59.163' AS DateTime), 3, 140000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (29, N'TGCBK01', N'Thanh Gươm Diệt Quỷ 2: Cánh Bướm Khuyết', 47500, 11, 3, N'Ngược về quá khứ, Himejima từng cứu giúp Kanae vàShinobu bị quỷ sát hại cha mẹ.
<br>
 Himejima thương xót và căm ghét số phận. Nếu không có biến cố kia, hẳn Shinobu đã có thể sống hạnh phúc trong tình yêu thương của cha mẹ và chị gái thay vì bị giận dữ và hận thù vây hãm. Tuy nhiên, anh đã quay lưng với lời thỉnh cầu của hai đứa trẻ. Anh không thể để tương lai của hai chị em bị tước đi vì những cảm xúc nhất thời này.
<br>
 Vì không muốn hai chị em dấn thân vào con đường nguy hiểm, anh đã đưa ra thử thách hòng ngăn cản cả hai gia nhập Đội Diệt Quỷ, thế nhưng…
<br>
“Cánh bướm khuyết” là cuốn tiểu thuyết gồm 5 câu chuyện vô cùng thú vị, hé lộ về cuộc sống của các “Trụ cột” - Dàn nhân vật nhận được sự quan tâm lớn từ độc giả! Ngoài ra với những ai vốn yêu thích “Học viện Diệt Quỷ”, tập sách này sẽ tiếp tục mang đến cho các bạn những khoảnh khắc vô cùng hài hước và khó quên!!
<br>
Đáng chú ý trong tập này: Rốt cuộc đã xảy ra chuyện gì mà đến cả thầy giáo thể dục Tomioka – vốn lạnh lùng hơn băng giá – cũng phải rớt nước mắt!? Tất cả sẽ được làm sáng tỏ qua phần ngoại truyện “Học viện Diệt quỷ”.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td><td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td><td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td><td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td><td>16+</td>
											</tr>
										</tbody>
									</table>', N'diet-quy-2-canh-buom-khuyet-1.jpg', N'diet-quy-2-canh-buom-khuyet-2.jpg', N'diet-quy-2-canh-buom-khuyet-3.jpg', N'diet-quy-2-canh-buom-khuyet-2.jpg', N'diet-quy-2-canh-buom-khuyet-3.jpg', 1, 1, 7, N'diet-quy-canh-buom-khuyet', CAST(N'2021-12-20T05:52:41.777' AS DateTime), 3, NULL, 0, NULL, 0, 50000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (30, N'SEVENDAYTB', N'Seven Days (Tái Bản)', 64000, 7, 19, N'Câu chuyện khởi đầu bằng cuộc gặp gỡ giữa cậu nam sinh năm ba cao trung Shino Yuzuru và người đàn em câu lạc bộ bắn cung Seryo Toji tại cổng trường vào một buổi sáng thứ Hai. Seryo là anh chàng được nữ sinh trong trường vô cùng mến mộ bất kể mọi khối lớp, nổi tiếng với tin đồn nhất định sẽ hẹn hò cùng người tỏ tình đầu tiên hôm thứ Hai, nhưng chia tay ngay lúc cuối tuần. Thời hạn một tuần để làm người yêu của nhau… Chỉ bằng câu nói buột ra trong phút nông nổi của Yuzuru, đã kéo cả hai vào bảy ngày vờ như hò hẹn, vậy nhưng…', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'seven-day-1.jpg', N'seven-day-2.jpg', N'seven-day-3.jpg', N'seven-day-2.jpg', N'seven-day-3.jpg', 1, 1, 7, N'seven-days-tai-ban', CAST(N'2021-12-20T06:02:35.700' AS DateTime), 3, NULL, 0, NULL, 0, 80000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (31, N'NNHTTT01', N'Nỗi Nhớ Anh Hóa Một Tòa Thành (Trọn Bộ 2 Tập)', 206400, 7, 47, N'Anh là kiến trúc sư nổi tiếng thế giới - Dante, cũng là Cố Hi Thành, người đã dành hết 10 năm cuộc đời để yêu thương cô.
<br>
Cô là Ảnh hậu hàng đầu trong làng giải trí, song cũng chỉ là một người con gái bình thường khi đứng trước tình yêu.
<br>
Cô có thể phụ bản thân mình nhưng tuyệt đối, tuyệt đối không thể phụ Cố Hi Thành.
<br>
Mười năm đã trôi qua, nhưng cô vẫn luôn tự tin nói với mình như vậy.
<br>
Anh là một tòa thành mà cô mãi mãi không thể nào quên, còn cô là nỗi đâu một lời không thể nói hết của anh.
<br>
Khi tất cả mọi hiểu lầm được hóa giải, tất cả mọi hoài nghi được tan biến, anh đứng trước mặt cô với một thân phận hoàn toàn mới, còn cô phải làm thế nào để vượt qua được tòa thành tình cảm chất chứa 10 năm đây?', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'noi-nho-anh-hoa-thanh-toa-thanh-1.jpg', N'noi-nho-anh-hoa-thanh-toa-thanh-2.png', N'noi-nho-anh-hoa-thanh-toa-thanh-3.png', N'noi-nho-anh-hoa-thanh-toa-thanh-3.png', N'noi-nho-anh-hoa-thanh-toa-thanh-2.png', 1, 1, 7, N'noi-nho-anh-hoa-thanh-toa-thanh-tron-bo', CAST(N'2021-12-20T06:10:58.087' AS DateTime), 3, NULL, 0, NULL, 0, 258000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (32, N'NDDGDBT3', N'Nguyệt Đạo Dị Giới - Tập 3 - Bản Đặc Biệt', 117000, 12, 31, N'Tiếp nối diễn biến hấp dẫn từ tập 2, Nguyệt Đạo Dị Giới tập 3 mở ra với sự kiện Misumi Makoto với bí danh Raidou đã cùng hai tùy tùng là Tomoe và Mio thành lập thương hội Kuzunoha. Nhờ có sự hậu thuẫn và giúp đỡ của Rembrandt, Makoto đã thành công gia nhập thị trường Ziege dưới mô hình kinh doanh cửa hàng bách hóa, nơi bày bán các sản vật từ Á Không, đặc biệt là hoa Ambrosia – loài hoa trị bách bệnh mà Makoto đã khám phá ra thông qua vụ việc náo động của gia đình Rembrandt ở tập 2.
<br>
Trong chuyến du hành tìm đến nơi loài hoa Ambrosia sinh trưởng, Makoto và Mio đã phát hiện ra ba Loài người bám đuôi mình, nhưng vì nể tình đồng loại nên cậu đã tha thứ và đưa họ về Á Không để trông coi. Cũng trong lúc ấy, nhóm Makoto còn chạm trán với hai cô gái Á nhân thuộc tộc Quỷ rừng, sau đó được họ dẫn về ngôi làng của họ - một nơi với bầu không khí vô cùng kì quái… Có vẻ nhóm Makoto lại sắp bị cuốn vào chuyện gì đó rồi đây.
<br>
Rốt cuộc đã có chuyện gì xảy ra với ngôi làng ấy…?
<br>
Và liệu ba Loài người được tha thứ kia có gây nên những sóng gió gì không?', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'nguyet-dao-di-gioi-tap3-1.jpg', N'nguyet-dao-di-gioi-tap3-2.jpg', N'nguyet-dao-di-gioi-tap3-3.jpg', N'nguyet-dao-di-gioi-tap3-4.jpg', N'nguyet-dao-di-gioi-tap3-5.jpg', 1, 7, 7, N'nguyet-dao-di-gioi-dac-biet-tap-3', CAST(N'2021-12-20T06:24:28.580' AS DateTime), 3, NULL, 0, NULL, 0, 129000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (33, N'HPTB7C', N'Harry Potter Hộp (Trọn Bộ 7 Cuốn)', 1271000, 8, 11, N'Harry Potter là tên của bộ truyện (gồm bảy phần) của nữ nhà văn J. K. Rowling viết về cậu bé thiếu niên Harry Potter. Câu chuyện phần lớn diễn ra tại Trường Phù thủy và Pháp sư Hogwarts, một ngôi trường pháp thuật, và tập trung vào cuộc chiến của Harry Potter chống lại một phù thủy hắc ám là Chúa tể Voldemort, người đã giết cha mẹ cậu trong tham vọng làm chủ thế giới phù thủy.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'harry-potter-tron-bo-7-cuon-1.jpg', N'harry-potter-tron-bo-7-cuon-2.jpg', N'harry-potter-tron-bo-7-cuon-3.jpg', N'harry-potter-tron-bo-7-cuon-4.jpg', N'harry-potter-tron-bo-7-cuon-5.jpg', 1, 2, 7, N'harry-potter-tron-bo-7-cuon', CAST(N'2021-12-20T06:34:03.080' AS DateTime), 3, NULL, 0, NULL, 0, 1550000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (34, N'DBTSC01', N'Đôi Bàn Tay Siết Chặt - Tặng Kèm Bookmark', 123000, 22, 36, N'<b>Tác phẩm đạt giải Xuất sắc của Giải thưởng Tiểu thuyết Keitai Nhật Bản lần thứ 8!</b>
<br>
Khi đang trải qua những ngày tháng hạnh phúc bên cậu bạn trai Kouki, Miyu đột ngột mắc bệnh nặng và được thông báo thời gian sống chỉ còn ba tháng. Vào ngày kỷ niệm một năm quen nhau, vì nghĩ cho Kouki nên dù vẫn còn tình cảm, Miyu vẫn quyết định nói lời chia tay cậu với lý do cô đã thích người khác. Kouki vô cùng đau khổ với lời chia tay đến quá bất ngờ, sau một thời gian cậu quyết định đến với mối tình mới nhằm quên đi nỗi đau này. Nhưng cuối cùng liệu họ có thể hạnh phúc khi cả hai đều không thể quên được nhau?

Trích dẫn trong sách:

“Người ta nói rằng vì sao sáng nhất trên bầu trời chính là người vô cùng quan trọng đối với mình. Khi một ai đó mất đi, họ sẽ hóa thành ngôi sao và tiếp tục tỏa sáng. Sau khi tớ không còn nữa, mỗi khi Kou tình cờ ngước nhìn bầu trời đêm, hy vọng tớ sẽ là ngôi sao sáng nhất ở đó.”

Mã hàng	3300000012124
Tên Nhà Cung Cấp	AZ Việt Nam
Tác giả	Ayuu
Người Dịch	satoukibi
NXB	NXB Thế Giới
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	400
Kích Thước Bao Bì	18 x 13 cm
Số trang	376
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
AZ Việt Nam
AZ Việt Nam - Light Novel
MUA SẮM AN TOÀN NGÀN DEAL GIẢM SỐC - Giảm Khủng Đến 60%
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Đôi Bàn Tay Siết Chặt

Tác phẩm đạt giải Xuất sắc của Giải thưởng Tiểu thuyết Keitai Nhật Bản lần thứ 8!

Khi đang trải qua những ngày tháng hạnh phúc bên cậu bạn trai Kouki, Miyu đột ngột mắc bệnh nặng và được thông báo thời gian sống chỉ còn ba tháng. Vào ngày kỷ niệm một năm quen nhau, vì nghĩ cho Kouki nên dù vẫn còn tình cảm, Miyu vẫn quyết định nói lời chia tay cậu với lý do cô đã thích người khác. Kouki vô cùng đau khổ với lời chia tay đến quá bất ngờ, sau một thời gian cậu quyết định đến với mối tình mới nhằm quên đi nỗi đau này. Nhưng cuối cùng liệu họ có thể hạnh phúc khi cả hai đều không thể quên được nhau?
<br>
“Người ta nói rằng vì sao sáng nhất trên bầu trời chính là người vô cùng quan trọng đối với mình. Khi một ai đó mất đi, họ sẽ hóa thành ngôi sao và tiếp tục tỏa sáng. Sau khi tớ không còn nữa, mỗi khi Kou tình cờ ngước nhìn bầu trời đêm, hy vọng tớ sẽ là ngôi sao sáng nhất ở đó.”', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'doi-ban-tay-siet-chac-1.jpg', N'doi-ban-tay-siet-chac-2.jpg', N'doi-ban-tay-siet-chac-3.jpg', N'doi-ban-tay-siet-chac-4.jpg', N'doi-ban-tay-siet-chac-3.jpg', 1, 2, 7, N'doi-ban-tay-siet-chac', CAST(N'2021-12-20T06:40:48.903' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (35, N'NGK2020', N'Nhà Giả Kim (Tái Bản 2020)', 67000, 35, 2, N'Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.
<br>
“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'nha-gia-kim-1.jpg', N'nha-gia-kim-1.jpg', N'nha-gia-kim-3.jpg', N'nha-gia-kim-4.jpg', N'nha-gia-kim-3.jpg', 1, 10, 5, N'nha-gia-kim', CAST(N'2021-12-20T08:04:09.950' AS DateTime), 3, NULL, 0, NULL, 0, 79000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (36, N'CFCTONY17', N'Cà Phê Cùng Tony (Tái Bản 2017)', 63000, 25, 3, N'Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.
<br>
Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'cafe-cung-tony-2017.jpg', N'cafe-cung-tony-2017-2.jpg', N'cafe-cung-tony-2017-3.jpg', N'cafe-cung-tony-2017-4.jpg', N'cafe-cung-tony-2017-5.jpg', 1, 7, 5, N'cafe-cung-tony-2017', CAST(N'2021-12-20T08:10:40.910' AS DateTime), 3, NULL, 0, NULL, 0, 90000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (37, N'TTDGBN21', N'Tuổi Trẻ Đáng Giá Bao Nhiêu (Tái Bản 2021)', 78300, 22, 4, N'Nhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.
<br>
Hãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.
<br>
Nếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần.”', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'tuoi-tre-dang-gia-bao-nhieu-2021-1.jpg', N'tuoi-tre-dang-gia-bao-nhieu-2021-2.jpg', N'tuoi-tre-dang-gia-bao-nhieu-2021-3.jpg', N'tuoi-tre-dang-gia-bao-nhieu-2021-4.jpg', N'tuoi-tre-dang-gia-bao-nhieu-2021-5.jpg', 1, 10, 5, N'tuoi-tre-dang-gia-bao-nhieu-2021', CAST(N'2021-12-20T08:18:29.927' AS DateTime), 3, NULL, 0, NULL, 0, 90000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (38, N'KAKNCDTH01', N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ - Bản Mới', 88000, 24, 5, N'Trong xã hội thông tin hiện đại, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù là vàng cũng sẽ bị chôn vùi. Trong cuộc đời một con người, từ xin việc đến thăng tiến, từ tình yêu đến hôn nhân, từ tiếp thị cho đến đàm phán, từ xã giao đến làm việc... không thể không cần đến kĩ năng và khả năng giao tiếp. Khéo ăn khéo nói thì đi đâu, làm gì cũng gặp thuận lợi. Không khéo ăn nói, bốn bề đều là trở ngại, khó khăn. Trong thời đại thông tin và liên lạc phát triển nhanh chóng, tin tức được cập nhật liên tục, các công cụ thông tin và kĩ thuật truyền thông được ứng dụng rộng rãi như ngày nay thì việc khéo ăn nói đã trở thành “cái tài số một thiên hạ”. Trong khoảng thời gian ngắn nhất, nếu ai có thể nêu bật được khả năng.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'kheo-an-kheo-noi-co-duoc-thien-ha-1.jpg', N'kheo-an-kheo-noi-co-duoc-thien-ha-2.jpg', N'kheo-an-kheo-noi-co-duoc-thien-ha-3.jpg', N'kheo-an-kheo-noi-co-duoc-thien-ha-4.jpg', N'kheo-an-kheo-noi-co-duoc-thien-ha-5.jpg', 1, 7, 5, N'kheo-an-kheo-noi-co-duoc-thien-ha', CAST(N'2021-12-20T21:51:00.490' AS DateTime), 3, NULL, 0, NULL, 0, 110000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (39, N'MDNKTD01', N'Một Đời Như Kẻ Tìm Đường', 149000, 23, 5, N'Hai cuốn sách trước của Giáo sư Phan Văn Trường, Một đời thương thuyết và Một đời quản trị, là sự chắt lọc từ những trải nghiệm trong suốt nhiều năm tháng nghề nghiệp của bản thân. Tuy nhiên, đến với cuốn sách này, tác giả lại muốn dành một khoảng không gian riêng để có thể phản ảnh những cảm nhận cá nhân về cuộc sống, với góc nhìn từ những năm tháng tuổi trẻ cho đến độ tuổi xế chiều này.
<br>
Khoảnh khắc khó chịu nhất có lẽ là khi mình đã lỡ chọn một hướng đi, nhưng ngộ được rằng con đường này nhiều chông gai, lắm rào cản và lại còn không phù hợp. Trong lòng, lúc ấy chỉ muốn được quay trở lại để bắt đầu, để lựa chọn lại một hướng khôn ngoan hơn.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'moi-doi-ke-tim-duong-1.jpg', N'moi-doi-ke-tim-duong-2.jpg', N'moi-doi-ke-tim-duong-3.jpg', N'khu-vuon-ngon-tu-4.jpg', N'moi-doi-ke-tim-duong-5.jpg', 1, 7, 5, N'mot-doi-ke-tim-duong', CAST(N'2021-12-20T21:55:50.917' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (40, N'RLTDPB01', N'Rèn Luyện Tư Duy Phản Biện', 80000, 27, 3, N'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><strong>Thông số chi tiết</strong></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tên nhà cung cấp:</td>
												<td>Nhà xuất bản Kim Đồng</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Koyoharu Goutage</td>
											</tr>
											<tr>
												<td>NXB</td>
												<td>Kim Đồng</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>250</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>19 x 13 cm</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>204</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											<tr>
												<td>Độ tuổi:</td>
												<td>16+</td>
											</tr>
										</tbody>
									</table>', N'ren-luyen-tu-duy-phan-bien.jpg', N'ren-luyen-tu-duy-phan-bien-2.jpg', N'ren-luyen-tu-duy-phan-bien-3.jpg', N'ren-luyen-tu-duy-phan-bien-2.jpg', N'ren-luyen-tu-duy-phan-bien-3.jpg', 1, 1, 5, N'ren-luyen-tu-duy-phan-bien', CAST(N'2021-12-20T22:01:51.123' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (41, N'BMTDTP', N'Bí Mật Tư Duy Triệu Phú (Tái Bản 2021)', 75600, 30, 77, N'Trong cuốn sách này <b>T. Harv Eker </b> sẽ tiết lộ những bí mật tại sao một số người lại đạt được những thành công vượt bậc, được số phận ban cho cuộc sống sung túc, giàu có, trong khi một số người khác phải chật vật, vất vả mới có một cuộc sống qua ngày. Bạn sẽ hiểu được nguồn gốc sự thật và những yếu tố quyết định thành công, thất bại để rồi áp dụng, thay đổi cách suy nghĩ, lên kế hoạch rồi tìm ra cách làm việc, đầu tư, sử dụng nguồn tài chính của bạn theo hướng hiệu quả nhất.

<br><br>
Cuốn sách dành cho những ai còn loay hoay muốn tìm đường đến sự giàu có và thành công. “Bí mật tự duy triệu phú” mang đến nhiều tư duy mới cho người đọc về cách suy nghĩ của người giàu hay cách suy nghĩ để trở nên giàu có.

<br><br>
<b>Bí mật tư duy triệu phú là tác phẩm nổi tiếng thế giới được thời báo New York Times, Wall Street Journal và USB Today bình chọn là cuốn sách hay nhất, bán chạy nhất trong nhiều năm.</b>', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</b></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>BMTDTP</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>T Harv E</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Tổng Hợp TPHCM</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>300</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>287</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'bi-mat-tu-duy-trieu-phu_1.jpg', N'bi_mat_tu_duy_trieu_phu_2.jpg', N'bi_mat_tu_duy_trieu_phu_3.jpg', N'bi_mat_tu_duy_trieu_phu_4.jpg', N'bi-mat-tu-duy-trieu-phu_5.jpg', 1, 3, 3, N'bi-mat-tu-duy-trieu-phu', CAST(N'2023-03-27T19:40:54.640' AS DateTime), 3, NULL, 0, CAST(N'2023-03-28T22:02:29.473' AS DateTime), 3, 108000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (42, N'NGVLG', N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', 77000, 29, 20, N'Nghĩ Giàu & Làm Giàu (Tái Bản) - <i>(Tái bản của cuốn "Cách Nghĩ Để Thành Công")</i>
<br><br>
<b>NGHĨ GIÀU VÀ LÀM GIÀU</b>
<br><br>
Think and Grow Rich - Nghĩ giàu và làm giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.
<br><br>
Tác phẩm này đã giúp tác giả của nó, Napoleon Hill, được tôn vinh bằng danh hiệu “người tạo ra những nhà triệu phú”. Đây cũng là cuốn sách hiếm hoi được đứng trong top của rất nhiều bình chọn theo nhiều tiêu chí khác nhau - bình chọn của độc giả, của giới chuyên môn, của báo chí. Lý do để <b>Think and Grow Rich - Nghĩ giàu và làm giàu</b> có được vinh quang này thật hiển nhiên và dễ hiểu: Bằng việc đọc và áp dụng những phương pháp đơn giản, cô đọng này vào đời sống của mỗi cá nhân mà đã có hàng ngàn người trên thế giới trở thành triệu phú và thành công bền vững.
<br><br>
Điều thú vị nhất là các bí quyết này có thể được hiểu và áp dụng bởi bất kỳ một người bình thường nào, hoạt động trong bất cứ lĩnh vực nào. Qua hơn 70 năm tồn tại, những đúc kết về thành công của Napoleon Hill đến nay vẫn không hề bị lỗi thời, ngược lại, thời gian chính là minh chứng sống động cho tính đúng đắn của những bí quyết mà ông chia sẻ.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>NGVLG</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Napoleon Hill</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Việt Khương</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Tổng Hợp TPHCM</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2020</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>450</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>400</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'nghi-giau-lam-giau-1.jpg', N'nghi-giau-lam-giau-2.jpg', N'nghi-giau-lam-giau-3.jpg', N'nghi-giau-lam-giau-4.jpg', N'nghi-giau-lam-giau-5.jpg', 1, 3, 3, N'nghi-giau-lam-giau', CAST(N'2023-03-28T14:42:48.320' AS DateTime), 3, NULL, 0, CAST(N'2023-03-28T15:02:10.147' AS DateTime), 3, 110000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (43, N'VTSBCF', N'Vị Tu Sĩ Bán Chiếc Ferrari - Tái Bản 2020', 75460, 20, 1, N'<b>Vị tu sĩ bán chiếc Ferrari
<br><br>
Cuốn sách cho những người khát khao theo đuổi đam mê
<br><br>
Vị Tu Sĩ Bán Chiếc Ferarri</b> không phải là một cuốn sách xa lạ, cuốn sách này là một trong những ấn phẩm kinh điển của thế giới về đề tài truyền cảm hứng, theo đuổi lý tưởng sống, và hướng về một cuộc sống hạnh phúc. Đây cũng là cuốn sách đầu tiên mà tác giả, nhà diễn thuyết nổi tiếng thế giới Robin Sharma chấp bút.
<br><br>
Cuốn sách gây được tiếng vang khi xuất bản năm 1997 và bán được hơn 3 triệu bản vào năm 2013.
<br><br>
Từng được xuất bản và bán chạy ở Việt Nam với cái tên Tìm về sức mạnh vô biên, trong lần tái bản này, <b>Vị tu sĩ bán chiếc Ferrari</b> là phiên bản bổ sung, hoàn thiện và tiếp tục là cuốn sách kinh điển về đề tài truyền cảm hứng, theo đuổi lý tưởng sống, hướng tới cuộc sống hạnh phúc của tác giả Robin Sharma.
<br><br>
Ngay từ năm 1997, Vị tu sĩ bán chiếc Ferrari đã nhanh chóng trở thành hiện tượng và nằm trong danh sách best-seller, bán ra hơn 4 triệu bản tại 50 quốc gia trên khắp thế giới. Điều đặc biệt, khi đó Robin Sharma chỉ là một tác giả trẻ chưa có tên tuổi.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>VTSBCF</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Robin Sharma</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Thanh Thảo</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Tổng Hợp TPHCM</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2020</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>275</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14.5 x 1.8 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>264</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'vi-tu-si-ban-chiec-ferrari-1.jpg', N'vi-tu-si-ban-chiec-ferrari-2.jpg', N'vi-tu-si-ban-chiec-ferrari-3.jpg', N'vi-tu-si-ban-chiec-ferrari-4.jpg', N'vi-tu-si-ban-chiec-ferrari-5.jpg', 1, 3, 3, N'vi-tu-si-ban-chiec-ferrari', CAST(N'2023-03-28T22:46:14.913' AS DateTime), 3, NULL, 0, NULL, 0, 0)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (44, N'TLMHKD', N'Tạo Lập Mô Hình Kinh Doanh (Tái Bản)', 239200, 18, 2, N'<b>Tạo Lập Mô Hình Kinh Doanh</b> là cuốn sổ tay dành cho những doanh nhân có khao khát thay đổi, khao khát vươn lên. Qua cuốn sách, bạn sẽ:
<br><br>
- Biết được cách thiết kế và thực hiện có hệ thống mô hình kinh doanh mang tính đột phá - hoặc phân tích và tái tạo một mô hình cũ.
<br><br>
- Hiểu rõ hơn về khách hàng, các kênh phân phối, đối tác, dòng doanh thu, chi phí và giá trị cốt lõi của mình...
<br><br>
<b>Tạo Lập Mô Hình Kinh Doanh</b> mang đến cho bạn những kỹ thuật sáng tạo thiết thực đang được các nhà tư vấn kinh doanh và các công ty hàng đầu thế giới sử dụng. Với đối tượng độc giả mục tiêu là những con người hành động, cuốn sách được thiết kế theo hướng trực quan, dễ hiểu, dễ áp dụng. Cuốn sách dành cho những người sẵn sàng vứt bỏ đường lối tư duy cũ để tiếp nhận những mô hình sáng tạo giá trị mới. Do đó, nó phù hợp với các lãnh đạo, cố vấn và các doanh nhân của mọi tổ chức.
<br><br>
Nếu bạn đã sẵn sàng thay đổi thông lệ, chào mừng bạn đến với <b>Tạo Lập Mô Hình Kinh Doanh!</b>', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>TLMHKD</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>Alpha Books</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Alexander Osterwalder, Yves Pigneur</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Lưu Thị Thanh Huyền</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>Công Thương</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>300</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>24 x 19 x 1.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>288</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'tao-lap-mo-hinh-kinh-doanh-1.jpg', N'tao-lap-mo-hinh-kinh-doanh-2.jpg', N'tao-lap-mo-hinh-kinh-doanh-3.jpg', N'tao-lap-mo-hinh-kinh-doanh-4.jpg', N'tao-lap-mo-hinh-kinh-doanh-5.jpg', 1, 8, 3, N'tao-lap-mo-hinh-kinh-doanh', CAST(N'2023-04-02T10:57:03.210' AS DateTime), 3, NULL, 0, NULL, 0, 299000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (45, N'TTDVD', N'Từ Tốt Đến Vĩ Đại - Jim Collins (Tái Bản 2021)', 104000, 20, 2, N'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề. Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>TTDVD</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Jim Collins</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>500</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>14.5 x 20.5 cm x 2</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>484</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'tu-tot-den-vi-dai-1.jpg', N'tu-tot-den-vi-dai-2.jpg', N'tu-tot-den-vi-dai-3.jpg', N'tu-tot-den-vi-dai-4.jpg', N'tu-tot-den-vi-dai-5.jpg', 1, 7, 3, N'tu-tot-den-vi-dai', CAST(N'2023-04-02T11:10:14.833' AS DateTime), 3, NULL, 0, NULL, 0, 130000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (46, N'NTBHCNDT', N'Nghệ Thuật Bán Hàng Của Người Do Thái', 70400, 40, 2, N'<b>Nghệ thuật bán hàng của người Do Thái - Cuốn sách bán chạy số 1 trên Amazon</b>
<br><br>
<b>Nghệ thuật bán hàng của người Do Thái</b> là những bí quyết marketing và thương thuyết sáng tạo mà diễn giả, "Tiến sĩ Thuyết Phục" Yaniv Zaid đã tích lũy sau nhiều năm nghiên cứu về chủ đề thành công cũng như hoạt động trên thương trường.
<br><br>
Được mệnh danh là "quốc gia khởi nghiệp", Israel là nơi sản sinh ra nhiều doanh nhân thành công trong nhiều lĩnh vực và ở mọi quốc gia. Để làm được điều này, người Do Thái đã tiếp thu và thấm nhuần những triết lý và công cụ để tạo dựng uy tín, xây dựng và duy trì một cộng đồng khách hàng trung thành, thực hiện marketing sáng tạo và tối đa hóa doanh số cho công ty của mình – những phương pháp mà người Do Thái đã áp dụng từ rất lâu. Tất cả những điều này sẽ được tác giả Yaniv Zaid chia sẻ và lý giải trong quyển sách Nghệ thuật bán hàng của người Do Thái.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>NTBHCNDT</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Yaniv Zaid</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Ca Dao, Cẩm Xuân</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Tổng Hợp TPHCM</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2020</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>200</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>184</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'nghe-thuat-ban-hang-cua-nguoi-do-thai-1.jpg', N'nghe-thuat-ban-hang-cua-nguoi-do-thai-2.jpg', N'nghe-thuat-ban-hang-cua-nguoi-do-thai-3.jpg', N'nghe-thuat-ban-hang-cua-nguoi-do-thai-4.jpg', N'nghe-thuat-ban-hang-cua-nguoi-do-thai-5.jpg', 1, 3, 3, N'nghe-thuat-ban-hang-cua-nguoi-do-thai', CAST(N'2023-04-02T11:55:18.527' AS DateTime), 3, NULL, 0, CAST(N'2023-04-02T11:59:19.273' AS DateTime), 3, 88000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (47, N'NQLMCBHVDV', N'Những Quy Luật Mới Của Bán Hàng Và Dịch Vụ', 144000, 41, 2, N'<b>Những Quy Luật Mới Của Bán Hàng Và Dịch Vụ</b>
<br><br>
Bán hàng và dịch vụ đang được tái định nghĩa về cơ bản bởi cuộc cách mạng truyền thông lớn nhất trong lịch sử nhân loại. Trong thế giới định hướng công nghệ ngày nay, nội dung trực tuyến có thể tiếp cận và chinh phục từng khách hàng, thay thế phương pháp tiếp cận đại trà lỗi thời của ngày hôm qua đối với việc bán hàng và dịch vụ. Cuốn sách Những quy luật mới của bán hàng và dịch vụ tiết lộ cách các doanh nhân có thể áp dụng “những quy luật mới” để trực tiếp tiếp cận khách hàng… và làm cho lợi nhuận của mình tăng vọt.
<br><br>
Trong cuốn Những quy luật mới của bán hàng và dịch vụ – David Meerman Scott mô tả chi tiết những công cụ và chiến lược đã được chứng minh mà các nhà lãnh đạo doanh nghiệp có thể sử dụng để kết nối một cách hiệu quả với khách hàng và phát triển tổ chức của mình. Được viết theo phong cách đầy lôi cuốn, cuốn sách khám phá những quy luật mới của bán hàng và dịch vụ, bao gồm: Kỹ thuật kể chuyện xác thực tạo sắc thái cho nội dung để làm mối liên kết giữa công ty và khách hàng. Dữ liệu lớn cho phép một cách tiếp cận khoa học hơn với việc bán hàng và dịch vụ. Bán hàng linh hoạt mang đến những giao dịch mới cho công ty của bạn, và việc kết nối thời gian thực giữ gìn sự hài lòng của khách hàng.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>NQLMCBHVDV</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>David Meerman Scott</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Nguyễn Minh Thiên Kim</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2022</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>430</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>23 x 16 x 1.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>392</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'nhung-quy-luat-moi-cua-ban-hang-va-dich-vu-1.jpg', N'nhung-quy-luat-moi-cua-ban-hang-va-dich-vu-2.jpg', N'nhung-quy-luat-moi-cua-ban-hang-va-dich-vu-3.jpg', N'nhung-quy-luat-moi-cua-ban-hang-va-dich-vu-4.jpg', N'nhung-quy-luat-moi-cua-ban-hang-va-dich-vu-5.jpg', 1, 7, 3, N'nhung-quy-luat-moi-cua-ban-hang-va-dich-vu', CAST(N'2023-04-02T12:20:13.027' AS DateTime), 3, NULL, 0, NULL, 0, 180000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (48, N'12QTLDTS', N'12 Quy Tắc Lãnh Đạo Từ Seal', 148800, 0, 17, N'12 Quy tắc Lãnh đạo từ SEAL<br>
#1 Best seller của New York Times
<br><br>
“Các tác giả này thật mãnh liệt. Và học mang ngọn lửa mãnh liệt ấy vào lời kể của họ trong cuốn sách này. Hãy nghe những sĩ quan SEAL có năng lực điên cuồng này cho bạn biết cách chính xác để tạo dựng một đội nhóm thành công qua những trải nghiệm từ chính họ trong kinh doanh cũng như trong chiến đấu.” <b>- The Hustle</b>
<br><br>
12 quy tắc chiến đấu trên chiến trường của lực lượng SEAL Mỹ đã được các tác giả đúc rút thành những quy tắc ứng dụng vào môi trường kinh doanh. Khi được áp dụng đúng lúc đúng chỗ, những quy tắc đó sẽ mang lại cho bất kỳ đội nhóm hoặc tổ chức nào, trong bất kỳ môi trường hoạt động nào những thắng lợi và phát triển tương tự.
<br><br>
Các tác giả đặc biệt đề cao quy tắc về tinh thần trách nhiệm tối thượng, rằng bất cứ ai đang giữ vị trí lãnh đạo hoặc những người muốn giữ vị trí ấy phải có can đảm và năng lực gánh lấy trách nhiệm về mọi thứ trong thế giới của mình. Họ không thể đổ lỗi cho ai khác ngoài bản thân, từ chấp nhận thất bại, gánh chịu tổn thương đến xây dựng một kế hoạch mới để giành chiến thắng.
<br>
Cuốn sách trả lời phần nào câu hỏi về lãnh đạo lâu nay vẫn được đặt ra, rằng lãnh đạo là năng lực bẩm sinh hoặc do tôi luyện mà thành. Cuốn sách đã tạo ra bước đột phá trong phát triển năng lực lãnh đạo và đặt ra một tiêu chuẩn mới về trách nhiệm trong lãnh đạo.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>12QTLDTS</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>	Nhã Nam</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Jocko Willink, Leif Babin</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Đỗ Trí Vương, Trần Trọng Hải Minh</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Thế Giới</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>500</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>453</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'12-quy-tac-lanh-dao-tu-seal-1.jpg', N'12-quy-tac-lanh-dao-tu-seal-2.jpg', N'12-quy-tac-lanh-dao-tu-seal-3.jpg', N'12-quy-tac-lanh-dao-tu-seal-4.jpg', N'12-quy-tac-lanh-dao-tu-seal-5.jpg', 1, 10, 3, N'12-quy-tac-lanh-dao-tu-seal', CAST(N'2023-04-02T18:27:06.727' AS DateTime), 3, NULL, 0, CAST(N'2023-06-07T11:07:48.557' AS DateTime), 3, 186000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (49, N'TVFTTI', N'Thương Vụ Facebook Thâu Tóm Instagram', 198400, 28, 3, N'Sự thật chưa được tiết lộ về hành trình của Instagram và tham vọng thống trị của Facebook
<br><br>
Được tạp chí kinh doanh Fortune giới thiệu là một trong những “cuốn sách mê hoặc nhất về những tranh đấu ở Thung lũng Silicon”, “Thương vụ Facebook thâu tóm Instagram” (tựa gốc: “No Filter”) của Sarah Frier, phóng viên Bloomberg News, đã cung cấp cho độc giả một câu chuyện sâu sắc và chân thực xoay quanh hành trình phát triển của Instagram.
<br><br>
Với những “tình tiết chưa từng được tiết lộ” từ các nguồn tin độc quyền - trong đó có các nhà sáng lập, nhân viên, giám đốc điều hành và cả người nổi tiếng - cuốn sách này đã cho thấy sức tác động to lớn của Instagram đối với xã hội, mối quan hệ đầy rủi ro giữa chúng ta với công nghệ, cuộc chiến khốc liệt giữa các công ty trong việc tranh giành sự chú ý của người dùng cũng như tham vọng thống trị đáng sợ của Facebook. 
Câu chuyện bắt đầu vào năm 2010 khi Kevin Systrom và Mike Krieger - hai cựu sinh viên Đại học Stanford - ra mắt ứng dụng chia sẻ ảnh Instagram, cho phép người dùng sử dụng các bộ lọc để làm cho những bức ảnh họ chụp trở nên đẹp hơn. Nhờ tận dụng được sự ủng hộ của cộng đồng nghệ sĩ và nhiếp ảnh gia, ứng dụng này nhanh chóng trở nên phổ biến với cả người nổi tiếng lẫn người bình thường.
<br><br>
Bước ngoặt xảy đến khi Instagram được Facebook mua lại với giá 1 tỷ đô-la, “gây rúng động” giới công nghệ vào năm 2012. Kể từ đó, Instagram đã không ngừng chinh phục các cột mốc ấn tượng về số lượng người dùng, cải thiện các tính năng giúp nâng cao trải nghiệm người dùng, tăng doanh thu quảng cáo…
Nhưng cũng từ đó, cuộc đấu tranh với “công ty mẹ” để giữ vững các giá trị văn hóa và đảm bảo lợi ích của người dùng đã kéo dài dai dẳng, cuối cùng kết thúc với sự ra đi của hai nhà sáng lập Instagram. Đây cũng là nội dung cốt lõi của tác phẩm này, được kể từ một góc nhìn “không áp dụng bộ lọc nào ngoài bộ lọc của chính tác giả”.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>TVFTTI</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Sarah Frier</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>Dân Trí</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2023</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>550</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>512</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'thuong-vu-facebook-thau-tom-instagram-1.jpg', N'thuong-vu-facebook-thau-tom-instagram-2.jpg', N'thuong-vu-facebook-thau-tom-instagram-3.jpg', N'thuong-vu-facebook-thau-tom-instagram-4.png', N'thuong-vu-facebook-thau-tom-instagram-5.png', 1, 3, 3, N'thuong-vu-facebook-thau-tom-instagram', CAST(N'2023-04-03T11:00:48.327' AS DateTime), 3, CAST(N'2023-04-03T11:21:36.390' AS DateTime), 3, CAST(N'2023-04-03T11:03:12.753' AS DateTime), 3, 248000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (50, N'TVFTTI', N'Thương Vụ Facebook Thâu Tóm Instagram', 198400, 28, 3, N'Sự thật chưa được tiết lộ về hành trình của Instagram và tham vọng thống trị của Facebook
<br><br>
Được tạp chí kinh doanh Fortune giới thiệu là một trong những “cuốn sách mê hoặc nhất về những tranh đấu ở Thung lũng Silicon”, “Thương vụ Facebook thâu tóm Instagram” (tựa gốc: “No Filter”) của Sarah Frier, phóng viên Bloomberg News, đã cung cấp cho độc giả một câu chuyện sâu sắc và chân thực xoay quanh hành trình phát triển của Instagram.
<br><br>
Với những “tình tiết chưa từng được tiết lộ” từ các nguồn tin độc quyền - trong đó có các nhà sáng lập, nhân viên, giám đốc điều hành và cả người nổi tiếng - cuốn sách này đã cho thấy sức tác động to lớn của Instagram đối với xã hội, mối quan hệ đầy rủi ro giữa chúng ta với công nghệ, cuộc chiến khốc liệt giữa các công ty trong việc tranh giành sự chú ý của người dùng cũng như tham vọng thống trị đáng sợ của Facebook. 
Câu chuyện bắt đầu vào năm 2010 khi Kevin Systrom và Mike Krieger - hai cựu sinh viên Đại học Stanford - ra mắt ứng dụng chia sẻ ảnh Instagram, cho phép người dùng sử dụng các bộ lọc để làm cho những bức ảnh họ chụp trở nên đẹp hơn. Nhờ tận dụng được sự ủng hộ của cộng đồng nghệ sĩ và nhiếp ảnh gia, ứng dụng này nhanh chóng trở nên phổ biến với cả người nổi tiếng lẫn người bình thường.
<br><br>
Bước ngoặt xảy đến khi Instagram được Facebook mua lại với giá 1 tỷ đô-la, “gây rúng động” giới công nghệ vào năm 2012. Kể từ đó, Instagram đã không ngừng chinh phục các cột mốc ấn tượng về số lượng người dùng, cải thiện các tính năng giúp nâng cao trải nghiệm người dùng, tăng doanh thu quảng cáo…
Nhưng cũng từ đó, cuộc đấu tranh với “công ty mẹ” để giữ vững các giá trị văn hóa và đảm bảo lợi ích của người dùng đã kéo dài dai dẳng, cuối cùng kết thúc với sự ra đi của hai nhà sáng lập Instagram. Đây cũng là nội dung cốt lõi của tác phẩm này, được kể từ một góc nhìn “không áp dụng bộ lọc nào ngoài bộ lọc của chính tác giả”.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>TVFTTI</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Sarah Frier</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>Dân Trí</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2023</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>550</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 14.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>512</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'thuong-vu-facebook-thau-tom-instagram-1.jpg', N'thuong-vu-facebook-thau-tom-instagram-2.jpg', N'thuong-vu-facebook-thau-tom-instagram-3.jpg', N'thuong-vu-facebook-thau-tom-instagram-4.png', N'thuong-vu-facebook-thau-tom-instagram-5.png', 1, 3, 3, N'thuong-vu-facebook-thau-tom-instagram', CAST(N'2023-04-03T11:44:52.827' AS DateTime), 3, NULL, 0, NULL, 0, 248000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (51, N'DTNTDP', N'D. Trump - Nghệ Thuật Đàm Phán (Tái Bản 2020)', 87200, 25, 16, N'Quyển sách cho chúng ta thấy cách Trump làm việc mỗi ngày - cách ông điều hành công việc kinh doanh và cuộc sống - cũng như cách ông trò chuyện với bạn bè và gia đình, làm ăn với đối thủ, mua thành công những sòng bạc hàng đầu ở thành phố Atlantic, thay đổi bộ mặt của những cao ốc ở thành phố New York… và xây dựng những tòa nhà chọc trời trên thế giới.
<br><br>
Quyển sách đi sâu vào đầu óc của một doanh nhân xuất sắc và khám phá một cách khoa học chưa từng thấy về cách đàm phán một thương vụ thành công. Đây là một cuốn sách thú vị về đàm phán và kinh doanh – và là một cuốn sách nên đọc cho bất kỳ ai quan tâm đến đầu tư, bất động sản và thành công.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>DTNTDP</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Donald J Trump, Tony Schartz</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Đỗ Trí Vương, Trần Trọng Hải Minh</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2020</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>350</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20 x 14 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>452</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'nghe-thuat-dam-phan-1.jpg', N'nghe-thuat-dam-phan-2.jpg', N'nghe-thuat-dam-phan-3.jpg', N'nghe-thuat-dam-phan-4.jpg', N'nghe-thuat-dam-phan-5.jpg', 1, 7, 3, N'd.trump-nghe-thuat-dam-phan', CAST(N'2023-04-04T23:05:29.953' AS DateTime), 3, NULL, 0, CAST(N'2023-04-04T23:09:03.843' AS DateTime), 3, 109000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (52, N'GTCKTB2021', N'Giàu Từ Chứng Khoán (Tái Bản 2021)', 111200, 32, 3, N'Giàu từ chứng khoán - Bài học từ những nhà kinh doanh chứng khoán thành công nhất mọi thời đại
<br><br>
Người ta luôn nhận ra những nhà đầu tư thành công nhất nhờ những quy tắc và kỹ thuật cụ thể mà họ đã xây dựng và áp dụng thành công. Hãy cùng khám phá những chiến lược đó trong cuốn <b>sách tài chính hấp dẫn</b> được viết vừa dễ hiểu vừa chứa đựng nhiều thông tin mang tính kỹ thuật này.
<br><br>
Sau một thế kỷ với sự tồn tại của mọi loại hình thị trường và mọi hình thái kinh tế, 5 nhà kinh doanh chứng khoán đã xây dựng và hoàn thiện những quy tắc để thành công trên thị trường <i>chứng khoán</i>.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>GTCKTB2021</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>Alpha Books</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>John Boik</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Vũ Việt Hằng</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Lao Động</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>250</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 13 cm x 1.5</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>284</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'giau-tu-chung-khoan-1.jpg', N'giau-tu-chung-khoan-2.jpg', N'giau-tu-chung-khoan-3.jpg', N'giau-tu-chung-khoan-4.jpg', N'giau-tu-chung-khoan-5.jpg', 1, 8, 3, N'giau-tu-chung-khoan', CAST(N'2023-04-04T23:26:44.733' AS DateTime), 3, CAST(N'2023-04-04T23:37:28.093' AS DateTime), 3, NULL, 0, 139000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (53, N'GTCKTB2021', N'Giàu Từ Chứng Khoán (Tái Bản 2021)', 111200, 32, 9, N'Giàu từ chứng khoán - Bài học từ những nhà kinh doanh chứng khoán thành công nhất mọi thời đại
<br><br>
Người ta luôn nhận ra những nhà đầu tư thành công nhất nhờ những quy tắc và kỹ thuật cụ thể mà họ đã xây dựng và áp dụng thành công. Hãy cùng khám phá những chiến lược đó trong cuốn <b>sách tài chính hấp dẫn</b> được viết vừa dễ hiểu vừa chứa đựng nhiều thông tin mang tính kỹ thuật này.
<br><br>
Sau một thế kỷ với sự tồn tại của mọi loại hình thị trường và mọi hình thái kinh tế, 5 nhà kinh doanh chứng khoán đã xây dựng và hoàn thiện những quy tắc để thành công trên thị trường <i>chứng khoán</i>.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>GTCKTB2021</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>Alpha Books</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>John Boik</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Vũ Việt Hằng</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Lao Động</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>250</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 13 cm x 1.5</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>284</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'giau-tu-chung-khoan-1.jpg', N'giau-tu-chung-khoan-2.jpg', N'giau-tu-chung-khoan-3.jpg', N'giau-tu-chung-khoan-4.jpg', N'giau-tu-chung-khoan-5.jpg', 1, 8, 3, N'giau-tu-chung-khoan', CAST(N'2023-04-04T23:39:58.233' AS DateTime), 3, NULL, 0, NULL, 0, 139000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (54, N'CPTLNPT', N'Cổ Phiếu Thường Lợi Nhuận Phi Thường', 159200, 26, 4, N'<b>Cổ Phiếu Thường Lợi Nhuận Phi Thường (Tái Bản)</b>
<br><br>
Philip Fisher là một trong số các nhà đầu tư có ảnh hưởng lớn nhất mọi thời đại. Triết lý đầu tư của ông không chỉ được nhiều chuyên gia hiện đại nghiên cứu và áp dụng mà còn được rất nhiều nhà đầu tư coi đó là cẩm nang dẫn đường cho bản thân. Những triết lý này đã được tập hợp trong cuốn sách nổi tiếng của ông - Cổ phiếu thường, Lợi nhuận phi thường (Common Stocks and Uncommon Profits), một trong những giáo trình đầu tư kinh điển dành cho các nhà đầu tư hiện đại.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>CPTLNPT</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>Alpha Books</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Philip A. Fisher</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Lao Động Xã Hội</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2018</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>430</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>430</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>477</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'co-phieu-thuong-loi-nhuan-phi-thuong-1.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-2.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-3.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-4.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-5.jpg', 1, 8, 3, N'co-phieu-thuong-loi-nhuan-phi-thuong', CAST(N'2023-04-04T23:49:50.790' AS DateTime), 3, CAST(N'2023-04-04T23:54:11.390' AS DateTime), 3, CAST(N'2023-04-04T23:52:33.150' AS DateTime), 3, 199000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (55, N'CPTLNPT', N'Cổ Phiếu Thường Lợi Nhuận Phi Thường', 159200, 24, 33, N'<b>Cổ Phiếu Thường Lợi Nhuận Phi Thường (Tái Bản)</b>
<br><br>
Philip Fisher là một trong số các nhà đầu tư có ảnh hưởng lớn nhất mọi thời đại. Triết lý đầu tư của ông không chỉ được nhiều chuyên gia hiện đại nghiên cứu và áp dụng mà còn được rất nhiều nhà đầu tư coi đó là cẩm nang dẫn đường cho bản thân. Những triết lý này đã được tập hợp trong cuốn sách nổi tiếng của ông - Cổ phiếu thường, Lợi nhuận phi thường (Common Stocks and Uncommon Profits), một trong những giáo trình đầu tư kinh điển dành cho các nhà đầu tư hiện đại.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>CPTLNPT</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>Alpha Books</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Philip A. Fisher</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Lao Động Xã Hội</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2018</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>430</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>430</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>477</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'co-phieu-thuong-loi-nhuan-phi-thuong-1.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-2.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-3.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-4.jpg', N'co-phieu-thuong-loi-nhuan-phi-thuong-5.jpg', 1, 8, 3, N'co-phieu-thuong-loi-nhuan-phi-thuong', CAST(N'2023-04-04T23:55:50.937' AS DateTime), 3, NULL, 0, NULL, 0, 199000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (56, N'SMTTTB2021', N'Sức Mạnh Tiềm Thức (Tái Bản 2021)', 102400, 28, 14, N'Là một trong những quyển sách về nghệ thuật sống nhận được nhiều lời ngợi khen và bán chạy nhất mọi thời đại, <b>Sức Mạnh Tiềm Thức</b> đã giúp hàng triệu độc giả trên thế giới đạt được những mục tiêu quan trọng trong đời chỉ bằng một cách đơn giản là thay đổi tư duy.
<br><br>
<b>Sức Mạnh Tiềm Thức</b> giới thiệu và giải thích các phương pháp tập trung tâm thức nhằm xoá bỏ những rào cản tiềm thức đã ngăn chúng ta đạt được những điều mình mong muốn.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>SMTTTB2021</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>FIRST NEWS</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Joseph Murphyc</td>
        </tr>
	  <tr>
            <td>Người Dịch:</td>
            <td>Bùi Thanh Châu, Mai Sơn</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Tổng Hợp TPHCM</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>370</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 13 cm x 1.5</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>335</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'suc-manh-tiem-thuc-1.jpg', N'suc-manh-tiem-thuc-2.jpg', N'suc-manh-tiem-thuc-3.jpg', N'suc-manh-tiem-thuc-4.jpg', N'suc-manh-tiem-thuc-5.jpg', 1, 3, 3, N'suc-manh-tiem-thuc', CAST(N'2023-04-05T00:10:19.747' AS DateTime), 3, NULL, 0, CAST(N'2023-04-05T00:16:04.743' AS DateTime), 3, 128000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (57, N'TTCMTB2021', N'Trái Tim Của Mẹ (Tái Bản 2021)', 48000, 18, 13, N'“Trái tim của mẹ” là cuốn nhật kí bằng tranh xúc động trên hành trình đồng hành cùng con của một người mẹ. Cuốn sách thuyết phục người đọc bởi những bức tranh vô cùng tinh tế và đẹp mắt cùng câu chuyện cảm động về tình mẫu tử. Nhưng hơn thế, “Trái tim của mẹ” còn gửi gắm một thông điệp xúc động về tình yêu thương: rằng vẻ đẹp của cuộc sống và tình yêu lại thường đến từ những gì bình dị nhất.
<br><br>
Nhà báo Hoài Anh từng chia sẻ: “Cuộc sống cơ bản là những điều đơn giản. Không phải lúc nào người ta cũng đủ năng lượng, cảm hứng, động lực để làm những điều phi thường, vĩ đại. Hãy tìm thấy niềm vui ngay trong những điều bình dị, giản đơn của cuộc sống. Đó cũng là mong muốn của mình khi viết Trái tim của mẹ.”', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>TTCMTB2021</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>NXB Kim Đồng</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Hoài Anh, Đậu Đũa</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Kim Đồng</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2021</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>100</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 20.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>72</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'trai-tim-cua-me-1.jpg', N'trai-tim-cua-me-2.jpg', N'trai-tim-cua-me-3.jpg', N'trai-tim-cua-me-4.jpg', N'trai-tim-cua-me-5.jpg', 1, 1, 9, N'trai-tim-cua-me', CAST(N'2023-04-05T00:28:24.510' AS DateTime), 3, NULL, 0, NULL, 0, 60000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (58, N'DRPNTB2020', N'Đất Rừng Phương Nam (Tái Bản 2020)', 64800, 32, 4, N'Cuộc đời lưu lạc của chú bé An qua những miền đất rừng phương Nam thời kì đầu cuộc kháng chiến chống Pháp. Một vùng đất trù phú, đa dạng, kì vĩ với những kênh rạch, tôm cá, chim chóc, muông thú, lúa gạo... và cây cối, rừng già. Trong thế giới đó có những con người vô cùng nhân hậu như cha mẹ nuôi của bé An, như cậu bé Cò, chú Võ Tòng... cùng những người anh em giàu lòng yêu quê hương, đất nước. Cuộc sống tự do và cuộc đời phóng khoáng cởi mở đã để lại ấn tượng sâu sắc trong tâm khảm người đọc nhiều thế hệ suốt những năm tháng qua', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>DRPNTB2020</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>NXB Kim Đồng</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Đoàn Giỏi</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Kim Đồng</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2020</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>320</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>14.5 x 20.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>304</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'dat-rung-phuong-nam-1.jpg', N'dat-rung-phuong-nam-2.jpg', N'dat-rung-phuong-nam-3.jpg', N'dat-rung-phuong-nam-4.jpg', N'dat-rung-phuong-nam-5.jpg', 1, 1, 9, N'dat-rung-phuong-nam', CAST(N'2023-04-05T00:55:41.800' AS DateTime), 3, NULL, 0, CAST(N'2023-04-05T00:57:50.493' AS DateTime), 3, 82000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (59, N'CTXMVDTT', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 64000, 32, 15, N'Trong Cho tôi xin một vé đi tuổi thơ, nhà văn Nguyễn Nhật Ánh mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>DRPNTB2020</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Nguyễn Nhật Ánh</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>NXB Trẻ</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2018</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>220</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>13 x 20</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>208</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'cho-toi-xin-mot-ve-di-tuoi-tho-1.jpg', N'cho-toi-xin-mot-ve-di-tuoi-tho-2.jpg', N'cho-toi-xin-mot-ve-di-tuoi-tho-3.jpg', N'cho-toi-xin-mot-ve-di-tuoi-tho-4.jpg', N'cho-toi-xin-mot-ve-di-tuoi-tho-5.jpg', 1, 7, 9, N'cho-toi-xin-mot-ve-di-tuoi-tho', CAST(N'2023-04-05T01:04:06.903' AS DateTime), 3, NULL, 0, NULL, 0, 80000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (60, N'DNTTB2021', N'Đắc Nhân Tâm (Tái Bản 2021)', 67080, 30, 12, N'<b>Đắc nhân tâm</b> của Dale Carnegie là quyển sách của mọi thời đại và một hiện tượng đáng kinh ngạc trong ngành xuất bản Hoa Kỳ. Trong suốt nhiều thập kỷ tiếp theo và cho đến tận bây giờ, tác phẩm này vẫn chiếm vị trí số một trong danh mục sách bán chạy nhất và trở thành một sự kiện có một không hai trong lịch sử ngành xuất bản thế giới và được đánh giá là một quyển sách có tầm ảnh hưởng nhất mọi thời đại.
<br><br>
Đây là cuốn sách độc nhất về thể loại self-help sở hữu một lượng lớn người hâm mộ. Ngoài ra cuốn sách có doanh số bán ra cao nhất được tờ báo The New York Times bình chọn trong nhiều năm. Cuốn sách này không còn là một tác phẩm về nghệ thuật đơn thuần nữa mà là một bước thay đổi lớn trong cuộc sống của mỗi người.', N'<table class="table table-bordered">
										<thead>
											<tr>
												<td colspan="2"><b style="">Thông số chi tiết</b></td>
											</tr>
										</thead>
										<tbody>
											<tr><td>Mã sản phẩm:</td><td>DNTTB2021<br></td></tr><tr>
												<td>Tên nhà cung cấp:</td>
												<td>FIRST NEWS</td>
											</tr>
											<tr>
												<td>Tác giả:</td>
												<td>Dale Carnegie</td>
											</tr><tr><td>Người Dịch:</td><td>Nguyễn Văn Phước</td></tr>
											<tr>
												<td>NXB</td>
												<td>NXB Tổng Hợp TPHCM</td>
											</tr>
											<tr>
												<td>Năm XB:</td>
												<td>2021</td>
											</tr><tr><td>Ngôn Ngữ:</td><td>Tiếng Việt</td></tr>
											<tr>
												<td>Trọng lượng:</td>
												<td>350</td>
											</tr>
											<tr>
												<td>Kích thước bao bì:</td>
												<td>20.5 x 14.5 cm x 1.9</td>
											</tr>
											<tr>
												<td>Số trang:</td>
												<td>320</td>
											</tr>
											<tr>
												<td>Hình thức:</td>
												<td>Bìa mềm</td>
											</tr>
											
										</tbody>
									</table>', N'dac-nhan-tam-1.jpg', N'dac-nhan-tam-2.jpg', N'dac-nhan-tam-3.jpg', N'dac-nhan-tam-4.jpg', N'dac-nhan-tam-5.jpg', 1, 3, 2, N'dac-nhan-tam', CAST(N'2023-05-21T00:37:38.287' AS DateTime), 3, NULL, 0, CAST(N'2023-06-07T11:36:01.723' AS DateTime), 3, 86000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (61, N'DVCMQH', N'Đọc Vị Các Mối Quan Hệ', 107100, 30, 8, N'Giống như việc chăm sóc cơ thể mỗi lúc đau ốm, khi mối quan hệ rơi vào “khổ đau”, chúng ta cũng cần phải chăm sóc cho nó. Và Đọc vị các mối quan hệ chính là một cuốn sách tổng hợp các phương pháp chiếu theo tâm lý học sẽ giúp bạn tạo dựng lại các mối quan hệ cá nhân. Thông qua đó, bạn có thể trở thành một người biết chăm sóc cho bản thân, tôn trọng con người thật của đối phương, biết tìm cách giải quyết mâu thuẫn thay vì tránh né, từ chối những việc mình không muốn và mạnh dạn bày tỏ những điều bạn khát khao.', N'
														<table class="table table-bordered">
															<thead>
																<tr>
																	<td colspan="2"><strong>Thông số chi tiết</strong></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Mã sản phẩm:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Tên nhà cung cấp:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Tác giả:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Người Dịch:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>NXB</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Năm XB:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Ngôn Ngữ:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Trọng lượng:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Kích thước bao bì:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Số trang:</td>
																	<td></td>
																</tr>
																<tr>
																	<td>Hình thức:</td>
																	<td></td>
																</tr>
																
															</tbody>
														</table>
													', N'doc-vi-cac-moi-quan-he-1.jpg', N'doc-vi-cac-moi-quan-he-2.jpg', N'doc-vi-cac-moi-quan-he-3.jpg', N'doc-vi-cac-moi-quan-he-4.jpg', N'doc-vi-cac-moi-quan-he-5.jpg', 1, 4, 2, N'doc-vi-cac-moi-quan-he', CAST(N'2023-05-23T23:52:52.267' AS DateTime), 3, NULL, 0, NULL, 0, 119000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (62, N'CAODK', N'Có Ai Ở Đó Không?', 77350, 25, 5, N'<div><b>"CÓ AI Ở ĐÓ KHÔNG" – cuốn sách giúp bạn giải thoát khỏi “giếng sâu” của tâm hồn</b></div><div><br></div><div>Có bao giờ bạn giật mình tỉnh dậy giữa đêm, thảng thốt bật lên tiếng gọi ai đó nhưng chợt nhận ra bản thân chẳng có một ai để cất lên tiếng gọi ấy không?</div><div><br></div><div>Có bao giờ bạn tự mình thụt vào vỏ ốc rồi đắm mình xuống đại dương rộng lớn của cuộc đời, tưởng như muốn trốn tránh hết thảy nhưng sâu thẳm trong tâm hồn vẫn mong chờ một cái nắm tay níu giữ không?</div><div><br></div><div>Cuốn sách mới nhất từ A Crazy Mind là một ấn phẩm mang đầy những câu hỏi như vậy.</div><div><br></div><div>Chủ đề cuốn sách được lấy cảm hứng từ hình ảnh một chiếc giếng không đáy. Chiếc giếng đó được tạo ra ở thẳm sâu trong tâm hồn của mỗi chúng ta.</div><div><br></div><div>Chắc hẳn trong khoảnh khắc nào đó của cuộc đời, ai cũng có những lúc muốn nhảy xuống chiếc giếng không đáy, hay muốn gào thét trong đó mà không hề có tiếng vọng lại, nhưng thẳm sâu trong chúng ta là cần sự thấu hiểu, ít nhất là từ một ai đó - như sự hi vọng có một cái đáy giếng khi chơi vơi trong đó quá lâu, hay là một tiếng vọng lại khi việc thét gào đã quá mỏi mệt.</div><div><br></div><div>Với sự kết hợp của nhiều tác giả trong A Crazy Mind, cuốn sách là tập hợp những câu chuyện lạ mà quen. Mỗi câu chữ đem đến một thế giới riêng, một chiếc giếng riêng của cuộc đời mà cả tất cả chúng ta ai cũng đã ít nhất một lầm gặp phải và song song với đó là cách để ta tìm lối thoát ra khỏi sự chơi vơi không đích đến của chiếc giếng sâu thẳm trong tâm hồn.</div><div><br></div><div>Còn bạn, đã có lúc nào bạn rơi xuống chiếc giếng của mình chưa?</div>', N'
														<table class="table table-bordered">
															<thead>
																<tr>
																	<td colspan="2"><strong>Thông số chi tiết</strong></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Mã sản phẩm:</td>
																	<td><b>CAODK</b></td>
																</tr>
																<tr>
																	<td>Tên nhà cung cấp:</td>
																	<td><a class="xem-chi-tiet" href="https://www.fahasa.com/az-viet-nam?fhs_campaign=ATTRIBUTE_PRODUCT" style="margin: 0px; padding: 0px; background: rgb(255, 255, 255); color: rgb(36, 137, 244); text-decoration-line: none; transition: all 300ms ease-in 0s; font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">AZ Việt Nam</a><span style="font-size: 14.3px;"><br></span></td>
																</tr>
																<tr>
																	<td>Tác giả:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">A Crazy Mind</span></td>
																</tr>
																
																<tr>
																	<td>NXB</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">NXB Thế Giới</span><br></td>
																</tr>
																<tr>
																	<td>Năm XB:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">2021</span><br></td>
																</tr>
																<tr>
																	<td>Ngôn Ngữ:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Tiếng Việt</span><br></td>
																</tr>
																<tr>
																	<td>Trọng lượng:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">200</span></td>
																</tr>
																<tr>
																	<td>Kích thước bao bì:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">20.5 x 13 cm x 1.1</span></td>
																</tr>
																<tr>
																	<td>Số trang:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">200</span></td>
																</tr>
																<tr>
																	<td>Hình thức:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Bìa Mềm</span></td>
																</tr>
																
															</tbody>
														</table>
													', N'co-ai-o-do-khong-1.jpg', N'co-ai-o-do-khong-2.jpg', N'co-ai-o-do-khong-3.jpg', N'co-ai-o-do-khong-4.jpg', N'co-ai-o-do-khong-5.jpg', 1, 4, 2, N'co-ai-o-do-khong', CAST(N'2023-05-24T11:24:23.653' AS DateTime), 3, NULL, 0, CAST(N'2023-06-07T11:52:36.610' AS DateTime), 3, 91000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (63, N'BKCSML', N'Bạn Không Chỉ Sống Một Lần', 83300, 17, 16, N'Cuốn sách “Bạn không chỉ sống một lần” nằm trong bộ sách gồm 2 tập (“Bạn sẽ sống mấy lần?” và “Bạn không chỉ sống một lần”) của Triết Học Đường Phố 2.0 sẽ giúp bạn tìm thấy câu trả lời cho mình về bài học buông bỏ lòng tham, lòng đố kỵ đối với kẻ khác, sự hằn học khi bị cuộc đời trêu đùa.
<br><br>
Con đường của “Bạn không chỉ sống một lần” cho bạn biết được nửa còn lại của những thắc mắc trong lòng nhưng không mang góc nhìn màu hồng ảo tưởng về cuộc đời. Cuốn sách giúp bạn nhận ra một tâm hồn lạc quan cũng có thể chứa đựng những vết sẹo của sự tổn thương, ẩn sau một lối sống tự do là trách nhiệm cá nhân, ẩn sau sự thành công là những thử nghiệm thất bại và ẩn sau ngôi nhà ở nơi “thiên đường” là những cái giá mà một người sẵn sàng phải trả. Để chân thành yêu thương thế giới, bạn phải học cách chữa lành và thấu hiểu chính mình, bạn cần có thời gian để đi sâu và lắng nghe tiếng nói nội tại đang vang vọng trong tiềm thức của bạn. Cuộc sống càng nhiều kích thích, một người sẽ càng trở nên yếu ớt và mệt mỏi.
<br><br>
“Bạn không chỉ sống một lần” đưa ra các góc nhìn mới lạ của những nhà tâm lý học, nhà nghiên cứu nổi tiếng và các tu sĩ nổi tiếng thế giới, giúp bạn tiếp cận những kiến thức khoa học song hành cùng thế giới tâm linh dưới nhiều quan điểm khác nhau. Dẫn lối cho bạn nhận biết con đường tâm linh đúng đắn, hiểu và biết cách sử dụng Luật Hấp Dẫn để chuyển hóa năng lượng hạnh phúc bên trong mình.
<br><br>
Từ đó, bạn nhận ra đừng mong cầu thế giới sẽ an ủi và làm hài lòng bạn, cũng đừng tìm kiếm năng lượng hay hạnh phúc ở bên ngoài xa xôi, hãy dành thời gian để ngắm nhìn nó ở bên trong chính mình. Dựa vào năng lượng nội tại của bạn. Và cội nguồn hạnh phúc không ở đâu xa ngoài trái tim.', N'<table class="table table-bordered">
    <thead>
        <tr>
            <td colspan="2"><b>Thông tin sản phẩm</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Mã sản phẩm:</td>
            <td>BKCSML</td>
        </tr>
        <tr>
            <td>Tên Nhà Cung Cấp:</td>
            <td>AZ Việt Nam</td>
        </tr>
        <tr>
            <td>Tác giả:</td>
            <td>Triết Học Đường Phố 2.0</td>
        </tr>
        <tr>
            <td>NXB:</td>
            <td>Phụ Nữ Việt Nam</td>
        </tr>
        <tr>
            <td>Năm XB:</td>
            <td>2022</td>
        </tr>
        <tr>
            <td>Ngôn Ngữ:</td>
            <td>Tiếng Việt</td>
        </tr>
        <tr>
            <td>Trọng lượng (gr):</td>
            <td>250</td>
        </tr>
	  <tr>
            <td>Kích Thước Bao Bì:</td>
            <td>20.5 x 13.5 cm</td>
        </tr>
	  <tr>
            <td>Số trang:</td>
            <td>240</td>
        </tr>
	  <tr>
            <td>Hình thức:</td>
            <td>Bìa Mềm</td>
        </tr>
    </tbody>
</table>', N'ban-khong-chi-song-mot-lan-1.jpg', N'ban-khong-chi-song-mot-lan-2.jpg', N'ban-khong-chi-song-mot-lan-3.jpg', N'ban-khong-chi-song-mot-lan-4.jpg', N'ban-khong-chi-song-mot-lan-5.jpg', 1, 4, 2, N'ban-khong-chi-song-mot-lan', CAST(N'2023-05-25T20:11:43.587' AS DateTime), 3, NULL, 0, NULL, 0, 98000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (74, N'CBTTH', N'Cùng Bạn Trưởng Thành', 71200, 14, 11, N'<div class="product_view_tab_content_ad" style="margin: 0px; padding: 0px; overflow: hidden; max-height: 600px; color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 13px;"><div id="product_tabs_description_contents" style="margin: 20px 0px 0px; padding: 0px; line-height: 25px;"><div id="desc_content" class="std" style="margin: 0px; padding: 0px;"><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;">Cùng Bạn Trưởng Thành</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;"><strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"><em style="margin: 0px; padding: 0px;">“CÙNG BẠN TRƯỞNG THÀNH” -&nbsp;</em></strong>Cuốn sách lan tỏa đến bạn thông điệp “Không ngừng học tập, không ngừng nỗ lực” trên con đường khẳng định chính mình.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;">Nếu bạn đang tìm kiếm một người bạn đồng hành trong việc học tập ngoại ngữ và phát triển bản thân thì cuốn sách&nbsp;<strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"><em style="margin: 0px; padding: 0px;">“Cùng bạn trưởng thành”</em></strong>&nbsp;chắc chắn là cuốn sách dành cho bạn. Đúng như tên gọi của nó, cuốn sách sẽ là người bạn sát cánh bên bạn mỗi ngày, ngoài ra còn truyền tải cảm hứng và thông điệp sống tích cực thông qua những trích dẫn ngắn&nbsp;<strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">song ngữ Trung - Việt</strong>, qua đó bạn có thể vừa trau dồi thêm kiến thức mới, vừa làm mới thế giới nội tâm của bản thân. Với ngoại hình nhỏ gọn và vô cùng xinh xắn, bạn cũng có thể dễ dàng sách mang theo bên mình để cuốn sách trở thành bạn đồng hành không thể thiếu trong cuộc sống và có thể thưởng thức bất cứ lúc nào bạn rảnh rỗi.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;"><em style="margin: 0px; padding: 0px;">“Mỗi một việc mà bạn đang cố gắng làm, chắc chắn sẽ đơm hoa kết trái vào những ngày tháng sau này”</em>&nbsp;- Hi vọng đây sẽ là cuốn sách “kim chỉ nam” giúp bạn ngày một hoàn thiện bản thân, mạnh mẽ trưởng thành, làm một phiên bản chính mình hoàn hảo nhất.</p><div class="clear" style="margin: 0px; padding: 0px; clear: both; font-size: 1em;"></div></div></div></div><div class="clear" style="margin: 0px; padding: 0px; clear: both; color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 13px;"></div><div style="margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 13px; overflow-y: hidden;"><div class="product_view_tab_content_ad_more" style="margin: -600px 0px 0px; padding: 0px;"><div class="product_view_tab_content_additional" style="margin: 0px; padding: 0px; border-bottom: 1px solid rgb(193, 193, 193);"><table class="data-table table-additional" style="margin: 10px 0px; padding: 0px; border-spacing: 0px; max-width: 100%; background: transparent; border: none; empty-cells: show; width: 1200px; box-shadow: none;"><colgroup style="margin: 0px; padding: 0px;"><col width="25%" style="margin: 0px; padding: 0px;"><col style="margin: 0px; padding: 0px;"></colgroup><tbody style="margin: 0px; padding: 0px;"><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Mã hàng</th><td class="data_sku" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">8935325009846</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Tên Nhà Cung Cấp</th><td class="data_supplier" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;"><a class="xem-chi-tiet" href="https://www.fahasa.com/az-viet-nam?fhs_campaign=ATTRIBUTE_PRODUCT" style="margin: 0px; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(36, 137, 244); transition: all 300ms ease-in 0s;">AZ Việt Nam</a></td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Tác giả</th><td class="data_author" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">Ying Shu</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">NXB</th><td class="data_publisher" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">Dân Trí</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Năm XB</th><td class="data_publish_year" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">2022</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Trọng lượng (gr)</th><td class="data_weight" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">250</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Kích Thước Bao Bì</th><td class="data_size" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">15 x 10 cm</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Số trang</th><td class="data_qty_of_page" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">216</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Hình thức</th><td class="data_book_layout" style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;">Bìa Mềm</td></tr><tr style="margin: 0px; padding: 0px;"><th class="table-label" style="margin: 0px; padding: 4px; text-align: left; vertical-align: baseline; border: none; line-height: 1.6; text-wrap: nowrap; color: rgb(119, 119, 119); font-size: 1.1em;">Sản phẩm bán chạy nhất</th><td style="margin: 0px; padding: 4px; vertical-align: top; border: none; font-size: 1.1em;"><a href="https://www.fahasa.com/sach-trong-nuoc/tam-ly-ky-nang-song/ky-nang-song.html?order=num_orders_month" style="margin: 0px; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(36, 137, 244); transition: all 300ms ease-in 0s; font-size: 14px;">Top 100 sản phẩm Kỹ năng sống bán chạy của tháng</a></td></tr><tr style="margin: 0px; padding: 0px;"><td colspan="2" style="margin: 0px; padding: 0px; vertical-align: top; border: none; font-size: 1.1em;">Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...</td></tr></tbody></table></div><div class="clear" style="margin: 0px; padding: 0px; clear: both;"></div><div id="product_tabs_description_contents" style="margin: 20px 0px 0px; padding: 0px; line-height: 25px;"><div id="desc_content" class="std" style="margin: 0px; padding: 0px;"><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;">Cùng Bạn Trưởng Thành</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;"><strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"><em style="margin: 0px; padding: 0px;">“CÙNG BẠN TRƯỞNG THÀNH” -&nbsp;</em></strong>Cuốn sách lan tỏa đến bạn thông điệp “Không ngừng học tập, không ngừng nỗ lực” trên con đường khẳng định chính mình.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;">Nếu bạn đang tìm kiếm một người bạn đồng hành trong việc học tập ngoại ngữ và phát triển bản thân thì cuốn sách&nbsp;<strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;"><em style="margin: 0px; padding: 0px;">“Cùng bạn trưởng thành”</em></strong>&nbsp;chắc chắn là cuốn sách dành cho bạn. Đúng như tên gọi của nó, cuốn sách sẽ là người bạn sát cánh bên bạn mỗi ngày, ngoài ra còn truyền tải cảm hứng và thông điệp sống tích cực thông qua những trích dẫn ngắn&nbsp;<strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">song ngữ Trung - Việt</strong>, qua đó bạn có thể vừa trau dồi thêm kiến thức mới, vừa làm mới thế giới nội tâm của bản thân. Với ngoại hình nhỏ gọn và vô cùng xinh xắn, bạn cũng có thể dễ dàng sách mang theo bên mình để cuốn sách trở thành bạn đồng hành không thể thiếu trong cuộc sống và có thể thưởng thức bất cứ lúc nào bạn rảnh rỗi.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; text-align: justify;"><em style="margin: 0px; padding: 0px;">“Mỗi một việc mà bạn đang cố gắng làm, chắc chắn sẽ đơm hoa kết trái vào những ngày tháng sau này”</em>&nbsp;- Hi vọng đây sẽ là cuốn sách “kim chỉ nam” giúp bạn ngày một hoàn thiện bản thân, mạnh mẽ trưởng thành, làm một phiên bản chính mình hoàn hảo nhất.</p></div></div></div></div>', N'<table class="table table-bordered">
															<thead>
																<tr>
																	<td colspan="2"><b>Thông số chi tiết</b></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Mã sản phẩm:</td><td><b>CBTTH</b></td>
																</tr>
																<tr>
																	<td>Tên nhà cung cấp:</td>
																	<td><a class="xem-chi-tiet" href="https://www.fahasa.com/az-viet-nam?fhs_campaign=ATTRIBUTE_PRODUCT" style="margin: 0px; padding: 0px; background: rgb(255, 255, 255); color: rgb(36, 137, 244); text-decoration-line: none; transition: all 300ms ease-in 0s; font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">AZ Việt Nam</a><br></td>
																</tr>
																<tr>
																	<td>Tác giả:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Ying Shu</span><br></td>
																</tr>
																
																<tr>
																	<td>NXB</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Dân Trí</span><br></td>
																</tr>
																<tr>
																	<td>Năm XB:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">2022</span><br></td>
																</tr>
																
																<tr>
																	<td>Trọng lượng:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">250</span><br></td>
																</tr>
																<tr>
																	<td>Kích thước bao bì:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">15 x 10 cm</span><br></td>
																</tr>
																<tr>
																	<td>Số trang:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">216</span><br></td>
																</tr>
																<tr>
																	<td>Hình thức:</td>
																	<td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Bìa Mềm</span><br></td>
																</tr>
																
															</tbody>
														</table>', N'cung-ban-truong-thanh-1.jpg', N'cung-ban-truong-thanh-2.jpg', N'cung-ban-truong-thanh-3.jpg', N'cung-ban-truong-thanh-4.png', N'cung-ban-truong-thanh-5.png', 1, 4, 2, N'cung-ban-truong-thanh', CAST(N'2023-05-26T20:53:31.550' AS DateTime), 3, NULL, 0, CAST(N'2023-06-07T11:45:58.180' AS DateTime), 3, 89000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (75, N'DNDND', N'Đời Ngắn Đừng Ngủ Dài (Tái Bản 2018)', 60000, 10, 53, N'<p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; text-align: justify;"><font color="#333333" face="Arial"><span style="font-size: 13px;">“Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải theo cách của ta. Hãy kiên nhẫn. Tin tưởng. Hãy giống như người thợ cắt đá, đều đặn từng nhịp, ngày qua ngày. Cuối cùng, một nhát cắt duy nhất sẽ phá vỡ tảng đá và lộ ra viên kim cương. Người tràn đầy nhiệt huyết và tận tâm với việc mình làm không bao giờ bị chối bỏ. Sự thật là thế.”</span></font></p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; text-align: justify;"><font color="#333333" face="Arial"><span style="font-size: 13px;">Bằng những lời chia sẻ thật ngắn gọn, dễ hiểu về những trải nghiệm và suy ngẫm trong đời, Robin Sharma tiếp tục phong cách viết của ông từ cuốn sách Điều vĩ đại đời thường để mang đến cho độc giả những bài viết như lời tâm sự, vừa chân thành vừa sâu sắc.</span></font></p>', N'<p><b>Thông tin sản phẩm</b><br></p><table class="table table-bordered"><tbody><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Mã hàng</span><b><br></b></td><td><b>DNDND</b><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Tên Nhà Cung Cấp</span><br></td><td><a class="xem-chi-tiet" href="https://www.fahasa.com/nxb-tre?fhs_campaign=ATTRIBUTE_PRODUCT" style="margin: 0px; padding: 0px; background: rgb(255, 255, 255); color: rgb(36, 137, 244); text-decoration-line: none; transition: all 300ms ease-in 0s; font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">NXB Trẻ</a><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Tác giả</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Robin Sharma</span><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">NXB</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">NXB Trẻ</span><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Năm XB</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">2018</span><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Trọng lượng (gr)</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">250</span><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Kích Thước Bao Bì</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">13 x 20.5</span><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Số trang</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">228</span><br></td></tr><tr><td><span style="color: rgb(119, 119, 119); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px; text-wrap: nowrap;">Hình thức</span><br></td><td><span style="color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; font-size: 14.3px;">Bìa Mềm</span><br></td></tr></tbody></table><p><br></p>', N'doi-ngan-dung-ngu-dai-1.jpg', N'doi-ngan-dung-ngu-dai-2.jpg', N'doi-ngan-dung-ngu-dai-3.jpg', N'doi-ngan-dung-ngu-dai-4.jpg', N'doi-ngan-dung-ngu-dai-5.jpg', 1, 7, 2, N'doi-ngan-dung-ngu-dai', CAST(N'2023-05-26T21:45:45.610' AS DateTime), 3, NULL, 0, CAST(N'2023-06-07T11:33:15.930' AS DateTime), 3, 75000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (76, N'TDBTB2022', N'Trên Đường Băng (Tái Bản 2022)', 78750, 15, 55, N'TRÊN ĐƯỜNG BĂNG là cuốn sách tập hợp những bài viết truyền cảm hứng và hướng dẫn kỹ năng cho các bạn trẻ khi chuẩn bị bước vào đời.', N'
														<table class="table table-bordered">
															<thead>
																<tr>
																	<td colspan="2"><b>Thông số chi tiết</b></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Mã sản phẩm:</td>
																	<td>TDBTB2022<br></td>
																</tr>
																<tr>
																	<td>Tên nhà cung cấp:</td>
																	<td>NXT Trẻ</td>
																</tr>
																<tr>
																	<td>Tác giả:</td>
																	<td>Tony Buổi Sáng<br></td>
																</tr>
																
																<tr>
																	<td>NXB</td>
																	<td>Trẻ</td>
																</tr>
																<tr>
																	<td>Năm XB:</td>
																	<td>2022</td>
																</tr>
																<tr>
																	<td>Ngôn Ngữ:</td>
																	<td>Tiếng Việt</td>
																</tr>
																<tr>
																	<td>Trọng lượng:</td>
																	<td>350</td>
																</tr>
																<tr>
																	<td>Kích thước bao bì:</td>
																	<td>20 x 13 cm</td>
																</tr>
																<tr>
																	<td>Số trang:</td>
																	<td>308</td>
																</tr>
																<tr>
																	<td>Hình thức:</td>
																	<td>Bìa Mềm</td>
																</tr>
																
															</tbody>
														</table>
													', N'tren-duong-bang-1.jpg', N'tren-duong-bang-2.jpg', N'tren-duong-bang-3.jpg', N'tren-duong-bang-4.jpg', N'tren-duong-bang-5.jpg', 1, 7, 2, N'tren-duong-bang', CAST(N'2023-05-26T21:53:00.843' AS DateTime), 3, NULL, 0, CAST(N'2023-06-07T11:13:22.337' AS DateTime), 3, 105000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (77, N'CSFTS-TTNC', N'Chicken Soup For The Soul - Trái Tim Người Cha', 64600, 15, 50, N'<p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; text-align: justify;"><strong style="margin: 0px; padding: 0px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Chicken Soup For The Soul - Trái Tim Người Cha (Tái Bản 2022)</strong><br style="margin: 0px; padding: 0px;"><br style="margin: 0px; padding: 0px;">Tình mẹ - suối nguồn ấm áp, dịu dàng, nuôi dưỡng, vỗ về&nbsp; tâm hồn chúng ta với tình yêu thương vô điều kiện. Ngược lại, tình cha gợi nên một hình tượng vững vàng, đáng tin cậy hơn của một người bảo vệ, tin yêu; người mang lại sự hiểu biết và sức mạnh cho con trẻ. Những câu chuyện trong cuốn sách này viết về tình yêu thương của người cha dành cho con, về hình ảnh người cha với nhiều cung bậc tình cảm khác nhau; nhưng có một điểm chung là: tất cả đều gây xúc động và truyền cảm hứng thật sự đến người đọc.</p><p style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 1em; color: rgb(51, 51, 51); font-family: nunito-sans, sans-serif, Helvetica, Arial; text-align: justify;">Mỗi câu chuyện là một thông điệp có thể hàn gắn vết thương, làm thay đổi suy nghĩ, tâm hồn và đôi khi, cả cuộc đời bạn. Hy vọng rằng những câu chuyện này sẽ làm nên sự khác biệt, mang lại nguồn cảm hứng vô tận cho bạn. Một khi đã được truyền cảm hứng, bạn đều có thể đem đến những điều tốt đẹp cho bạn thân mình và những người xung quanh.</p>
													', N'
														<table class="table table-bordered">
															<thead>
																<tr>
																	<td colspan="2"><b>Thông số chi tiết</b></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Mã sản phẩm:</td>
																	<td>CSFTS-TTNC</td>
																</tr>
																<tr>
																	<td>Tên nhà cung cấp:</td>
																	<td>FIRST NEWS</td>
																</tr>
																<tr>
																	<td>Tác giả:</td>
																	<td>Jack Canfield, Mark Victor</td>
																</tr>
																
																<tr>
																	<td>NXB</td>
																	<td>Tổng Hợp Thành Phố Hồ Chí Minh</td>
																</tr>
																<tr>
																	<td>Năm XB:</td>
																	<td>2022</td>
																</tr>
																<tr>
																	<td>Ngôn Ngữ:</td>
																	<td>Tiếng Việt</td>
																</tr>
																<tr>
																	<td>Trọng lượng:</td>
																	<td>177</td>
																</tr>
																<tr>
																	<td>Kích thước bao bì:</td>
																	<td><p>20.5 x 13 x 0.9 cm</p></td>
																</tr>
																<tr>
																	<td>Số trang:</td>
																	<td>175</td>
																</tr>
																<tr>
																	<td>Hình thức:</td>
																	<td>Bìa Mềm</td>
																</tr>
																
															</tbody>
														</table>
													', N'trai-tim-nguoi-cha-1.jpg', N'trai-tim-nguoi-cha-2.jpg', N'trai-tim-nguoi-cha-3.jpg', N'trai-tim-nguoi-cha-4.jpg', N'trai-tim-nguoi-cha-5.jpg', 1, 3, 2, N'chicken-soup-for-the-soul-trai-tim-nguoi-cha', CAST(N'2023-05-27T00:01:46.317' AS DateTime), 3, NULL, 0, NULL, 0, 76000)
INSERT [dbo].[Products] ([Id], [Code], [Name], [Price], [Quality], [Views], [Description], [Specification], [Image1], [Image2], [Image3], [Image4], [Image5], [Active], [Manu_Id], [Cate_Id], [NameSearch], [CreateDay], [PersonCreate], [DeleteDay], [PersonDelete], [UpdateDay], [PersonUpdate], [Sales]) VALUES (78, N'GTHPTB2021', N'Gieo Trồng Hạnh Phúc (Tái Bản 2021)', 62300, 9, 42, N'<div>Chánh Niệm là nguồn năng lượng tỉnh thức đưa ta trở về với giây phút hiện tại và giúp ta tiếp xúc sâu sắc với sự sống trong mỗi phút giây của đời sống hằng ngày. Chúng ta không cần phải đi đâu xa để thực tập chánh niệm. Chúng ta có thể thực tập chánh niệm ngay trong phòng mình hoặc trên đường đi từ nơi này đến nơi khác. Ta vẫn có thể tiếp tục làm những công việc ta thường làm hằng ngày như đi, đứng, nằm, ngồi, làm việc, ăn, uống, giao tiếp, chuyện trò… nhưng với ý thức là mình đang làm những công việc ấy.</div><div><br></div><div>Hãy tưởng tượng ta đang ngắm mặt trời mọc với một số người. Trong khi những người khác đang thưởng thức khung cảnh đẹp đẽ ấy thì ta lại “bận rộn” với những thứ trong đầu mình. Ta bận rộn và lo lắng cho những kế hoạch của ta. Ta nghĩ về quá khứ hoặc tương lai mà không thực sự có mặt để trân quý cơ hội đó. Thay vì thưởng thức cảnh đẹp của buổi bình minh, ta lại để cho những khoảnh khắc quý giá ấy trôi qua oan uổng.</div><div><br></div><div>Nếu quả thực như vậy, ta có thể sử dụng một phương pháp khác. Mỗi khi tâm ta đi lang thang thì ta kéo tâm về và tập trung tâm ý vào hơi thở vào – ra. Thực tập hơi thở ý thức giúp ta trở về với giây phút hiện tại. Thân tâm hợp nhất, ta sẽ có mặt trọn vẹn để ngắm nhìn, quán chiếu và thưởng thức khung cảnh đẹp đẽ ấy. Bằng cách trở về với hơi thở, ta lấy lại được sự mầu nhiệm của buổi bình minh.</div><div><br></div><div>Chúng ta thường quá bận rộn đến nỗi quên mình đang làm gì, hoặc có khi ta quên mình là ai. Thậm chí có người quên mất là mình đang thở. Ta quên nhìn những người thương của ta và trân quý sự có mặt của họ, cho đến một ngày họ đi xa hay qua đời ta mới thấy hối tiếc. Có khi rảnh rỗi đi nữa, ta cũng không biết cách tiếp xúc với những gì đang xảy ra trong ta. Vì vậy ta mở ti vi lên xem hoặc nhấc điện thoại gọi cho ai đó. Ta nghĩ làm như thế là ta có thể trốn thoát được chính mình.</div><div><br></div><div>Ý thức về hơi thở là tinh yếu của chánh niệm. Theo lời Bụt dạy, chánh niệm là nguồn suối phát sinh hỷ lạc. Hạt giống chánh niệm có trong mỗi chúng ta nhưng thường thì ta quên tưới tẩm hạt giống đó. Nếu biết cách nương vào hơi thở, nương vào bước chân của mình, chúng ta có thể tiếp xúc được với những hạt giống an lành ấy và cho phép chúng biểu hiện. Thay vì nương vào những ý niệm trừu tượng về Bụt, về Chúa hoặc về Allah, chúng ta có thể tiếp xúc được với Bụt, với Chúa trong từng hơi thở và bước chân của mình.</div><div><br></div><div>Điều này nghe có vẻ dễ dàng và ai cũng có thể làm được, tuy nhiên đòi hỏi ở chúng ta một sự tập luyện. Quan trọng là tập dừng lại. Dừng lại như thế nào? Dừng lại bằng hơi thở vào ra và bước chân của mình. Vì vậy pháp môn căn bản của chúng ta là hơi thở ý thức và bước chân chánh niệm. Nếu nắm vững những pháp môn này, chúng ta có thể ăn, uống, nấu nướng, làm việc, lái xe… trong chánh niệm. Và chúng ta luôn luôn an trú trong giây phút hiện tại, bây giờ ở đây.</div><div><br></div><div>Thực tập chánh niệm (smrti) đưa đến định (samadhi) và định đưa đến tuệ (prajna). Tuệ giác mà ta đạt được từ sự thực tập chánh niệm có khả năng giải phóng chúng ta ra khỏi những tình trạng sợ hãi, lo âu, tuyệt vọng và đem lại hạnh phúc đích thực cho ta. Chúng ta có thể sử dụng những đối tượng đơn giản như bông hoa để thực tập chánh niệm. Khi cầm bông hoa trong tay, chúng ta ý thức về bông hoa. Hơi thở vào ra giúp ta duy trì ý thức. Thay vì để cho những suy nghĩ trấn ngự hoặc lôi kéo, ta trở về có mặt cho bông hoa và thưởng thức vẻ đẹp của bông hoa. Định lực sẽ trở thành nguồn suối phát sinh niềm vui trong ta.</div><div><br></div><div>Để thưởng thức trọn vẹn những món quà mà cuộc sống ban tặng, chúng ta phải thực tập chánh niệm trong mọi lúc, mọi nơi dù đang đánh răng, chuẩn bị thức ăn sáng hay lái xe đi làm. Mỗi bước chân, mỗi hơi thở có thể là một cơ hội đem đến cho ta niềm vui và hạnh phúc. Cuộc sống đầy dẫy khổ đau. Nếu không đủ hạnh phúc, ta sẽ không chăm sóc được nỗi khổ đau và tuyệt vọng của mình. Chúng ta hãy thực tập với tinh thần nhẹ nhàng thư thái, với tâm hồn rộng mở bao la và với một trái tim sẵn sàng lắng nghe, chấp nhận. Thực tập là để nuôi lớn hiểu biết chứ không phải để phô trương hình thức. Có chánh niệm, ta có thể nuôi lớn được niềm vui trong ta, giúp ta xử lý tốt hơn những khó khăn thách thức trong cuộc sống và biết cách chế tác tự do, an lạc, thương yêu trong mỗi chúng ta.</div>', N'
														<table class="table table-bordered">
															<thead>
																<tr>
																	<td colspan="2"><b>Thông tin sản phẩm</b></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Mã sản phẩm:</td>
																	<td>GTHPTB2021</td>
																</tr>
																<tr>
																	<td>Tên nhà cung cấp:</td>
																	<td>Thái Hà</td>
																</tr>
																<tr>
																	<td>Tác giả:</td>
																	<td>Thích Nhất Hạnh</td>
																</tr>
																<tr>
																	<td>Người Dịch:</td>
																	<td>Chân Hội Nghiêm, Chân Duyệt Nghiêm</td>
																</tr>
																<tr>
																	<td>NXB</td>
																	<td>NXB Lao Động</td>
																</tr>
																<tr>
																	<td>Năm XB:</td>
																	<td>2021</td>
																</tr>
																
																<tr>
																	<td>Trọng lượng:</td>
																	<td>250</td>
																</tr>
																<tr>
																	<td>Kích thước bao bì:</td>
																	<td>20.5 x 13 cm</td>
																</tr>
																<tr>
																	<td>Số trang:</td>
																	<td>279</td>
																</tr>
																<tr>
																	<td>Hình thức:</td>
																	<td>Bìa Mềm</td>
																</tr>
																
															</tbody>
														</table>
													', N'gieo-trong-hanh-phuc-1.jpg', N'gieo-trong-hanh-phuc-2.jpg', N'gieo-trong-hanh-phuc-3.jpg', N'gieo-trong-hanh-phuc-4.jpg', N'gieo-trong-hanh-phuc-5.jpg', 1, 2, 2, N'gieo-trong-hanh-phuc', CAST(N'2023-06-04T23:35:39.727' AS DateTime), 3, NULL, 0, CAST(N'2023-06-04T23:59:33.877' AS DateTime), 3, 89000)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'ROLE_USER')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'ROLE_ADMIN')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'ROLE_DIRECTOR')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Role] ON 

INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1, 1, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (2, 2, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (3, 3, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1024, 39, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1025, 40, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1026, 41, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1027, 42, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1030, 45, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1031, 46, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1032, 47, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1033, 48, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1034, 49, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1035, 50, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1036, 51, 3)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1037, 1052, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1038, 1053, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1039, 1057, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1040, 1058, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (1041, 1059, 2)
SET IDENTITY_INSERT [dbo].[User_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1, N'khoahoang333@gmail.com', N'1234567', N'Nguyen Anh Phu', 0, NULL, 0, CAST(N'2021-09-09T11:52:28.310' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (2, N'phunahcmute@gmail.com', N'1234567', N'Nguyen Anh Phu', 1, CAST(N'2001-09-06' AS Date), 1, CAST(N'2021-09-09T12:04:33.607' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (3, N'19110429@student.hcmute.edu.vn', N'1234567', N'Nguyễn Thị Phú', 0, CAST(N'2001-08-17' AS Date), 0, CAST(N'2021-09-10T10:14:19.630' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (39, N'khoahoang123@gmail.com', N'1234567', N'Trinh Khanh', 0, NULL, 0, CAST(N'2021-09-16T11:52:00.997' AS DateTime), CAST(N'2023-05-25T19:05:56.077' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (40, N'khoahoang@gmail.com', N'1234567', N'Trinh Khanh', 0, NULL, 0, CAST(N'2021-09-16T11:53:18.593' AS DateTime), CAST(N'2021-09-17T06:24:51.960' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (41, N'tennv@gmail.com', N'1234567', N'Trinh Khanh', 0, NULL, 0, CAST(N'2021-09-17T19:08:26.167' AS DateTime), CAST(N'2023-05-25T19:06:04.397' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (42, N'lethimanchin123@fpt.edu.vn', N'1234567', N'Lê Thị Mận', 0, NULL, 0, CAST(N'2021-09-17T19:13:14.837' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (45, N'america123@gmail.com', N'1234567', N'Captain America', 0, NULL, 0, CAST(N'2021-09-17T19:17:31.787' AS DateTime), CAST(N'2023-05-25T19:05:44.063' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (46, N'dasdadas@gmail.com', N'1234567', N'asdadasda', 0, NULL, 0, CAST(N'2021-09-17T19:18:08.257' AS DateTime), CAST(N'2023-05-25T19:05:50.430' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (47, N'123@gmail.com', N'1234567', N'dfsfsadsada123', 0, NULL, 0, CAST(N'2021-09-17T19:18:31.427' AS DateTime), CAST(N'2021-09-17T19:22:53.700' AS DateTime), 39)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (48, N'khoahoangyahoo123@gmail.com', N'1234567', N'Trinh Khanh', 0, NULL, 0, CAST(N'2021-09-17T19:19:09.147' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (49, N'234@gmail.com', N'1234567', N'dasdadadsaa', 0, NULL, 0, CAST(N'2021-09-17T19:21:32.937' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (50, N'khoapham@gmail.com', N'1234567', N'fytytyrtrt', 0, NULL, 0, CAST(N'2021-09-17T19:21:57.880' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (51, N'asdasda@gmail.com', N'1234567', N'rrwerwrw', 0, NULL, 0, CAST(N'2021-09-17T19:23:43.470' AS DateTime), CAST(N'2023-05-25T19:05:47.887' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1052, N'cuonglvps12556@fpt.edu.vn', N'1234567', N'Trinh Khanh', 1, CAST(N'2021-12-09' AS Date), 0, CAST(N'2021-10-09T09:33:22.903' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1053, N'tuanpmps12603@fpt.edu.vn', N'1234567', N'pham minh tuan', 0, NULL, 0, CAST(N'2021-10-29T14:13:25.923' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1055, N'demo@gmail.com', N'1234567', N'Trinh Khanh', 0, CAST(N'1900-01-01' AS Date), 0, CAST(N'2021-12-16T21:16:40.170' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1056, N'demo2@gmail.com', N'1234567', N'HaHaHaHa', 1, CAST(N'2021-12-16' AS Date), 1, CAST(N'2021-12-16T21:17:54.607' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1057, N'nguyenanhphu692001@gmail.com', N'1234567', N'Nguyễn Thị Phú', 0, NULL, 1, CAST(N'2023-06-25T01:08:06.220' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1058, N'trinhngockhanhvirgo@gmail.com', N'1234567', N'Ngọc Khánh', 1, CAST(N'2001-08-31' AS Date), 0, CAST(N'2023-07-03T08:31:18.087' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FullName], [Sex], [Birthday], [Subscribe], [CreateDay], [DeleteDay], [PersonDelete]) VALUES (1059, N'phunguyenute@gmail.com', N'1234567', N'Phú Thị', 0, NULL, 0, CAST(N'2023-07-03T08:47:07.233' AS DateTime), CAST(N'2023-07-03T08:51:54.383' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (NULL) FOR [NameSearch]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [Image]
GO
ALTER TABLE [dbo].[InformationShop] ADD  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[InformationShop] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[InformationShop] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[InformationShop] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[InformationShop] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[InformationShop] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[Manufactures] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[Manufactures] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[Manufactures] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[Manufactures] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[Manufactures] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[MenuOne] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[MenuOne] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[MenuOne] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[MenuOne] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[MenuOne] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[MenuTwo] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[MenuTwo] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[MenuTwo] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[MenuTwo] ADD  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[MenuTwo] ADD  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [Discount_Id]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Views__4D94879B]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Create__5070F446]  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Delete__5165187F]  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Person__52593CB8]  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Update__534D60F1]  DEFAULT (NULL) FOR [UpdateDay]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Person__5441852A]  DEFAULT ((0)) FOR [PersonUpdate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Sales]  DEFAULT ((0)) FOR [Sales]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Sex]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [Birthday]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Subscribe]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDay]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [DeleteDay]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [PersonDelete]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MenuOne]  WITH CHECK ADD FOREIGN KEY([Cate_Id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuTwo]  WITH CHECK ADD FOREIGN KEY([Menu1_Id])
REFERENCES [dbo].[MenuOne] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Product___619B8048] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Product___619B8048]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Cate_I__628FA481] FOREIGN KEY([Cate_Id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Cate_I__628FA481]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Manu_I__6383C8BA] FOREIGN KEY([Manu_Id])
REFERENCES [dbo].[Manufactures] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Manu_I__6383C8BA]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
