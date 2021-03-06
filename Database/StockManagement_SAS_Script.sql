USE [master]
GO
/****** Object:  Database [StockManagement_SAS]    Script Date: 11/28/2018 15:39:16 ******/
CREATE DATABASE [StockManagement_SAS] ON  PRIMARY 
( NAME = N'StockManagement', FILENAME = N'H:\code\Dot Net Visual C#\New folder\StockManagement.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagement_log', FILENAME = N'H:\code\Dot Net Visual C#\New folder\StockManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagement_SAS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagement_SAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagement_SAS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StockManagement_SAS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StockManagement_SAS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StockManagement_SAS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StockManagement_SAS] SET ARITHABORT OFF
GO
ALTER DATABASE [StockManagement_SAS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StockManagement_SAS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StockManagement_SAS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StockManagement_SAS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StockManagement_SAS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StockManagement_SAS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StockManagement_SAS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StockManagement_SAS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StockManagement_SAS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StockManagement_SAS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StockManagement_SAS] SET  DISABLE_BROKER
GO
ALTER DATABASE [StockManagement_SAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StockManagement_SAS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StockManagement_SAS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StockManagement_SAS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StockManagement_SAS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StockManagement_SAS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StockManagement_SAS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StockManagement_SAS] SET  READ_WRITE
GO
ALTER DATABASE [StockManagement_SAS] SET RECOVERY FULL
GO
ALTER DATABASE [StockManagement_SAS] SET  MULTI_USER
GO
ALTER DATABASE [StockManagement_SAS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StockManagement_SAS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockManagement_SAS', N'ON'
GO
USE [StockManagement_SAS]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Company] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON
INSERT [dbo].[Company] ([Id], [Name]) VALUES (9, N'Beximco')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (7, N'Fastrac')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (11, N'HoneySweet')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (10, N'Hp')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (5, N'Keya')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'Nestle')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Pran')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'RFL')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'S.Alam')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (8, N'shahadat and company')
SET IDENTITY_INSERT [dbo].[Company] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Sugar')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Fruits')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Chanachur')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Biscuits')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Milk')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Drinks')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Chips')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Tea')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Soap')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (10, N'Medicine')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (11, N'Laptop')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (12, N'Mobile')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (13, N'Glass')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (14, N'Table')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Items]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
	[ReorderLevel] [int] NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (1, N'GoodSugar', 7, 1, 1, 24)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (3, N'potato', 5, 2, 5, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (4, N'Milk Biscuit', 3, 4, 6, 30)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (5, N'goava', 2, 2, 6, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (6, N'mango', 2, 2, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (9, N'Cndense', 4, 5, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (10, N'Cndense', 5, 4, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (11, N'secklo', 6, 3, 563, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (12, N'secklo', 10, 9, 36, 40)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (13, N'Potato', 2, 5, 0, 89)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (14, N'Cndense', 3, 9, 563, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (15, N'Potato', 2, 7, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (16, N'Cndense', 9, 2, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (17, N'Omiprajol', 10, 7, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (18, N'Samsung C3', 1, 9, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (19, N'Samsung C3', 1, 7, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (20, N'Avisekh Biscuit', 4, 3, 12, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (21, N'ProoBook 450G2', 11, 10, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (22, N'Biscuits Nestle', 4, 3, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (23, N'Bexmico biscuit', 4, 9, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (24, N'PranSugar', 1, 4, 0, 0)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (25, N'Potato', 2, 4, 0, 87)
INSERT [dbo].[Items] ([Id], [Name], [CategoryId], [CompanyId], [ReorderLevel], [AvailableQuantity]) VALUES (26, N'Jhal Chanachur', 3, 3, 0, 0)
SET IDENTITY_INSERT [dbo].[Items] OFF
/****** Object:  View [dbo].[ItemSummaryView]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ItemSummaryView]
AS
SELECT     It.ID AS ItemId, It.Name AS ItemName, It.CompanyId, Cm.Name AS CompanyName, It.CategoryId, Cg.Name AS CategoryName, It.AvailableQuantity, It.ReorderLevel
FROM         dbo.Company AS Cm INNER JOIN
                      dbo.Items AS It ON Cm.ID = It.CompanyId INNER JOIN
                      dbo.Category AS Cg ON It.CategoryId = Cg.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[22] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "It"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 186
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cg"
            Begin Extent = 
               Top = 6
               Left = 448
               Bottom = 96
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cm"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 97
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemSummaryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemSummaryView'
GO
/****** Object:  Table [dbo].[ItemStockOut]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemStockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[StockOutType] [varchar](50) NULL,
	[Date] [date] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_StockOutItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ItemStockOut] ON
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (1, 1, N'Sell', CAST(0xD03E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (2, 4, N'Sell', CAST(0xEF3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (3, 1, N'Damage', CAST(0xE43E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (4, 4, N'Lost', CAST(0xE73E0B00 AS Date), 20)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (6, 1, N'Sell', CAST(0xDA3E0B00 AS Date), 30)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (7, 4, N'Sell', CAST(0xFC3E0B00 AS Date), 20)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (8, 1, N'Sell', CAST(0xFC3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (9, 4, N'Sell', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (10, 1, N'Sell', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (11, 4, N'Sell', CAST(0xFC3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (12, 1, N'Sell', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (13, 4, N'Sell', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (14, 4, N'Damage', CAST(0xFC3E0B00 AS Date), 20)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (15, 12, N'Damage', CAST(0xFC3E0B00 AS Date), 20)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (16, 12, N'Lost', CAST(0xFC3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (17, 1, N'Lost', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (18, 4, N'Damage', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (19, 12, N'Sell', CAST(0xFC3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (20, 12, N'Sell', CAST(0xFC3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (21, 12, N'Sell', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (22, 12, N'Sell', CAST(0xFC3E0B00 AS Date), 5)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (23, 12, N'Sell', CAST(0xFE3E0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (24, 13, N'Sell', CAST(0xFE3E0B00 AS Date), 11)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (25, 1, N'Sell', CAST(0xFE3E0B00 AS Date), 1)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (26, 12, N'Sell', CAST(0x003F0B00 AS Date), 10)
INSERT [dbo].[ItemStockOut] ([Id], [ItemId], [StockOutType], [Date], [Quantity]) VALUES (27, 25, N'Sell', CAST(0x013F0B00 AS Date), 13)
SET IDENTITY_INSERT [dbo].[ItemStockOut] OFF
/****** Object:  View [dbo].[StockOutItemView]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockOutItemView]
AS
SELECT     ISO.ItemId, It.Name AS ItemName, It.CompanyId, Cm.Name AS ComanyName, It.ReorderLevel, It.AvailableQuantity, ISO.Quantity AS StockOutQuantity, ISO.StockOutType, ISO.Date
FROM         dbo.Items AS It INNER JOIN
                      dbo.ItemStockOut AS ISO ON It.Id = ISO.ItemId INNER JOIN
                      dbo.Company AS Cm ON It.CompanyId = Cm.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "It"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 203
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ISO"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cm"
            Begin Extent = 
               Top = 6
               Left = 448
               Bottom = 197
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutItemView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutItemView'
GO
/****** Object:  View [dbo].[SalesView]    Script Date: 11/28/2018 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SalesView]
AS
SELECT     It.Name AS Item, Cm.Name AS Company, ISO.Quantity, ISO.Date, ISO.StockOutType
FROM         dbo.Items AS It INNER JOIN
                      dbo.Company AS Cm ON It.CompanyId = Cm.Id INNER JOIN
                      dbo.ItemStockOut AS ISO ON ISO.ItemId = It.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "It"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cm"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 96
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ISO"
            Begin Extent = 
               Top = 6
               Left = 448
               Bottom = 126
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SalesView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SalesView'
GO
/****** Object:  Default [DF_Items_ReorderLevel]    Script Date: 11/28/2018 15:39:16 ******/
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
GO
/****** Object:  Default [DF_Items_AvailableQuantity]    Script Date: 11/28/2018 15:39:16 ******/
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_AvailableQuantity]  DEFAULT ((0)) FOR [AvailableQuantity]
GO
/****** Object:  ForeignKey [FK_Items_Category]    Script Date: 11/28/2018 15:39:16 ******/
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
/****** Object:  ForeignKey [FK_Items_Company]    Script Date: 11/28/2018 15:39:16 ******/
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Company]
GO
/****** Object:  ForeignKey [FK_StockOutItem_Items]    Script Date: 11/28/2018 15:39:16 ******/
ALTER TABLE [dbo].[ItemStockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOutItem_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[ItemStockOut] CHECK CONSTRAINT [FK_StockOutItem_Items]
GO
