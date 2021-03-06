USE master 
go
CREATE DATABASE [db_ecomartvietnam]
GO
USE [db_ecomartvietnam]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07/08/2021 16:04:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 07/08/2021 16:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/08/2021 16:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 07/08/2021 16:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[product_source] [nvarchar](100) NULL,
	[product_weight] [nvarchar](100) NULL,
	[product_description] [ntext] NOT NULL,
	[product_price] [decimal](18, 0) NOT NULL,
	[product_image] [varchar](50) NULL,
	[product_amount] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/08/2021 16:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone_number] [nvarchar](11) NULL,
	[password] [nvarchar](200) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[role] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- trigger for categories

CREATE TRIGGER trg_insert_category ON [categories]
FOR INSERT
AS 
  UPDATE [categories]
	SET created_at = GETDATE(), updated_at = GETDATE()
	from [categories] inner join inserted i
	on [categories].category_id = i.category_id
go
create trigger trg_category_update on [categories]
for update 
as
	begin
	  update [categories]
		set updated_at = getDate()
		from [categories] inner join deleted d
		on [categories].category_id = d.category_id;
	end


-- trigger for users
go
CREATE TRIGGER trg_insert_user ON [users]
FOR INSERT
AS 
  UPDATE [users]
	SET created_at = GETDATE(), updated_at = GETDATE()
	from [users] inner join inserted i
	on [users].user_id = i.user_id
go
create trigger trg_user_update on [users]
for update 
as
	begin
	  update [users]
		set updated_at = getDate()
		from [users] inner join deleted d
		on [users].user_id = d.user_id;
	end

		-- trigger for products
go
CREATE TRIGGER trg_insert_products ON [products]
FOR INSERT
AS 
  UPDATE [products]
	SET created_at = GETDATE(), updated_at = GETDATE()
	from [products] inner join inserted i
	on [products].product_id = i.product_id
go
create trigger trg_product_update on [products]
for update 
as
	begin
	  update [products]
		set updated_at = getDate()
		from [products] inner join deleted d
		on [products].product_id = d.product_id;
	end

				-- trigger for orders
go
CREATE TRIGGER trg_insert_order ON [orders]
FOR INSERT
AS 
  UPDATE [orders]
	SET created_at = GETDATE(), updated_at = GETDATE()
	from [orders] inner join inserted i
	on [orders].order_id = i.order_id
go
create trigger trg_order_update on [orders]
for update 
as
	begin
	  update [orders]
		set updated_at = getDate()
		from [orders] inner join deleted d
		on [orders].order_id = d.order_id;
	end

					-- trigger for orders_detail
go
CREATE TRIGGER trg_insert_orderd ON [order_detail]
FOR INSERT
AS 
  UPDATE [order_detail]
	SET created_at = GETDATE(), updated_at = GETDATE()
	from [order_detail] inner join inserted i
	on [order_detail].order_id = i.order_id and [order_detail].product_id = i.product_id
go
create trigger trg_orderd_update on [order_detail]
for update 
as
	begin
	  update [order_detail]
		set updated_at = getDate()
		from [order_detail] inner join deleted d
		on [order_detail].order_id = d.order_id and [order_detail].product_id = d.product_id;
	end

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [created_at], [updated_at]) VALUES (1, N'Thịt cá trứng', NULL, CAST(N'2021-08-07T14:58:19.040' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [category_name], [created_at], [updated_at]) VALUES (2, N'Rau củ quả', CAST(N'2021-08-07T14:58:25.023' AS DateTime), CAST(N'2021-08-07T14:58:25.023' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [category_name], [created_at], [updated_at]) VALUES (3, N'Thực phẩm khô', CAST(N'2021-08-07T14:58:43.707' AS DateTime), CAST(N'2021-08-07T14:58:43.707' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [category_name], [created_at], [updated_at]) VALUES (4, N'Gia vị', CAST(N'2021-08-07T15:00:27.997' AS DateTime), CAST(N'2021-08-07T15:00:27.997' AS DateTime))
INSERT [dbo].[Categories] ([category_id], [category_name], [created_at], [updated_at]) VALUES (5, N'Mì ăn liền', CAST(N'2021-08-07T15:02:35.610' AS DateTime), CAST(N'2021-08-07T15:02:35.610' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Order_detail] ([order_id], [product_id], [price], [quantity], [created_at], [updated_at]) VALUES (1, 38, CAST(190000 AS Decimal(18, 0)), 1, CAST(N'2021-08-07T16:00:48.660' AS DateTime), CAST(N'2021-08-07T16:00:48.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [status], [created_at], [updated_at]) VALUES (1, 2, 1, CAST(N'2021-08-07T16:00:48.650' AS DateTime), CAST(N'2021-08-07T16:00:48.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (1, 2, N'Bí đỏ Nhật', N'Thực phẩm Nhật Bản', N'1kg', N'Bí đỏ Nhật Bản thuộc loài Cucurbita maxima, có kích thước từ nhỏ đến trung bình với vỏ cứng, kết cấu và thô với các sọc nhạt, không đều. Thịt quả dày, xốp, đặc và có màu vàng cam đậm với khoang trung tâm chứa nhiều cùi dai và nhiều hạt phẳng, màu kem.  Bí đỏ Nhật Kabocha có hương vị đặc biệt ngọt ngào, thậm chí còn ngọt hơn cả bí đao. Nó có kết cấu và hương vị tương tự như bí ngô và khoai lang kết hợp. Một số kabocha có thể có hương vị giống như khoai tây Russet. Vỏ có thể ăn được mặc dù một số đầu bếp có thể gọt vỏ để tăng tốc quá trình nấu ăn hoặc để phù hợp với sở thích cá nhân của họ. Kabocha thường được sử dụng trong các món ăn phụ và súp, hoặc thay thế cho khoai tây hoặc các loại bí khác. Có thể nấu sau khi cắt đôi bí, cạo sạch vỏ và hạt bên trong, sau đó cắt bí thành từng khoanh. Với một ít dầu ô liu và gia vị, nó có thể được nướng trong lò…', CAST(37000 AS Decimal(18, 0)), N'4850402bi-do-giong-nhat.jpg', 100, NULL, CAST(N'2021-08-07T15:08:37.080' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (2, 2, N'Nấm linh chi nâu', N'Nông trại Đà Lạt', N'150g', N'Nấm linh chi màu nâu của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Vị nấm giòn dai và ngọt thịt, chứa hàm lượng dinh dưỡng cao rất thích hợp cho các món nhúng lẩu, xào với rau củ hoặc nấu súp...', CAST(32500 AS Decimal(18, 0)), N'nam-linh-chi-nau.jpg', 100, CAST(N'2021-08-07T15:10:56.127' AS DateTime), CAST(N'2021-08-07T15:10:56.127' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (3, 2, N'Cà tím túi 2 trái', N'Nông trại Đà Lạt', N'500g', N'Cà tím hay còn được gọi là cà dái dê, đây là một loại rau củ chế biến được thành rất nhiều món ăn thơm ngon như: hấp, xào, nướng, ăn sống,... mỗi dạng đều mang lại hương vị rất ngon. Trong cà tím chứa hàm lượng chất xơ vô cùng cao và giàu sắt rất tốt cho cơ thể. Cà tím có tên gọi khác là cà dái dê, có họ hàng với cà chua, khoai tây, cà pháo. Loại củ, quả này sử dụng trong chế biến dưới dạng thức ăn hầm, xào, nướng. Nhờ chứa hàm lượng chất xơ vô cùng cao và giàu sắt, cà tím còn giúp giảm nguy cơ mắc các bệnh ung thư như ung thư ruột kết, trực tràng, tim mạch, chữa chứng hay quên,...', CAST(25500 AS Decimal(18, 0)), N'ca-tim-tui-500g-202009292339095207.jpg', 100, CAST(N'2021-08-07T15:12:26.383' AS DateTime), CAST(N'2021-08-07T15:12:26.383' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (4, 2, N'Nấm hải sản', N'Nông trại Đà Lạt', N'150g', N'Nấm hải sản của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng. Nấm trắng ngần, ngọt, chứa nhiều chất, hàm lượng dinh dưỡng cao nên thường dùng để nấu cháo hoặc làm rau nhúng lẩu.', CAST(25000 AS Decimal(18, 0)), N'nam-hai-san-vn.jpg', 100, CAST(N'2021-08-07T15:13:20.800' AS DateTime), CAST(N'2021-08-07T15:13:20.800' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (5, 2, N'Khoai sọ', N'Nông trại Đà Lạt', N'500g', N'Khoai sọ là một loại khoai rất quen thuộc với chúng ta, chúng được chế biến thành nhiều món ăn ngon như: canh khoai sọ, bánh,... Khoai sọ chứa rất nhiều chất dinh dưỡng tốt cho cơ thể, có tác dụng như: chống táo bón, ổn định đường huyết, giảm cholesterol trong máu,... Khoai sọ là một trong những loại khoai được nhiều người yêu thích và có thể chế biến thành nhiều món ăn khác nhau. Cũng giống như các loại củ khác, khoai sọ có chứa hàm lượng lớn tinh bột, chất béo, đường, chất xơ cùng các khoáng chất có lợi như sắt, canxi,... vì thế, khoai sọ có một số tác dụng như nhuận tràng, chống táo bón, ổn định đường huyết, giảm cholesterol trong máu,...', CAST(23000 AS Decimal(18, 0)), N'khoai-so.jpg', 100, CAST(N'2021-08-07T15:14:36.750' AS DateTime), CAST(N'2021-08-07T15:14:36.750' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (6, 2, N'Dưa leo baby', N'Nông trại Đà Lạt', N'500g', N'Dưa leo baby là một giống dưa mới, được trồng khá nhiều ở nước ta, đây là một loại rau củ rất ngon, gần như là quen thuộc trong tất cả bữa ăn ở mọi gia đình. Dưa leo chứa rất nhiều chất dinh dưỡng và vitamin rất tốt cho cơ thể. Ngoài ra, dưa leo còn có thể dụng để làm đẹp cũng rất hiệu quả. Dưa leo (hay còn gọi là dưa chuột) được trồng rộng rãi ở nhiều nước khác nhau, có thể được sử dụng với nhiều mục đích khác nhau nhưng dù ở dạng nào dưa leo vẫn giữ nguyên được những giá trị dinh dưỡng của mình. Dưa leo baby với hình dạng giống hệt trái dưa leo thông thường với vỏ xanh lá cây sọc trắng, nhưng chiều dài lại chỉ từ 3 - 5cm và vị thì ngọt và mát hơn dưa leo thông thường.', CAST(23000 AS Decimal(18, 0)), N'dua-leo-baby.jpg', 100, CAST(N'2021-08-07T15:15:48.550' AS DateTime), CAST(N'2021-08-07T15:15:48.550' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (7, 2, N'Rau muống nước', N'Nông trại Phú Quốc', N'300g', N'Rau muống nước baby của Bách hóa xanh cọng giòn, ngon, ngọt, nhỏ nhắn. Hàm lượng dinh dưỡng cao, chứa nhiều vitamin, chất khoáng đặc biệt là sắt. Do được thu hoạch sớm nên tránh tình trạng sử dụng thuốc kích thích tăng trưởng, thuốc trừ sâu, đảm bảo an toàn cho người dùng. Rau muống nước baby là một loại rau muống có phần lá với kích thước nhỏ nhưng công dụng không thua kém gì so với rau muống thông thường. Đặc biệt, đây là loại rau có chứa hàm lượng nước cao (92%) cùng với một số các khoáng chất có lợi khác (canxi, photpho, sắt,...) cùng các nhóm vitamin B, C,... Vì thế, rau muống có nhiều công dụng như cung cấp nguồn nước cho cơ thể, giúp giải nhiệt, ổn định huyết áp, ngăn ngừa ung thư, điều hòa tim mạch,... ', CAST(22500 AS Decimal(18, 0)), N'rau-muong-nuoc.jpg', 100, CAST(N'2021-08-07T15:17:18.147' AS DateTime), CAST(N'2021-08-07T15:17:18.147' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (8, 2, N'Xà lách búp mỡ thuỷ canh', N'Nông trại Phú Quốc', N'300g', N'Xà lách búp mỡ thủy canh của Ecomart có lá cây rất mềm, có vị ngọt thanh, rất thơm ngon khi ăn sống. Chứa nhiều chất xơ có lợi cho tiêu hóa, giàu giá trị dinh dưỡng, chứa nhiều vitamin và khoáng chất, có công dụng bồi bổ sức khỏe, chống oxy hóa, ngăn ngừa ung thư… Xà lách búp mỡ thủy canh túi 300g có lá lớn, liên kết xếp tầng xung quanh, rất dễ tách ra từ thân cây. Lá cây rất mềm, có vị ngọt thanh, rất thơm ngon khi ăn sống. Chứa nhiều chất xơ có lợi cho tiêu hóa, giàu giá trị dinh dưỡng, chứa nhiều vitamin và khoáng chất, có công dụng bồi bổ sức khỏe, chống oxy hóa, ngăn ngừa ung thư…', CAST(20000 AS Decimal(18, 0)), N'xa-lach-bup-mo-thuy-canh.jpg', 100, CAST(N'2021-08-07T15:18:33.117' AS DateTime), CAST(N'2021-08-07T15:18:33.127' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (9, 2, N'Rau cần tây', N'Nông trại Phú Quốc', N'200g', N'Cần tây của Ecomart được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn. Vị giòn ngọt, có chút hăng nhẹ nhưng cần tây hỗ trợ rất tốt cho người đang ăn kiêng giảm cân. Thường được dùng trong các món xào hoặc ép lấy nước.', CAST(14700 AS Decimal(18, 0)), N'can-tay.jpg', 100, CAST(N'2021-08-07T15:20:18.493' AS DateTime), CAST(N'2021-08-07T15:20:18.500' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (10, 2, N'Cà chua bi', N'Nông trại Đà Lạt', N'200g', N'Cà chua bi là loại rau củ rất tốt cho sức khoẻ, đây là giống cà có kích thước khá nhỏ nhưng cũng rất dồi dào chống dinh dưỡng như chất xơ, vitamin C,... Bạn có thể sử dụng cà chua bi để ăn sống, trộn salad hoặc có thể dùng để chế biến thành các món ăn khác đều rất tốt. Cà chua bi là giống cà chua có kích thước nhỏ, hình tròn hoặc hình oval, giàu chất xơ và dinh dưỡng. Khác với cà chua thông thường, cà chua bi có vị chua nhưng ngọt hơn, vì thế rất thích hợp để ăn sống hoặc chế biến các món salad hoặc nướng cùng với các món BBQ,... Đặc biệt, cà chua bi còn là một loại quả mang đến nhiều chất xơ, chất chống lão hóa, vitamin C cùng các khoáng chất rất có lợi cho sức khỏe và làm đẹp.  Xem thêm: Lợi ích của cà chua đối với sức khỏe.', CAST(8000 AS Decimal(18, 0)), N'ca-chua-bi.jpg', 100, CAST(N'2021-08-07T15:21:09.443' AS DateTime), CAST(N'2021-08-07T15:21:09.447' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (11, 1, N'Ba rọi heo rút sườn', N'Trang trại lợn Thái Nguyên', N'500g', N'Ba rọi heo rút sườn của thương hiệu CP được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon của thực phẩm, xuất xứ rõ ràng.  Ba rọi với tỉ lệ nạc mỡ tuyệt vời nên rất thích hợp để nướng BBQ, luộc hoặc kho mặn.', CAST(123000 AS Decimal(18, 0)), N'ba-roi-heo-rut-suon.jpg', 100, CAST(N'2021-08-07T15:22:44.343' AS DateTime), CAST(N'2021-08-07T15:22:44.347' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (12, 1, N'Sườn già heo', N'Trang trại lợn Thái Nguyên', N'500g', N'Sườn già heo của thương hiệu CP được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon của thực phẩm, xuất xứ rõ ràng. Sườn ngọt, tươi nên rất được ưa chuộng để hầm canh với rau củ quả, làm ngọt nước lèo,...', CAST(83000 AS Decimal(18, 0)), N'nac-vai-heo.jpg', 100, CAST(N'2021-08-07T15:23:38.153' AS DateTime), CAST(N'2021-08-07T15:23:38.160' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (13, 1, N'Thịt thăn heo', N'Trang trại lợn Thái Nguyên', N'300g', N'hịt thăn heo của thương hiệu CP được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon của thực phẩm, xuất xứ rõ ràng. Với đặc tính mềm, khá mọng nước nên rất được ưa chuộng bởi những người có chế độ ăn kiêng, giảm cân.', CAST(54000 AS Decimal(18, 0)), N'thit-bap-gio.jpg', 100, CAST(N'2021-08-07T15:24:47.500' AS DateTime), CAST(N'2021-08-07T15:24:47.500' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (14, 1, N'Cá lóc làm sạch', N'Thuỷ sản Cà Mau', N'1kg', N'Cá lóc hay còn gọi là cá quả là thực phẩm không còn xa lạ với bà nội trợ. Cá lóc có thể chế biến thàh nhiều món ăn ngon như nấu canh chua, kho tộ, hấp bầu,... Cá lóc đã được làm sạch và cắt khúc sẵn rất tiện lợi, giúp tiết kiệm thời gian cho chị em. Cá lóc hay còn được gọi là cá quả, là loại cá được nhiều người yêu thích bởi vị ngọt của thịt, lành tính, ít mỡ, chứa nhiều khoáng chất và các vitamin bổ sung năng lượng cho cơ thể. Cá lóc không chỉ là nguyên liệu chế biến phong phú mà còn là một liều thuốc chữa bệnh hiệu quả.', CAST(104000 AS Decimal(18, 0)), N'ca-loc-song.jpg', 100, CAST(N'2021-08-07T15:25:48.733' AS DateTime), CAST(N'2021-08-07T15:25:48.737' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (15, 1, N'1/6 Cá diêu hồng làm sạch', N'Thuỷ sản Cà Mau', N'1kg', N'Cá điêu hồng loại cá phổ biến có thịt nhiều, ít xương, thịt trắng, ngọt và lành tính, cá điêu hồng chế biến thành rất nhiều món ngon trong bữa cơm gia đình như cá điêu hồng kho, cá điêu hồng nấu canh chua, cá điêu hồng chiên giòn, cá điêu hồng sốt cà chua,...', CAST(110000 AS Decimal(18, 0)), N'ca-dieu-hong-lam-sach.jpg', 100, CAST(N'2021-08-07T15:26:38.373' AS DateTime), CAST(N'2021-08-07T15:26:38.377' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (16, 1, N'Đùi gà tháo khớp', N'Trang trại gà Quảng Ninh', N'500g', N'Được sản xuất trên dây chuyền khép kín, an toàn vệ sinh thực phẩm. Đùi gà tháo khớp C.P khay 500g đã tách bỏ phần khớp nối giữa má đùi và đùi. Giúp giảm lượng xương khớp chế biến nhanh dễ dàng hơn. Sản phẩm có 2 mã QR để khách hàng có thể truy xuất nguồn gốc thịt', CAST(38500 AS Decimal(18, 0)), N'dui-ga-thao-khop.jpg', 100, CAST(N'2021-08-07T15:27:36.667' AS DateTime), CAST(N'2021-08-07T15:27:36.670' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (17, 1, N'Cá cơm', N'Thuỷ sản Cà Mau', N'100g', N'Với thịt cá tươi ngon, hàng mới về mỗi ngày, cá cơm túi 200g thường được các bà nội trợ lựa chọn hàng đầu. Dễ dàng nấu những món ăn ngon cho cả nhà như: cá cơm kho tiêu, cá cơm kho thịt ba chỉ,... Cá cơm Bách hoá XANH tươi rói, thích hợp làm nguyên liệu giúp bạn nấu những bữa ngon Cá cơm là loại cá sinh sống ở vùng nước mặn, dễ dàng bắt gặp trong mỗi bữa cơm của gia đình. Cá cơm có thân trắng trong, mỗi con có dáng thon dài cỡ một ngón tay. Tại Bách hoá XANH, cá cơm đã được sơ chế cắt bỏ phần đầu và làm sạch phần ruột. Vì thế, sản phẩm thích hợp cho những ai bận rộn nhưng vẫn muốn có bữa ăn nhanh chóng, đầy đủ chất dinh dưỡng. Cá cơm mang đến nhiều lợi ích cho sức khoẻ, không những tốt cho tim mạch mà còn giúp khỏe xương, sáng mắt, đẹp da.', CAST(22000 AS Decimal(18, 0)), N'ca-com.jpg', 100, CAST(N'2021-08-07T15:28:39.400' AS DateTime), CAST(N'2021-08-07T15:28:39.407' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (18, 1, N'Bao tử cá basa', N'Thuỷ sản Cà Mau', N'200g', N'Bao tử cá basa với độ dai dai, giòn giòn, sựt sựt rất hấp dẫn (đóng khay sạch sẽ - an toàn vệ sinh thực phẩm). Sản phẩm nhiều dưỡng chất, nhất là vitamin, chất khoáng, giúp bồi bổ cơ thể, hỗ trợ ngăn ngừa một số bệnh về xương, mắt. Nhắc đến cá basa (cá ba sa) chắc hẳn mọi người thường nghĩ ngay đến những phần thịt cá săn chắc, thơm ngon được bán nơi các siêu thị, chợ,... nhưng lại hiếm ai biết đến bao tử cá ba sa - món ngon "thần thánh" trong thế giới ăn vặt. Bao tử cá basa là phần bao từ ruột của cá, khi thưởng thức sẽ có cảm giác dai dai, giòn giòn, sựt sựt rất hấp dẫn. Bao tử cá có rất nhiều dưỡng chất, nhất là vitamin, chất khoáng và chất xơ, giúp bồi bổ cơ thể, bổ sung các vi chất cần thiết và hỗ trợ ngăn ngừa một số bệnh về xương.', CAST(27500 AS Decimal(18, 0)), N'bao-tu-ca-basa.jpg', 100, CAST(N'2021-08-07T15:29:35.163' AS DateTime), CAST(N'2021-08-07T15:29:35.170' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (19, 1, N'Thịt heo xay', N'Trang trại lợn Thái Nguyên', N'300g', N'Thịt heo xay G được đóng gói và bảo quản đạt các tiêu chuẩn về an toàn toàn thực phẩm. Thịt được sơ chế kĩ càng, tiện lợi cho người mua khi chế biến thành các món canh rau hoặc cháo. Có thể dùng điện thoại quét mã QR trên tem sản phẩm để kiểm tra nguồn gốc.', CAST(52000 AS Decimal(18, 0)), N'ba-roi-heo-rut-sussson.jpg', 100, CAST(N'2021-08-07T15:30:34.040' AS DateTime), CAST(N'2021-08-07T15:30:34.043' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (20, 1, N'Ếch làm sạch', N'Cơ sở nuôi ếch Nam Định', N'500g', N'Là thực phẩm không chỉ thơm ngon mà còn bổ dưỡng vô cùng. Thịt ếch chứa nhiều protein, vitamin tốt cho cơ thể nên thường được dùng làm nguyên liệu nấu các món ăn chính trong gia đình như thịt ếch kho tộ, ếch xào sả ớt, cháo ếch,... Thịt ếch Bách hoá XANH tươi ngon, bổ dưỡng, hàng mới mỗi ngày Thịt ếch là nguyên liệu rất quen thuộc trong nền văn hoá ẩm thực của nhiều quốc gia. Ở Việt Nam, ếch không chỉ là loại thực phẩm dân dã, ngon miệng mà còn có giá trị dinh dưỡng cao, là vị thuốc chữa bệnh độc đáo.  Theo nghiên cứu thành phần dinh dưỡng, trong thịt ếch có nhiều protein, chất béo, đường, canxi, photpho, kali, natri, sắt, đồng, magie, kẽm, selen, vitamin A, vitamin nhóm B, E,… ', CAST(70500 AS Decimal(18, 0)), N'ech-lam-sach.jpg', 100, CAST(N'2021-08-07T15:31:47.010' AS DateTime), CAST(N'2021-08-07T15:31:47.013' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (21, 3, N'Xoài sấy dẻo', N'Công ty cổ phần thực phẩm số 2', N'250g', N'Xoài sấy dẻo hay xoài sấy khô được bán tại Ecomart cam kết đảm bảo chất lượng của xoài sau khi sấy khô vẫn giữ nguyên được hương vị thơm ngon, đảm bảo chất lượng, an toàn vệ sinh, thành phần chất dinh dưỡng trong miếng xoài sấy khô vẫn giữ nguyên 100%.', CAST(85000 AS Decimal(18, 0)), N'xoai-say-deo.jpg', 100, NULL, CAST(N'2021-08-07T15:37:13.760' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (22, 3, N'Quế thanh khô cạo vỏ - nguyên vỏ', N'Công ty thực phẩm Tây Bắc', N'1kg', N'Cung cấp quế thanh giá rẻ thơm, chất lượng cao Cây quế thường trồng nhiều trên các các vùng miền núi cao của nước ta. Trong y học cổ truyền thì quế thanh được coi là thảo dược quý hiếm, tuổi đời cây quế càng cao thì quế thanh (vỏ quế) càng tốt và chất lượng ', CAST(195000 AS Decimal(18, 0)), N'que-thanh-cao-vo-1.jpg', 100, NULL, CAST(N'2021-08-07T15:39:28.177' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (23, 3, N'Tinh bột nghệ vàng', N'Công ty thực phẩm Tây Bắc', N'500g', N'Tinh bột nghệ vàng được chiết xuất 100% từ củ nghệ tươi nhưng không phải bột nghệ. Tinh bột nghệ là tinh chất chắt lọc từ củ nghệ, có chứa chất curcumin rất tốt cho sức khoẻ. So với bột nghệ thì tinh bột nghệ  là tinh chất của củ nghệ đã được tách nhựa và tinh dầu nên tinh bột nghệ sẽ tốt và cô đọng nhất về thành phần chất dinh dưỡng. Sử dụng tinh bột nghệ rất có lợi cho sức khỏe. Tinh bột nghệ sẽ uống và dễ sử dụng hơn bột nghệ hoặc củ nghệ thông thường', CAST(520000 AS Decimal(18, 0)), N'tinh-bot-nghe-vang-1.jpg', 100, CAST(N'2021-08-07T15:39:19.540' AS DateTime), CAST(N'2021-08-07T15:39:19.543' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (24, 3, N'Hạt tiêu sọ', N'Công ty thực phẩm Phú Quốc', N'500g', N'Cung cấp hạt tiêu sọ giá rẻ đặc sản Phú Quốc Hạt tiêu sọ là thành phẩm được sơ chế từ cây tiêu. Sau khi thu hoạch, hạt tiêu phải trải qau nhiều công đoạn sơ chế cẩn thận, để tạo ra sản phẩm những hạt tiêu sọ đẹp, trắng đều, thơm ngon đến tay người tiêu dùng. Để có thể chế biến hạt tiêu sọ trắng thì người dân phải lựa chọn những quả tiêu có kích thước đồng đều, chín.', CAST(100000 AS Decimal(18, 0)), N'hat-tieu-so.jpg', 100, CAST(N'2021-08-07T15:40:35.017' AS DateTime), CAST(N'2021-08-07T15:40:35.023' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (25, 3, N'Bột củ riềng', N'Nông trại Bắc Ninh', N'500g', N'Bột củ riềng khô nguyên chất 100%  Cây riềng là loại cây nhỏ, thân rễ mọc bò ngang, dài. Cụm hoa mặt trong màu trắng, mép hơi mỏng, kèm hai lá bắc hình mo, một màu xanh, một màu trắng. Lá không cuống, có bẹ, hình mác dài.  Ở nước ta, cây riềng mọc hoang và được trồng ở khắp nơi, không chỉ được dùng làm gia vị mà còn được sử dụng làm thuốc. Bộ phận làm thuốc rễ (củ) phơi khô nghiền nhỏ thành bột củ riềng khô.', CAST(210000 AS Decimal(18, 0)), N'cu-rieng.jpg', 100, CAST(N'2021-08-07T15:41:51.063' AS DateTime), CAST(N'2021-08-07T15:41:51.070' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (26, 3, N'Bột sả khô - Sả khô thái lát', N'Nông trại Bắc Ninh', N'100g', N'Bột sả khô là gì? Sả được sử dụng rộng rãi như là một loại cây thuốc và gia vị tại các nước châu Á. Nó có hương vị như chanh và có thể sấy khô và tán thành bột sả khô hoặc dùng ở dạng tươi sống. Bột sả khô thường được dùng trong chè, súp và các món cà ri. Bột sả khô cũng rất thích hợp cho các món chế biến từ thịt gia cầm, cá và hải sản. Bột sả khô thường được sử dụng như một loại chè tại một số quốc gia châu Phi.', CAST(20000 AS Decimal(18, 0)), N'bot-sa-kho.jpg', 100, CAST(N'2021-08-07T15:42:37.747' AS DateTime), CAST(N'2021-08-07T15:42:37.750' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (27, 3, N'Bột hoa hồi', N'Nông trại Bắc Ninh', N'1kg', N'Bột hoa hồi được làm như thế nào Hoa hồi hay còn gọi là đại hồi hoặc giác hồi hương, Trong tiếng Trung nó có nghĩa là "tám cánh".Bột hoa hồi là thành phẩm của những bông hoa hồi tán nhỏ, nghiền thành bột, bột hoa hồi rất mịn, màu vàng đậm ( màu hoa hồi), mùi thơm đặc trưng của hoa hồi.  Đây là một loại gia vị dùng trong chế biến các món ăn ngon của người Việt. Ngoài ra, bột hoa hồi còn có rất nhiều công dụng đối với sức khỏe.', CAST(450000 AS Decimal(18, 0)), N'dscf7416.jpg', 100, CAST(N'2021-08-07T15:43:35.417' AS DateTime), CAST(N'2021-08-07T15:43:35.427' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (28, 3, N'Bột quế', N'Nông trại Bắc Ninh', N'1kg', N'Quế khô là phần thu được từ lớp vỏ thân cành của cây quế sau khi được phơi khô. Bột quế nguyên chất là phần vỏ quế phơi khô nghiền thành bột. Bột quế có vị cay, mùi thơm nên bột quế thường được dùng để để uống trực tiếp hoặc dùng để làm bánh', CAST(160000 AS Decimal(18, 0)), N'bot-que-200g.jpg', 100, CAST(N'2021-08-07T15:44:28.257' AS DateTime), CAST(N'2021-08-07T15:44:28.260' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (29, 3, N'Hạt tiêu xay', N'Nông trại Bắc Ninh', N'500g', N'Hạt tiêu xay có mùi thơm, vị cay nồng tạo nên hương vị đậm đà của các món ăn. Hạt tiêu xay là gia vị nhiều món ăn truyển thống như: bánh chưng, giò thủ,...Nó cũng là nguyên liệu tuyệt vời, không thể thiếu của bát nước chấm trong bữa cơm gia đình.   Hạt tiêu xay được người sử dụng rất phổ biến, nó có mặt ở hầu hết mọi căn bếp. Hạt tiêu xay không thể thiếu ở bất cứ mọi nơi: từ quán phở ăn sáng, quán cơm ăn trưa. Hạt tiêu xay thông dụng và được sử dụng như một thói quen.', CAST(75000 AS Decimal(18, 0)), N'hat-tieu-xay.jpg', 100, CAST(N'2021-08-07T15:45:18.223' AS DateTime), CAST(N'2021-08-07T15:45:18.233' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (30, 3, N'Hạt tiêu đen', N'Nông trại Bắc Ninh', N'1kg', N'Hạt tiêu đen là một trong những nguyên liệu, gia vị không thể thiếu trong căn bếp của các chị em. Hạt tiêu đen mang mùi một thơm đặc trưng, có vị cay. Thêm hạt tiêu đen vào các món ăn sẽ giúp chúng trở nên hấp dẫn, thơm ngon và dậy mùi hơn.   Với những đặc điểm trên hạt tiêu đen được người tiêu dùng chọn mua rất nhiều. Tuy nhiên, vẫn rất nhiều người thắc mắc giá hạt tiêu đen bao nhiêu tiền một kg?', CAST(150000 AS Decimal(18, 0)), N'hat-tieu-den-02.jpg', 100, CAST(N'2021-08-07T15:46:01.143' AS DateTime), CAST(N'2021-08-07T15:46:01.143' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (31, 4, N'Đường sạch Biên Hòa', N'Công ty Biên Hoà', N'1kg', N'Được sản xuất từ giống mía tốt nhất và công nghệ an toàn nhất không sử dụng hóa chất tẩy trắng và loại bỏ hoàn toàn tạp chất. Với phương châm "An toàn cho sức khỏe", đường sạch Biên Hòa Saving giúp bạn tự tin chế biến các món ăn hương vị thơm ngon và tốt cho sức khỏe.', CAST(24900 AS Decimal(18, 0)), N'duong-bien-hoa.jpg', 100, CAST(N'2021-08-07T15:47:34.540' AS DateTime), CAST(N'2021-08-07T15:47:34.543' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (32, 4, N'Nước đường nâu Beksul', N'Hàn Quốc', N'750ml', N'Là loại nước đường cô đặc có vị ngọt đậm đà và hương thơm đặc trưng của đường nâu đến từ thương hiệu đường Beskul Hàn Quốc. Nước đường nâu Beksul chai 750ml là giải pháp thay thế các loại đường thông thường, giúp tiết kiệm thời gian và chi phí cho bạn khi chế biến các món ăn, thức uống.', CAST(142000 AS Decimal(18, 0)), N'nuoc-duong-nau-beksul.jpg', 100, CAST(N'2021-08-07T15:48:24.803' AS DateTime), CAST(N'2021-08-07T15:48:24.810' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (33, 4, N'Dầu thực vật Tường An Cooking Oil', N'Công ty Trường An', N'1 lít', N'Là dầu ăn chiết xuất dầu olein nguyên chất, giàu Omega 3,6,9 và Vitamin A, E có lợi cho cơ thể. Dầu thực vật Tường An Cooking Oil chai 1 lít được áp dụng công nghệ tinh luyện của dầu ăn Tường An kết hợp với phương pháp tinh luyện vật lý trên các dây chuyền sản xuất hiện đại.', CAST(42000 AS Decimal(18, 0)), N'dau-thuc-vat-tuong-an-cooking-oil.jpg', 100, CAST(N'2021-08-07T15:49:42.200' AS DateTime), CAST(N'2021-08-07T15:49:42.210' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (34, 4, N'Dầu ăn cao cấp Happi Koki', N'Công ty Happi Koki', N'1 lít', N'Có nguồn gốc 100% từ thực vật, phối hợp hoàn hảo giữa dầu olein, dầu hạt cải và dầu nành thích hợp cho mọi hoạt động chế biến thực phẩm từ chiên, xào, ướp các món mặn cho đến món chay. Chai 1 lít với dung tích lớn, tiết kiệm cho người dùng cho nhiều lần sử dụng. ', CAST(34400 AS Decimal(18, 0)), N'dau-an-happi-koki-1l-2-org.jpg', 100, CAST(N'2021-08-07T15:50:36.007' AS DateTime), CAST(N'2021-08-07T15:50:36.010' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (35, 4, N'Hạt nêm thịt thăn, xương ống, tủy Delly Cook', N'Công ty Delly Cook', N'400g', N'Được chiết xuất từ nước hầm thịt thăn và xương ống tuỷ heo theo công nghệ Nhật Bản, sản phẩm không chỉ mang đến chất dinh dưỡng từ thịt heo mà còn đem đến hương thơm đặc trưng cho mọi món ăn. Thích hợp dùng cho món kho, xào, canh hoặc tẩm ướp thức ăn.', CAST(25000 AS Decimal(18, 0)), N'hat-nem-thit-than-xuong.jpg', 100, CAST(N'2021-08-07T15:51:44.950' AS DateTime), CAST(N'2021-08-07T15:51:44.963' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (36, 5, N'Thùng 30 gói mì Hảo Hảo tôm chua cay', N'Công ty Ecocook', N'75g', N'Sợi mì vàng dai ngon hòa quyện trong nước súp tôm chua cay Hảo Hảo, đậm đà thấm đẫm từng sợi sóng sánh cùng hương thơm quyến rũ ngất ngây. Mì Hảo Hảo tôm chua cay gói 75g là lựa chọn hấp dẫn không thể bỏ qua đặc biệt là những ngày bận rộn cần bổ sung năng lượng nhanh chóng đơn giản mà vẫn đủ chất', CAST(106000 AS Decimal(18, 0)), N'thung-30-goi-mi-hao-hao-tom-chua-cay.jpg', 100, CAST(N'2021-08-07T15:53:08.073' AS DateTime), CAST(N'2021-08-07T15:53:08.077' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (37, 5, N'Thùng 30 gói mì 3 Miền tôm chua cay', N'Công ty 3 miền', N'65g', N'Sở hữu nét đậm đà chuẩn hương vị truyền thống. Mì 3 Miền tôm chua cay gói 65g có được vị chua cay từ quá trình tìm tòi cũng như chắt lọc các nét đặc trưng nhất của các món chua cay dọc 3 miền tổ quốc. Để rồi thành phẩm mang đến cho người tiêu dùng hương vị tinh tế nhất và tuyệt hảo nhất', CAST(80000 AS Decimal(18, 0)), N'thung-30-goi-mi-3-mien.jpg', 100, CAST(N'2021-08-07T15:54:06.050' AS DateTime), CAST(N'2021-08-07T15:54:06.057' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (38, 5, N'Thùng 30 gói mì khoai tây Cung Đình vị sườn hầm ngũ', N'Công ty Micoem', N'80g', N'Sợi mì vàng từ trứng và khoai tây dai ngon hòa quyện trong nước súp sườn hầm ngủ quả Cung Đình thanh ngọt đậm đà cùng hương thơm lừng quyến rũ. Mì khoai tây Cung Đình sườn hầm ngũ quả gói 80g tiện lợi, nhanh chóng, là lựa chọn hấp dẫn cho bữa ăn nhanh gọn đơn giản nhưng vẫn đầy đủ dưỡng chất', CAST(190000 AS Decimal(18, 0)), N'thung-30-goi-mi-khoai-tay.jpg', 0, NULL, CAST(N'2021-08-07T16:00:48.640' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (39, 5, N'Thùng 30 gói mì Gấu Đỏ tôm và gà', N'Côg ty Gấu đỏ', N'63g', N'Sợi mì vàng dai giòn được tẩm ướp nước mắm cá cơm hòa quyện trong nước súp tôm và gà Gấu Đỏ đậm đà cùng hành phi 1 nắng thơm lừng quyến rũ. Mì Gấu Đỏ tôm và gà gói 63g tiện lợi, nhanh chóng, là lựa chọn hấp dẫn cho bữa ăn nhanh gọn đơn giản nhưng vẫn đầy đủ dưỡng chất.', CAST(80000 AS Decimal(18, 0)), N'thung-30-goi-mi-gau-do.jpg', 100, CAST(N'2021-08-07T15:57:38.697' AS DateTime), CAST(N'2021-08-07T15:57:38.700' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_source], [product_weight], [product_description], [product_price], [product_image], [product_amount], [created_at], [updated_at]) VALUES (40, 5, N'Thùng 24 ly mì khoai tây Omachi tôm chua cay ', N'Công ty Omachi', N'112g', N'Sợi mì từ trứng và khoai tây vàng dai ngon hòa quyện trong nước súp Omachi tôm chua cay đậm đà cùng cây thịt thật chất lượng tạo ra siêu phẩm mì với sự kết hợp hương vị hài hòa, độc đáo. Mì khoai tây Omachi tôm chua cay ly 112g tiện lợi, thơm ngon hấp dẫn không thể chối từ', CAST(378000 AS Decimal(18, 0)), N'thung-mi-khoai-tay-omachi.jpg', 10, CAST(N'2021-08-07T15:59:11.370' AS DateTime), CAST(N'2021-08-07T15:59:11.373' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [email], [phone_number], [password], [full_name], [address], [role], [created_at], [updated_at], [is_active]) VALUES (1, N'nhom2admin@gmail.com', N'0866136920', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', N'Hoàng Duy Khánh', N'An Lão', 1, CAST(N'2021-08-07T14:53:27.280' AS DateTime), CAST(N'2021-08-07T14:53:53.007' AS DateTime), 1)
INSERT [dbo].[Users] ([user_id], [email], [phone_number], [password], [full_name], [address], [role], [created_at], [updated_at], [is_active]) VALUES (2, N'nhom2user@gmail.com', N'0866136920', N'E1-0A-DC-39-49-BA-59-AB-BE-56-E0-57-F2-0F-88-3E', N'Hoàng Duy Khánh', N'An Lão', 0, CAST(N'2021-08-07T16:00:13.113' AS DateTime), CAST(N'2021-08-07T16:00:13.117' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
