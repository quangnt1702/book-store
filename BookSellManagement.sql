USE [BookSellManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](10) NOT NULL,
	[userID] [varchar](25) NOT NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[totalMoney] [float] NULL,
	[orderDate] [date] NULL,
	[statusID] [varchar](10) NULL,
	[paymentStatus] [varchar](10) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailOrderID] [varchar](10) NOT NULL,
	[orderID] [varchar](10) NOT NULL,
	[productID] [varchar](10) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[statusID] [varchar](10) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](10) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productPrice] [float] NULL,
	[productQuantity] [int] NULL,
	[image] [varchar](100) NULL,
	[categoryID] [varchar](10) NOT NULL,
	[statusID] [varchar](10) NULL,
	[description] [nvarchar](500) NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [varchar](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/13/2021 9:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](25) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[phoneNumber] [varchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[roleID] [varchar](10) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[statusID] [varchar](10) NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'IT', N'Lập Trình')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'LG', N'Làm giàu')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'SH', N'Self-Help')
GO
INSERT [dbo].[tblOrder] ([orderID], [userID], [email], [address], [phoneNumber], [totalMoney], [orderDate], [statusID], [paymentStatus]) VALUES (N'O001', N'116456976191737100975', N'quangnt17022001@gmail.com', N'568/6 Le Van Viet, District 9', N'0868019067', 100000, CAST(N'2021-07-13' AS Date), N'A', N'Y')
INSERT [dbo].[tblOrder] ([orderID], [userID], [email], [address], [phoneNumber], [totalMoney], [orderDate], [statusID], [paymentStatus]) VALUES (N'O002', N'quanguuu10', N'npham4533@gmail.com', N'568/6 Le Van Viet, District 9', N'0868019067', 540000, CAST(N'2021-07-13' AS Date), N'A', N'Y')
INSERT [dbo].[tblOrder] ([orderID], [userID], [email], [address], [phoneNumber], [totalMoney], [orderDate], [statusID], [paymentStatus]) VALUES (N'O003', N'117183747599827402996', N'quangntse150500@fpt.edu.vn', N'568/6 Le Van Viet, District 9', N'0868019067', 250000, CAST(N'2021-07-13' AS Date), N'A', N'Y')
INSERT [dbo].[tblOrder] ([orderID], [userID], [email], [address], [phoneNumber], [totalMoney], [orderDate], [statusID], [paymentStatus]) VALUES (N'O004', N'110298949886663745668', N'quangnt1702@gmail.com', N'568/6 Le Van Viet, District 9', N'0868019067', 400000, CAST(N'2021-07-13' AS Date), N'A', N'Y')
INSERT [dbo].[tblOrder] ([orderID], [userID], [email], [address], [phoneNumber], [totalMoney], [orderDate], [statusID], [paymentStatus]) VALUES (N'O005', N'quanguuu10', N'quangntse150500@fpt.edu.vn', N'568/6 Le Van Viet, District 9', N'0868019067', 195000, CAST(N'2021-07-13' AS Date), N'A', N'Y')
GO
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0011', N'O001', N'B001', 2, 50000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0021', N'O002', N'B001', 2, 50000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0022', N'O002', N'B002', 3, 200000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0023', N'O002', N'B222', 4, 20000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0031', N'O003', N'B001', 2, 50000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0032', N'O003', N'B002', 3, 200000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0041', N'O004', N'B001', 2, 50000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0042', N'O004', N'B002', 3, 200000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0051', N'O005', N'B444', 2, 75000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0052', N'O005', N'B222', 3, 20000, N'A')
INSERT [dbo].[tblOrderDetail] ([detailOrderID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'O0053', N'O005', N'B300', 4, 100000, N'A')
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [productPrice], [productQuantity], [image], [categoryID], [statusID], [description], [createDate]) VALUES (N'B001', N'Đời ngắn đừng ngủ dài', 50000, 4, N'img/doi-ngan-dung-ngu-dai.jpg', N'LG', N'A', N'Ngon ngon ngon', CAST(N'2021-07-07' AS Date))
INSERT [dbo].[tblProduct] ([productID], [productName], [productPrice], [productQuantity], [image], [categoryID], [statusID], [description], [createDate]) VALUES (N'B002', N'Người Trong Muôn Nghề', 200000, 4, N'img/nguoi-trong-muon-nghe.jpg', N'IT', N'A', N'Sách hay nên đọc dành cho ngành IT', CAST(N'2021-07-13' AS Date))
INSERT [dbo].[tblProduct] ([productID], [productName], [productPrice], [productQuantity], [image], [categoryID], [statusID], [description], [createDate]) VALUES (N'B222', N'Đắc Nhân Tâm', 20000, 4, N'img/dac-nhan-tam.jpg', N'SH', N'A', N'Ngon ngon cực kỳ mlem mlem', CAST(N'2021-07-07' AS Date))
INSERT [dbo].[tblProduct] ([productID], [productName], [productPrice], [productQuantity], [image], [categoryID], [statusID], [description], [createDate]) VALUES (N'B300', N'Cho tôi xin 1 vé đi tuổi thơ', 100000, 4, N'img/Cho-toi-xin-mot-ve.jpg', N'SH', N'A', N'Sách hay nên đọc', CAST(N'2021-07-08' AS Date))
INSERT [dbo].[tblProduct] ([productID], [productName], [productPrice], [productQuantity], [image], [categoryID], [statusID], [description], [createDate]) VALUES (N'B444', N'Đi Tìm Lẽ Sống', 75000, 4, N'img/sach-di-tim-le-song-ebook-206x300.jpg', N'SH', N'A', N'Mlem Mlem Mlem', CAST(N'2021-07-08' AS Date))
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'A', N'Available')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'NA', N'Not Available')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'110298949886663745668', N'quangnt1702@gmail.com', NULL, NULL, N'US', N'1', N'A', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'116456976191737100975', N'quangnt17022001@gmail.com', NULL, NULL, N'US', N'1', N'A', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'117183747599827402996', N'quangntse150500@fpt.edu.vn', NULL, NULL, N'US', N'1', N'A', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'admin', N'admin', N'123', N'HCM', N'AD', N'1', N'A', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'quanguuu10', N'Nguyen Thien Quang', N'1234', N'Quang Ngai', N'US', N'1', N'A', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'SE1234', N'Nguyen Van A', N'12345', N'Ha Noi', N'US', N'1', N'NA', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'SE150500', N'Nguyen Van B', NULL, N'Nha Trang', N'AD', N'1', N'A', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [phoneNumber], [address], [roleID], [password], [statusID], [createDate]) VALUES (N'SE150501', N'Nguyen Van C', NULL, N'Da Lat', N'US', N'1', N'A', NULL)
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblStatus]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblStatus]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
