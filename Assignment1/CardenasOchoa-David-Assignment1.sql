USE [master]
GO
/****** Object:  Database [DavidCardenasOchoa1]    Script Date: 10/4/2023 2:26:35 AM ******/
CREATE DATABASE [DavidCardenasOchoa1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DavidCardenasOchoa1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DavidCardenasOchoa1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DavidCardenasOchoa1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DavidCardenasOchoa1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DavidCardenasOchoa1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DavidCardenasOchoa1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DavidCardenasOchoa1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET ARITHABORT OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET RECOVERY FULL 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET  MULTI_USER 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DavidCardenasOchoa1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DavidCardenasOchoa1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DavidCardenasOchoa1', N'ON'
GO
ALTER DATABASE [DavidCardenasOchoa1] SET QUERY_STORE = OFF
GO
USE [DavidCardenasOchoa1]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/4/2023 2:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[City] [char](35) NOT NULL,
	[PostalCode] [char](7) NOT NULL,
	[CreditCard] [char](16) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/4/2023 2:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[ReviewID] [int] NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Completed] [char](3) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [numeric](9, 2) NOT NULL,
	[ShippingDate] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/4/2023 2:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductCategory] [char](25) NOT NULL,
	[ProductColour] [char](25) NOT NULL,
	[Cost] [numeric](9, 2) NOT NULL,
	[ListPrice] [numeric](9, 2) NOT NULL,
	[InStock] [char](3) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/4/2023 2:26:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Review] [varchar](250) NOT NULL,
	[ReviewDate] [date] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (98, N'Newman
', N'London                             ', N'N6B 1P1', N'2260000006172830')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (154, N'Eduaro Corrochio
', N'Oshawa                             ', N'L1H 4N7', N'2260226756171430')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (160, N'Elaine Bennnis
', N'Woodstock                          ', N'N4S 5Z4', N'4290035006172830')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (210, N'Tim Whatley
', N'Windsor                            ', N'N8X 2C7', N'2145017503086420')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (237, N'George Costanza
', N'Barrie                             ', N'L4M 3C1', N'3822500392272830')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (314, N'Cosmo Kramer
', N'Toronto                            ', N'M5P 1P3', N'4760015006172830')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (517, N'Larry David
', N'London                             ', N'N6H 4S4', N'3390340134257150')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [City], [PostalCode], [CreditCard]) VALUES (618, N'Jerry Seinfeld
', N'Kingston                           ', N'K7L 1X7', N'2610017171561700')
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (1, 1, 314, 200292, CAST(N'2011-09-14' AS Date), N'yes', 1, CAST(80.00 AS Numeric(9, 2)), CAST(N'2011-09-15' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (2, 2, 98, 200296, CAST(N'2011-09-14' AS Date), N'yes', 3, CAST(225.00 AS Numeric(9, 2)), CAST(N'2011-09-16' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (3, 4, 154, 200292, CAST(N'2011-08-20' AS Date), N'yes', 2, CAST(160.00 AS Numeric(9, 2)), CAST(N'2011-08-22' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (4, 3, 618, 200010, CAST(N'2011-08-22' AS Date), N'yes', 2, CAST(40.00 AS Numeric(9, 2)), CAST(N'2011-08-24' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (5, NULL, 237, 200010, CAST(N'2011-09-20' AS Date), N'no ', 1, CAST(20.00 AS Numeric(9, 2)), CAST(N'2011-09-21' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (6, 5, 98, 200325, CAST(N'2011-09-16' AS Date), N'yes', 5, CAST(325.00 AS Numeric(9, 2)), CAST(N'2011-09-18' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (7, NULL, 160, 200400, CAST(N'2011-09-17' AS Date), N'yes', 1, CAST(91.00 AS Numeric(9, 2)), CAST(N'2011-09-19' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (8, NULL, 517, 200319, CAST(N'2011-09-01' AS Date), N'yes', 1, CAST(77.00 AS Numeric(9, 2)), CAST(N'2011-09-05' AS Date))
GO
INSERT [dbo].[Order] ([OrderID], [ReviewID], [CustomerID], [ProductID], [OrderDate], [Completed], [Quantity], [TotalPrice], [ShippingDate]) VALUES (9, NULL, 210, 200423, CAST(N'2011-10-03' AS Date), N'no ', 1, CAST(1085.00 AS Numeric(9, 2)), CAST(N'2011-10-10' AS Date))
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200010, N'20 lb Barbell
', N'freeweights
            ', N'Black
                  ', CAST(10.00 AS Numeric(9, 2)), CAST(20.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200145, N'Elliptical Trainer
', N'Exercise Machines
      ', N'Grey
                   ', CAST(400.00 AS Numeric(9, 2)), CAST(1000.00 AS Numeric(9, 2)), N'No ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200292, N'Soldier Apparel Jacket
', N'Soldier Apparel
        ', N'Grey
                   ', CAST(30.00 AS Numeric(9, 2)), CAST(80.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200296, N'Soldier Apparel T-Shirt
', N'Soldier Apparel
        ', N'Green
                  ', CAST(25.00 AS Numeric(9, 2)), CAST(75.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200319, N'Soldier Apparel Long Sleeve Shirt
', N'Soldier Apparel
        ', N'Navy
                   ', CAST(42.00 AS Numeric(9, 2)), CAST(77.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200325, N'Soldier Apparel toque
', N'Soldier Apparel
        ', N'Burgandy
               ', CAST(28.00 AS Numeric(9, 2)), CAST(65.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200400, N'Gym Partner
', N'Accessories
            ', N'Chocolate
              ', CAST(42.00 AS Numeric(9, 2)), CAST(91.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductCategory], [ProductColour], [Cost], [ListPrice], [InStock]) VALUES (200423, N'Gym Partner iPad
', N'Accessories
            ', N'Khaki
                  ', CAST(74.00 AS Numeric(9, 2)), CAST(155.00 AS Numeric(9, 2)), N'Yes')
GO
INSERT [dbo].[Review] ([ReviewID], [Rating], [Review], [ReviewDate]) VALUES (1, 4, N'Great product
', CAST(N'2011-09-20' AS Date))
GO
INSERT [dbo].[Review] ([ReviewID], [Rating], [Review], [ReviewDate]) VALUES (2, 5, N'Good
', CAST(N'2011-09-20' AS Date))
GO
INSERT [dbo].[Review] ([ReviewID], [Rating], [Review], [ReviewDate]) VALUES (3, 3, N'Excellent', CAST(N'2011-08-29' AS Date))
GO
INSERT [dbo].[Review] ([ReviewID], [Rating], [Review], [ReviewDate]) VALUES (4, 5, N'Excellent', CAST(N'2011-08-30' AS Date))
GO
INSERT [dbo].[Review] ([ReviewID], [Rating], [Review], [ReviewDate]) VALUES (5, 3, N'Not Bad', CAST(N'2011-09-22' AS Date))
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Products]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Review] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Review] ([ReviewID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Review]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer''s name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer''s city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer''s postal code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer''s credit card number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreditCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each review' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'ReviewID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When an order was placed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Whether the order is completed or not' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Completed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amount ordered' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total amount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When the order was shipped' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'ShippingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the product sold' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Category of the product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Colour of the product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductColour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How much an item was bought for' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How much an item is sold for' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ListPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Whether or not there is stock for an item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'InStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for each review' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Review', @level2type=N'COLUMN',@level2name=N'ReviewID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer’s rating for a product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Review', @level2type=N'COLUMN',@level2name=N'Rating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer’s review on a product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Review', @level2type=N'COLUMN',@level2name=N'Review'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the customer reviews an order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Review', @level2type=N'COLUMN',@level2name=N'ReviewDate'
GO
USE [master]
GO
ALTER DATABASE [DavidCardenasOchoa1] SET  READ_WRITE 
GO
