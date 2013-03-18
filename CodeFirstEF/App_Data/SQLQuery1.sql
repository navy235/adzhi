USE [CodeFirstBase]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_dbo.Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Group] ON
INSERT [dbo].[Group] ([GroupID], [Name], [Description]) VALUES (1, N'基本会员', N'基本会员')
INSERT [dbo].[Group] ([GroupID], [Name], [Description]) VALUES (2, N'Backup Operators', N'备份操作员为了备份或还原文件可以替代安全限制')
INSERT [dbo].[Group] ([GroupID], [Name], [Description]) VALUES (3, N'Video Manager', N'视频监管,视频审核')
INSERT [dbo].[Group] ([GroupID], [Name], [Description]) VALUES (4, N'超级管理员', N'超级管理员')
SET IDENTITY_INSERT [dbo].[Group] OFF
/****** Object:  Table [dbo].[Member]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[GroupID] [int] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[LastIP] [nvarchar](50) NULL,
	[AddTime] [datetime] NOT NULL,
	[AddIP] [nvarchar](50) NULL,
	[LoginCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[OpenType] [int] NOT NULL,
	[OpenID] [nvarchar](50) NULL,
	[AvtarUrl] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON
INSERT [dbo].[Member] ([MemberID], [Email], [NickName], [Password], [GroupID], [LastTime], [LastIP], [AddTime], [AddIP], [LoginCount], [Status], [CompanyID], [OpenType], [OpenID], [AvtarUrl]) VALUES (1, N'shenhaijunmail@163.com', N'夜幕流浪', N'a67efd04f1d08836', 4, CAST(0x0000A185016390B5 AS DateTime), N'127.0.0.1', CAST(0x0000A18000FD8227 AS DateTime), N'127.0.0.1', 8, 2, NULL, 2, N'2.007Gt8CC0J5WSa06a8ba417eWyoIlD', N'/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg')
INSERT [dbo].[Member] ([MemberID], [Email], [NickName], [Password], [GroupID], [LastTime], [LastIP], [AddTime], [AddIP], [LoginCount], [Status], [CompanyID], [OpenType], [OpenID], [AvtarUrl]) VALUES (2, N'56404908@qq.com', N'鹏飞', N'954a8069343989ba', 1, CAST(0x0000A184013197E0 AS DateTime), N'127.0.0.1', CAST(0x0000A18201299D65 AS DateTime), N'127.0.0.1', 2, 3, NULL, 1, N'867500BB0033503199D9DC514C44A18D', NULL)
SET IDENTITY_INSERT [dbo].[Member] OFF
/****** Object:  Table [dbo].[Member_Action]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member_Action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActionType] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Description] [nvarchar](150) NULL,
	[AddTime] [datetime] NOT NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Member_Action] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member_Action] ON
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (1, 6, 1, N'40872009-a244-4dad-94d7-355410f281f9', CAST(0x0000A18000FE99A0 AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (2, 3, 1, N'登录', CAST(0x0000A18200B30360 AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (3, 3, 1, N'登录', CAST(0x0000A182012B7F1B AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (4, 3, 1, N'登录', CAST(0x0000A182012BEBEC AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (5, 3, 1, N'登录', CAST(0x0000A18301518CAE AS DateTime), NULL)
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (6, 3, 2, N'登录', CAST(0x0000A184013197E0 AS DateTime), NULL)
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (7, 6, 2, N'df921c99-ccfa-4556-8ae1-2f48c4bbd3de', CAST(0x0000A184014587A7 AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (8, 7, 2, N'', CAST(0x0000A18501517D54 AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (9, 3, 1, N'登录', CAST(0x0000A18501523E86 AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (10, 3, 1, N'登录', CAST(0x0000A18501630B2E AS DateTime), N'127.0.0.1')
INSERT [dbo].[Member_Action] ([ID], [ActionType], [MemberID], [Description], [AddTime], [IP]) VALUES (11, 3, 1, N'登录', CAST(0x0000A185016390B5 AS DateTime), N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[Member_Action] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateCode] [nvarchar](20) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NOT NULL,
	[Length] [int] NOT NULL,
	[PCateCode] [nvarchar](20) NULL,
	[OrderIndex] [int] NOT NULL,
	[CategoryType] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[CateCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001', 1, N'北京', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001001', 5, N'东城区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001002', 6, N'西城区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001003', 7, N'朝阳区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001004', 8, N'丰台区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001005', 9, N'石景山区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001006', 10, N'海淀区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001007', 11, N'门头沟区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001008', 12, N'房山区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001009', 13, N'通州区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001010', 14, N'顺义区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001011', 15, N'昌平区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001012', 16, N'大兴区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001013', 17, N'怀柔区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001014', 18, N'平谷区', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001015', 19, N'密云县', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'001016', 20, N'延庆县', 6, N'001', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002', 21, N'上海市', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002001', 22, N'黄浦区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002002', 23, N'徐汇区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002003', 24, N'长宁区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002004', 25, N'静安区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002005', 26, N'普陀区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002006', 27, N'闸北区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002007', 28, N'虹口区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002008', 29, N'杨浦区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002009', 30, N'闵行区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002010', 31, N'宝山区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002011', 32, N'嘉定区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002012', 33, N'浦东新区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002013', 34, N'金山区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002014', 35, N'松江区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002015', 36, N'青浦区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002016', 37, N'奉贤区', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'002017', 38, N'崇明县', 6, N'002', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003', 39, N'天津市', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003001', 40, N'和平区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003002', 41, N'河东区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003003', 42, N'河西区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003004', 43, N'南开区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003005', 44, N'河北区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003006', 45, N'红桥区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003007', 46, N'东丽区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003008', 47, N'西青区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003009', 48, N'津南区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003010', 49, N'北辰区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003011', 50, N'武清区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003012', 51, N'宝坻区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003013', 52, N'滨海新区', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003014', 53, N'宁河县', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003015', 54, N'静海县', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'003016', 55, N'蓟县县', 6, N'003', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004', 56, N'重庆市', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004001', 57, N'渝中区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004002', 58, N'大渡口区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004003', 59, N'江北区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004004', 60, N'沙坪坝区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004005', 61, N'九龙坡区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004006', 62, N'南岸区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004007', 63, N'北碚区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004008', 64, N'渝北区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004009', 65, N'巴南区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004010', 66, N'万州区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004011', 67, N'涪陵区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004012', 68, N'黔江区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004013', 69, N'长寿区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004014', 70, N'江津区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004015', 71, N'合川区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004016', 72, N'永川区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004017', 73, N'南川区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004018', 74, N'綦江区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'004019', 75, N'大足区', 6, N'004', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005', 76, N'河北省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005001', 77, N'石家庄', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005002', 78, N'唐山市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005003', 79, N'秦皇岛', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005004', 80, N'邯郸市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005005', 81, N'邢台市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005006', 82, N'张家口', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005007', 83, N'保定市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005008', 84, N'承德市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005009', 85, N'沧州市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005010', 86, N'廊坊市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'005011', 87, N'衡水市', 6, N'005', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006', 88, N'山西省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006001', 89, N'太原市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006002', 90, N'大同市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006003', 91, N'阳泉市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006004', 92, N'长治市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006005', 93, N'晋城市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006006', 94, N'朔州市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006007', 95, N'晋中市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006008', 96, N'运城市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006009', 97, N'忻州市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006010', 98, N'临汾市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'006011', 99, N'吕梁市', 6, N'006', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007', 100, N'内蒙古', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007001', 101, N'呼和浩特', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007002', 102, N'包头市', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007003', 103, N'乌海市', 6, N'007', 0, N'Area')
GO
print 'Processed 100 total records'
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007004', 104, N'赤峰市', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007005', 105, N'通辽市', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007006', 106, N'鄂尔多斯', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007007', 107, N'呼伦贝尔', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007008', 108, N'巴彦淖尔', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007009', 109, N'乌兰察布', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007010', 110, N'兴安市', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007011', 111, N'锡林郭勒', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'007012', 112, N'阿拉善', 6, N'007', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008', 113, N'辽宁省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008001', 114, N'沈阳市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008002', 115, N'大连市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008003', 116, N'鞍山市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008004', 117, N'抚顺市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008005', 118, N'本溪市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008006', 119, N'丹东市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008007', 120, N'锦州市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008008', 121, N'营口市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008009', 122, N'阜新市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008010', 123, N'辽阳市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008011', 124, N'盘锦市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008012', 125, N'铁岭市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008013', 126, N'朝阳市', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'008014', 127, N'葫芦岛', 6, N'008', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009', 128, N'吉林省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009001', 129, N'长春市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009002', 130, N'吉林市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009003', 131, N'四平市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009004', 132, N'辽源市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009005', 133, N'通化市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009006', 134, N'白山市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009007', 135, N'松原市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009008', 136, N'延边市', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'009009', 137, N'白城', 6, N'009', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010', 138, N'黑龙江省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010001', 139, N'哈尔滨', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010002', 140, N'齐齐哈尔', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010003', 141, N'鸡西市', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010004', 142, N'鹤岗市', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010005', 143, N'双鸭山', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010006', 144, N'大庆市', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010007', 145, N'伊春市', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010008', 146, N'佳木斯', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010009', 147, N'七台河', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010010', 148, N'牡丹江', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010011', 149, N'黑河市', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010012', 150, N'绥化市', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'010013', 151, N'大兴安岭', 6, N'010', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011', 152, N'江苏省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011001', 153, N'南京市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011002', 154, N'无锡市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011003', 155, N'徐州市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011004', 156, N'常州市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011005', 157, N'苏州市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011006', 158, N'南通市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011007', 159, N'连云港', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011008', 160, N'淮安市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011009', 161, N'盐城市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011010', 162, N'扬州市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011011', 163, N'泰州市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011012', 164, N'宿迁市', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'011013', 165, N'常熟', 6, N'011', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012', 166, N'浙江省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012001', 167, N'杭州市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012002', 168, N'宁波市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012003', 169, N'温州市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012004', 170, N'嘉兴市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012005', 171, N'湖州市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012006', 172, N'绍兴市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012007', 173, N'金华市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012008', 174, N'衢州市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012009', 175, N'舟山市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012010', 176, N'丽水市', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'012011', 177, N'乐清', 6, N'012', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013', 178, N'安徽省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013001', 179, N'合肥市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013002', 180, N'芜湖市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013003', 181, N'蚌埠市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013004', 182, N'淮南市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013005', 183, N'马鞍山', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013006', 184, N'淮北市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013007', 185, N'铜陵市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013008', 186, N'安庆市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013009', 187, N'黄山市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013010', 188, N'滁州市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013011', 189, N'阜阳市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013012', 190, N'宿州市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013013', 191, N'巢湖市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013014', 192, N'六安市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013015', 193, N'毫州市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013016', 194, N'池州市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'013017', 195, N'宣城市', 6, N'013', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014', 196, N'福建省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014001', 197, N'福州市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014002', 198, N'厦门市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014003', 199, N'莆田市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014004', 200, N'三明市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014005', 201, N'泉州市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014006', 202, N'漳州市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014007', 203, N'南平市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014008', 204, N'龙岩市', 6, N'014', 0, N'Area')
GO
print 'Processed 200 total records'
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'014009', 205, N'宁德市', 6, N'014', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015', 206, N'江西省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015001', 207, N'南昌', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015002', 208, N'景德镇', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015003', 209, N'萍乡', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015004', 210, N'九江', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015005', 211, N'新余', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015006', 212, N'鹰潭', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015007', 213, N'吉安', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015008', 214, N'宜春', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015009', 215, N'抚州', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015010', 216, N'上饶', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'015011', 217, N'赣州', 6, N'015', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016', 218, N'山东省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016001', 219, N'济南', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016002', 220, N'青岛', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016003', 221, N'淄博', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016004', 222, N'枣庄', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016005', 223, N'东营', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016006', 224, N'烟台', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016007', 225, N'潍坊', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016008', 226, N'威海', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016009', 227, N'济宁', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016010', 228, N'泰安', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016011', 229, N'日照', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016012', 230, N'莱芜', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016013', 231, N'临沂', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016014', 232, N'德州', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016015', 233, N'聊城', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016016', 234, N'滨州', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016017', 235, N'菏泽', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'016018', 236, N'昌邑', 6, N'016', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017', 237, N'河南省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017001', 238, N'郑州', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017002', 239, N'开封', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017003', 240, N'洛阳', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017004', 241, N'平顶山', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017005', 242, N'焦作', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017006', 243, N'鹤壁', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017007', 244, N'新乡', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017008', 245, N'安阳', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017009', 246, N'濮阳', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017010', 247, N'许昌', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017011', 248, N'漯河', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017012', 249, N'三门峡', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017013', 250, N'南阳', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017014', 251, N'商丘', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017015', 252, N'信阳', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017016', 253, N'周口', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'017017', 254, N'驻马店', 6, N'017', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018', 255, N'湖北省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018001', 256, N'武汉', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018002', 257, N'黄石', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018003', 258, N'襄樊', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018004', 259, N'十堰', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018005', 260, N'荆州', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018006', 261, N'宜昌', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018007', 262, N'荆门', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018008', 263, N'鄂州', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018009', 264, N'孝感', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018010', 265, N'黄冈', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018011', 266, N'咸宁', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018012', 267, N'随州', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018013', 268, N'恩施', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'018014', 269, N'潜江', 6, N'018', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019', 270, N'湖南省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019001', 271, N'长沙', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019002', 272, N'株洲', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019003', 273, N'湘潭', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019004', 274, N'衡阳', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019005', 275, N'邵阳', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019006', 276, N'岳阳', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019007', 277, N'常德', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019008', 278, N'张家界', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019009', 279, N'郴州', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019010', 280, N'益阳', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019011', 281, N'永州', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019012', 282, N'怀化', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019013', 283, N'娄底', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'019014', 284, N'湘西', 6, N'019', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020', 285, N'广东省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020001', 286, N'广州', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020002', 287, N'深圳', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020003', 288, N'珠海', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020004', 289, N'汕头', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020005', 290, N'韶关', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020006', 291, N'佛山', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020007', 292, N'江门', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020008', 293, N'湛江', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020009', 294, N'茂名', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020010', 295, N'肇庆', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020011', 296, N'惠州', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020012', 297, N'梅州', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020013', 298, N'汕尾', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020014', 299, N'河源', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020015', 300, N'阳江', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020016', 301, N'清远', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020017', 302, N'潮州', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020018', 303, N'揭阳', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020019', 304, N'云浮', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020020', 305, N'东莞', 6, N'020', 0, N'Area')
GO
print 'Processed 300 total records'
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'020021', 306, N'中山', 6, N'020', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021', 307, N'广西', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021001', 308, N'南宁', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021002', 309, N'柳州', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021003', 310, N'桂林', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021004', 311, N'梧州', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021005', 312, N'北海', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021006', 313, N'防城港', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021007', 314, N'钦州', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021008', 315, N'贵港', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021009', 316, N'玉林', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021010', 317, N'百色', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021011', 318, N'贺州', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021012', 319, N'河池', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021013', 320, N'来宾', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'021014', 321, N'崇左', 6, N'021', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'022', 322, N'海南省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'022001', 323, N'海口', 6, N'022', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'022002', 324, N'三亚', 6, N'022', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023', 325, N'四川省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023001', 326, N'成都', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023002', 327, N'自贡', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023003', 328, N'攀枝花', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023004', 329, N'泸州', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023005', 330, N'德阳', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023006', 331, N'绵阳', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023007', 332, N'广元', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023008', 333, N'遂宁', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023009', 334, N'内江', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023010', 335, N'乐山', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023011', 336, N'南充', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023012', 337, N'宜宾', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023013', 338, N'广安', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023014', 339, N'达州', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023015', 340, N'眉山', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023016', 341, N'巴中', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023017', 342, N'资阳', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023018', 343, N'阿坝', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023019', 344, N'甘孜', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023020', 345, N'凉山', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023021', 346, N'雅安', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'023022', 347, N'都江堰', 6, N'023', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024', 348, N'贵州省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024001', 349, N'贵阳', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024002', 350, N'六盘水', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024003', 351, N'遵义', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024004', 352, N'安顺', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024005', 353, N'铜仁', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024006', 354, N'毕节', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024007', 355, N'黔西南', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024008', 356, N'黔东南', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'024009', 357, N'黔南', 6, N'024', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025', 358, N'云南省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025001', 359, N'昆明', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025002', 360, N'曲靖', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025003', 361, N'玉溪', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025004', 362, N'保山', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025005', 363, N'昭通', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025006', 364, N'普洱', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025007', 365, N'丽江', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025008', 366, N'临沧', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025009', 367, N'文山', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025010', 368, N'红河', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025011', 369, N'西双版纳', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025012', 370, N'楚雄', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025013', 371, N'大理', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025014', 372, N'德宏', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025015', 373, N'怒江', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'025016', 374, N'迪庆', 6, N'025', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026', 375, N'西藏', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026001', 376, N'拉萨', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026002', 377, N'昌都', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026003', 378, N'山南', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026004', 379, N'日喀则', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026005', 380, N'那曲', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026006', 381, N'阿里', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'026007', 382, N'林芝', 6, N'026', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027', 383, N'陕西省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027001', 384, N'西安', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027002', 385, N'铜川', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027003', 386, N'宝鸡', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027004', 387, N'咸阳', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027005', 388, N'渭南', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027006', 389, N'延安', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027007', 390, N'汉中', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027008', 391, N'榆林', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027009', 392, N'安康', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'027010', 393, N'商洛', 6, N'027', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028', 394, N'甘肃省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028001', 395, N'兰州', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028002', 396, N'嘉峪关', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028003', 397, N'金昌', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028004', 398, N'白银', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028005', 399, N'天水', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028006', 400, N'武威', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028007', 401, N'张掖', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028008', 402, N'平凉', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028009', 403, N'酒泉', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028010', 404, N'庆阳', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028011', 405, N'定西', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028012', 406, N'陇南', 6, N'028', 0, N'Area')
GO
print 'Processed 400 total records'
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028013', 407, N'临夏', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'028014', 408, N'甘南', 6, N'028', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029', 409, N'青海省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029001', 410, N'西宁', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029002', 411, N'海东', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029003', 412, N'海北', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029004', 413, N'黄南', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029005', 414, N'海南', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029006', 415, N'果洛', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029007', 416, N'玉树', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'029008', 417, N'海西', 6, N'029', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'030', 418, N'宁夏', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'030001', 419, N'银川', 6, N'030', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'030002', 420, N'石嘴山', 6, N'030', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'030003', 421, N'吴忠', 6, N'030', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'030004', 422, N'固原', 6, N'030', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'030005', 423, N'中卫', 6, N'030', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031', 424, N'新疆', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031001', 425, N'乌鲁木齐', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031002', 426, N'克拉玛依', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031003', 427, N'吐鲁番', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031004', 428, N'哈密', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031005', 429, N'和田', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031006', 430, N'阿克苏', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031007', 431, N'喀什', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031008', 432, N'克孜勒苏柯尔克孜', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031009', 433, N'巴音郭楞', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031010', 434, N'蒙古', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031011', 435, N'昌吉', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031012', 436, N'博尔塔拉蒙古', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031013', 437, N'伊犁哈萨克', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031014', 438, N'塔城', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'031015', 439, N'阿勒泰', 6, N'031', 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'032', 440, N'香港', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'033', 441, N'澳门', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'034', 442, N'台湾省', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'035', 443, N'全国', 3, NULL, 0, N'Area')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CB01', 543, N'买广告媒体', 0, NULL, 0, N'CompanyBussiness')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CB02', 542, N'卖广告媒体', 0, NULL, 0, N'CompanyBussiness')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF01', 558, N'5万以下', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF02', 557, N'5万-10万', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF03', 556, N'10万-50万', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF04', 555, N'50万-100万', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF05', 554, N'100万-500万', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF06', 553, N'500万-1000万', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF07', 552, N'1000万-5000万', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CF08', 551, N'5000万以上', 0, NULL, 0, N'CompanyFund')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS01', 550, N'20人以下', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS02', 549, N'20-99人', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS03', 548, N'100-499人', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS04', 547, N'500-999人', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS05', 546, N'1000-4999人', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS06', 545, N'5000-9999人', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'CS07', 544, N'10000人以上', 0, NULL, 0, N'CompanyScale')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01', 2, N'商住楼宇媒体 ', 3, NULL, 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01001', 475, N'楼宇液晶电视', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01002', 474, N'大厅海报', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01003', 473, N'电梯看板', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01004', 472, N'电梯门贴', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01005', 471, N'地下停车场', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01006', 470, N'公告栏', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01007', 469, N'墙体大牌', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01008', 468, N'楼顶大牌', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01009', 467, N'大型LED', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D01999', 466, N'其他', 0, N'D01', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02', 476, N'社区内网络媒体', 0, NULL, 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02001', 488, N'普通住宅', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02002', 487, N'公寓住宅', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02003', 486, N'中档住宅', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02004', 485, N'高档住宅', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02005', 484, N'商住社区', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02006', 483, N'别墅区住宅', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D02999', 482, N'其它', 0, N'D02', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03', 481, N'公共交通媒体', 0, NULL, 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03001', 495, N'市内巴士', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03002', 494, N'的士', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03003', 493, N'省外大巴', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03004', 492, N'地铁', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03005', 491, N'列车', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03006', 490, N'船运', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D03999', 489, N'其它', 0, N'D03', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04', 480, N'机场媒体', 0, NULL, 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04001', 496, N'机场高速', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04002', 510, N'机场大牌', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04003', 509, N'机场看板', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04004', 508, N'机场灯箱', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04005', 507, N'机场包柱', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04006', 506, N'机场电视', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04007', 505, N'机场吊旗', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04008', 504, N'廊桥广告', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04009', 503, N'数码刷屏机', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04010', 502, N'机翼广告', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04011', 501, N'机票广告', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04012', 500, N'飞机椅套广告', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04013', 499, N'刊物', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04014', 498, N'展架', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D04999', 497, N'其它', 0, N'D04', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05', 479, N'公共场所媒体', 0, NULL, 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05001', 524, N'百货商场', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05002', 523, N'超市', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05003', 522, N'户外广场', 0, N'D05', 0, N'OutDoorMedia')
GO
print 'Processed 500 total records'
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05004', 521, N'医院', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05005', 520, N'高校', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05006', 519, N'高尔夫球场', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05007', 518, N'艺术中心', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05008', 517, N'加油站', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05009', 516, N'边检站', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05010', 515, N'健身会所', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05011', 514, N'公园', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05012', 513, N'景点', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05013', 512, N'娱乐场', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D05999', 511, N'其它', 0, N'D05', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07', 477, N'公路户外大牌', 0, NULL, 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07001', 531, N'立柱', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07002', 530, N'立地大牌', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07003', 529, N'墙体', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07004', 528, N' 楼顶', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07005', 527, N'围挡', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07006', 526, N'包楼广告', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'D07999', 525, N'其它', 0, N'D07', 0, N'OutDoorMedia')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F01', 3, N'喷绘/写真', 3, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F02', 444, N'喷画灯箱', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F03', 445, N'LED灯箱', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F04', 446, N'大型LED电视	', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F05', 465, N'多面翻', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F06', 464, N'电视', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F07', 463, N'大型看板', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F08', 462, N'门贴', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F09', 461, N'车身喷画	', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F10', 460, N'灯旗', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F11', 459, N'椅套', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F12', 458, N'包柱', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F13', 457, N'拉手套 ', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F14', 456, N'车贴', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F15', 455, N'电梯看板	', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F16', 454, N'墙体喷漆', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F17', 453, N'窗贴', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F18', 452, N'投光灯', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F19', 451, N'堆头造型', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F20', 450, N'平面媒体', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F21', 449, N'空中汽艇', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F22', 448, N'霓虹灯', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'F99', 447, N'其他', 0, NULL, 0, N'Format')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'O01', 541, N'一般代理', 0, NULL, 0, N'Owner')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'O02', 540, N'自有媒体', 0, NULL, 0, N'Owner')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'O03', 539, N'独家代理', 0, NULL, 0, N'Owner')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'O04', 538, N'行业代理', 0, NULL, 0, N'Owner')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'O05', 537, N'优势代理', 0, NULL, 0, N'Owner')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'P01', 4, N'一月', 3, NULL, 0, N'Period')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'P02', 536, N'一季度', 0, NULL, 0, N'Period')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'P03', 535, N'半年', 0, NULL, 0, N'Period')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'P04', 534, N'一年', 0, NULL, 0, N'Period')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'P05', 533, N'两年', 0, NULL, 0, N'Period')
INSERT [dbo].[Category] ([CateCode], [ID], [CateName], [Length], [PCateCode], [OrderIndex], [CategoryType]) VALUES (N'P06', 532, N'两年以上', 0, NULL, 0, N'Period')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Company]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[MemberID] [int] NOT NULL,
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[LinkMan] [nvarchar](50) NULL,
	[Sex] [bit] NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[MSN] [nvarchar](50) NULL,
	[Lat] [float] NOT NULL,
	[Lng] [float] NOT NULL,
	[CityCode] [nvarchar](20) NOT NULL,
	[ScaleCode] [nvarchar](20) NOT NULL,
	[FundCode] [nvarchar](20) NOT NULL,
	[BussinessCode] [nvarchar](20) NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[LastIP] [nvarchar](50) NULL,
	[AddTime] [datetime] NOT NULL,
	[AddIP] [nvarchar](50) NULL,
	[Unapprovedlog] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.Company] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON
INSERT [dbo].[Company] ([MemberID], [CompanyID], [Name], [LinkMan], [Sex], [Address], [Phone], [Mobile], [Fax], [QQ], [MSN], [Lat], [Lng], [CityCode], [ScaleCode], [FundCode], [BussinessCode], [LastTime], [LastIP], [AddTime], [AddIP], [Unapprovedlog], [Status], [Description]) VALUES (2, 1, N'生活之阿飞大苏打', N'生活之', 0, N'生活之阿飞大苏打', NULL, N'18321841288', NULL, NULL, NULL, 112.97635650634766, 28.211130142211914, N'003003', N'CS03', N'CF08', N'CB02', CAST(0x0000A18501517CD7 AS DateTime), N'127.0.0.1', CAST(0x0000A18501517CD7 AS DateTime), N'127.0.0.1', NULL, 2, N'生活之阿飞大苏打')
SET IDENTITY_INSERT [dbo].[Company] OFF
/****** Object:  Table [dbo].[LinkManImg]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkManImg](
	[CompanyID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ImgUrls] [nvarchar](2000) NOT NULL,
	[FocusImgUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.LinkManImg] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LinkManImg] ON
INSERT [dbo].[LinkManImg] ([CompanyID], [ID], [MemberID], [ImgUrls], [FocusImgUrl]) VALUES (2, 1, 2, N'/Upload/Normal/2013/3/18/e3ffeaf9-7fe3-48ff-b889-d7e72444e8a0_800.JPG,/Upload/Normal/2013/3/18/4a9c2e79-e303-4471-8456-542b2af002b5_800.JPG', N'/Upload/Normal/2013/3/18/e3ffeaf9-7fe3-48ff-b889-d7e72444e8a0_800.JPG')
SET IDENTITY_INSERT [dbo].[LinkManImg] OFF
/****** Object:  Table [dbo].[CompanyImg]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyImg](
	[CompanyID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ImgUrls] [nvarchar](2000) NOT NULL,
	[FocusImgUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.CompanyImg] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyImg] ON
INSERT [dbo].[CompanyImg] ([CompanyID], [ID], [MemberID], [ImgUrls], [FocusImgUrl]) VALUES (2, 1, 2, N'/Upload/Normal/2013/3/18/cccc55fe-eb59-430d-9208-3fa3cc78f89d_800.JPG,/Upload/Normal/2013/3/18/baad38f6-3fdd-4729-b417-c01918eb85f7_800.JPG', N'/Upload/Normal/2013/3/18/cccc55fe-eb59-430d-9208-3fa3cc78f89d_800.JPG')
SET IDENTITY_INSERT [dbo].[CompanyImg] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (2, N'权限管理', N'权限管理')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (3, N'角色管理', N'角色管理')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (4, N'用户群组管理', N'用户群组管理')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (5, N'部门管理', N'部门管理')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (6, N'后台登陆', N'后台登陆')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (7, N'用户管理', N'用户管理')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (8, N'基本会员', N'基本会员')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (9, N'数据字典管理', N'数据字典管理')
INSERT [dbo].[Roles] ([ID], [Name], [Description]) VALUES (10, N'企业信息审核', N'企业信息审核')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[WorkItem]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobName] [nvarchar](64) NULL,
	[WorkerId] [nvarchar](64) NULL,
	[Started] [datetime] NOT NULL,
	[Completed] [datetime] NULL,
	[ExceptionInfo] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.WorkItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WorkItem] ON
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (1, N'Lucene', N'9b2fb4d8-a8c0-4b43-a360-b5010748b986', CAST(0x0000A18000794260 AS DateTime), CAST(0x0000A180007C02A3 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (2, N'Lucene', N'9b2fb4d8-a8c0-4b43-a360-b5010748b986', CAST(0x0000A180007C02A9 AS DateTime), CAST(0x0000A180007F849F AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (3, N'Lucene', N'9b2fb4d8-a8c0-4b43-a360-b5010748b986', CAST(0x0000A180007F84AB AS DateTime), CAST(0x0000A180007F84CB AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (4, N'Lucene', N'718ba664-2917-4db7-9603-6845a9020232', CAST(0x0000A180007FE0CE AS DateTime), CAST(0x0000A1800082A010 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (5, N'Lucene', N'718ba664-2917-4db7-9603-6845a9020232', CAST(0x0000A1800082A011 AS DateTime), CAST(0x0000A18000855F66 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (6, N'Lucene', N'718ba664-2917-4db7-9603-6845a9020232', CAST(0x0000A18000855F6A AS DateTime), CAST(0x0000A18000874246 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (7, N'Lucene', N'2e9c757d-9143-43be-b0e7-280bb5f970ca', CAST(0x0000A18000874277 AS DateTime), CAST(0x0000A180008A0229 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (8, N'Lucene', N'2e9c757d-9143-43be-b0e7-280bb5f970ca', CAST(0x0000A180008A023B AS DateTime), CAST(0x0000A180008CC246 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (9, N'Lucene', N'2e9c757d-9143-43be-b0e7-280bb5f970ca', CAST(0x0000A180008CC247 AS DateTime), CAST(0x0000A1800093A88B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (10, N'Lucene', N'f63f22fd-b7a6-471a-bcae-aff4702890fa', CAST(0x0000A1800093A92E AS DateTime), CAST(0x0000A180009A75FF AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (11, N'Lucene', N'c8c2c23e-0547-4b5e-b2d9-d0a2a3669fb7', CAST(0x0000A180009A7668 AS DateTime), CAST(0x0000A180009BDFF5 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (12, N'Lucene', N'2b327064-b0b8-42d1-8e21-751f6bca32d7', CAST(0x0000A180009BE014 AS DateTime), CAST(0x0000A180009D67E2 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (13, N'Lucene', N'916a5494-44e0-4355-b147-24c4aaaa3056', CAST(0x0000A180009D6800 AS DateTime), CAST(0x0000A18000A4A55D AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (14, N'Lucene', N'1da5da9a-30dc-4b8e-89e7-600157530451', CAST(0x0000A18000A4A57C AS DateTime), CAST(0x0000A18000A764CF AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (15, N'Lucene', N'1da5da9a-30dc-4b8e-89e7-600157530451', CAST(0x0000A18000A764CF AS DateTime), CAST(0x0000A1810070E514 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (16, N'Lucene', N'645aac68-c576-4631-96d4-8c7a9b6db4b4', CAST(0x0000A1810070E6B0 AS DateTime), CAST(0x0000A1810073A648 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (17, N'Lucene', N'645aac68-c576-4631-96d4-8c7a9b6db4b4', CAST(0x0000A1810073A649 AS DateTime), CAST(0x0000A18100766581 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (18, N'Lucene', N'645aac68-c576-4631-96d4-8c7a9b6db4b4', CAST(0x0000A18100766583 AS DateTime), CAST(0x0000A1810077DF26 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (19, N'Lucene', N'571f6ea2-7441-403c-bf66-06074c29ba93', CAST(0x0000A1810077DFF7 AS DateTime), CAST(0x0000A1810079F872 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (20, N'Lucene', N'd5555e7a-7f03-422f-9c9d-c2572dd0f1ad', CAST(0x0000A1810079F8A5 AS DateTime), CAST(0x0000A181007B301C AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (21, N'Lucene', N'4cef4f36-871a-4836-9b7b-cd1f9019d0ad', CAST(0x0000A181007B3059 AS DateTime), CAST(0x0000A181007DEFDA AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (22, N'Lucene', N'4cef4f36-871a-4836-9b7b-cd1f9019d0ad', CAST(0x0000A181007DEFDA AS DateTime), CAST(0x0000A1810080AF02 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (23, N'Lucene', N'4cef4f36-871a-4836-9b7b-cd1f9019d0ad', CAST(0x0000A1810080AF03 AS DateTime), CAST(0x0000A18100836E2B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (24, N'Lucene', N'4cef4f36-871a-4836-9b7b-cd1f9019d0ad', CAST(0x0000A18100836E2B AS DateTime), CAST(0x0000A181009EACA3 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (25, N'Lucene', N'22236344-b41e-40bd-9414-b322845ba6b0', CAST(0x0000A181009EAD82 AS DateTime), CAST(0x0000A181009F97A6 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (26, N'Lucene', N'aaddccdf-d0f7-4b3b-99f2-d1c8807c24a9', CAST(0x0000A181009F97BC AS DateTime), CAST(0x0000A181009F97CA AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (27, N'Lucene', N'f486e30a-b1fa-466a-88b7-f46af40814c0', CAST(0x0000A181009FD9E6 AS DateTime), CAST(0x0000A18100A3679C AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (28, N'Lucene', N'3e297d8f-13b2-4a31-beef-cf8c424134dd', CAST(0x0000A18100A367EE AS DateTime), CAST(0x0000A18100A36826 AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (29, N'Lucene', N'124a1363-6e15-4745-9963-533b22e3dba0', CAST(0x0000A18100A39309 AS DateTime), CAST(0x0000A18100A61FA1 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (30, N'Lucene', N'9af5e528-4bdd-45a7-a4ad-34b59175cd93', CAST(0x0000A18100A61FC3 AS DateTime), CAST(0x0000A18100A61FDD AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (31, N'Lucene', N'a7fb792d-73ea-4741-b3ac-dfacca5e8402', CAST(0x0000A18100A6A408 AS DateTime), CAST(0x0000A18100A96348 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (32, N'Lucene', N'a7fb792d-73ea-4741-b3ac-dfacca5e8402', CAST(0x0000A18100A96348 AS DateTime), CAST(0x0000A1820024F83E AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (33, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A1820024F932 AS DateTime), CAST(0x0000A1820027B88E AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (34, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A1820027B88F AS DateTime), CAST(0x0000A182002A77C3 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (35, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A182002A77C4 AS DateTime), CAST(0x0000A182002D36F8 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (36, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A182002D36F9 AS DateTime), CAST(0x0000A182002FF639 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (37, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A182002FF63A AS DateTime), CAST(0x0000A1820032B573 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (38, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A1820032B576 AS DateTime), CAST(0x0000A182003574B4 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (39, N'Lucene', N'3e4d56f2-e4e7-43ae-bb12-752ef238e98a', CAST(0x0000A182003574B9 AS DateTime), CAST(0x0000A18200369C2B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (40, N'Lucene', N'da23facb-1054-4150-845c-434541ef8401', CAST(0x0000A18200369CAD AS DateTime), CAST(0x0000A1820039DB5A AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (41, N'Lucene', N'cdadbf50-3dba-4313-837c-5ecd60cf31b5', CAST(0x0000A1820039DBC3 AS DateTime), CAST(0x0000A182003AE42B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (42, N'Lucene', N'0b742876-b3b2-44ee-9406-1ff4b81d97b5', CAST(0x0000A182003AE45B AS DateTime), CAST(0x0000A182003DA599 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (43, N'Lucene', N'0b742876-b3b2-44ee-9406-1ff4b81d97b5', CAST(0x0000A182003DA59A AS DateTime), CAST(0x0000A182004064CE AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (44, N'Lucene', N'0b742876-b3b2-44ee-9406-1ff4b81d97b5', CAST(0x0000A182004064CF AS DateTime), CAST(0x0000A182004323FF AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (45, N'Lucene', N'0b742876-b3b2-44ee-9406-1ff4b81d97b5', CAST(0x0000A18200432400 AS DateTime), CAST(0x0000A18200567F73 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (46, N'Lucene', N'cbbb4225-f551-49c0-8c13-13d4cdc52182', CAST(0x0000A18200568011 AS DateTime), CAST(0x0000A18200593F7D AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (47, N'Lucene', N'cbbb4225-f551-49c0-8c13-13d4cdc52182', CAST(0x0000A18200593F7E AS DateTime), CAST(0x0000A182005BFEA6 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (48, N'Lucene', N'cbbb4225-f551-49c0-8c13-13d4cdc52182', CAST(0x0000A182005BFEB1 AS DateTime), CAST(0x0000A182005EBDD5 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (49, N'Lucene', N'cbbb4225-f551-49c0-8c13-13d4cdc52182', CAST(0x0000A182005EBDD5 AS DateTime), CAST(0x0000A18200615570 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (50, N'Lucene', N'8d9900b1-992b-45ec-ab8b-40e9e00d071e', CAST(0x0000A18200615592 AS DateTime), CAST(0x0000A182006414C7 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (51, N'Lucene', N'8d9900b1-992b-45ec-ab8b-40e9e00d071e', CAST(0x0000A182006414C8 AS DateTime), CAST(0x0000A1820066D404 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (52, N'Lucene', N'8d9900b1-992b-45ec-ab8b-40e9e00d071e', CAST(0x0000A1820066D40B AS DateTime), CAST(0x0000A182006A375E AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (53, N'Lucene', N'f330cba0-d847-48bc-864f-175a7cef2e3f', CAST(0x0000A182006A37A4 AS DateTime), CAST(0x0000A182006CF6DB AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (54, N'Lucene', N'f330cba0-d847-48bc-864f-175a7cef2e3f', CAST(0x0000A182006CF6DC AS DateTime), CAST(0x0000A182006FB610 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (55, N'Lucene', N'f330cba0-d847-48bc-864f-175a7cef2e3f', CAST(0x0000A182006FB61B AS DateTime), CAST(0x0000A18200727552 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (56, N'Lucene', N'f330cba0-d847-48bc-864f-175a7cef2e3f', CAST(0x0000A18200727554 AS DateTime), CAST(0x0000A18200739B3F AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (57, N'Lucene', N'eaabe1d5-d8cc-4d1c-a264-94dd7946d034', CAST(0x0000A18200739BAB AS DateTime), CAST(0x0000A1820075A6A3 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (58, N'Lucene', N'2e181fe6-4952-45a3-b8f3-ba06f0941854', CAST(0x0000A1820075A6B9 AS DateTime), CAST(0x0000A18200773CC4 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (59, N'Lucene', N'2305b186-8f43-4202-8f5e-a7f69af71c1e', CAST(0x0000A18200773CDE AS DateTime), CAST(0x0000A182007837E0 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (60, N'Lucene', N'9514fbce-1b12-49e8-9c1b-c8b057cad5ac', CAST(0x0000A182007837FC AS DateTime), CAST(0x0000A182007AF765 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (61, N'Lucene', N'9514fbce-1b12-49e8-9c1b-c8b057cad5ac', CAST(0x0000A182007AF766 AS DateTime), CAST(0x0000A182007DFEB4 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (62, N'Lucene', N'129111a3-58d9-4feb-8065-c79e1a7da01d', CAST(0x0000A182007DFEDC AS DateTime), CAST(0x0000A182007F4076 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (63, N'Lucene', N'5b415746-b5ce-438e-be7c-567787ae7fdd', CAST(0x0000A182007F4098 AS DateTime), CAST(0x0000A182007F4195 AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (64, N'Lucene', N'55ba0677-c81e-4fa5-ab98-849217e81b5c', CAST(0x0000A182007F8B7E AS DateTime), CAST(0x0000A18200816094 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (65, N'Lucene', N'b974178b-86c2-4491-9ccc-02b6af8bc2a6', CAST(0x0000A182008160B0 AS DateTime), CAST(0x0000A182008413F0 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (66, N'Lucene', N'49d09560-8f01-4dba-8d63-3aa81aadc84e', CAST(0x0000A18200841407 AS DateTime), CAST(0x0000A18200854972 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (67, N'Lucene', N'2bca6d65-55eb-450c-ac07-cf41f10f612c', CAST(0x0000A1820085498F AS DateTime), CAST(0x0000A182008808BB AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (68, N'Lucene', N'2bca6d65-55eb-450c-ac07-cf41f10f612c', CAST(0x0000A182008808BB AS DateTime), CAST(0x0000A1820088D259 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (69, N'Lucene', N'8896765a-89de-4a4c-ab3b-20e7fe42679d', CAST(0x0000A1820088D274 AS DateTime), CAST(0x0000A1820089941C AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (70, N'Lucene', N'd74dbda5-ea66-40d4-abb5-c4d6c9aa31a3', CAST(0x0000A18200899437 AS DateTime), CAST(0x0000A182008C5378 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (71, N'Lucene', N'd74dbda5-ea66-40d4-abb5-c4d6c9aa31a3', CAST(0x0000A182008C537D AS DateTime), CAST(0x0000A182008F12CE AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (72, N'Lucene', N'd74dbda5-ea66-40d4-abb5-c4d6c9aa31a3', CAST(0x0000A182008F12CF AS DateTime), CAST(0x0000A1820091D208 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (73, N'Lucene', N'd74dbda5-ea66-40d4-abb5-c4d6c9aa31a3', CAST(0x0000A1820091D209 AS DateTime), CAST(0x0000A1820094F59C AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (74, N'Lucene', N'7353de0d-6f6b-4794-9343-aa433ccb13f5', CAST(0x0000A1820094F5CE AS DateTime), CAST(0x0000A182009BE807 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (75, N'Lucene', N'55776e4d-ecbb-4dad-978d-93e0aebfdbb0', CAST(0x0000A182009BE8B6 AS DateTime), CAST(0x0000A182009D9D91 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (76, N'Lucene', N'fbd314a9-1191-4cee-84a1-be91a0538568', CAST(0x0000A182009D9DB5 AS DateTime), CAST(0x0000A18200A05CDD AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (77, N'Lucene', N'fbd314a9-1191-4cee-84a1-be91a0538568', CAST(0x0000A18200A05CDD AS DateTime), CAST(0x0000A18200A31C08 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (78, N'Lucene', N'fbd314a9-1191-4cee-84a1-be91a0538568', CAST(0x0000A18200A31C09 AS DateTime), CAST(0x0000A18200A5DB39 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (79, N'Lucene', N'fbd314a9-1191-4cee-84a1-be91a0538568', CAST(0x0000A18200A5DB39 AS DateTime), CAST(0x0000A18200A5DB46 AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (80, N'Lucene', N'102da0ac-7890-424e-b01a-6ee547f0dd6b', CAST(0x0000A18200A61BAA AS DateTime), CAST(0x0000A18200A77628 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (81, N'Lucene', N'ecb75f29-cc6a-4b91-85c0-aeecf6843e23', CAST(0x0000A18200A7763F AS DateTime), CAST(0x0000A18200A77646 AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (82, N'Lucene', N'66e17745-108b-4140-ac41-691427e478f6', CAST(0x0000A18200A7F378 AS DateTime), CAST(0x0000A18300CD74E9 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (83, N'Lucene', N'4aa6fbcd-43e8-4771-8d58-eb21069ea32c', CAST(0x0000A18300CD757B AS DateTime), CAST(0x0000A18300CEE766 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (84, N'Lucene', N'c05a951f-f451-4b34-8ae3-1fa40c417022', CAST(0x0000A18300CEE779 AS DateTime), CAST(0x0000A18300D178D9 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (85, N'Lucene', N'99718097-08fb-4f3d-8059-c7bc9ff08c19', CAST(0x0000A18300D17909 AS DateTime), CAST(0x0000A18300D43837 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (86, N'Lucene', N'99718097-08fb-4f3d-8059-c7bc9ff08c19', CAST(0x0000A18300D43837 AS DateTime), CAST(0x0000A18300D4383B AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (87, N'Lucene', N'b8941c27-8062-45b8-8fbe-7787bd93949e', CAST(0x0000A18300D48FC3 AS DateTime), CAST(0x0000A18300D588D3 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (88, N'Lucene', N'e1d28597-8abd-42ca-9369-2c4a218210c0', CAST(0x0000A18300D588E5 AS DateTime), CAST(0x0000A18300D65295 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (89, N'Lucene', N'41d33f0c-e1be-47b4-884f-7ac5214f9422', CAST(0x0000A18300D652A6 AS DateTime), CAST(0x0000A18300E22B8B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (90, N'Lucene', N'4d6f90e2-ea0f-4c80-a005-7a6ddd7f57ef', CAST(0x0000A18300E22BC3 AS DateTime), CAST(0x0000A18300E2E07D AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (91, N'Lucene', N'96b47700-12c4-4884-85eb-4bb1d3ddec8a', CAST(0x0000A18300E2E091 AS DateTime), CAST(0x0000A18300E3AD83 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (92, N'Lucene', N'ce374ade-aca0-4a29-a6fa-0048abe8200b', CAST(0x0000A18300E3AD94 AS DateTime), CAST(0x0000A18300F2B46B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (93, N'Lucene', N'f499c0f5-7d27-45a1-b852-7c7562933fff', CAST(0x0000A18300F2B49B AS DateTime), CAST(0x0000A18300F52EB4 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (94, N'Lucene', N'd7d93182-e53e-45ff-8127-f6e6e8eb916d', CAST(0x0000A18300F52EC4 AS DateTime), CAST(0x0000A18300F52EDC AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (95, N'Lucene', N'21e78aec-f810-41f7-8c53-c38a14cef332', CAST(0x0000A18300F55DB4 AS DateTime), CAST(0x0000A18300F55DCD AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (96, N'Lucene', N'0daa6ef2-de6e-437c-b5f7-ff9db8ba7f60', CAST(0x0000A18300F589AB AS DateTime), CAST(0x0000A18300F7163A AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (97, N'Lucene', N'f42ea5f4-22b4-426c-a1ce-10bb7ba6aebe', CAST(0x0000A18300F71649 AS DateTime), CAST(0x0000A18300F9D589 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (98, N'Lucene', N'f42ea5f4-22b4-426c-a1ce-10bb7ba6aebe', CAST(0x0000A18300F9D589 AS DateTime), CAST(0x0000A18300FC94B5 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (99, N'Lucene', N'f42ea5f4-22b4-426c-a1ce-10bb7ba6aebe', CAST(0x0000A18300FC94C3 AS DateTime), CAST(0x0000A18300FF53EA AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (100, N'Lucene', N'f42ea5f4-22b4-426c-a1ce-10bb7ba6aebe', CAST(0x0000A18300FF53ED AS DateTime), CAST(0x0000A18301002543 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
GO
print 'Processed 100 total records'
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (101, N'Lucene', N'c544e819-347c-44a3-ab24-a9cf1a607fc6', CAST(0x0000A18301002571 AS DateTime), CAST(0x0000A1830101E469 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (102, N'Lucene', N'da26a7b9-be16-4538-b1e1-e29042765db2', CAST(0x0000A1830101E491 AS DateTime), CAST(0x0000A1830103B9DF AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (103, N'Lucene', N'0a1b9654-21c3-4a1d-80d4-11f954b9c21f', CAST(0x0000A1830103B9EF AS DateTime), CAST(0x0000A18301067920 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (104, N'Lucene', N'0a1b9654-21c3-4a1d-80d4-11f954b9c21f', CAST(0x0000A1830106792F AS DateTime), CAST(0x0000A18400A53394 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (105, N'Lucene', N'905a78b9-7a20-46c0-bd85-bf87d436324d', CAST(0x0000A18400A5344D AS DateTime), CAST(0x0000A18400A8262F AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (106, N'Lucene', N'6937cba8-2d84-4d0e-936e-a4e31aad6494', CAST(0x0000A18400A82646 AS DateTime), CAST(0x0000A18400AAE572 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (107, N'Lucene', N'6937cba8-2d84-4d0e-936e-a4e31aad6494', CAST(0x0000A18400AAE572 AS DateTime), CAST(0x0000A18400AD7D0B AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (108, N'Lucene', N'7100c42a-8157-48e5-9ab2-05e5ea997c48', CAST(0x0000A18400AD7D29 AS DateTime), CAST(0x0000A18400AE1049 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (109, N'Lucene', N'e9020351-d0b3-4151-9dae-d1d58418409c', CAST(0x0000A18400AE1068 AS DateTime), CAST(0x0000A18400BF1B1C AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (110, N'Lucene', N'4b4478d6-22ef-4de6-ad37-8390b667acaf', CAST(0x0000A18400BF1B8B AS DateTime), CAST(0x0000A18400BF1BBF AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (111, N'Lucene', N'dc0f438d-0698-470c-9c68-6859379a78b3', CAST(0x0000A18400BF9C81 AS DateTime), CAST(0x0000A18400BF9DAD AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (112, N'Lucene', N'6147951a-38f7-4f6f-848c-a3f7f9014496', CAST(0x0000A18400BFD90A AS DateTime), CAST(0x0000A18400C0B7B1 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (113, N'Lucene', N'a6b02daa-0263-45ac-ad48-0f7d00f933c0', CAST(0x0000A18400C0B7C1 AS DateTime), CAST(0x0000A18400C0B7C6 AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (114, N'Lucene', N'd4f86c9f-1f6a-4741-ab68-15da543919c0', CAST(0x0000A18400C0D175 AS DateTime), CAST(0x0000A18400C0D19D AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (115, N'Lucene', N'0ad4ddde-a836-4a80-bc4d-dd9aa416dd40', CAST(0x0000A18400C11660 AS DateTime), CAST(0x0000A18500CC53B6 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (116, N'Lucene', N'76f81841-b7e4-4284-83c0-2670b8357630', CAST(0x0000A18500CC54C6 AS DateTime), CAST(0x0000A18500CF1428 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (117, N'Lucene', N'76f81841-b7e4-4284-83c0-2670b8357630', CAST(0x0000A18500CF142D AS DateTime), CAST(0x0000A18500D1D377 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (118, N'Lucene', N'76f81841-b7e4-4284-83c0-2670b8357630', CAST(0x0000A18500D1D377 AS DateTime), CAST(0x0000A18500D2AEA1 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (119, N'Lucene', N'8c7f221d-69f8-41b2-b73a-7b831f46689f', CAST(0x0000A18500D2AEBC AS DateTime), CAST(0x0000A18500D3C0FB AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (120, N'Lucene', N'39e7f701-92a2-4e64-8aad-3544c1b0634e', CAST(0x0000A18500D3C10D AS DateTime), CAST(0x0000A18500D68144 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (121, N'Lucene', N'39e7f701-92a2-4e64-8aad-3544c1b0634e', CAST(0x0000A18500D68144 AS DateTime), CAST(0x0000A18500DF0CDD AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (122, N'Lucene', N'bdbdf4db-4539-4be9-ae01-cc752f670a9a', CAST(0x0000A18500DF0DB4 AS DateTime), CAST(0x0000A18500E12C29 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (123, N'Lucene', N'3629e964-65e3-48cf-ab7c-4d3a1c6f7a4d', CAST(0x0000A18500E12C58 AS DateTime), CAST(0x0000A18500E3EB84 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (124, N'Lucene', N'3629e964-65e3-48cf-ab7c-4d3a1c6f7a4d', CAST(0x0000A18500E3EB85 AS DateTime), CAST(0x0000A18500E6AAB0 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (125, N'Lucene', N'3629e964-65e3-48cf-ab7c-4d3a1c6f7a4d', CAST(0x0000A18500E6AAB0 AS DateTime), CAST(0x0000A18500E86ECF AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (126, N'Lucene', N'84a7b3ce-d79d-49fa-8553-5cd00f68b822', CAST(0x0000A18500E86EF9 AS DateTime), CAST(0x0000A18500EB2EFB AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (127, N'Lucene', N'84a7b3ce-d79d-49fa-8553-5cd00f68b822', CAST(0x0000A18500EB2EFC AS DateTime), CAST(0x0000A18500F89928 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (128, N'Lucene', N'f4daa6ac-5dc4-4c3b-a301-1c3a157f32ec', CAST(0x0000A18500F899E3 AS DateTime), CAST(0x0000A18500FB5952 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (129, N'Lucene', N'f4daa6ac-5dc4-4c3b-a301-1c3a157f32ec', CAST(0x0000A18500FB5973 AS DateTime), CAST(0x0000A18500FB59A5 AS DateTime), NULL)
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (130, N'Lucene', N'c3339e05-f857-41ad-8def-3135c0cb4784', CAST(0x0000A18500FBC083 AS DateTime), CAST(0x0000A18500FCDB9A AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (131, N'Lucene', N'de35e660-aa7d-4705-b55f-078c550ab6fd', CAST(0x0000A18500FCDBA9 AS DateTime), CAST(0x0000A18500FF9AD1 AS DateTime), N'Workitem expired. Job timeout was 00:02:00
')
INSERT [dbo].[WorkItem] ([Id], [JobName], [WorkerId], [Started], [Completed], [ExceptionInfo]) VALUES (132, N'Lucene', N'de35e660-aa7d-4705-b55f-078c550ab6fd', CAST(0x0000A18500FF9AEF AS DateTime), CAST(0x0000A18500FF9AF2 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[WorkItem] OFF
/****** Object:  Table [dbo].[Member_Profile]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member_Profile](
	[MemberID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Borthday] [datetime] NOT NULL,
	[CityCode] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[RealName] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Phone] [nvarchar](20) NULL,
	[QQ] [nvarchar](20) NULL,
	[MSN] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Lat] [float] NOT NULL,
	[Lng] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Member_Profile] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member_Profile] ON
INSERT [dbo].[Member_Profile] ([MemberID], [ID], [Sex], [Borthday], [CityCode], [Description], [RealName], [Mobile], [Phone], [QQ], [MSN], [Address], [Lat], [Lng]) VALUES (1, 1, 0, CAST(0x0000A18000000000 AS DateTime), N'002012', N'How Can I do?
How Can I Think this world is to shift!', N'申海军', N'18321841288', N'0739-2748645', N'56404908', N'56404908@hotmail.com', N'上海市浦东新区芳芯路210弄', 121.562142, 31.195115)
SET IDENTITY_INSERT [dbo].[Member_Profile] OFF
/****** Object:  Table [dbo].[AreaAtt]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaAtt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.AreaAtt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AreaAtt] ON
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (1, N'餐厅')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (2, N'食堂')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (3, N'公交站')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (4, N'地铁站')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (5, N'码头')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (6, N'交通要道')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (7, N'经济区域')
INSERT [dbo].[AreaAtt] ([ID], [AttName]) VALUES (8, N'商业区域')
SET IDENTITY_INSERT [dbo].[AreaAtt] OFF
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ELMAH_Error] ON
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'ea75ad6b-a22c-4e53-9242-0db508b36e94', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'Ninject.ActivationException', N'Ninject', N'Error activating IOutDoorMediaCateService
No matching bindings are available, and the type is not self-bindable.
Activation path:
  2) Injection of dependency IOutDoorMediaCateService into parameter _OutDoorMediaCateService of constructor of type OutDoorMediaCateController
  1) Request for OutDoorMediaCateController

Suggestions:
  1) Ensure that you have defined a binding for IOutDoorMediaCateService.
  2) If the binding was defined in a module, ensure that the module has been loaded in', N'', 0, CAST(0x0000A18300E3088C AS DateTime), 10, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="Ninject.ActivationException"
  message="Error activating IOutDoorMediaCateService&#xD;&#xA;No matching bindings are available, and the type is not self-bindable.&#xD;&#xA;Activation path:&#xD;&#xA;  2) Injection of dependency IOutDoorMediaCateService into parameter _OutDoorMediaCateService of constructor of type OutDoorMediaCateController&#xD;&#xA;  1) Request for OutDoorMediaCateController&#xD;&#xA;&#xD;&#xA;Suggestions:&#xD;&#xA;  1) Ensure that you have defined a binding for IOutDoorMediaCateService.&#xD;&#xA;  2) If the binding was defined in a module, ensure that the module has been loaded into the kernel.&#xD;&#xA;  3) Ensure you have not accidentally created more than one kernel.&#xD;&#xA;  4) If you are using constructor arguments, ensure that the parameter name matches the constructors parameter name.&#xD;&#xA;  5) If you are using automatic module loading, ensure the search path and filters are correct.&#xD;&#xA;"
  source="Ninject"
  detail="System.InvalidOperationException: 尝试创建“CodeFirstEF.Controllers.OutDoorMediaCateController”类型的控制器时出错。请确保控制器具有无参数公共构造函数。 ---&gt; Ninject.ActivationException: Error activating IOutDoorMediaCateService&#xD;&#xA;No matching bindings are available, and the type is not self-bindable.&#xD;&#xA;Activation path:&#xD;&#xA;  2) Injection of dependency IOutDoorMediaCateService into parameter _OutDoorMediaCateService of constructor of type OutDoorMediaCateController&#xD;&#xA;  1) Request for OutDoorMediaCateController&#xD;&#xA;&#xD;&#xA;Suggestions:&#xD;&#xA;  1) Ensure that you have defined a binding for IOutDoorMediaCateService.&#xD;&#xA;  2) If the binding was defined in a module, ensure that the module has been loaded into the kernel.&#xD;&#xA;  3) Ensure you have not accidentally created more than one kernel.&#xD;&#xA;  4) If you are using constructor arguments, ensure that the parameter name matches the constructors parameter name.&#xD;&#xA;  5) If you are using automatic module loading, ensure the search path and filters are correct.&#xD;&#xA;&#xD;&#xA;   在 Ninject.KernelBase.Resolve(IRequest request)&#xD;&#xA;   在 Ninject.Planning.Targets.Target`1.GetValue(Type service, IContext parent)&#xD;&#xA;   在 Ninject.Planning.Targets.Target`1.ResolveWithin(IContext parent)&#xD;&#xA;   在 Ninject.Activation.Providers.StandardProvider.GetValue(IContext context, ITarget target)&#xD;&#xA;   在 Ninject.Activation.Providers.StandardProvider.&lt;&gt;c__DisplayClass4.&lt;Create&gt;b__2(ITarget target)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Buffer`1..ctor(IEnumerable`1 source)&#xD;&#xA;   在 System.Linq.Enumerable.ToArray[TSource](IEnumerable`1 source)&#xD;&#xA;   在 Ninject.Activation.Providers.StandardProvider.Create(IContext context)&#xD;&#xA;   在 Ninject.Activation.Context.Resolve()&#xD;&#xA;   在 Ninject.KernelBase.&lt;&gt;c__DisplayClass10.&lt;Resolve&gt;b__c(IBinding binding)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectEnumerableIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Enumerable.SingleOrDefault[TSource](IEnumerable`1 source)&#xD;&#xA;   在 Ninject.Web.Mvc.NinjectDependencyResolver.GetService(Type serviceType) 位置 c:\Projects\Ninject\ninject.web.mvc\mvc3\src\Ninject.Web.Mvc\NinjectDependencyResolver.cs:行号 56&#xD;&#xA;   在 System.Web.Mvc.DefaultControllerFactory.DefaultControllerActivator.Create(RequestContext requestContext, Type controllerType)&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 System.Web.Mvc.DefaultControllerFactory.DefaultControllerActivator.Create(RequestContext requestContext, Type controllerType)&#xD;&#xA;   在 System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)&#xD;&#xA;   在 System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController&amp; controller, IControllerFactory&amp; factory)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T13:46:36.1994149Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/dashboard&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/dashboard&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/OutDoorMediaCate" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\OutDoorMediaCate" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="3738" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/OutDoorMediaCate" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/OutDoorMediaCate" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/dashboard" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'de2919ca-e716-428b-9579-16bab3a437f9', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'CodeFirstEF', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A18300F52EF1 AS DateTime), 11, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="CodeFirstEF"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 CodeFirstEF.Filters.PermissionAttribute.AuthorizeCore(HttpContextBase httpContext) 位置 f:\GitProject\adzhi\CodeFirstEF\Filters\PermissionAttributes.cs:行号 62&#xD;&#xA;   在 System.Web.Mvc.AuthorizeAttribute.OnAuthorization(AuthorizationContext filterContext)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__1e(AsyncCallback asyncCallback, Object asyncState)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__17(AsyncCallback asyncCallback, Object asyncState)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__2(AsyncCallback asyncCallback, Object asyncState)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T14:52:41.1221955Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/dashboard" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\dashboard" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4180" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/dashboard" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/dashboard" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'1cb6911f-4bf5-4f52-97aa-2d3b765ad44a', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FAB14C AS DateTime), 23, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:12:44.6273591Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:6&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 6&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="on" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'9c034e46-4f65-4ac2-a226-41602f52ffe9', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.Web.HttpCompileException', N'System.Web', N'f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型', N'', 500, CAST(0x0000A18400BF5FD9 AS DateTime), 18, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.Web.HttpCompileException"
  message="f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型"
  source="System.Web"
  detail="System.Web.HttpCompileException (0x80004005): f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;   在 System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   在 System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetObjectFactory(String virtualPath, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.&lt;&gt;c__DisplayClass4.&lt;GetPathFromGeneralName&gt;b__0(String path)&#xD;&#xA;   在 System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.&lt;&gt;c__DisplayClassb.&lt;GetDisplayInfoForVirtualPath&gt;b__8(IDisplayMode mode)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.&lt;&gt;c__DisplayClass4.&lt;FindView&gt;b__3() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.Find(ControllerContext controllerContext, String name, Func`1 finder, Boolean isPartial) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 66&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.&lt;&gt;c__DisplayClassc.&lt;FindView&gt;b__b(IViewEngine e)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)&#xD;&#xA;   在 System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-17T11:36:46.3755869Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;编译错误&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;“/”应用程序中的服务器错误。&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;编译错误&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 说明: &lt;/b&gt;在编译向该请求提供服务所需资源的过程中出现错误。请检查下列特定错误详细信息并适当地修改源代码。&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 编译器错误消息: &lt;/b&gt;CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;源错误:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 50:             {&#xD;&#xA;行 51:                 @ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;&#xA;&lt;font color=red&gt;行 52:                 Html.Raw(@&amp;lt;text&amp;gt;&#xD;&#xA;&lt;/font&gt;行 53:                 @CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请先进行邮箱绑.&amp;quot; + @Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;)&#xD;&#xA;行 54:                 &amp;lt;/text&amp;gt;).ToHtmlString()&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;源文件:&lt;/b&gt; f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;行:&lt;/b&gt;  52&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;显示详细的编译器输出:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe&amp;quot; /t:library /utf8output /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\20461b34\98250e66_33fdcd01\ICSharpCode.SharpZipLib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_global.asax.nzeenlsp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\d646fe13\2ff05314_6ff9cd01\EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\faec4bb3\dabe3c7f_0323ce01\CoreHelper.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcd85fc9\1514e0d7_34fdcd01\WebBackgrounder.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\11f905e0\46eedd08_59e6cd01\System.Web.Http.WebHost.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\150a79dc\1e9ae962_5f1ace01\Microsoft.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Mvc\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\39e5ef3b\2a813408_59e6cd01\System.Net.Http.Formatting.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\fec2f268\e34b7f82_0323ce01\CodeFirstEF.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6626534f\a9b6f431_33fdcd01\MiniProfiler.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\c82bae78\f901f13b_33fdcd01\Ninject.Web.Common.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\4b6934ef\3f1da408_59e6cd01\System.Web.Http.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcb8c082\7f054fe6_6ef9cd01\Ninject.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6927149a\1ca6f909_59e6cd01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\9d313db2\ac8e44d8_32fdcd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Code.7uqd9fcy.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\2b8fd3e3\b88ed7c9_34fdcd01\Elmah.Contrib.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\f7654580\e1468883_4f13ce01\BundleMinifyInlineJsCss.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.Entity\v4.0_4.0.0.0__b77a5c561934e089\System.Data.Entity.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\63cdd554\2ed15b34_ac02ce01\MiniProfiler.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e44bbd4b\d953f509_59e6cd01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\b0a0078c\aa627e55_de1fce01\Lucene.Net.China.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e78f38e3\504ddedd_34fdcd01\WebBackgrounder.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1446f373\23fcc609_59e6cd01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Helpers\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_1.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\8de7e665\fc146296_32fdcd01\WebActivator.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a67719ca\004a670b_16c2cd01\Kendo.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Web.Infrastructure\v4.0_1.0.0.0__31bf3856ad364e35\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Runtime\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\00c31624\345af93b_33fdcd01\Ninject.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1e6035e1\98da4166_33fdcd01\Lucene.Net.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a844eb1e\999d4107_59e6cd01\Newtonsoft.Json.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.iy29aplp.dll&amp;quot; /D:DEBUG /debug+ /optimize- /w:4 /nowarn:1659;1699;1701;612;618 /warnaserror-  &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.iy29aplp.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.iy29aplp.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft(R) Visual C# 编译器版本 4.0.30319.17929&#xD;&#xA;&#xD;&#xA;用于 Microsoft(R) .NET Framework 4.5&#xD;&#xA;版权所有 (C) Microsoft Corporation。保留所有权利。&#xD;&#xA;&#xD;&#xA;f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52,26): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;显示完整的编译源:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 1:    #pragma checksum &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;034D5044BEBAEDBF92AEFDCBF51B56C2062C974E&amp;quot;&#xD;行 2:    //------------------------------------------------------------------------------&#xD;行 3:    // &amp;lt;auto-generated&amp;gt;&#xD;行 4:    //     此代码由工具生成。&#xD;行 5:    //     运行时版本:4.0.30319.18034&#xD;行 6:    //&#xD;行 7:    //     对此文件的更改可能会导致不正确的行为，并且如果&#xD;行 8:    //     重新生成代码，这些更改将会丢失。&#xD;行 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;行 10:   //------------------------------------------------------------------------------&#xD;行 11:   &#xD;行 12:   namespace ASP {&#xD;行 13:       using System;&#xD;行 14:       using System.Collections.Generic;&#xD;行 15:       using System.IO;&#xD;行 16:       using System.Linq;&#xD;行 17:       using System.Net;&#xD;行 18:       using System.Web;&#xD;行 19:       using System.Web.Helpers;&#xD;行 20:       using System.Web.Security;&#xD;行 21:       using System.Web.UI;&#xD;行 22:       using System.Web.WebPages;&#xD;行 23:       using System.Web.Mvc;&#xD;行 24:       using System.Web.Mvc.Ajax;&#xD;行 25:       using System.Web.Mvc.Html;&#xD;行 26:       using System.Web.Optimization;&#xD;行 27:       using System.Web.Routing;&#xD;行 28:       using Kendo.Mvc.UI;&#xD;行 29:       using Microsoft.Web.Helpers;&#xD;行 30:       &#xD;行 31:       &#xD;行 32:       public class _Page_Views_Company_Index_cshtml : System.Web.Mvc.WebViewPage&amp;lt;CodeFirstEF.ViewModels.CompanyReg&amp;gt; {&#xD;行 33:           &#xD;行 34:   #line hidden&#xD;行 35:           &#xD;行 36:           public _Page_Views_Company_Index_cshtml() {&#xD;行 37:           }&#xD;行 38:           &#xD;行 39:           protected ASP.global_asax ApplicationInstance {&#xD;行 40:               get {&#xD;行 41:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;行 42:               }&#xD;行 43:           }&#xD;行 44:           &#xD;行 45:           public override void Execute() {&#xD;行 46:               &#xD;行 47:               #line 2 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 48:     &#xD;行 49:       ViewBag.Title = &amp;quot;企业认证&amp;quot;;&#xD;行 50:       Layout = &amp;quot;~/Views/Shared/_LayoutPersonal.cshtml&amp;quot;;&#xD;行 51:   &#xD;行 52:               &#xD;行 53:               #line default&#xD;行 54:               #line hidden&#xD;行 55:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 56:   &#xD;行 57:   WriteLiteral(&amp;quot;\r\n&amp;lt;article&amp;quot;);&#xD;行 58:   &#xD;行 59:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 60:   &#xD;行 61:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 62:   &#xD;行 63:   WriteLiteral(&amp;quot; class=\&amp;quot;personal clearfix\&amp;quot;&amp;quot;);&#xD;行 64:   &#xD;行 65:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 66:   &#xD;行 67:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 68:   &#xD;行 69:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 70:   &#xD;行 71:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 72:   &#xD;行 73:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 74:   &#xD;行 75:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-left\&amp;quot;&amp;quot;);&#xD;行 76:   &#xD;行 77:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 78:   &#xD;行 79:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 80:   &#xD;行 81:   WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 82:   &#xD;行 83:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 84:   &#xD;行 85:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 86:   &#xD;行 87:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-nav\&amp;quot;&amp;quot;);&#xD;行 88:   &#xD;行 89:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 90:   &#xD;行 91:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 92:   &#xD;行 93:   WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 94:   &#xD;行 95:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 96:   &#xD;行 97:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 98:   &#xD;行 99:   WriteLiteral(&amp;quot;            &amp;quot;);&#xD;行 100:  &#xD;行 101:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 102:  &#xD;行 103:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 104:  &#xD;行 105:              &#xD;行 106:              #line 9 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 107:         Write(Html.Partial(&amp;quot;_PersonalLeftNav&amp;quot;));&#xD;行 108:  &#xD;行 109:              &#xD;行 110:              #line default&#xD;行 111:              #line hidden&#xD;行 112:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 113:  &#xD;行 114:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 115:  &#xD;行 116:  WriteLiteral(&amp;quot;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 117:  &#xD;行 118:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 119:  &#xD;行 120:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 121:  &#xD;行 122:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right\&amp;quot;&amp;quot;);&#xD;行 123:  &#xD;行 124:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 125:  &#xD;行 126:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 127:  &#xD;行 128:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 129:  &#xD;行 130:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 131:  &#xD;行 132:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 133:  &#xD;行 134:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right-body\&amp;quot;&amp;quot;);&#xD;行 135:  &#xD;行 136:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 137:  &#xD;行 138:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 139:  &#xD;行 140:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;行 141:  &#xD;行 142:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 143:  &#xD;行 144:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 145:  &#xD;行 146:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-body-title clearfix\&amp;quot;&amp;quot;);&#xD;行 147:  &#xD;行 148:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 149:  &#xD;行 150:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 151:  &#xD;行 152:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;h5&amp;gt;&amp;quot;);&#xD;行 153:  &#xD;行 154:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 155:  &#xD;行 156:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 157:  &#xD;行 158:              &#xD;行 159:              #line 15 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 160:                 Write(ViewBag.Title);&#xD;行 161:  &#xD;行 162:              &#xD;行 163:              #line default&#xD;行 164:              #line hidden&#xD;行 165:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 166:  &#xD;行 167:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 168:  &#xD;行 169:  WriteLiteral(&amp;quot;&amp;lt;/h5&amp;gt;\r\n                &amp;lt;ul&amp;quot;);&#xD;行 170:  &#xD;行 171:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 172:  &#xD;行 173:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 174:  &#xD;行 175:  WriteLiteral(&amp;quot; class=\&amp;quot;form-step clearfix\&amp;quot;&amp;quot;);&#xD;行 176:  &#xD;行 177:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 178:  &#xD;行 179:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 180:  &#xD;行 181:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;li  &amp;quot;);&#xD;行 182:  &#xD;行 183:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 184:  &#xD;行 185:              &#xD;行 186:              #line 17 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 187:                            if (!ViewBag.UserEmailActived)&#xD;行 188:                           {&#xD;行 189:              &#xD;行 190:              #line default&#xD;行 191:              #line hidden&#xD;行 192:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 193:  &#xD;行 194:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 195:  &#xD;行 196:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 197:  &#xD;行 198:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 199:  &#xD;行 200:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 201:  &#xD;行 202:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 203:  &#xD;行 204:              &#xD;行 205:              #line 18 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 206:                                                     }&#xD;行 207:              &#xD;行 208:              #line default&#xD;行 209:              #line hidden&#xD;行 210:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 211:  &#xD;行 212:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第一步：邮箱绑定&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li   &amp;quot;);&#xD;行 213:  &#xD;行 214:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 215:  &#xD;行 216:              &#xD;行 217:              #line 19 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 218:                             if (ViewBag.UserEmailActived)&#xD;行 219:                            {&#xD;行 220:              &#xD;行 221:              #line default&#xD;行 222:              #line hidden&#xD;行 223:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 224:  &#xD;行 225:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 226:  &#xD;行 227:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 228:  &#xD;行 229:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 230:  &#xD;行 231:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 232:  &#xD;行 233:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 234:  &#xD;行 235:              &#xD;行 236:              #line 20 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 237:                                                      }&#xD;行 238:              &#xD;行 239:              #line default&#xD;行 240:              #line hidden&#xD;行 241:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 242:  &#xD;行 243:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第二步：填写企业信息&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第三步：提&amp;quot; +&#xD;行 244:  &amp;quot;交后台审核&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第四步：审核通过认证成功&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&amp;quot; +&#xD;行 245:  &amp;quot;\r\n                &amp;lt;/ul&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 246:  &#xD;行 247:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 248:  &#xD;行 249:              &#xD;行 250:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 251:              &#xD;行 252:              &#xD;行 253:              #line default&#xD;行 254:              #line hidden&#xD;行 255:              &#xD;行 256:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 257:               if (ViewBag.UserEmailActived)&#xD;行 258:              {&#xD;行 259:            &#xD;行 260:                  &#xD;行 261:              &#xD;行 262:              #line default&#xD;行 263:              #line hidden&#xD;行 264:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 265:  &#xD;行 266:              &#xD;行 267:              #line 28 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 268:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 269:                  CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请填写真实企业资料,我们将在1小时候内审核您发的信息。通过企业认证您发布的信息的权重更高。&amp;quot;, false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 270:  &#xD;行 271:              &#xD;行 272:              #line default&#xD;行 273:              #line hidden&#xD;行 274:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 275:  &#xD;行 276:              &#xD;行 277:              #line 29 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 278:                                                                                                                                                               &#xD;行 279:  &#xD;行 280:                  if (ViewBag.Error != null)&#xD;行 281:                  { &#xD;行 282:                  &#xD;行 283:              &#xD;行 284:              #line default&#xD;行 285:              #line hidden&#xD;行 286:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 287:  &#xD;行 288:              &#xD;行 289:              #line 33 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 290:             Write(ViewHelpers.Alert(&amp;quot;错误信息：&amp;quot;,&#xD;行 291:                  ViewBag.Error, false, CoreHelper.Enum.AlertType.error.ToString()));&#xD;行 292:  &#xD;行 293:              &#xD;行 294:              #line default&#xD;行 295:              #line hidden&#xD;行 296:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 297:  &#xD;行 298:              &#xD;行 299:              #line 34 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 300:                                                                                   &#xD;行 301:                  }&#xD;行 302:  &#xD;行 303:              &#xD;行 304:              #line default&#xD;行 305:              #line hidden&#xD;行 306:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 307:  &#xD;行 308:  WriteLiteral(&amp;quot;                &amp;lt;div&amp;quot;);&#xD;行 309:  &#xD;行 310:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 311:  &#xD;行 312:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 313:  &#xD;行 314:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-form mt20\&amp;quot;&amp;quot;);&#xD;行 315:  &#xD;行 316:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 317:  &#xD;行 318:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 319:  &#xD;行 320:  WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 321:  &#xD;行 322:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 323:  &#xD;行 324:              &#xD;行 325:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 326:                      &#xD;行 327:              &#xD;行 328:              #line default&#xD;行 329:              #line hidden&#xD;行 330:              &#xD;行 331:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 332:                       using (Html.BeginForm())&#xD;行 333:                      {&#xD;行 334:                          &#xD;行 335:              &#xD;行 336:              #line default&#xD;行 337:              #line hidden&#xD;行 338:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 339:  &#xD;行 340:              &#xD;行 341:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 342:                     Write(Html.AntiForgeryToken());&#xD;行 343:  &#xD;行 344:              &#xD;行 345:              #line default&#xD;行 346:              #line hidden&#xD;行 347:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 348:  &#xD;行 349:              &#xD;行 350:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 351:                                                  &#xD;行 352:                          &#xD;行 353:              &#xD;行 354:              #line default&#xD;行 355:              #line hidden&#xD;行 356:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 357:  &#xD;行 358:              &#xD;行 359:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 360:                     Write(Html.EditorForModel());&#xD;行 361:  &#xD;行 362:              &#xD;行 363:              #line default&#xD;行 364:              #line hidden&#xD;行 365:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 366:  &#xD;行 367:              &#xD;行 368:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 369:                                                &#xD;行 370:  &#xD;行 371:              &#xD;行 372:              #line default&#xD;行 373:              #line hidden&#xD;行 374:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 375:  &#xD;行 376:  WriteLiteral(&amp;quot;                        &amp;lt;div&amp;quot;);&#xD;行 377:  &#xD;行 378:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 379:  &#xD;行 380:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 381:  &#xD;行 382:  WriteLiteral(&amp;quot; class=\&amp;quot;form-field form-field-submit c_gray\&amp;quot;&amp;quot;);&#xD;行 383:  &#xD;行 384:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 385:  &#xD;行 386:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 387:  &#xD;行 388:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;button&amp;quot;);&#xD;行 389:  &#xD;行 390:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 391:  &#xD;行 392:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 393:  &#xD;行 394:  WriteLiteral(&amp;quot; type=\&amp;quot;submit\&amp;quot;&amp;quot;);&#xD;行 395:  &#xD;行 396:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 397:  &#xD;行 398:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 399:  &#xD;行 400:  WriteLiteral(&amp;quot; class=\&amp;quot;btn btn-warning \&amp;quot;&amp;quot;);&#xD;行 401:  &#xD;行 402:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 403:  &#xD;行 404:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 405:  &#xD;行 406:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;amp;nbsp;&amp;amp;nbsp;保&amp;amp;nbsp;&amp;amp;nbsp;存&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;/button&amp;quot; +&#xD;行 407:  &amp;quot;&amp;gt;\r\n                        &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 408:  &#xD;行 409:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 410:  &#xD;行 411:              &#xD;行 412:              #line 45 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 413:                      }&#xD;行 414:  &#xD;行 415:              &#xD;行 416:              #line default&#xD;行 417:              #line hidden&#xD;行 418:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 419:  &#xD;行 420:  WriteLiteral(&amp;quot;                &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 421:  &#xD;行 422:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 423:  &#xD;行 424:              &#xD;行 425:              #line 47 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 426:                    &#xD;行 427:              }&#xD;行 428:              else&#xD;行 429:              {&#xD;行 430:                  &#xD;行 431:              &#xD;行 432:              #line default&#xD;行 433:              #line hidden&#xD;行 434:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 435:  &#xD;行 436:              &#xD;行 437:              #line 51 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 438:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 439:                  Html.Raw(item =&amp;gt; new System.Web.WebPages.HelperResult(__razor_template_writer =&amp;gt; {&#xD;行 440:  &#xD;行 441:              &#xD;行 442:              #line default&#xD;行 443:              #line hidden&#xD;行 444:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 445:  &#xD;行 446:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n&amp;quot;);&#xD;行 447:  &#xD;行 448:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 449:  &#xD;行 450:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 451:  &#xD;行 452:  WriteTo(__razor_template_writer, &#xD;行 453:              &#xD;行 454:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 455:                  &#xD;行 456:              &#xD;行 457:              #line default&#xD;行 458:              #line hidden&#xD;行 459:              &#xD;行 460:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 461:                   CoreHelper.Cookie.CookieHelper.NickName);&#xD;行 462:  &#xD;行 463:              &#xD;行 464:              #line default&#xD;行 465:              #line hidden&#xD;行 466:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 467:  &#xD;行 468:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 469:  &#xD;行 470:  WriteLiteralTo(__razor_template_writer, &amp;quot; + \&amp;quot;,请先进行邮箱绑.\&amp;quot; + &amp;quot;);&#xD;行 471:  &#xD;行 472:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 473:  &#xD;行 474:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 475:  &#xD;行 476:              &#xD;行 477:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 478:                                           WriteTo(__razor_template_writer, Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;));&#xD;行 479:  &#xD;行 480:              &#xD;行 481:              #line default&#xD;行 482:              #line hidden&#xD;行 483:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 484:  &#xD;行 485:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 486:  &#xD;行 487:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n                &amp;quot;);&#xD;行 488:  &#xD;行 489:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 490:  &#xD;行 491:              &#xD;行 492:              #line 54 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 493:                       })).ToHtmlString()&#xD;行 494:                 , false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 495:  &#xD;行 496:              &#xD;行 497:              #line default&#xD;行 498:              #line hidden&#xD;行 499:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 500:  &#xD;行 501:              &#xD;行 502:              #line 55 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 503:                                                                    &#xD;行 504:  &#xD;行 505:              }&#xD;行 506:  &#xD;行 507:              &#xD;行 508:              #line default&#xD;行 509:              #line hidden&#xD;行 510:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2420, 42, true);&#xD;行 511:  &#xD;行 512:  WriteLiteral(&amp;quot;        &amp;lt;/div&amp;gt;\r\n\r\n    &amp;lt;/div&amp;gt;\r\n&amp;lt;/article&amp;gt;\r\n&amp;quot;);&#xD;行 513:  &#xD;行 514:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2420, 42, true);&#xD;行 515:  &#xD;行 516:          }&#xD;行 517:      }&#xD;行 518:  }&#xD;行 519:  &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Personal&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Personal&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Company" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Company" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4216" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Company" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Company" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Personal" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="2n4pdsa2wr2g1hibmgc1ifze" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'595b59b0-08d3-4f4a-a6b3-47ded5b75eac', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500F950D8 AS DateTime), 21, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:07:43.8681567Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:6&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 6&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59560" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="on" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'ee4be316-abd0-45ba-b489-4c00cad83dcf', N'/LM/W3SVC/3/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'App_Web_qcrw13x3', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A18200767A3D AS DateTime), 5, N'<error
  application="/LM/W3SVC/3/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="App_Web_qcrw13x3"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_ForeignKeyForCheckBox_cshtml.&lt;&gt;c__DisplayClass2.&lt;Execute&gt;b__1(TextWriter __razor_template_writer) 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\ForeignKeyForCheckBox.cshtml:行号 12&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlTemplate`1.&lt;&gt;c__AnonStorey48.&lt;&gt;m__178(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlElement.WriteTo(TextWriter output)&#xD;&#xA;   在 Kendo.Mvc.UI.Window.WriteHtml(HtmlTextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.WidgetBase.ToHtmlString()&#xD;&#xA;   在 Kendo.Mvc.UI.Fluent.WidgetBuilderBase`2.ToHtmlString()&#xD;&#xA;   在 System.Web.HttpUtility.HtmlEncode(Object value)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(Object value)&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_ForeignKeyForCheckBox_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\ForeignKeyForCheckBox.cshtml:行号 10&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.ExecuteTemplate(HtmlHelper html, ViewDataDictionary viewData, String templateName, DataBoundControlMode mode, GetViewNamesDelegate getViewNames, GetDefaultActionsDelegate getDefaultActions)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.Template(HtmlHelper html, String expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.Template(HtmlHelper html, String expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.EditorExtensions.Editor(HtmlHelper html, String expression)&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_Object_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\Object.cshtml:行号 43&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.ExecuteTemplate(HtmlHelper html, ViewDataDictionary viewData, String templateName, DataBoundControlMode mode, GetViewNamesDelegate getViewNames, GetDefaultActionsDelegate getDefaultActions)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.EditorExtensions.EditorFor[TModel,TValue](HtmlHelper`1 html, Expression`1 expression)&#xD;&#xA;   在 ASP._Page_Views_Group_Edit_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Group\Edit.cshtml:行号 15&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.StartPage.RunPage()&#xD;&#xA;   在 System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-15T07:11:21.8017578Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Group&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;Cookie: __RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Group&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Group/Edit/2" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\Group\Edit\2" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="48604" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Group/Edit/2" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Group/Edit/2" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Group" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="nzddbadbwq3321jrrylpf534" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'0feff696-5a8d-4257-8dab-4c03dcae4541', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'CodeFirstEF', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A18300F55DAE AS DateTime), 12, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="CodeFirstEF"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 CodeFirstEF.Filters.PermissionAttribute.AuthorizeCore(HttpContextBase httpContext) 位置 f:\GitProject\adzhi\CodeFirstEF\Filters\PermissionAttributes.cs:行号 62&#xD;&#xA;   在 System.Web.Mvc.AuthorizeAttribute.OnAuthorization(AuthorizationContext filterContext)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__1e(AsyncCallback asyncCallback, Object asyncState)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__17(AsyncCallback asyncCallback, Object asyncState)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__2(AsyncCallback asyncCallback, Object asyncState)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.Begin(AsyncCallback callback, Object state, Int32 timeout)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T14:53:21.0074768Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/dashboard" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\dashboard" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4180" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/dashboard" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/dashboard" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'7333fffe-6a7f-4760-960d-608e3fab682f', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.Web.HttpCompileException', N'System.Web', N'f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型', N'', 500, CAST(0x0000A18400BF9E6F AS DateTime), 19, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.Web.HttpCompileException"
  message="f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型"
  source="System.Web"
  detail="System.Web.HttpCompileException (0x80004005): f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;   在 System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   在 System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.&lt;&gt;c__DisplayClass4.&lt;GetPathFromGeneralName&gt;b__0(String path)&#xD;&#xA;   在 System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.&lt;&gt;c__DisplayClassb.&lt;GetDisplayInfoForVirtualPath&gt;b__8(IDisplayMode mode)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.&lt;&gt;c__DisplayClass4.&lt;FindView&gt;b__3() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.Find(ControllerContext controllerContext, String name, Func`1 finder, Boolean isPartial) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 66&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.&lt;&gt;c__DisplayClassc.&lt;FindView&gt;b__b(IViewEngine e)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)&#xD;&#xA;   在 System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-17T11:37:39.7826416Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;编译错误&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;“/”应用程序中的服务器错误。&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;编译错误&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 说明: &lt;/b&gt;在编译向该请求提供服务所需资源的过程中出现错误。请检查下列特定错误详细信息并适当地修改源代码。&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 编译器错误消息: &lt;/b&gt;CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;源错误:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 50:             {&#xD;&#xA;行 51:                 @ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;&#xA;&lt;font color=red&gt;行 52:                 Html.Raw(@&amp;lt;text&amp;gt;&#xD;&#xA;&lt;/font&gt;行 53:                 @CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请先进行邮箱绑.&amp;quot; + @Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;)&#xD;&#xA;行 54:                 &amp;lt;/text&amp;gt;)&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;源文件:&lt;/b&gt; f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;行:&lt;/b&gt;  52&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;显示详细的编译器输出:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe&amp;quot; /t:library /utf8output /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Code.ynhe-sbb.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\2b8fd3e3\b88ed7c9_34fdcd01\Elmah.Contrib.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\f7654580\e1468883_4f13ce01\BundleMinifyInlineJsCss.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6626534f\a9b6f431_33fdcd01\MiniProfiler.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\faec4bb3\dabe3c7f_0323ce01\CoreHelper.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\b0a0078c\aa627e55_de1fce01\Lucene.Net.China.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\9d313db2\ac8e44d8_32fdcd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcd85fc9\1514e0d7_34fdcd01\WebBackgrounder.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a844eb1e\999d4107_59e6cd01\Newtonsoft.Json.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Helpers\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\20461b34\98250e66_33fdcd01\ICSharpCode.SharpZipLib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\150a79dc\1e9ae962_5f1ace01\Microsoft.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Web.Infrastructure\v4.0_1.0.0.0__31bf3856ad364e35\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e44bbd4b\d953f509_59e6cd01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\11f905e0\46eedd08_59e6cd01\System.Web.Http.WebHost.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\39e5ef3b\2a813408_59e6cd01\System.Net.Http.Formatting.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_1.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6927149a\1ca6f909_59e6cd01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\4b6934ef\3f1da408_59e6cd01\System.Web.Http.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\8de7e665\fc146296_32fdcd01\WebActivator.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e78f38e3\504ddedd_34fdcd01\WebBackgrounder.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\d646fe13\2ff05314_6ff9cd01\EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\63cdd554\2ed15b34_ac02ce01\MiniProfiler.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a67719ca\004a670b_16c2cd01\Kendo.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_global.asax.e9z5hovm.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\c82bae78\f901f13b_33fdcd01\Ninject.Web.Common.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.Entity\v4.0_4.0.0.0__b77a5c561934e089\System.Data.Entity.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Runtime\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\00c31624\345af93b_33fdcd01\Ninject.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcb8c082\7f054fe6_6ef9cd01\Ninject.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Mvc\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\fec2f268\e34b7f82_0323ce01\CodeFirstEF.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1e6035e1\98da4166_33fdcd01\Lucene.Net.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1446f373\23fcc609_59e6cd01\System.Web.Optimization.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.gkt0zaqp.dll&amp;quot; /D:DEBUG /debug+ /optimize- /w:4 /nowarn:1659;1699;1701;612;618 /warnaserror-  &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.gkt0zaqp.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.gkt0zaqp.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft(R) Visual C# 编译器版本 4.0.30319.17929&#xD;&#xA;&#xD;&#xA;用于 Microsoft(R) .NET Framework 4.5&#xD;&#xA;版权所有 (C) Microsoft Corporation。保留所有权利。&#xD;&#xA;&#xD;&#xA;f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52,26): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;显示完整的编译源:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 1:    #pragma checksum &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;A70F17916D358E05FB0AEA8E4981F0E9A64CACB9&amp;quot;&#xD;行 2:    //------------------------------------------------------------------------------&#xD;行 3:    // &amp;lt;auto-generated&amp;gt;&#xD;行 4:    //     此代码由工具生成。&#xD;行 5:    //     运行时版本:4.0.30319.18034&#xD;行 6:    //&#xD;行 7:    //     对此文件的更改可能会导致不正确的行为，并且如果&#xD;行 8:    //     重新生成代码，这些更改将会丢失。&#xD;行 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;行 10:   //------------------------------------------------------------------------------&#xD;行 11:   &#xD;行 12:   namespace ASP {&#xD;行 13:       using System;&#xD;行 14:       using System.Collections.Generic;&#xD;行 15:       using System.IO;&#xD;行 16:       using System.Linq;&#xD;行 17:       using System.Net;&#xD;行 18:       using System.Web;&#xD;行 19:       using System.Web.Helpers;&#xD;行 20:       using System.Web.Security;&#xD;行 21:       using System.Web.UI;&#xD;行 22:       using System.Web.WebPages;&#xD;行 23:       using System.Web.Mvc;&#xD;行 24:       using System.Web.Mvc.Ajax;&#xD;行 25:       using System.Web.Mvc.Html;&#xD;行 26:       using System.Web.Optimization;&#xD;行 27:       using System.Web.Routing;&#xD;行 28:       using Kendo.Mvc.UI;&#xD;行 29:       using Microsoft.Web.Helpers;&#xD;行 30:       &#xD;行 31:       &#xD;行 32:       public class _Page_Views_Company_Index_cshtml : System.Web.Mvc.WebViewPage&amp;lt;CodeFirstEF.ViewModels.CompanyReg&amp;gt; {&#xD;行 33:           &#xD;行 34:   #line hidden&#xD;行 35:           &#xD;行 36:           public _Page_Views_Company_Index_cshtml() {&#xD;行 37:           }&#xD;行 38:           &#xD;行 39:           protected ASP.global_asax ApplicationInstance {&#xD;行 40:               get {&#xD;行 41:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;行 42:               }&#xD;行 43:           }&#xD;行 44:           &#xD;行 45:           public override void Execute() {&#xD;行 46:               &#xD;行 47:               #line 2 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 48:     &#xD;行 49:       ViewBag.Title = &amp;quot;企业认证&amp;quot;;&#xD;行 50:       Layout = &amp;quot;~/Views/Shared/_LayoutPersonal.cshtml&amp;quot;;&#xD;行 51:   &#xD;行 52:               &#xD;行 53:               #line default&#xD;行 54:               #line hidden&#xD;行 55:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 56:   &#xD;行 57:   WriteLiteral(&amp;quot;\r\n&amp;lt;article&amp;quot;);&#xD;行 58:   &#xD;行 59:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 60:   &#xD;行 61:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 62:   &#xD;行 63:   WriteLiteral(&amp;quot; class=\&amp;quot;personal clearfix\&amp;quot;&amp;quot;);&#xD;行 64:   &#xD;行 65:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 66:   &#xD;行 67:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 68:   &#xD;行 69:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 70:   &#xD;行 71:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 72:   &#xD;行 73:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 74:   &#xD;行 75:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-left\&amp;quot;&amp;quot;);&#xD;行 76:   &#xD;行 77:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 78:   &#xD;行 79:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 80:   &#xD;行 81:   WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 82:   &#xD;行 83:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 84:   &#xD;行 85:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 86:   &#xD;行 87:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-nav\&amp;quot;&amp;quot;);&#xD;行 88:   &#xD;行 89:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 90:   &#xD;行 91:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 92:   &#xD;行 93:   WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 94:   &#xD;行 95:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 96:   &#xD;行 97:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 98:   &#xD;行 99:   WriteLiteral(&amp;quot;            &amp;quot;);&#xD;行 100:  &#xD;行 101:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 102:  &#xD;行 103:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 104:  &#xD;行 105:              &#xD;行 106:              #line 9 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 107:         Write(Html.Partial(&amp;quot;_PersonalLeftNav&amp;quot;));&#xD;行 108:  &#xD;行 109:              &#xD;行 110:              #line default&#xD;行 111:              #line hidden&#xD;行 112:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 113:  &#xD;行 114:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 115:  &#xD;行 116:  WriteLiteral(&amp;quot;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 117:  &#xD;行 118:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 119:  &#xD;行 120:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 121:  &#xD;行 122:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right\&amp;quot;&amp;quot;);&#xD;行 123:  &#xD;行 124:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 125:  &#xD;行 126:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 127:  &#xD;行 128:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 129:  &#xD;行 130:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 131:  &#xD;行 132:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 133:  &#xD;行 134:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right-body\&amp;quot;&amp;quot;);&#xD;行 135:  &#xD;行 136:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 137:  &#xD;行 138:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 139:  &#xD;行 140:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;行 141:  &#xD;行 142:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 143:  &#xD;行 144:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 145:  &#xD;行 146:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-body-title clearfix\&amp;quot;&amp;quot;);&#xD;行 147:  &#xD;行 148:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 149:  &#xD;行 150:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 151:  &#xD;行 152:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;h5&amp;gt;&amp;quot;);&#xD;行 153:  &#xD;行 154:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 155:  &#xD;行 156:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 157:  &#xD;行 158:              &#xD;行 159:              #line 15 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 160:                 Write(ViewBag.Title);&#xD;行 161:  &#xD;行 162:              &#xD;行 163:              #line default&#xD;行 164:              #line hidden&#xD;行 165:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 166:  &#xD;行 167:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 168:  &#xD;行 169:  WriteLiteral(&amp;quot;&amp;lt;/h5&amp;gt;\r\n                &amp;lt;ul&amp;quot;);&#xD;行 170:  &#xD;行 171:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 172:  &#xD;行 173:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 174:  &#xD;行 175:  WriteLiteral(&amp;quot; class=\&amp;quot;form-step clearfix\&amp;quot;&amp;quot;);&#xD;行 176:  &#xD;行 177:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 178:  &#xD;行 179:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 180:  &#xD;行 181:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;li  &amp;quot;);&#xD;行 182:  &#xD;行 183:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 184:  &#xD;行 185:              &#xD;行 186:              #line 17 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 187:                            if (!ViewBag.UserEmailActived)&#xD;行 188:                           {&#xD;行 189:              &#xD;行 190:              #line default&#xD;行 191:              #line hidden&#xD;行 192:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 193:  &#xD;行 194:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 195:  &#xD;行 196:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 197:  &#xD;行 198:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 199:  &#xD;行 200:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 201:  &#xD;行 202:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 203:  &#xD;行 204:              &#xD;行 205:              #line 18 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 206:                                                     }&#xD;行 207:              &#xD;行 208:              #line default&#xD;行 209:              #line hidden&#xD;行 210:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 211:  &#xD;行 212:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第一步：邮箱绑定&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li   &amp;quot;);&#xD;行 213:  &#xD;行 214:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 215:  &#xD;行 216:              &#xD;行 217:              #line 19 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 218:                             if (ViewBag.UserEmailActived)&#xD;行 219:                            {&#xD;行 220:              &#xD;行 221:              #line default&#xD;行 222:              #line hidden&#xD;行 223:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 224:  &#xD;行 225:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 226:  &#xD;行 227:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 228:  &#xD;行 229:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 230:  &#xD;行 231:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 232:  &#xD;行 233:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 234:  &#xD;行 235:              &#xD;行 236:              #line 20 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 237:                                                      }&#xD;行 238:              &#xD;行 239:              #line default&#xD;行 240:              #line hidden&#xD;行 241:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 242:  &#xD;行 243:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第二步：填写企业信息&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第三步：提&amp;quot; +&#xD;行 244:  &amp;quot;交后台审核&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第四步：审核通过认证成功&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&amp;quot; +&#xD;行 245:  &amp;quot;\r\n                &amp;lt;/ul&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 246:  &#xD;行 247:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 248:  &#xD;行 249:              &#xD;行 250:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 251:              &#xD;行 252:              &#xD;行 253:              #line default&#xD;行 254:              #line hidden&#xD;行 255:              &#xD;行 256:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 257:               if (ViewBag.UserEmailActived)&#xD;行 258:              {&#xD;行 259:            &#xD;行 260:                  &#xD;行 261:              &#xD;行 262:              #line default&#xD;行 263:              #line hidden&#xD;行 264:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 265:  &#xD;行 266:              &#xD;行 267:              #line 28 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 268:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 269:                  CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请填写真实企业资料,我们将在1小时候内审核您发的信息。通过企业认证您发布的信息的权重更高。&amp;quot;, false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 270:  &#xD;行 271:              &#xD;行 272:              #line default&#xD;行 273:              #line hidden&#xD;行 274:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 275:  &#xD;行 276:              &#xD;行 277:              #line 29 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 278:                                                                                                                                                               &#xD;行 279:  &#xD;行 280:                  if (ViewBag.Error != null)&#xD;行 281:                  { &#xD;行 282:                  &#xD;行 283:              &#xD;行 284:              #line default&#xD;行 285:              #line hidden&#xD;行 286:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 287:  &#xD;行 288:              &#xD;行 289:              #line 33 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 290:             Write(ViewHelpers.Alert(&amp;quot;错误信息：&amp;quot;,&#xD;行 291:                  ViewBag.Error, false, CoreHelper.Enum.AlertType.error.ToString()));&#xD;行 292:  &#xD;行 293:              &#xD;行 294:              #line default&#xD;行 295:              #line hidden&#xD;行 296:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 297:  &#xD;行 298:              &#xD;行 299:              #line 34 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 300:                                                                                   &#xD;行 301:                  }&#xD;行 302:  &#xD;行 303:              &#xD;行 304:              #line default&#xD;行 305:              #line hidden&#xD;行 306:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 307:  &#xD;行 308:  WriteLiteral(&amp;quot;                &amp;lt;div&amp;quot;);&#xD;行 309:  &#xD;行 310:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 311:  &#xD;行 312:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 313:  &#xD;行 314:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-form mt20\&amp;quot;&amp;quot;);&#xD;行 315:  &#xD;行 316:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 317:  &#xD;行 318:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 319:  &#xD;行 320:  WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 321:  &#xD;行 322:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 323:  &#xD;行 324:              &#xD;行 325:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 326:                      &#xD;行 327:              &#xD;行 328:              #line default&#xD;行 329:              #line hidden&#xD;行 330:              &#xD;行 331:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 332:                       using (Html.BeginForm())&#xD;行 333:                      {&#xD;行 334:                          &#xD;行 335:              &#xD;行 336:              #line default&#xD;行 337:              #line hidden&#xD;行 338:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 339:  &#xD;行 340:              &#xD;行 341:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 342:                     Write(Html.AntiForgeryToken());&#xD;行 343:  &#xD;行 344:              &#xD;行 345:              #line default&#xD;行 346:              #line hidden&#xD;行 347:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 348:  &#xD;行 349:              &#xD;行 350:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 351:                                                  &#xD;行 352:                          &#xD;行 353:              &#xD;行 354:              #line default&#xD;行 355:              #line hidden&#xD;行 356:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 357:  &#xD;行 358:              &#xD;行 359:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 360:                     Write(Html.EditorForModel());&#xD;行 361:  &#xD;行 362:              &#xD;行 363:              #line default&#xD;行 364:              #line hidden&#xD;行 365:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 366:  &#xD;行 367:              &#xD;行 368:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 369:                                                &#xD;行 370:  &#xD;行 371:              &#xD;行 372:              #line default&#xD;行 373:              #line hidden&#xD;行 374:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 375:  &#xD;行 376:  WriteLiteral(&amp;quot;                        &amp;lt;div&amp;quot;);&#xD;行 377:  &#xD;行 378:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 379:  &#xD;行 380:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 381:  &#xD;行 382:  WriteLiteral(&amp;quot; class=\&amp;quot;form-field form-field-submit c_gray\&amp;quot;&amp;quot;);&#xD;行 383:  &#xD;行 384:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 385:  &#xD;行 386:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 387:  &#xD;行 388:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;button&amp;quot;);&#xD;行 389:  &#xD;行 390:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 391:  &#xD;行 392:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 393:  &#xD;行 394:  WriteLiteral(&amp;quot; type=\&amp;quot;submit\&amp;quot;&amp;quot;);&#xD;行 395:  &#xD;行 396:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 397:  &#xD;行 398:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 399:  &#xD;行 400:  WriteLiteral(&amp;quot; class=\&amp;quot;btn btn-warning \&amp;quot;&amp;quot;);&#xD;行 401:  &#xD;行 402:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 403:  &#xD;行 404:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 405:  &#xD;行 406:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;amp;nbsp;&amp;amp;nbsp;保&amp;amp;nbsp;&amp;amp;nbsp;存&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;/button&amp;quot; +&#xD;行 407:  &amp;quot;&amp;gt;\r\n                        &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 408:  &#xD;行 409:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 410:  &#xD;行 411:              &#xD;行 412:              #line 45 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 413:                      }&#xD;行 414:  &#xD;行 415:              &#xD;行 416:              #line default&#xD;行 417:              #line hidden&#xD;行 418:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 419:  &#xD;行 420:  WriteLiteral(&amp;quot;                &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 421:  &#xD;行 422:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 423:  &#xD;行 424:              &#xD;行 425:              #line 47 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 426:                    &#xD;行 427:              }&#xD;行 428:              else&#xD;行 429:              {&#xD;行 430:                  &#xD;行 431:              &#xD;行 432:              #line default&#xD;行 433:              #line hidden&#xD;行 434:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 435:  &#xD;行 436:              &#xD;行 437:              #line 51 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 438:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 439:                  Html.Raw(item =&amp;gt; new System.Web.WebPages.HelperResult(__razor_template_writer =&amp;gt; {&#xD;行 440:  &#xD;行 441:              &#xD;行 442:              #line default&#xD;行 443:              #line hidden&#xD;行 444:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 445:  &#xD;行 446:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n&amp;quot;);&#xD;行 447:  &#xD;行 448:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 449:  &#xD;行 450:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 451:  &#xD;行 452:  WriteTo(__razor_template_writer, &#xD;行 453:              &#xD;行 454:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 455:                  &#xD;行 456:              &#xD;行 457:              #line default&#xD;行 458:              #line hidden&#xD;行 459:              &#xD;行 460:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 461:                   CoreHelper.Cookie.CookieHelper.NickName);&#xD;行 462:  &#xD;行 463:              &#xD;行 464:              #line default&#xD;行 465:              #line hidden&#xD;行 466:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 467:  &#xD;行 468:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 469:  &#xD;行 470:  WriteLiteralTo(__razor_template_writer, &amp;quot; + \&amp;quot;,请先进行邮箱绑.\&amp;quot; + &amp;quot;);&#xD;行 471:  &#xD;行 472:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 473:  &#xD;行 474:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 475:  &#xD;行 476:              &#xD;行 477:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 478:                                           WriteTo(__razor_template_writer, Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;));&#xD;行 479:  &#xD;行 480:              &#xD;行 481:              #line default&#xD;行 482:              #line hidden&#xD;行 483:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 484:  &#xD;行 485:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 486:  &#xD;行 487:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n                &amp;quot;);&#xD;行 488:  &#xD;行 489:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 490:  &#xD;行 491:              &#xD;行 492:              #line 54 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 493:                       }))&#xD;行 494:                 , false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 495:  &#xD;行 496:              &#xD;行 497:              #line default&#xD;行 498:              #line hidden&#xD;行 499:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 500:  &#xD;行 501:              &#xD;行 502:              #line 55 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 503:                                                                    &#xD;行 504:  &#xD;行 505:              }&#xD;行 506:  &#xD;行 507:              &#xD;行 508:              #line default&#xD;行 509:              #line hidden&#xD;行 510:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2405, 42, true);&#xD;行 511:  &#xD;行 512:  WriteLiteral(&amp;quot;        &amp;lt;/div&amp;gt;\r\n\r\n    &amp;lt;/div&amp;gt;\r\n&amp;lt;/article&amp;gt;\r\n&amp;quot;);&#xD;行 513:  &#xD;行 514:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2405, 42, true);&#xD;行 515:  &#xD;行 516:          }&#xD;行 517:      }&#xD;行 518:  }&#xD;行 519:  &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Personal&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Personal&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Company" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Company" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4216" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Company" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Company" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Personal" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="2n4pdsa2wr2g1hibmgc1ifze" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'cf11ea02-a40e-4cb1-9015-69a4f1a7a3de', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.Web.HttpCompileException', N'System.Web', N'f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型', N'', 500, CAST(0x0000A18400BFDAE2 AS DateTime), 20, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.Web.HttpCompileException"
  message="f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型"
  source="System.Web"
  detail="System.Web.HttpCompileException (0x80004005): f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;   在 System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   在 System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.&lt;&gt;c__DisplayClass4.&lt;GetPathFromGeneralName&gt;b__0(String path)&#xD;&#xA;   在 System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.&lt;&gt;c__DisplayClassb.&lt;GetDisplayInfoForVirtualPath&gt;b__8(IDisplayMode mode)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.&lt;&gt;c__DisplayClass4.&lt;FindView&gt;b__3() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.Find(ControllerContext controllerContext, String name, Func`1 finder, Boolean isPartial) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 66&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.&lt;&gt;c__DisplayClassc.&lt;FindView&gt;b__b(IViewEngine e)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)&#xD;&#xA;   在 System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-17T11:38:31.3675921Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;编译错误&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;“/”应用程序中的服务器错误。&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;编译错误&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 说明: &lt;/b&gt;在编译向该请求提供服务所需资源的过程中出现错误。请检查下列特定错误详细信息并适当地修改源代码。&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 编译器错误消息: &lt;/b&gt;CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;源错误:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 50:             {&#xD;&#xA;行 51:                 @ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;&#xA;&lt;font color=red&gt;行 52:                 Html.Raw(@&amp;lt;text&amp;gt;&#xD;&#xA;&lt;/font&gt;行 53:                 @CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请先进行邮箱绑.&amp;quot; + @Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;)&#xD;&#xA;行 54:                 &amp;lt;/text&amp;gt;)&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;源文件:&lt;/b&gt; f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;行:&lt;/b&gt;  52&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;显示详细的编译器输出:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe&amp;quot; /t:library /utf8output /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcd85fc9\1514e0d7_34fdcd01\WebBackgrounder.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\00c31624\345af93b_33fdcd01\Ninject.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\d646fe13\2ff05314_6ff9cd01\EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\9d313db2\ac8e44d8_32fdcd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\faec4bb3\dabe3c7f_0323ce01\CoreHelper.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a844eb1e\999d4107_59e6cd01\Newtonsoft.Json.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Runtime\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1446f373\23fcc609_59e6cd01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Code.mbgvt78p.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\c82bae78\f901f13b_33fdcd01\Ninject.Web.Common.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\f7654580\e1468883_4f13ce01\BundleMinifyInlineJsCss.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Web.Infrastructure\v4.0_1.0.0.0__31bf3856ad364e35\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcb8c082\7f054fe6_6ef9cd01\Ninject.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\8de7e665\fc146296_32fdcd01\WebActivator.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\fec2f268\e34b7f82_0323ce01\CodeFirstEF.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\39e5ef3b\2a813408_59e6cd01\System.Net.Http.Formatting.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a67719ca\004a670b_16c2cd01\Kendo.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\20461b34\98250e66_33fdcd01\ICSharpCode.SharpZipLib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1e6035e1\98da4166_33fdcd01\Lucene.Net.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\63cdd554\2ed15b34_ac02ce01\MiniProfiler.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\2b8fd3e3\b88ed7c9_34fdcd01\Elmah.Contrib.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_global.asax.ofvptito.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Helpers\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\11f905e0\46eedd08_59e6cd01\System.Web.Http.WebHost.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6626534f\a9b6f431_33fdcd01\MiniProfiler.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.Entity\v4.0_4.0.0.0__b77a5c561934e089\System.Data.Entity.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_1.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6927149a\1ca6f909_59e6cd01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e44bbd4b\d953f509_59e6cd01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Mvc\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\150a79dc\1e9ae962_5f1ace01\Microsoft.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\b0a0078c\aa627e55_de1fce01\Lucene.Net.China.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e78f38e3\504ddedd_34fdcd01\WebBackgrounder.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\4b6934ef\3f1da408_59e6cd01\System.Web.Http.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1._klmwy7a.dll&amp;quot; /D:DEBUG /debug+ /optimize- /w:4 /nowarn:1659;1699;1701;612;618 /warnaserror-  &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1._klmwy7a.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1._klmwy7a.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft(R) Visual C# 编译器版本 4.0.30319.17929&#xD;&#xA;&#xD;&#xA;用于 Microsoft(R) .NET Framework 4.5&#xD;&#xA;版权所有 (C) Microsoft Corporation。保留所有权利。&#xD;&#xA;&#xD;&#xA;f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52,26): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;显示完整的编译源:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 1:    #pragma checksum &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;A70F17916D358E05FB0AEA8E4981F0E9A64CACB9&amp;quot;&#xD;行 2:    //------------------------------------------------------------------------------&#xD;行 3:    // &amp;lt;auto-generated&amp;gt;&#xD;行 4:    //     此代码由工具生成。&#xD;行 5:    //     运行时版本:4.0.30319.18034&#xD;行 6:    //&#xD;行 7:    //     对此文件的更改可能会导致不正确的行为，并且如果&#xD;行 8:    //     重新生成代码，这些更改将会丢失。&#xD;行 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;行 10:   //------------------------------------------------------------------------------&#xD;行 11:   &#xD;行 12:   namespace ASP {&#xD;行 13:       using System;&#xD;行 14:       using System.Collections.Generic;&#xD;行 15:       using System.IO;&#xD;行 16:       using System.Linq;&#xD;行 17:       using System.Net;&#xD;行 18:       using System.Web;&#xD;行 19:       using System.Web.Helpers;&#xD;行 20:       using System.Web.Security;&#xD;行 21:       using System.Web.UI;&#xD;行 22:       using System.Web.WebPages;&#xD;行 23:       using System.Web.Mvc;&#xD;行 24:       using System.Web.Mvc.Ajax;&#xD;行 25:       using System.Web.Mvc.Html;&#xD;行 26:       using System.Web.Optimization;&#xD;行 27:       using System.Web.Routing;&#xD;行 28:       using Kendo.Mvc.UI;&#xD;行 29:       using Microsoft.Web.Helpers;&#xD;行 30:       &#xD;行 31:       &#xD;行 32:       public class _Page_Views_Company_Index_cshtml : System.Web.Mvc.WebViewPage&amp;lt;CodeFirstEF.ViewModels.CompanyReg&amp;gt; {&#xD;行 33:           &#xD;行 34:   #line hidden&#xD;行 35:           &#xD;行 36:           public _Page_Views_Company_Index_cshtml() {&#xD;行 37:           }&#xD;行 38:           &#xD;行 39:           protected ASP.global_asax ApplicationInstance {&#xD;行 40:               get {&#xD;行 41:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;行 42:               }&#xD;行 43:           }&#xD;行 44:           &#xD;行 45:           public override void Execute() {&#xD;行 46:               &#xD;行 47:               #line 2 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 48:     &#xD;行 49:       ViewBag.Title = &amp;quot;企业认证&amp;quot;;&#xD;行 50:       Layout = &amp;quot;~/Views/Shared/_LayoutPersonal.cshtml&amp;quot;;&#xD;行 51:   &#xD;行 52:               &#xD;行 53:               #line default&#xD;行 54:               #line hidden&#xD;行 55:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 56:   &#xD;行 57:   WriteLiteral(&amp;quot;\r\n&amp;lt;article&amp;quot;);&#xD;行 58:   &#xD;行 59:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 60:   &#xD;行 61:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 62:   &#xD;行 63:   WriteLiteral(&amp;quot; class=\&amp;quot;personal clearfix\&amp;quot;&amp;quot;);&#xD;行 64:   &#xD;行 65:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 66:   &#xD;行 67:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 68:   &#xD;行 69:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 70:   &#xD;行 71:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 72:   &#xD;行 73:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 74:   &#xD;行 75:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-left\&amp;quot;&amp;quot;);&#xD;行 76:   &#xD;行 77:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 78:   &#xD;行 79:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 80:   &#xD;行 81:   WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 82:   &#xD;行 83:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 84:   &#xD;行 85:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 86:   &#xD;行 87:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-nav\&amp;quot;&amp;quot;);&#xD;行 88:   &#xD;行 89:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 90:   &#xD;行 91:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 92:   &#xD;行 93:   WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 94:   &#xD;行 95:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 96:   &#xD;行 97:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 98:   &#xD;行 99:   WriteLiteral(&amp;quot;            &amp;quot;);&#xD;行 100:  &#xD;行 101:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 102:  &#xD;行 103:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 104:  &#xD;行 105:              &#xD;行 106:              #line 9 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 107:         Write(Html.Partial(&amp;quot;_PersonalLeftNav&amp;quot;));&#xD;行 108:  &#xD;行 109:              &#xD;行 110:              #line default&#xD;行 111:              #line hidden&#xD;行 112:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 113:  &#xD;行 114:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 115:  &#xD;行 116:  WriteLiteral(&amp;quot;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 117:  &#xD;行 118:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 119:  &#xD;行 120:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 121:  &#xD;行 122:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right\&amp;quot;&amp;quot;);&#xD;行 123:  &#xD;行 124:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 125:  &#xD;行 126:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 127:  &#xD;行 128:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 129:  &#xD;行 130:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 131:  &#xD;行 132:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 133:  &#xD;行 134:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right-body\&amp;quot;&amp;quot;);&#xD;行 135:  &#xD;行 136:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 137:  &#xD;行 138:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 139:  &#xD;行 140:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;行 141:  &#xD;行 142:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 143:  &#xD;行 144:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 145:  &#xD;行 146:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-body-title clearfix\&amp;quot;&amp;quot;);&#xD;行 147:  &#xD;行 148:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 149:  &#xD;行 150:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 151:  &#xD;行 152:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;h5&amp;gt;&amp;quot;);&#xD;行 153:  &#xD;行 154:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 155:  &#xD;行 156:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 157:  &#xD;行 158:              &#xD;行 159:              #line 15 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 160:                 Write(ViewBag.Title);&#xD;行 161:  &#xD;行 162:              &#xD;行 163:              #line default&#xD;行 164:              #line hidden&#xD;行 165:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 166:  &#xD;行 167:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 168:  &#xD;行 169:  WriteLiteral(&amp;quot;&amp;lt;/h5&amp;gt;\r\n                &amp;lt;ul&amp;quot;);&#xD;行 170:  &#xD;行 171:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 172:  &#xD;行 173:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 174:  &#xD;行 175:  WriteLiteral(&amp;quot; class=\&amp;quot;form-step clearfix\&amp;quot;&amp;quot;);&#xD;行 176:  &#xD;行 177:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 178:  &#xD;行 179:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 180:  &#xD;行 181:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;li  &amp;quot;);&#xD;行 182:  &#xD;行 183:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 184:  &#xD;行 185:              &#xD;行 186:              #line 17 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 187:                            if (!ViewBag.UserEmailActived)&#xD;行 188:                           {&#xD;行 189:              &#xD;行 190:              #line default&#xD;行 191:              #line hidden&#xD;行 192:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 193:  &#xD;行 194:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 195:  &#xD;行 196:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 197:  &#xD;行 198:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 199:  &#xD;行 200:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 201:  &#xD;行 202:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 203:  &#xD;行 204:              &#xD;行 205:              #line 18 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 206:                                                     }&#xD;行 207:              &#xD;行 208:              #line default&#xD;行 209:              #line hidden&#xD;行 210:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 211:  &#xD;行 212:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第一步：邮箱绑定&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li   &amp;quot;);&#xD;行 213:  &#xD;行 214:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 215:  &#xD;行 216:              &#xD;行 217:              #line 19 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 218:                             if (ViewBag.UserEmailActived)&#xD;行 219:                            {&#xD;行 220:              &#xD;行 221:              #line default&#xD;行 222:              #line hidden&#xD;行 223:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 224:  &#xD;行 225:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 226:  &#xD;行 227:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 228:  &#xD;行 229:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 230:  &#xD;行 231:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 232:  &#xD;行 233:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 234:  &#xD;行 235:              &#xD;行 236:              #line 20 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 237:                                                      }&#xD;行 238:              &#xD;行 239:              #line default&#xD;行 240:              #line hidden&#xD;行 241:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 242:  &#xD;行 243:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第二步：填写企业信息&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第三步：提&amp;quot; +&#xD;行 244:  &amp;quot;交后台审核&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第四步：审核通过认证成功&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&amp;quot; +&#xD;行 245:  &amp;quot;\r\n                &amp;lt;/ul&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 246:  &#xD;行 247:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 248:  &#xD;行 249:              &#xD;行 250:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 251:              &#xD;行 252:              &#xD;行 253:              #line default&#xD;行 254:              #line hidden&#xD;行 255:              &#xD;行 256:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 257:               if (ViewBag.UserEmailActived)&#xD;行 258:              {&#xD;行 259:            &#xD;行 260:                  &#xD;行 261:              &#xD;行 262:              #line default&#xD;行 263:              #line hidden&#xD;行 264:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 265:  &#xD;行 266:              &#xD;行 267:              #line 28 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 268:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 269:                  CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请填写真实企业资料,我们将在1小时候内审核您发的信息。通过企业认证您发布的信息的权重更高。&amp;quot;, false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 270:  &#xD;行 271:              &#xD;行 272:              #line default&#xD;行 273:              #line hidden&#xD;行 274:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 275:  &#xD;行 276:              &#xD;行 277:              #line 29 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 278:                                                                                                                                                               &#xD;行 279:  &#xD;行 280:                  if (ViewBag.Error != null)&#xD;行 281:                  { &#xD;行 282:                  &#xD;行 283:              &#xD;行 284:              #line default&#xD;行 285:              #line hidden&#xD;行 286:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 287:  &#xD;行 288:              &#xD;行 289:              #line 33 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 290:             Write(ViewHelpers.Alert(&amp;quot;错误信息：&amp;quot;,&#xD;行 291:                  ViewBag.Error, false, CoreHelper.Enum.AlertType.error.ToString()));&#xD;行 292:  &#xD;行 293:              &#xD;行 294:              #line default&#xD;行 295:              #line hidden&#xD;行 296:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 297:  &#xD;行 298:              &#xD;行 299:              #line 34 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 300:                                                                                   &#xD;行 301:                  }&#xD;行 302:  &#xD;行 303:              &#xD;行 304:              #line default&#xD;行 305:              #line hidden&#xD;行 306:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 307:  &#xD;行 308:  WriteLiteral(&amp;quot;                &amp;lt;div&amp;quot;);&#xD;行 309:  &#xD;行 310:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 311:  &#xD;行 312:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 313:  &#xD;行 314:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-form mt20\&amp;quot;&amp;quot;);&#xD;行 315:  &#xD;行 316:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 317:  &#xD;行 318:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 319:  &#xD;行 320:  WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 321:  &#xD;行 322:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 323:  &#xD;行 324:              &#xD;行 325:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 326:                      &#xD;行 327:              &#xD;行 328:              #line default&#xD;行 329:              #line hidden&#xD;行 330:              &#xD;行 331:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 332:                       using (Html.BeginForm())&#xD;行 333:                      {&#xD;行 334:                          &#xD;行 335:              &#xD;行 336:              #line default&#xD;行 337:              #line hidden&#xD;行 338:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 339:  &#xD;行 340:              &#xD;行 341:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 342:                     Write(Html.AntiForgeryToken());&#xD;行 343:  &#xD;行 344:              &#xD;行 345:              #line default&#xD;行 346:              #line hidden&#xD;行 347:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 348:  &#xD;行 349:              &#xD;行 350:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 351:                                                  &#xD;行 352:                          &#xD;行 353:              &#xD;行 354:              #line default&#xD;行 355:              #line hidden&#xD;行 356:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 357:  &#xD;行 358:              &#xD;行 359:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 360:                     Write(Html.EditorForModel());&#xD;行 361:  &#xD;行 362:              &#xD;行 363:              #line default&#xD;行 364:              #line hidden&#xD;行 365:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 366:  &#xD;行 367:              &#xD;行 368:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 369:                                                &#xD;行 370:  &#xD;行 371:              &#xD;行 372:              #line default&#xD;行 373:              #line hidden&#xD;行 374:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 375:  &#xD;行 376:  WriteLiteral(&amp;quot;                        &amp;lt;div&amp;quot;);&#xD;行 377:  &#xD;行 378:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 379:  &#xD;行 380:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 381:  &#xD;行 382:  WriteLiteral(&amp;quot; class=\&amp;quot;form-field form-field-submit c_gray\&amp;quot;&amp;quot;);&#xD;行 383:  &#xD;行 384:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 385:  &#xD;行 386:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 387:  &#xD;行 388:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;button&amp;quot;);&#xD;行 389:  &#xD;行 390:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 391:  &#xD;行 392:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 393:  &#xD;行 394:  WriteLiteral(&amp;quot; type=\&amp;quot;submit\&amp;quot;&amp;quot;);&#xD;行 395:  &#xD;行 396:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 397:  &#xD;行 398:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 399:  &#xD;行 400:  WriteLiteral(&amp;quot; class=\&amp;quot;btn btn-warning \&amp;quot;&amp;quot;);&#xD;行 401:  &#xD;行 402:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 403:  &#xD;行 404:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 405:  &#xD;行 406:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;amp;nbsp;&amp;amp;nbsp;保&amp;amp;nbsp;&amp;amp;nbsp;存&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;/button&amp;quot; +&#xD;行 407:  &amp;quot;&amp;gt;\r\n                        &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 408:  &#xD;行 409:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 410:  &#xD;行 411:              &#xD;行 412:              #line 45 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 413:                      }&#xD;行 414:  &#xD;行 415:              &#xD;行 416:              #line default&#xD;行 417:              #line hidden&#xD;行 418:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 419:  &#xD;行 420:  WriteLiteral(&amp;quot;                &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 421:  &#xD;行 422:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 423:  &#xD;行 424:              &#xD;行 425:              #line 47 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 426:                    &#xD;行 427:              }&#xD;行 428:              else&#xD;行 429:              {&#xD;行 430:                  &#xD;行 431:              &#xD;行 432:              #line default&#xD;行 433:              #line hidden&#xD;行 434:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 435:  &#xD;行 436:              &#xD;行 437:              #line 51 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 438:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 439:                  Html.Raw(item =&amp;gt; new System.Web.WebPages.HelperResult(__razor_template_writer =&amp;gt; {&#xD;行 440:  &#xD;行 441:              &#xD;行 442:              #line default&#xD;行 443:              #line hidden&#xD;行 444:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 445:  &#xD;行 446:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n&amp;quot;);&#xD;行 447:  &#xD;行 448:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 449:  &#xD;行 450:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 451:  &#xD;行 452:  WriteTo(__razor_template_writer, &#xD;行 453:              &#xD;行 454:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 455:                  &#xD;行 456:              &#xD;行 457:              #line default&#xD;行 458:              #line hidden&#xD;行 459:              &#xD;行 460:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 461:                   CoreHelper.Cookie.CookieHelper.NickName);&#xD;行 462:  &#xD;行 463:              &#xD;行 464:              #line default&#xD;行 465:              #line hidden&#xD;行 466:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 467:  &#xD;行 468:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 469:  &#xD;行 470:  WriteLiteralTo(__razor_template_writer, &amp;quot; + \&amp;quot;,请先进行邮箱绑.\&amp;quot; + &amp;quot;);&#xD;行 471:  &#xD;行 472:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 473:  &#xD;行 474:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 475:  &#xD;行 476:              &#xD;行 477:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 478:                                           WriteTo(__razor_template_writer, Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;));&#xD;行 479:  &#xD;行 480:              &#xD;行 481:              #line default&#xD;行 482:              #line hidden&#xD;行 483:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 484:  &#xD;行 485:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 486:  &#xD;行 487:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n                &amp;quot;);&#xD;行 488:  &#xD;行 489:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 490:  &#xD;行 491:              &#xD;行 492:              #line 54 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 493:                       }))&#xD;行 494:                 , false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 495:  &#xD;行 496:              &#xD;行 497:              #line default&#xD;行 498:              #line hidden&#xD;行 499:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 500:  &#xD;行 501:              &#xD;行 502:              #line 55 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 503:                                                                    &#xD;行 504:  &#xD;行 505:              }&#xD;行 506:  &#xD;行 507:              &#xD;行 508:              #line default&#xD;行 509:              #line hidden&#xD;行 510:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2405, 42, true);&#xD;行 511:  &#xD;行 512:  WriteLiteral(&amp;quot;        &amp;lt;/div&amp;gt;\r\n\r\n    &amp;lt;/div&amp;gt;\r\n&amp;lt;/article&amp;gt;\r\n&amp;quot;);&#xD;行 513:  &#xD;行 514:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2405, 42, true);&#xD;行 515:  &#xD;行 516:          }&#xD;行 517:      }&#xD;行 518:  }&#xD;行 519:  &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Personal&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Personal&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Company" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Company" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4216" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Company" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Company" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Personal" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="2n4pdsa2wr2g1hibmgc1ifze" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'f4c566df-a48f-46cb-8522-6ed095cc7e67', N'', N'NAVY-PC', N'System.TypeInitializationException', N'Lucene.Net.China', N'“Lucene.Net.China.WordTree”的类型初始值设定项引发异常。', N'', 0, CAST(0x0000A18000855F6D AS DateTime), 2, N'<error
  host="NAVY-PC"
  type="System.TypeInitializationException"
  message="“Lucene.Net.China.WordTree”的类型初始值设定项引发异常。"
  source="Lucene.Net.China"
  detail="System.AggregateException: 发生一个或多个错误。 ---&gt; System.TypeInitializationException: “Lucene.Net.China.WordTree”的类型初始值设定项引发异常。 ---&gt; System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 Lucene.Net.China.WordTree..cctor()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 Lucene.Net.China.WordTree..ctor()&#xD;&#xA;   在 Lucene.Net.China.ChineseTokenizer.IncrementToken()&#xD;&#xA;   在 Lucene.Net.Analysis.Standard.StandardFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\Standard\StandardFilter.cs:行号 53&#xD;&#xA;   在 Lucene.Net.Analysis.StopFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\StopFilter.cs:行号 132&#xD;&#xA;   在 Lucene.Net.Index.DocInverterPerField.ProcessFields(IFieldable[] fields, Int32 count) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocInverterPerField.cs:行号 149&#xD;&#xA;   在 Lucene.Net.Index.DocFieldProcessorPerThread.ProcessDocument() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocFieldProcessorPerThread.cs:行号 275&#xD;&#xA;   在 Lucene.Net.Index.DocumentsWriter.UpdateDocument(Document doc, Analyzer analyzer, Term delTerm) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocumentsWriter.cs:行号 1031&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc, Analyzer analyzer) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2331&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2303&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoor(OutDoorIndexEntity OutDoor) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 205&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoors(List`1 OutDoors, Boolean creatingIndex) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 139&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.UpdateIndex() 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 75&#xD;&#xA;   在 System.Threading.Tasks.Task.InnerInvoke()&#xD;&#xA;   在 System.Threading.Tasks.Task.Execute()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)&#xD;&#xA;   在 System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)&#xD;&#xA;   在 WebBackgrounder.JobHost.DoWork(Task work)&#xD;&#xA;   在 WebBackgrounder.JobManager.DoNextJob()&#xD;&#xA;   在 WebBackgrounder.JobManager.OnTimerElapsed(Object sender)&#xD;&#xA;---&gt; (内部异常 #0) System.TypeInitializationException: “Lucene.Net.China.WordTree”的类型初始值设定项引发异常。 ---&gt; System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 Lucene.Net.China.WordTree..cctor()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 Lucene.Net.China.WordTree..ctor()&#xD;&#xA;   在 Lucene.Net.China.ChineseTokenizer.IncrementToken()&#xD;&#xA;   在 Lucene.Net.Analysis.Standard.StandardFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\Standard\StandardFilter.cs:行号 53&#xD;&#xA;   在 Lucene.Net.Analysis.StopFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\StopFilter.cs:行号 132&#xD;&#xA;   在 Lucene.Net.Index.DocInverterPerField.ProcessFields(IFieldable[] fields, Int32 count) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocInverterPerField.cs:行号 149&#xD;&#xA;   在 Lucene.Net.Index.DocFieldProcessorPerThread.ProcessDocument() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocFieldProcessorPerThread.cs:行号 275&#xD;&#xA;   在 Lucene.Net.Index.DocumentsWriter.UpdateDocument(Document doc, Analyzer analyzer, Term delTerm) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocumentsWriter.cs:行号 1031&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc, Analyzer analyzer) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2331&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2303&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoor(OutDoorIndexEntity OutDoor) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 205&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoors(List`1 OutDoors, Boolean creatingIndex) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 139&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.UpdateIndex() 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 75&#xD;&#xA;   在 System.Threading.Tasks.Task.InnerInvoke()&#xD;&#xA;   在 System.Threading.Tasks.Task.Execute()&lt;---&#xD;&#xA;"
  time="2013-03-13T08:05:35.7216796Z" />')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'e5dd5170-1266-4d14-a573-7714baba8816', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FC0B66 AS DateTime), 28, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:17:39.9652515Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:5&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 5&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59647" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="1" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'45b075a4-b08b-42bb-bd2e-7e7b8c6493c6', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FA97E6 AS DateTime), 22, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:12:22.9541195Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:6&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 6&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="on" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'425dab08-ef7d-48c0-ad8f-7eb2d5f602f7', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FB518A AS DateTime), 26, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:15:01.3671802Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:5&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 5&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="1" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'8173abb0-62d1-468f-a78d-7efff22516a6', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FB11FA AS DateTime), 25, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:14:07.1250777Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:5&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 5&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="1" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'ce4d0807-3664-4b8f-a4e2-86bdc80a9f06', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FAC52C AS DateTime), 24, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:13:01.5873292Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:6&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 6&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59583" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="6" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="on" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'e05c0de6-3169-4574-92e7-8a966f03c278', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.Web.HttpCompileException', N'System.Web', N'f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型', N'', 500, CAST(0x0000A18400BF314F AS DateTime), 17, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.Web.HttpCompileException"
  message="f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型"
  source="System.Web"
  detail="System.Web.HttpCompileException (0x80004005): f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;   在 System.Web.Compilation.AssemblyBuilder.Compile()&#xD;&#xA;   在 System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetObjectFactory(String virtualPath, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.&lt;&gt;c__DisplayClass4.&lt;GetPathFromGeneralName&gt;b__0(String path)&#xD;&#xA;   在 System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.&lt;&gt;c__DisplayClassb.&lt;GetDisplayInfoForVirtualPath&gt;b__8(IDisplayMode mode)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.&lt;&gt;c__DisplayClass4.&lt;FindView&gt;b__3() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.Find(ControllerContext controllerContext, String name, Func`1 finder, Boolean isPartial) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 66&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.&lt;&gt;c__DisplayClassc.&lt;FindView&gt;b__b(IViewEngine e)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)&#xD;&#xA;   在 System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-17T11:36:06.6623154Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;编译错误&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;“/”应用程序中的服务器错误。&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;编译错误&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 说明: &lt;/b&gt;在编译向该请求提供服务所需资源的过程中出现错误。请检查下列特定错误详细信息并适当地修改源代码。&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 编译器错误消息: &lt;/b&gt;CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;b&gt;源错误:&lt;/b&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&lt;td&gt;&#xD;&#xA;                              &lt;/td&gt;&lt;/tr&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 50:             {&#xD;&#xA;行 51:                 @ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;&#xA;&lt;font color=red&gt;行 52:                 Html.Raw(@&amp;lt;text&amp;gt;&#xD;&#xA;&lt;/font&gt;行 53:                 @CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请先进行邮箱绑.&amp;quot; + @Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;)&#xD;&#xA;行 54:                 &amp;lt;/text&amp;gt;).ToString()&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;源文件:&lt;/b&gt; f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&#xD;&#xA;            &amp;nbsp;&amp;nbsp; &lt;b&gt;行:&lt;/b&gt;  52&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''compilerOutputDiv'')&quot;&gt;显示详细的编译器输出:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;compilerOutputDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;c:\windows\system32\inetsrv&amp;gt; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe&amp;quot; /t:library /utf8output /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\20461b34\98250e66_33fdcd01\ICSharpCode.SharpZipLib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_global.asax.nzeenlsp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\d646fe13\2ff05314_6ff9cd01\EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\faec4bb3\dabe3c7f_0323ce01\CoreHelper.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcd85fc9\1514e0d7_34fdcd01\WebBackgrounder.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\11f905e0\46eedd08_59e6cd01\System.Web.Http.WebHost.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\150a79dc\1e9ae962_5f1ace01\Microsoft.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Mvc\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Extensions\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.Extensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\39e5ef3b\2a813408_59e6cd01\System.Net.Http.Formatting.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\fec2f268\e34b7f82_0323ce01\CodeFirstEF.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6626534f\a9b6f431_33fdcd01\MiniProfiler.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\c82bae78\f901f13b_33fdcd01\Ninject.Web.Common.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\4b6934ef\3f1da408_59e6cd01\System.Web.Http.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\bcb8c082\7f054fe6_6ef9cd01\Ninject.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\6927149a\1ca6f909_59e6cd01\WebGrease.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.DynamicData\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.DynamicData.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\9d313db2\ac8e44d8_32fdcd01\Elmah.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Code.7uqd9fcy.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel\v4.0_4.0.0.0__b77a5c561934e089\System.ServiceModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\2b8fd3e3\b88ed7c9_34fdcd01\Elmah.Contrib.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\f7654580\e1468883_4f13ce01\BundleMinifyInlineJsCss.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.Entity\v4.0_4.0.0.0__b77a5c561934e089\System.Data.Entity.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\63cdd554\2ed15b34_ac02ce01\MiniProfiler.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.WorkflowServices\v4.0_4.0.0.0__31bf3856ad364e35\System.WorkflowServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e44bbd4b\d953f509_59e6cd01\Antlr3.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\b0a0078c\aa627e55_de1fce01\Lucene.Net.China.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.IdentityModel\v4.0_4.0.0.0__b77a5c561934e089\System.IdentityModel.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\e78f38e3\504ddedd_34fdcd01\WebBackgrounder.EntityFramework.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1446f373\23fcc609_59e6cd01\System.Web.Optimization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Web\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Web.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.Helpers\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.Helpers.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Deployment\v4.0_1.0.0.0__31bf3856ad364e35\System.Web.WebPages.Deployment.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\8de7e665\fc146296_32fdcd01\WebActivator.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a67719ca\004a670b_16c2cd01\Kendo.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Web.Infrastructure\v4.0_1.0.0.0__31bf3856ad364e35\Microsoft.Web.Infrastructure.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Runtime\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Runtime.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\00c31624\345af93b_33fdcd01\Ninject.Web.Mvc.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualStudio.Web.PageInspector.Loader\v4.0_1.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualStudio.Web.PageInspector.Loader.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Activation\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Activation.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Web.WebPages.Razor\v4.0_2.0.0.0__31bf3856ad364e35\System.Web.WebPages.Razor.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\1e6035e1\98da4166_33fdcd01\Lucene.Net.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_32\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.Net\assembly\GAC_MSIL\System.Activities\v4.0_4.0.0.0__31bf3856ad364e35\System.Activities.dll&amp;quot; /R:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\assembly\dl3\a844eb1e\999d4107_59e6cd01\Newtonsoft.Json.dll&amp;quot; /out:&amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.jcuyai5d.dll&amp;quot; /D:DEBUG /debug+ /optimize- /w:4 /nowarn:1659;1699;1701;612;618 /warnaserror-  &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.jcuyai5d.0.cs&amp;quot; &amp;quot;C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\root\eb64aaf3\c0acf271\App_Web_index.cshtml.bc77d9c1.jcuyai5d.1.cs&amp;quot;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;Microsoft(R) Visual C# 编译器版本 4.0.30319.17929&#xD;&#xA;&#xD;&#xA;用于 Microsoft(R) .NET Framework 4.5&#xD;&#xA;版权所有 (C) Microsoft Corporation。保留所有权利。&#xD;&#xA;&#xD;&#xA;f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml(52,26): error CS1660: 无法将 lambda 表达式 转换为类型“string”，原因是它不是委托类型&#xD;&#xA;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&lt;br&gt;&lt;div class=&quot;expandable&quot; onclick=&quot;OnToggleTOCLevel1(''dynamicCodeDiv'')&quot;&gt;显示完整的编译源:&lt;/div&gt;&#xD;&#xA;&lt;div id=&quot;dynamicCodeDiv&quot; style=&quot;display: none;&quot;&gt;&#xD;&#xA;            &lt;br&gt;&lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 1:    #pragma checksum &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot; &amp;quot;{ff1816ec-aa5e-4d10-87f7-6f4963833460}&amp;quot; &amp;quot;D62EBB49236055DBA0C520CA178E4E0B61E7C118&amp;quot;&#xD;行 2:    //------------------------------------------------------------------------------&#xD;行 3:    // &amp;lt;auto-generated&amp;gt;&#xD;行 4:    //     此代码由工具生成。&#xD;行 5:    //     运行时版本:4.0.30319.18034&#xD;行 6:    //&#xD;行 7:    //     对此文件的更改可能会导致不正确的行为，并且如果&#xD;行 8:    //     重新生成代码，这些更改将会丢失。&#xD;行 9:    // &amp;lt;/auto-generated&amp;gt;&#xD;行 10:   //------------------------------------------------------------------------------&#xD;行 11:   &#xD;行 12:   namespace ASP {&#xD;行 13:       using System;&#xD;行 14:       using System.Collections.Generic;&#xD;行 15:       using System.IO;&#xD;行 16:       using System.Linq;&#xD;行 17:       using System.Net;&#xD;行 18:       using System.Web;&#xD;行 19:       using System.Web.Helpers;&#xD;行 20:       using System.Web.Security;&#xD;行 21:       using System.Web.UI;&#xD;行 22:       using System.Web.WebPages;&#xD;行 23:       using System.Web.Mvc;&#xD;行 24:       using System.Web.Mvc.Ajax;&#xD;行 25:       using System.Web.Mvc.Html;&#xD;行 26:       using System.Web.Optimization;&#xD;行 27:       using System.Web.Routing;&#xD;行 28:       using Kendo.Mvc.UI;&#xD;行 29:       using Microsoft.Web.Helpers;&#xD;行 30:       &#xD;行 31:       &#xD;行 32:       public class _Page_Views_Company_Index_cshtml : System.Web.Mvc.WebViewPage&amp;lt;CodeFirstEF.ViewModels.CompanyReg&amp;gt; {&#xD;行 33:           &#xD;行 34:   #line hidden&#xD;行 35:           &#xD;行 36:           public _Page_Views_Company_Index_cshtml() {&#xD;行 37:           }&#xD;行 38:           &#xD;行 39:           protected ASP.global_asax ApplicationInstance {&#xD;行 40:               get {&#xD;行 41:                   return ((ASP.global_asax)(Context.ApplicationInstance));&#xD;行 42:               }&#xD;行 43:           }&#xD;行 44:           &#xD;行 45:           public override void Execute() {&#xD;行 46:               &#xD;行 47:               #line 2 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 48:     &#xD;行 49:       ViewBag.Title = &amp;quot;企业认证&amp;quot;;&#xD;行 50:       Layout = &amp;quot;~/Views/Shared/_LayoutPersonal.cshtml&amp;quot;;&#xD;行 51:   &#xD;行 52:               &#xD;行 53:               #line default&#xD;行 54:               #line hidden&#xD;行 55:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 56:   &#xD;行 57:   WriteLiteral(&amp;quot;\r\n&amp;lt;article&amp;quot;);&#xD;行 58:   &#xD;行 59:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 131, 10, true);&#xD;行 60:   &#xD;行 61:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 62:   &#xD;行 63:   WriteLiteral(&amp;quot; class=\&amp;quot;personal clearfix\&amp;quot;&amp;quot;);&#xD;行 64:   &#xD;行 65:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 141, 26, true);&#xD;行 66:   &#xD;行 67:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 68:   &#xD;行 69:   WriteLiteral(&amp;quot;&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 70:   &#xD;行 71:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 167, 11, true);&#xD;行 72:   &#xD;行 73:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 74:   &#xD;行 75:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-left\&amp;quot;&amp;quot;);&#xD;行 76:   &#xD;行 77:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 178, 22, true);&#xD;行 78:   &#xD;行 79:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 80:   &#xD;行 81:   WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 82:   &#xD;行 83:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 200, 15, true);&#xD;行 84:   &#xD;行 85:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 86:   &#xD;行 87:   WriteLiteral(&amp;quot; class=\&amp;quot;personal-nav\&amp;quot;&amp;quot;);&#xD;行 88:   &#xD;行 89:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 215, 21, true);&#xD;行 90:   &#xD;行 91:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 92:   &#xD;行 93:   WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 94:   &#xD;行 95:   EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 236, 3, true);&#xD;行 96:   &#xD;行 97:   BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 98:   &#xD;行 99:   WriteLiteral(&amp;quot;            &amp;quot;);&#xD;行 100:  &#xD;行 101:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 239, 12, true);&#xD;行 102:  &#xD;行 103:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 104:  &#xD;行 105:              &#xD;行 106:              #line 9 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 107:         Write(Html.Partial(&amp;quot;_PersonalLeftNav&amp;quot;));&#xD;行 108:  &#xD;行 109:              &#xD;行 110:              #line default&#xD;行 111:              #line hidden&#xD;行 112:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 252, 32, false);&#xD;行 113:  &#xD;行 114:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 115:  &#xD;行 116:  WriteLiteral(&amp;quot;\r\n        &amp;lt;/div&amp;gt;\r\n    &amp;lt;/div&amp;gt;\r\n    &amp;lt;div&amp;quot;);&#xD;行 117:  &#xD;行 118:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 284, 38, true);&#xD;行 119:  &#xD;行 120:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 121:  &#xD;行 122:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right\&amp;quot;&amp;quot;);&#xD;行 123:  &#xD;行 124:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 322, 23, true);&#xD;行 125:  &#xD;行 126:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 127:  &#xD;行 128:  WriteLiteral(&amp;quot;&amp;gt;\r\n        &amp;lt;div&amp;quot;);&#xD;行 129:  &#xD;行 130:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 345, 15, true);&#xD;行 131:  &#xD;行 132:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 133:  &#xD;行 134:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-right-body\&amp;quot;&amp;quot;);&#xD;行 135:  &#xD;行 136:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 360, 28, true);&#xD;行 137:  &#xD;行 138:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 139:  &#xD;行 140:  WriteLiteral(&amp;quot;&amp;gt;\r\n            &amp;lt;div&amp;quot;);&#xD;行 141:  &#xD;行 142:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 388, 19, true);&#xD;行 143:  &#xD;行 144:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 145:  &#xD;行 146:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-body-title clearfix\&amp;quot;&amp;quot;);&#xD;行 147:  &#xD;行 148:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 407, 37, true);&#xD;行 149:  &#xD;行 150:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 151:  &#xD;行 152:  WriteLiteral(&amp;quot;&amp;gt;\r\n                &amp;lt;h5&amp;gt;&amp;quot;);&#xD;行 153:  &#xD;行 154:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 444, 23, true);&#xD;行 155:  &#xD;行 156:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 157:  &#xD;行 158:              &#xD;行 159:              #line 15 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 160:                 Write(ViewBag.Title);&#xD;行 161:  &#xD;行 162:              &#xD;行 163:              #line default&#xD;行 164:              #line hidden&#xD;行 165:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 468, 13, false);&#xD;行 166:  &#xD;行 167:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 168:  &#xD;行 169:  WriteLiteral(&amp;quot;&amp;lt;/h5&amp;gt;\r\n                &amp;lt;ul&amp;quot;);&#xD;行 170:  &#xD;行 171:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 481, 26, true);&#xD;行 172:  &#xD;行 173:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 174:  &#xD;行 175:  WriteLiteral(&amp;quot; class=\&amp;quot;form-step clearfix\&amp;quot;&amp;quot;);&#xD;行 176:  &#xD;行 177:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 507, 27, true);&#xD;行 178:  &#xD;行 179:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 180:  &#xD;行 181:  WriteLiteral(&amp;quot;&amp;gt;\r\n                    &amp;lt;li  &amp;quot;);&#xD;行 182:  &#xD;行 183:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 534, 28, true);&#xD;行 184:  &#xD;行 185:              &#xD;行 186:              #line 17 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 187:                            if (!ViewBag.UserEmailActived)&#xD;行 188:                           {&#xD;行 189:              &#xD;行 190:              #line default&#xD;行 191:              #line hidden&#xD;行 192:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 193:  &#xD;行 194:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 195:  &#xD;行 196:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 621, 1, true);&#xD;行 197:  &#xD;行 198:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 199:  &#xD;行 200:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 201:  &#xD;行 202:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 628, 11, true);&#xD;行 203:  &#xD;行 204:              &#xD;行 205:              #line 18 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 206:                                                     }&#xD;行 207:              &#xD;行 208:              #line default&#xD;行 209:              #line hidden&#xD;行 210:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 211:  &#xD;行 212:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第一步：邮箱绑定&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li   &amp;quot;);&#xD;行 213:  &#xD;行 214:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 647, 63, true);&#xD;行 215:  &#xD;行 216:              &#xD;行 217:              #line 19 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 218:                             if (ViewBag.UserEmailActived)&#xD;行 219:                            {&#xD;行 220:              &#xD;行 221:              #line default&#xD;行 222:              #line hidden&#xD;行 223:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 224:  &#xD;行 225:  WriteLiteral(&amp;quot; &amp;quot;);&#xD;行 226:  &#xD;行 227:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 769, 1, true);&#xD;行 228:  &#xD;行 229:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 230:  &#xD;行 231:  WriteLiteral(&amp;quot;class=\&amp;quot;cur\&amp;quot;&amp;quot;);&#xD;行 232:  &#xD;行 233:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 776, 11, true);&#xD;行 234:  &#xD;行 235:              &#xD;行 236:              #line 20 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 237:                                                      }&#xD;行 238:              &#xD;行 239:              #line default&#xD;行 240:              #line hidden&#xD;行 241:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 242:  &#xD;行 243:  WriteLiteral(&amp;quot;)&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第二步：填写企业信息&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第三步：提&amp;quot; +&#xD;行 244:  &amp;quot;交后台审核&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;\r\n                    &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第四步：审核通过认证成功&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&amp;quot; +&#xD;行 245:  &amp;quot;\r\n                &amp;lt;/ul&amp;gt;\r\n            &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 246:  &#xD;行 247:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 795, 206, true);&#xD;行 248:  &#xD;行 249:              &#xD;行 250:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 251:              &#xD;行 252:              &#xD;行 253:              #line default&#xD;行 254:              #line hidden&#xD;行 255:              &#xD;行 256:              #line 25 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 257:               if (ViewBag.UserEmailActived)&#xD;行 258:              {&#xD;行 259:            &#xD;行 260:                  &#xD;行 261:              &#xD;行 262:              #line default&#xD;行 263:              #line hidden&#xD;行 264:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 265:  &#xD;行 266:              &#xD;行 267:              #line 28 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 268:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 269:                  CoreHelper.Cookie.CookieHelper.NickName + &amp;quot;,请填写真实企业资料,我们将在1小时候内审核您发的信息。通过企业认证您发布的信息的权重更高。&amp;quot;, false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 270:  &#xD;行 271:              &#xD;行 272:              #line default&#xD;行 273:              #line hidden&#xD;行 274:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1089, 185, false);&#xD;行 275:  &#xD;行 276:              &#xD;行 277:              #line 29 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 278:                                                                                                                                                               &#xD;行 279:  &#xD;行 280:                  if (ViewBag.Error != null)&#xD;行 281:                  { &#xD;行 282:                  &#xD;行 283:              &#xD;行 284:              #line default&#xD;行 285:              #line hidden&#xD;行 286:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 287:  &#xD;行 288:              &#xD;行 289:              #line 33 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 290:             Write(ViewHelpers.Alert(&amp;quot;错误信息：&amp;quot;,&#xD;行 291:                  ViewBag.Error, false, CoreHelper.Enum.AlertType.error.ToString()));&#xD;行 292:  &#xD;行 293:              &#xD;行 294:              #line default&#xD;行 295:              #line hidden&#xD;行 296:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1359, 109, false);&#xD;行 297:  &#xD;行 298:              &#xD;行 299:              #line 34 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 300:                                                                                   &#xD;行 301:                  }&#xD;行 302:  &#xD;行 303:              &#xD;行 304:              #line default&#xD;行 305:              #line hidden&#xD;行 306:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 307:  &#xD;行 308:  WriteLiteral(&amp;quot;                &amp;lt;div&amp;quot;);&#xD;行 309:  &#xD;行 310:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1489, 20, true);&#xD;行 311:  &#xD;行 312:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 313:  &#xD;行 314:  WriteLiteral(&amp;quot; class=\&amp;quot;personal-form mt20\&amp;quot;&amp;quot;);&#xD;行 315:  &#xD;行 316:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1509, 27, true);&#xD;行 317:  &#xD;行 318:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 319:  &#xD;行 320:  WriteLiteral(&amp;quot;&amp;gt;\r\n&amp;quot;);&#xD;行 321:  &#xD;行 322:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1536, 3, true);&#xD;行 323:  &#xD;行 324:              &#xD;行 325:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 326:                      &#xD;行 327:              &#xD;行 328:              #line default&#xD;行 329:              #line hidden&#xD;行 330:              &#xD;行 331:              #line 37 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 332:                       using (Html.BeginForm())&#xD;行 333:                      {&#xD;行 334:                          &#xD;行 335:              &#xD;行 336:              #line default&#xD;行 337:              #line hidden&#xD;行 338:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 339:  &#xD;行 340:              &#xD;行 341:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 342:                     Write(Html.AntiForgeryToken());&#xD;行 343:  &#xD;行 344:              &#xD;行 345:              #line default&#xD;行 346:              #line hidden&#xD;行 347:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1634, 23, false);&#xD;行 348:  &#xD;行 349:              &#xD;行 350:              #line 39 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 351:                                                  &#xD;行 352:                          &#xD;行 353:              &#xD;行 354:              #line default&#xD;行 355:              #line hidden&#xD;行 356:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 357:  &#xD;行 358:              &#xD;行 359:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 360:                     Write(Html.EditorForModel());&#xD;行 361:  &#xD;行 362:              &#xD;行 363:              #line default&#xD;行 364:              #line hidden&#xD;行 365:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1684, 21, false);&#xD;行 366:  &#xD;行 367:              &#xD;行 368:              #line 40 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 369:                                                &#xD;行 370:  &#xD;行 371:              &#xD;行 372:              #line default&#xD;行 373:              #line hidden&#xD;行 374:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 375:  &#xD;行 376:  WriteLiteral(&amp;quot;                        &amp;lt;div&amp;quot;);&#xD;行 377:  &#xD;行 378:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1707, 28, true);&#xD;行 379:  &#xD;行 380:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 381:  &#xD;行 382:  WriteLiteral(&amp;quot; class=\&amp;quot;form-field form-field-submit c_gray\&amp;quot;&amp;quot;);&#xD;行 383:  &#xD;行 384:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1735, 44, true);&#xD;行 385:  &#xD;行 386:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 387:  &#xD;行 388:  WriteLiteral(&amp;quot;&amp;gt;\r\n                            &amp;lt;button&amp;quot;);&#xD;行 389:  &#xD;行 390:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1779, 38, true);&#xD;行 391:  &#xD;行 392:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 393:  &#xD;行 394:  WriteLiteral(&amp;quot; type=\&amp;quot;submit\&amp;quot;&amp;quot;);&#xD;行 395:  &#xD;行 396:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1817, 14, true);&#xD;行 397:  &#xD;行 398:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 399:  &#xD;行 400:  WriteLiteral(&amp;quot; class=\&amp;quot;btn btn-warning \&amp;quot;&amp;quot;);&#xD;行 401:  &#xD;行 402:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1831, 25, true);&#xD;行 403:  &#xD;行 404:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 405:  &#xD;行 406:  WriteLiteral(&amp;quot;&amp;gt;\r\n                                &amp;amp;nbsp;&amp;amp;nbsp;保&amp;amp;nbsp;&amp;amp;nbsp;存&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;/button&amp;quot; +&#xD;行 407:  &amp;quot;&amp;gt;\r\n                        &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 408:  &#xD;行 409:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1856, 116, true);&#xD;行 410:  &#xD;行 411:              &#xD;行 412:              #line 45 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 413:                      }&#xD;行 414:  &#xD;行 415:              &#xD;行 416:              #line default&#xD;行 417:              #line hidden&#xD;行 418:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 419:  &#xD;行 420:  WriteLiteral(&amp;quot;                &amp;lt;/div&amp;gt;\r\n&amp;quot;);&#xD;行 421:  &#xD;行 422:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 1995, 24, true);&#xD;行 423:  &#xD;行 424:              &#xD;行 425:              #line 47 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 426:                    &#xD;行 427:              }&#xD;行 428:              else&#xD;行 429:              {&#xD;行 430:                  &#xD;行 431:              &#xD;行 432:              #line default&#xD;行 433:              #line hidden&#xD;行 434:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 435:  &#xD;行 436:              &#xD;行 437:              #line 51 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 438:             Write(ViewHelpers.Alert(&amp;quot;友情提醒：&amp;quot;,&#xD;行 439:                  Html.Raw(item =&amp;gt; new System.Web.WebPages.HelperResult(__razor_template_writer =&amp;gt; {&#xD;行 440:  &#xD;行 441:              &#xD;行 442:              #line default&#xD;行 443:              #line hidden&#xD;行 444:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 445:  &#xD;行 446:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n&amp;quot;);&#xD;行 447:  &#xD;行 448:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2164, 2, true);&#xD;行 449:  &#xD;行 450:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 451:  &#xD;行 452:  WriteTo(__razor_template_writer, &#xD;行 453:              &#xD;行 454:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 455:                  &#xD;行 456:              &#xD;行 457:              #line default&#xD;行 458:              #line hidden&#xD;行 459:              &#xD;行 460:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 461:                   CoreHelper.Cookie.CookieHelper.NickName);&#xD;行 462:  &#xD;行 463:              &#xD;行 464:              #line default&#xD;行 465:              #line hidden&#xD;行 466:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2166, 16, false);&#xD;行 467:  &#xD;行 468:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 469:  &#xD;行 470:  WriteLiteralTo(__razor_template_writer, &amp;quot; + \&amp;quot;,请先进行邮箱绑.\&amp;quot; + &amp;quot;);&#xD;行 471:  &#xD;行 472:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2222, 17, true);&#xD;行 473:  &#xD;行 474:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 475:  &#xD;行 476:              &#xD;行 477:              #line 53 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 478:                                           WriteTo(__razor_template_writer, Html.ActionLink(&amp;quot;马上进行邮箱绑定&amp;quot;, &amp;quot;BindEmail&amp;quot;, &amp;quot;Personal&amp;quot;));&#xD;行 479:  &#xD;行 480:              &#xD;行 481:              #line default&#xD;行 482:              #line hidden&#xD;行 483:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2240, 52, false);&#xD;行 484:  &#xD;行 485:  BeginContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 486:  &#xD;行 487:  WriteLiteralTo(__razor_template_writer, &amp;quot;\r\n                &amp;quot;);&#xD;行 488:  &#xD;行 489:  EndContext(__razor_template_writer, &amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2292, 18, true);&#xD;行 490:  &#xD;行 491:              &#xD;行 492:              #line 54 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 493:                       })).ToString()&#xD;行 494:                 , false, CoreHelper.Enum.AlertType.info.ToString()));&#xD;行 495:  &#xD;行 496:              &#xD;行 497:              #line default&#xD;行 498:              #line hidden&#xD;行 499:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2104, 53, false);&#xD;行 500:  &#xD;行 501:              &#xD;行 502:              #line 55 &amp;quot;F:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml&amp;quot;&#xD;行 503:                                                                    &#xD;行 504:  &#xD;行 505:              }&#xD;行 506:  &#xD;行 507:              &#xD;行 508:              #line default&#xD;行 509:              #line hidden&#xD;行 510:  BeginContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2416, 42, true);&#xD;行 511:  &#xD;行 512:  WriteLiteral(&amp;quot;        &amp;lt;/div&amp;gt;\r\n\r\n    &amp;lt;/div&amp;gt;\r\n&amp;lt;/article&amp;gt;\r\n&amp;quot;);&#xD;行 513:  &#xD;行 514:  EndContext(&amp;quot;~/Views/Company/Index.cshtml&amp;quot;, 2416, 42, true);&#xD;行 515:  &#xD;行 516:          }&#xD;行 517:      }&#xD;行 518:  }&#xD;行 519:  &lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &#xD;&#xA;&#xD;&#xA;&lt;/div&gt;&#xD;&#xA;&#xD;&#xA;    &lt;script type=&quot;text/javascript&quot;&gt;&#xD;&#xA;    function OnToggleTOCLevel1(level2ID)&#xD;&#xA;    {&#xD;&#xA;      var elemLevel2 = document.getElementById(level2ID);&#xD;&#xA;      if (elemLevel2.style.display == ''none'')&#xD;&#xA;      {&#xD;&#xA;        elemLevel2.style.display = '''';&#xD;&#xA;      }&#xD;&#xA;      else {&#xD;&#xA;        elemLevel2.style.display = ''none'';&#xD;&#xA;      }&#xD;&#xA;    }&#xD;&#xA;    &lt;/script&gt;&#xD;&#xA;                          &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Personal&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Personal&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Company" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Company" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4216" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Company" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Company" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Personal" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="2n4pdsa2wr2g1hibmgc1ifze" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'cf3f0c15-c04d-4e23-8602-8d42e02e529f', N'', N'NAVY-PC', N'System.TypeInitializationException', N'Lucene.Net.China', N'“Lucene.Net.China.WordTree”的类型初始值设定项引发异常。', N'', 0, CAST(0x0000A1800082A079 AS DateTime), 1, N'<error
  host="NAVY-PC"
  type="System.TypeInitializationException"
  message="“Lucene.Net.China.WordTree”的类型初始值设定项引发异常。"
  source="Lucene.Net.China"
  detail="System.AggregateException: 发生一个或多个错误。 ---&gt; System.TypeInitializationException: “Lucene.Net.China.WordTree”的类型初始值设定项引发异常。 ---&gt; System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 Lucene.Net.China.WordTree..cctor()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 Lucene.Net.China.WordTree..ctor()&#xD;&#xA;   在 Lucene.Net.China.ChineseTokenizer.IncrementToken()&#xD;&#xA;   在 Lucene.Net.Analysis.Standard.StandardFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\Standard\StandardFilter.cs:行号 53&#xD;&#xA;   在 Lucene.Net.Analysis.StopFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\StopFilter.cs:行号 132&#xD;&#xA;   在 Lucene.Net.Index.DocInverterPerField.ProcessFields(IFieldable[] fields, Int32 count) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocInverterPerField.cs:行号 149&#xD;&#xA;   在 Lucene.Net.Index.DocFieldProcessorPerThread.ProcessDocument() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocFieldProcessorPerThread.cs:行号 275&#xD;&#xA;   在 Lucene.Net.Index.DocumentsWriter.UpdateDocument(Document doc, Analyzer analyzer, Term delTerm) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocumentsWriter.cs:行号 1031&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc, Analyzer analyzer) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2331&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2303&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoor(OutDoorIndexEntity OutDoor) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 205&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoors(List`1 OutDoors, Boolean creatingIndex) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 139&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.UpdateIndex() 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 75&#xD;&#xA;   在 System.Threading.Tasks.Task.InnerInvoke()&#xD;&#xA;   在 System.Threading.Tasks.Task.Execute()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)&#xD;&#xA;   在 System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)&#xD;&#xA;   在 WebBackgrounder.JobHost.DoWork(Task work)&#xD;&#xA;   在 WebBackgrounder.JobManager.DoNextJob()&#xD;&#xA;   在 WebBackgrounder.JobManager.OnTimerElapsed(Object sender)&#xD;&#xA;---&gt; (内部异常 #0) System.TypeInitializationException: “Lucene.Net.China.WordTree”的类型初始值设定项引发异常。 ---&gt; System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 Lucene.Net.China.WordTree..cctor()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 Lucene.Net.China.WordTree..ctor()&#xD;&#xA;   在 Lucene.Net.China.ChineseTokenizer.IncrementToken()&#xD;&#xA;   在 Lucene.Net.Analysis.Standard.StandardFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\Standard\StandardFilter.cs:行号 53&#xD;&#xA;   在 Lucene.Net.Analysis.StopFilter.IncrementToken() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Analysis\StopFilter.cs:行号 132&#xD;&#xA;   在 Lucene.Net.Index.DocInverterPerField.ProcessFields(IFieldable[] fields, Int32 count) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocInverterPerField.cs:行号 149&#xD;&#xA;   在 Lucene.Net.Index.DocFieldProcessorPerThread.ProcessDocument() 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocFieldProcessorPerThread.cs:行号 275&#xD;&#xA;   在 Lucene.Net.Index.DocumentsWriter.UpdateDocument(Document doc, Analyzer analyzer, Term delTerm) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\DocumentsWriter.cs:行号 1031&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc, Analyzer analyzer) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2331&#xD;&#xA;   在 Lucene.Net.Index.IndexWriter.AddDocument(Document doc) 位置 d:\Lucene.Net\FullRepo\trunk\src\core\Index\IndexWriter.cs:行号 2303&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoor(OutDoorIndexEntity OutDoor) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 205&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.AddOutDoors(List`1 OutDoors, Boolean creatingIndex) 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 139&#xD;&#xA;   在 CodeFirstEF.Lucene.LuceneIndexingService.UpdateIndex() 位置 d:\GitProject\adzhi\CodeFirstEF\Lucene\LuceneIndexingService.cs:行号 75&#xD;&#xA;   在 System.Threading.Tasks.Task.InnerInvoke()&#xD;&#xA;   在 System.Threading.Tasks.Task.Execute()&lt;---&#xD;&#xA;"
  time="2013-03-13T07:55:35.8701171Z" />')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'7f727d25-c32c-4148-93f3-9cd3b3689fb9', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'CodeFirstEF', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A18300F58FFF AS DateTime), 13, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="CodeFirstEF"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 CodeFirstEF.Filters.PermissionAttribute.AuthorizeCore(HttpContextBase httpContext) 位置 f:\GitProject\adzhi\CodeFirstEF\Filters\PermissionAttributes.cs:行号 62&#xD;&#xA;   在 System.Web.Mvc.AuthorizeAttribute.OnAuthorization(AuthorizationContext filterContext)&#xD;&#xA;   在 Kendo.Mvc.Infrastructure.Implementation.ControllerAuthorization.IsAccessibleToUser(RequestContext requestContext, String controllerName, String actionName, RouteValueDictionary routeValues)&#xD;&#xA;   在 Kendo.Mvc.Infrastructure.Implementation.NavigationItemAuthorization.IsAccessibleToUser(RequestContext requestContext, INavigatable navigationItem)&#xD;&#xA;   在 Kendo.Mvc.UI.NavigatableExtensions.&lt;IsAccessible&gt;c__AnonStorey74`1.&lt;&gt;m__220(T item)&#xD;&#xA;   在 System.Linq.Enumerable.Any[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   在 Kendo.Mvc.UI.NavigatableExtensions.IsAccessible[T](IEnumerable`1 items, INavigationItemAuthorization authorization, ViewContext viewContext)&#xD;&#xA;   在 Kendo.Mvc.UI.NavigationItemContainerExtensions.WriteItem[TComponent,TItem](TItem item, TComponent component, IHtmlNode parentTag, INavigationComponentHtmlBuilder`1 builder)&#xD;&#xA;   在 Kendo.Mvc.UI.PanelBar.&lt;WriteHtml&gt;c__AnonStorey75.&lt;&gt;m__221(PanelBarItem item)&#xD;&#xA;   在 Kendo.Mvc.Extensions.EnumerableExtensions.Each[T](IEnumerable`1 instance, Action`1 action)&#xD;&#xA;   在 Kendo.Mvc.UI.PanelBar.WriteHtml(HtmlTextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.WidgetBase.ToHtmlString()&#xD;&#xA;   在 Kendo.Mvc.UI.Fluent.WidgetBuilderBase`2.ToHtmlString()&#xD;&#xA;   在 System.Web.HttpUtility.HtmlEncode(Object value)&#xD;&#xA;   在 System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, Object content)&#xD;&#xA;   在 ASP._Page_Views_Shared__LayoutKendo_cshtml.&lt;RendLeftMenu&gt;b__0(TextWriter __razor_helper_writer) 位置 f:\GitProject\adzhi\CodeFirstEF\Views\Shared\_LayoutKendo.cshtml:行号 73&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 System.Web.WebPages.WebPageExecutingBase.WriteTo(TextWriter writer, HelperResult content)&#xD;&#xA;   在 ASP._Page_Views_Shared__LayoutKendo_cshtml.&lt;Execute&gt;b__12(TextWriter __razor_template_writer) 位置 f:\GitProject\adzhi\CodeFirstEF\Views\Shared\_LayoutKendo.cshtml:行号 43&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlTemplate`1.&lt;&gt;c__AnonStorey48.&lt;&gt;m__178(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlElement.WriteTo(TextWriter output)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlElement.&lt;WriteTo&gt;c__AnonStorey3E.&lt;&gt;m__15D(IHtmlNode child)&#xD;&#xA;   在 Kendo.Mvc.Extensions.EnumerableExtensions.Each[T](IEnumerable`1 instance, Action`1 action)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlElement.WriteTo(TextWriter output)&#xD;&#xA;   在 Kendo.Mvc.UI.Splitter.WriteHtml(HtmlTextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.WidgetBase.ToHtmlString()&#xD;&#xA;   在 Kendo.Mvc.UI.Fluent.WidgetBuilderBase`2.ToHtmlString()&#xD;&#xA;   在 System.Web.HttpUtility.HtmlEncode(Object value)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(Object value)&#xD;&#xA;   在 ASP._Page_Views_Shared__LayoutKendo_cshtml.Execute() 位置 f:\GitProject\adzhi\CodeFirstEF\Views\Shared\_LayoutKendo.cshtml:行号 35&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.&lt;&gt;c__DisplayClass7.&lt;RenderPageCore&gt;b__6(TextWriter writer)&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T14:54:03.9439326Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/dashboard" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\dashboard" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="4180" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/dashboard" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/dashboard" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'78cdc32d-38ce-443e-8c6b-9f795a78ca58', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.InvalidOperationException', N'System.Web.Extensions', N'序列化类型为“System.Data.Entity.DynamicProxies.Area_0506DA193E944A6075D8A3158B1D560BB3BEF585504864B58AF7A1D4E867A81C”的对象时检测到循环引用。', N'', 0, CAST(0x0000A18300E304A4 AS DateTime), 9, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.InvalidOperationException"
  message="序列化类型为“System.Data.Entity.DynamicProxies.Area_0506DA193E944A6075D8A3158B1D560BB3BEF585504864B58AF7A1D4E867A81C”的对象时检测到循环引用。"
  source="System.Web.Extensions"
  detail="System.InvalidOperationException: 序列化类型为“System.Data.Entity.DynamicProxies.Area_0506DA193E944A6075D8A3158B1D560BB3BEF585504864B58AF7A1D4E867A81C”的对象时检测到循环引用。&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeCustomObject(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeEnumerable(IEnumerable enumerable, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeCustomObject(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeEnumerable(IEnumerable enumerable, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeCustomObject(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.Serialize(Object obj, StringBuilder output, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.Serialize(Object obj, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Mvc.JsonResult.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T13:46:32.8662242Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:20&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Areas&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 20&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Areas&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="20" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Areas/Editing_Read" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Areas\Editing_Read" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="3738" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Areas/Editing_Read" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Areas/Editing_Read" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="20" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Areas" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="sort">
      <value
        string="" />
    </item>
    <item
      name="group">
      <value
        string="" />
    </item>
    <item
      name="filter">
      <value
        string="" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'1adcd669-3017-42ed-86b5-a897e7653739', N'/LM/W3SVC/3/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'App_Web_qcrw13x3', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A18200761EA3 AS DateTime), 4, N'<error
  application="/LM/W3SVC/3/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="App_Web_qcrw13x3"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_ForeignKeyForCheckBox_cshtml.&lt;&gt;c__DisplayClass2.&lt;Execute&gt;b__1(TextWriter __razor_template_writer) 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\ForeignKeyForCheckBox.cshtml:行号 12&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlTemplate`1.&lt;&gt;c__AnonStorey48.&lt;&gt;m__178(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlElement.WriteTo(TextWriter output)&#xD;&#xA;   在 Kendo.Mvc.UI.Window.WriteHtml(HtmlTextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.WidgetBase.ToHtmlString()&#xD;&#xA;   在 Kendo.Mvc.UI.Fluent.WidgetBuilderBase`2.ToHtmlString()&#xD;&#xA;   在 System.Web.HttpUtility.HtmlEncode(Object value)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(Object value)&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_ForeignKeyForCheckBox_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\ForeignKeyForCheckBox.cshtml:行号 10&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.ExecuteTemplate(HtmlHelper html, ViewDataDictionary viewData, String templateName, DataBoundControlMode mode, GetViewNamesDelegate getViewNames, GetDefaultActionsDelegate getDefaultActions)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.Template(HtmlHelper html, String expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.Template(HtmlHelper html, String expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.EditorExtensions.Editor(HtmlHelper html, String expression)&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_Object_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\Object.cshtml:行号 43&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.ExecuteTemplate(HtmlHelper html, ViewDataDictionary viewData, String templateName, DataBoundControlMode mode, GetViewNamesDelegate getViewNames, GetDefaultActionsDelegate getDefaultActions)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.EditorExtensions.EditorFor[TModel,TValue](HtmlHelper`1 html, Expression`1 expression)&#xD;&#xA;   在 ASP._Page_Views_Group_Edit_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Group\Edit.cshtml:行号 15&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.StartPage.RunPage()&#xD;&#xA;   在 System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-15T07:10:03.6367187Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Group&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;Cookie: __RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Group&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Group/Edit/1" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\Group\Edit\1" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="48604" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Group/Edit/1" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Group/Edit/1" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Group" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="nzddbadbwq3321jrrylpf534" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'0cd68331-d1e1-4353-97f8-a9dfd54e94ea', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.InvalidOperationException', N'System.Web.Extensions', N'序列化类型为“System.Data.Entity.DynamicProxies.Area_0506DA193E944A6075D8A3158B1D560BB3BEF585504864B58AF7A1D4E867A81C”的对象时检测到循环引用。', N'', 0, CAST(0x0000A18300E2F81F AS DateTime), 8, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.InvalidOperationException"
  message="序列化类型为“System.Data.Entity.DynamicProxies.Area_0506DA193E944A6075D8A3158B1D560BB3BEF585504864B58AF7A1D4E867A81C”的对象时检测到循环引用。"
  source="System.Web.Extensions"
  detail="System.InvalidOperationException: 序列化类型为“System.Data.Entity.DynamicProxies.Area_0506DA193E944A6075D8A3158B1D560BB3BEF585504864B58AF7A1D4E867A81C”的对象时检测到循环引用。&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeCustomObject(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeEnumerable(IEnumerable enumerable, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeCustomObject(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeEnumerable(IEnumerable enumerable, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeCustomObject(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValueInternal(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.SerializeValue(Object o, StringBuilder sb, Int32 depth, Hashtable objectsInUse, SerializationFormat serializationFormat, MemberInfo currentMember)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.Serialize(Object obj, StringBuilder output, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Script.Serialization.JavaScriptSerializer.Serialize(Object obj, SerializationFormat serializationFormat)&#xD;&#xA;   在 System.Web.Mvc.JsonResult.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T13:46:22.1826132Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:20&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Areas&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 20&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Areas&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="20" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Areas/Editing_Read" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Areas\Editing_Read" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="3738" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Areas/Editing_Read" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Areas/Editing_Read" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="20" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Areas" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="sort">
      <value
        string="" />
    </item>
    <item
      name="group">
      <value
        string="" />
    </item>
    <item
      name="filter">
      <value
        string="" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'004e12e5-2da2-4c91-a00e-b543bced9711', N'/LM/W3SVC/3/ROOT', N'NAVY-PC', N'System.Web.HttpException', N'System.Web.WebPages', N'尚未对布局页“~/Views/Shared/_LayoutKendo.cshtml”调用“RenderBody”方法。', N'', 500, CAST(0x0000A18200615F13 AS DateTime), 3, N'<error
  application="/LM/W3SVC/3/ROOT"
  host="NAVY-PC"
  type="System.Web.HttpException"
  message="尚未对布局页“~/Views/Shared/_LayoutKendo.cshtml”调用“RenderBody”方法。"
  source="System.Web.WebPages"
  detail="System.Web.HttpException (0x80004005): 尚未对布局页“~/Views/Shared/_LayoutKendo.cshtml”调用“RenderBody”方法。&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.VerifyRenderedBodyOrSections()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.&lt;&gt;c__DisplayClass7.&lt;RenderPageCore&gt;b__6(TextWriter writer)&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.PopContext()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-15T05:54:31.1025390Z"
  statusCode="500">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;Cookie: __RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/dashboard" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\dashboard" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="2999" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/dashboard" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/dashboard" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="nzddbadbwq3321jrrylpf534" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'9dc8e268-76f5-46ea-9df3-bfce47c0c792', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'CodeFirstEF', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A183010271DB AS DateTime), 14, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="CodeFirstEF"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 CodeFirstEF.Controllers.MemberController.Edit(Int32 id) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\MemberController.cs:行号 132&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-16T15:40:58.1158940Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Member&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Member&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Member/Edit/2" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Member\Edit\2" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="5525" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Member/Edit/2" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Member/Edit/2" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1; ASP.NET_SessionId=5rqfnna0tigg5xvhycsfz1cl; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Member" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="geXKsfsGTd3VvzteM6MzWvG3uI36deO-SFIRdBS0xJlbdYPQ4hwJ5_0adbYGw_BZBvvrHz4ZPUcp_xMfUUYOr4_ySmq3_DFe_jhCBxL46LQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="5rqfnna0tigg5xvhycsfz1cl" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'27550fe5-907d-46ad-adb4-d53251ccd190', N'/LM/W3SVC/3/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'App_Web_4jbte15n', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A1820077F462 AS DateTime), 6, N'<error
  application="/LM/W3SVC/3/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="App_Web_4jbte15n"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_ForeignKeyForCheckBox_cshtml.&lt;&gt;c__DisplayClass2.&lt;Execute&gt;b__1(TextWriter __razor_template_writer) 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\ForeignKeyForCheckBox.cshtml:行号 12&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlTemplate`1.&lt;&gt;c__AnonStorey48.&lt;&gt;m__178(TextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.HtmlElement.WriteTo(TextWriter output)&#xD;&#xA;   在 Kendo.Mvc.UI.Window.WriteHtml(HtmlTextWriter writer)&#xD;&#xA;   在 Kendo.Mvc.UI.WidgetBase.ToHtmlString()&#xD;&#xA;   在 Kendo.Mvc.UI.Fluent.WidgetBuilderBase`2.ToHtmlString()&#xD;&#xA;   在 System.Web.HttpUtility.HtmlEncode(Object value)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(Object value)&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_ForeignKeyForCheckBox_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\ForeignKeyForCheckBox.cshtml:行号 10&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.ExecuteTemplate(HtmlHelper html, ViewDataDictionary viewData, String templateName, DataBoundControlMode mode, GetViewNamesDelegate getViewNames, GetDefaultActionsDelegate getDefaultActions)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.Template(HtmlHelper html, String expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.Template(HtmlHelper html, String expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.EditorExtensions.Editor(HtmlHelper html, String expression)&#xD;&#xA;   在 ASP._Page_Views_Shared_EditorTemplates_Object_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Shared\EditorTemplates\Object.cshtml:行号 43&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.ExecuteTemplate(HtmlHelper html, ViewDataDictionary viewData, String templateName, DataBoundControlMode mode, GetViewNamesDelegate getViewNames, GetDefaultActionsDelegate getDefaultActions)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)&#xD;&#xA;   在 System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)&#xD;&#xA;   在 System.Web.Mvc.Html.EditorExtensions.EditorFor[TModel,TValue](HtmlHelper`1 html, Expression`1 expression)&#xD;&#xA;   在 ASP._Page_Views_Group_Create_cshtml.Execute() 位置 d:\GitProject\adzhi\CodeFirstEF\Views\Group\Create.cshtml:行号 14&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.StartPage.RunPage()&#xD;&#xA;   在 System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-15T07:16:44.4873046Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Group&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;Cookie: __RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Group&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Group/Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\Group\Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="48628" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Group/Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Group/Create" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Group" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="nzddbadbwq3321jrrylpf534" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'5bf9b1b0-2f0c-4896-bf42-d91affb00377', N'/LM/W3SVC/3/ROOT', N'NAVY-PC', N'System.Data.SqlClient.SqlException', N'.Net SqlClient Data Provider', N'INSERT 语句与 FOREIGN KEY 约束"FK_dbo.Permissions_dbo.Department_DepartmentID"冲突。该冲突发生于数据库"CodeFirstBase"，表"dbo.Department", column ''DepartmentID''。
语句已终止。', N'', 0, CAST(0x0000A182009EB3AA AS DateTime), 7, N'<error
  application="/LM/W3SVC/3/ROOT"
  host="NAVY-PC"
  type="System.Data.SqlClient.SqlException"
  message="INSERT 语句与 FOREIGN KEY 约束&quot;FK_dbo.Permissions_dbo.Department_DepartmentID&quot;冲突。该冲突发生于数据库&quot;CodeFirstBase&quot;，表&quot;dbo.Department&quot;, column ''DepartmentID''。&#xD;&#xA;语句已终止。"
  source=".Net SqlClient Data Provider"
  detail="System.Data.Entity.Infrastructure.DbUpdateException: 更新条目时出错。有关详细信息，请参见内部异常。 ---&gt; System.Data.UpdateException: 更新条目时出错。有关详细信息，请参见内部异常。 ---&gt; System.Data.SqlClient.SqlException: INSERT 语句与 FOREIGN KEY 约束&quot;FK_dbo.Permissions_dbo.Department_DepartmentID&quot;冲突。该冲突发生于数据库&quot;CodeFirstBase&quot;，表&quot;dbo.Department&quot;, column ''DepartmentID''。&#xD;&#xA;语句已终止。&#xD;&#xA;   在 System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)&#xD;&#xA;   在 System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)&#xD;&#xA;   在 System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)&#xD;&#xA;   在 System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean&amp; dataReady)&#xD;&#xA;   在 System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()&#xD;&#xA;   在 System.Data.SqlClient.SqlDataReader.get_MetaData()&#xD;&#xA;   在 System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)&#xD;&#xA;   在 System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task&amp; task, Boolean asyncWrite)&#xD;&#xA;   在 System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task&amp; task, Boolean asyncWrite)&#xD;&#xA;   在 System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)&#xD;&#xA;   在 System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)&#xD;&#xA;   在 System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)&#xD;&#xA;   在 System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteDbDataReader(CommandBehavior behavior) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 169&#xD;&#xA;   在 System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)&#xD;&#xA;   在 System.Data.Mapping.Update.Internal.DynamicUpdateCommand.Execute(UpdateTranslator translator, EntityConnection connection, Dictionary`2 identifierValues, List`1 generatedValues)&#xD;&#xA;   在 System.Data.Mapping.Update.Internal.UpdateTranslator.Update(IEntityStateManager stateManager, IEntityAdapter adapter)&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 System.Data.Mapping.Update.Internal.UpdateTranslator.Update(IEntityStateManager stateManager, IEntityAdapter adapter)&#xD;&#xA;   在 System.Data.EntityClient.EntityAdapter.Update(IEntityStateManager entityCache)&#xD;&#xA;   在 System.Data.Objects.ObjectContext.SaveChanges(SaveOptions options)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   --- 内部异常堆栈跟踪的结尾 ---&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.SaveChanges()&#xD;&#xA;   在 System.Data.Entity.Internal.LazyInternalContext.SaveChanges()&#xD;&#xA;   在 System.Data.Entity.DbContext.SaveChanges()&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.CoreHelper.Data.Interface.IUnitOfWork.Commit() 位置 d:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 28&#xD;&#xA;   在 CodeFirstEF.Serivces.PermissionService.Create(Permissions model) 位置 d:\GitProject\adzhi\CodeFirstEF\Serivces\PermissionService.cs:行号 39&#xD;&#xA;   在 CodeFirstEF.Controllers.PermissionController.Editing_Create(DataSourceRequest request, IEnumerable`1 permissions) 位置 d:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\PermissionController.cs:行号 60&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-15T09:37:48.9414062Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:318&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;HTTP_COOKIE:__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Permission&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 318&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4&#xD;&#xA;Cookie: __RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Permission&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/3/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="318" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="3" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/3" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Permission/Editing_Create" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="D:\GitProject\adzhi\CodeFirstEF\Permission\Editing_Create" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="49376" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Permission/Editing_Create" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Permission/Editing_Create" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="318" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__RequestVerificationToken=85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1; ASP.NET_SessionId=nzddbadbwq3321jrrylpf534; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Permission" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="sort">
      <value
        string="" />
    </item>
    <item
      name="group">
      <value
        string="" />
    </item>
    <item
      name="filter">
      <value
        string="" />
    </item>
    <item
      name="models[0].ID">
      <value
        string="0" />
    </item>
    <item
      name="models[0].Name">
      <value
        string="用户群组管理" />
    </item>
    <item
      name="models[0].Description">
      <value
        string="用户群组管理" />
    </item>
    <item
      name="models[0].Controller">
      <value
        string="group" />
    </item>
    <item
      name="models[0].Action">
      <value
        string="controller" />
    </item>
    <item
      name="models[0].Namespace">
      <value
        string="default" />
    </item>
    <item
      name="models[0].DepartmentID">
      <value
        string="0" />
    </item>
  </form>
  <cookies>
    <item
      name="__RequestVerificationToken">
      <value
        string="85n7fWmPvAAcQoY4pd-CMpT3iTWRcu0M3oLsdLsu3wrzRpiXAEO5vC3m0sYCHn26u0_hOavc4axgE2mKZS_RPpGJ-b5QsHWywQqFs43Q1Fc1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="nzddbadbwq3321jrrylpf534" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/13/6e2850c1-6d4f-485b-bc01-7384906347e8_small.jpg&amp;GroupID=1&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'c743cf87-cecb-4db5-90d7-dfed82bd2e22', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.Web.HttpParseException', N'System.Web.WebPages.Razor', N'"@" 字符必须后跟 ":"、"(" 或 C# 标识符。如果您打算切换为标记，请使用 HTML 起始标记，例如:

@if(isLoggedIn) {
    <p>Hello, @user!</p>
}
', N'', 500, CAST(0x0000A18400AD7D6B AS DateTime), 15, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.Web.HttpParseException"
  message="&quot;@&quot; 字符必须后跟 &quot;:&quot;、&quot;(&quot; 或 C# 标识符。如果您打算切换为标记，请使用 HTML 起始标记，例如:&#xD;&#xA;&#xD;&#xA;@if(isLoggedIn) {&#xD;&#xA;    &lt;p&gt;Hello, @user!&lt;/p&gt;&#xD;&#xA;}&#xD;&#xA;"
  source="System.Web.WebPages.Razor"
  detail="System.Web.HttpParseException (0x80004005): &quot;@&quot; 字符必须后跟 &quot;:&quot;、&quot;(&quot; 或 C# 标识符。如果您打算切换为标记，请使用 HTML 起始标记，例如:&#xD;&#xA;&#xD;&#xA;@if(isLoggedIn) {&#xD;&#xA;    &lt;p&gt;Hello, @user!&lt;/p&gt;&#xD;&#xA;}&#xD;&#xA;&#xD;&#xA;   在 System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()&#xD;&#xA;   在 System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()&#xD;&#xA;   在 System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)&#xD;&#xA;   在 System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()&#xD;&#xA;   在 System.Web.Compilation.BuildProvidersCompiler.PerformBuild()&#xD;&#xA;   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)&#xD;&#xA;   在 System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.&lt;&gt;c__DisplayClass4.&lt;GetPathFromGeneralName&gt;b__0(String path)&#xD;&#xA;   在 System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.&lt;&gt;c__DisplayClassb.&lt;GetDisplayInfoForVirtualPath&gt;b__8(IDisplayMode mode)&#xD;&#xA;   在 System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()&#xD;&#xA;   在 System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)&#xD;&#xA;   在 System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]&amp; searchedLocations)&#xD;&#xA;   在 System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.&lt;&gt;c__DisplayClass4.&lt;FindView&gt;b__3() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.Find(ControllerContext controllerContext, String name, Func`1 finder, Boolean isPartial) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 66&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 101&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.&lt;&gt;c__DisplayClassc.&lt;FindView&gt;b__b(IViewEngine e)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)&#xD;&#xA;   在 System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)&#xD;&#xA;   在 System.Web.Mvc.ViewResult.FindView(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-17T10:31:39.4511236Z"
  statusCode="500"
  webHostHtmlMessage="&lt;!DOCTYPE html&gt;&#xD;&#xA;&lt;html&gt;&#xD;&#xA;    &lt;head&gt;&#xD;&#xA;        &lt;title&gt;分析器错误&lt;/title&gt;&#xD;&#xA;        &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width&quot; /&gt;&#xD;&#xA;        &lt;style&gt;&#xD;&#xA;         body {font-family:&quot;Verdana&quot;;font-weight:normal;font-size: .7em;color:black;} &#xD;&#xA;         p {font-family:&quot;Verdana&quot;;font-weight:normal;color:black;margin-top: -5px}&#xD;&#xA;         b {font-family:&quot;Verdana&quot;;font-weight:bold;color:black;margin-top: -5px}&#xD;&#xA;         H1 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:18pt;color:red }&#xD;&#xA;         H2 { font-family:&quot;Verdana&quot;;font-weight:normal;font-size:14pt;color:maroon }&#xD;&#xA;         pre {font-family:&quot;Consolas&quot;,&quot;Lucida Console&quot;,Monospace;font-size:11pt;margin:0;padding:0.5em;line-height:14pt}&#xD;&#xA;         .marker {font-weight: bold; color: black;text-decoration: none;}&#xD;&#xA;         .version {color: gray;}&#xD;&#xA;         .error {margin-bottom: 10px;}&#xD;&#xA;         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }&#xD;&#xA;         @media screen and (max-width: 639px) {&#xD;&#xA;          pre { width: 440px; overflow: auto; white-space: pre-wrap; word-wrap: break-word; }&#xD;&#xA;         }&#xD;&#xA;         @media screen and (max-width: 479px) {&#xD;&#xA;          pre { width: 280px; }&#xD;&#xA;         }&#xD;&#xA;        &lt;/style&gt;&#xD;&#xA;    &lt;/head&gt;&#xD;&#xA;&#xD;&#xA;    &lt;body bgcolor=&quot;white&quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;span&gt;&lt;H1&gt;“/”应用程序中的服务器错误。&lt;hr width=100% size=1 color=silver&gt;&lt;/H1&gt;&#xD;&#xA;&#xD;&#xA;            &lt;h2&gt; &lt;i&gt;分析器错误&lt;/i&gt; &lt;/h2&gt;&lt;/span&gt;&#xD;&#xA;&#xD;&#xA;            &lt;font face=&quot;Arial, Helvetica, Geneva, SunSans-Regular, sans-serif &quot;&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 说明: &lt;/b&gt;在分析向此请求提供服务所需资源时出错。请检查下列特定分析错误详细信息并适当地修改源文件。&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 分析器错误消息: &lt;/b&gt;&amp;quot;@&amp;quot; 字符必须后跟 &amp;quot;:&amp;quot;、&amp;quot;(&amp;quot; 或 C# 标识符。如果您打算切换为标记，请使用 HTML 起始标记，例如:&lt;br&gt;&lt;br&gt;@if(isLoggedIn) {&lt;br&gt; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;lt;p&amp;gt;Hello, @user!&amp;lt;/p&amp;gt;&lt;br&gt;}&lt;br&gt;&lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt;源错误:&lt;/b&gt; &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;table width=100% bgcolor=&quot;#ffffcc&quot;&gt;&#xD;&#xA;               &lt;tr&gt;&#xD;&#xA;                  &lt;td&gt;&#xD;&#xA;                      &lt;code&gt;&lt;pre&gt;&#xD;&#xA;&#xD;&#xA;行 18:                          { @&amp;lt;text&amp;gt;class=&amp;quot;cur&amp;quot;&amp;lt;/text&amp;gt;})&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第一步：邮箱绑定&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&#xD;&#xA;行 19:                     &amp;lt;li   @if (ViewBag.UserEmailActived)&#xD;&#xA;&lt;font color=red&gt;行 20:                           { @&amp;lt;text&amp;gt;class=&amp;quot;cur&amp;quot;&amp;lt;/text&amp;gt;})&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第二步：填写企业信息&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&#xD;&#xA;&lt;/font&gt;行 21:                     &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第三步：提交后台审核&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&#xD;&#xA;行 22:                     &amp;lt;li&amp;gt;&amp;lt;i&amp;gt;&amp;lt;/i&amp;gt;&amp;lt;span&amp;gt;第四步：审核通过认证成功&amp;lt;/span&amp;gt;&amp;lt;/li&amp;gt;&lt;/pre&gt;&lt;/code&gt;&#xD;&#xA;&#xD;&#xA;                  &lt;/td&gt;&#xD;&#xA;               &lt;/tr&gt;&#xD;&#xA;            &lt;/table&gt;&#xD;&#xA;&#xD;&#xA;            &lt;br&gt;&#xD;&#xA;&#xD;&#xA;            &lt;b&gt; 源文件: &lt;/b&gt; /Views/Company/Index.cshtml&lt;b&gt; &amp;nbsp;&amp;nbsp; 行: &lt;/b&gt; 20&#xD;&#xA;            &lt;br&gt;&lt;br&gt;&#xD;&#xA;&#xD;&#xA;    &lt;/body&gt;&#xD;&#xA;&lt;/html&gt;&#xD;&#xA;">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206; __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/Personal/OutDoor&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206; __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/Personal/OutDoor&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Company" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Company" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="3624" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Company" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Company" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206; __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/Personal/OutDoor" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'654dc37f-e86c-4b25-a521-f3638cc8b651', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.ArgumentException', N'System.Data', N'不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。', N'', 0, CAST(0x0000A18500FBAA50 AS DateTime), 27, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.ArgumentException"
  message="不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。"
  source="System.Data"
  detail="System.ArgumentException: 不存在从对象类型 System.Linq.Enumerable+WhereSelectArrayIterator`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] 到已知的托管提供程序本机类型的映射。&#xD;&#xA;   在 System.Data.SqlClient.MetaType.GetMetaTypeFromValue(Type dataType, Object value, Boolean inferLen, Boolean streamAllowed)&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.GetMetaTypeOnly()&#xD;&#xA;   在 System.Data.SqlClient.SqlParameter.get_DbType()&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetFormattedParameterValue(DbParameter dbParameter) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 258&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming.GetCommandParameters(DbCommand command) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 218&#xD;&#xA;   在 StackExchange.Profiling.SqlTiming..ctor(DbCommand command, ExecuteType type, MiniProfiler profiler) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlTiming.cs:行号 125&#xD;&#xA;   在 StackExchange.Profiling.SqlProfiler.ExecuteStartImpl(DbCommand command, ExecuteType type) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\SqlProfiler.cs:行号 38&#xD;&#xA;   在 StackExchange.Profiling.MiniProfiler.StackExchange.Profiling.Data.IDbProfiler.ExecuteStart(DbCommand profiledDbCommand, ExecuteType executeType) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MiniProfiler.IDbProfiler.cs:行号 115&#xD;&#xA;   在 StackExchange.Profiling.Data.ProfiledDbCommand.ExecuteNonQuery() 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\Data\ProfiledDbCommand.cs:行号 187&#xD;&#xA;   在 System.Data.Objects.ObjectContext.ExecuteStoreCommand(String commandText, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Internal.InternalContext.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 System.Data.Entity.Database.ExecuteSqlCommand(String sql, Object[] parameters)&#xD;&#xA;   在 CoreHelper.Data.Infrastructure.BaseEfUnitOfWork.ExecuteSqlCommand(String sql, Object[] parameters) 位置 f:\GitProject\adzhi\CoreHelper\Data\Infrastructure\BaseEfUnitOfWork.cs:行号 55&#xD;&#xA;   在 CodeFirstEF.Serivces.CompanyService.VerifyCompany(IEnumerable`1 CompangIds, CompanyStatus CompanyStatus) 位置 f:\GitProject\adzhi\CodeFirstEF\Serivces\CompanyService.cs:行号 133&#xD;&#xA;   在 CodeFirstEF.Controllers.CompanyVerifyController.VerifyPass(String ids) 位置 f:\GitProject\adzhi\CodeFirstEF\Controllers\Admin\CompanyVerifyController.cs:行号 68&#xD;&#xA;   在 lambda_method(Closure , ControllerBase , Object[] )&#xD;&#xA;   在 System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)&#xD;&#xA;   在 System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass42.&lt;BeginInvokeSynchronousActionMethod&gt;b__41()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass8`1.&lt;BeginSynchronous&gt;b__7(IAsyncResult _)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;&gt;c__DisplayClass39.&lt;BeginInvokeActionMethodWithFilters&gt;b__33()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass4f.&lt;InvokeActionMethodFilterAsynchronously&gt;b__49()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass37.&lt;BeginInvokeActionMethodWithFilters&gt;b__36(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-18T15:16:17.1195130Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_CONTENT_LENGTH:5&#xD;&#xA;HTTP_CONTENT_TYPE:application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;HTTP_ACCEPT:*/*&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_REFERER:http://www.dotaeye.com/companyverify&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;HTTP_ORIGIN:http://www.dotaeye.com&#xD;&#xA;HTTP_X_REQUESTED_WITH:XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Connection: keep-alive&#xD;&#xA;Content-Length: 5&#xD;&#xA;Content-Type: application/x-www-form-urlencoded; charset=UTF-8&#xD;&#xA;Accept: */*&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;Referer: http://www.dotaeye.com/companyverify&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;Origin: http://www.dotaeye.com&#xD;&#xA;X-Requested-With: XMLHttpRequest&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\CompanyVerify\VerifyPass" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="59586" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="POST" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/CompanyVerify/VerifyPass" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_CONTENT_LENGTH">
      <value
        string="5" />
    </item>
    <item
      name="HTTP_CONTENT_TYPE">
      <value
        string="application/x-www-form-urlencoded; charset=UTF-8" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="*/*" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1; ASP.NET_SessionId=xv2wq45hobzvrtxy033bgddc; dotaeyeUser=UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_REFERER">
      <value
        string="http://www.dotaeye.com/companyverify" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
    <item
      name="HTTP_ORIGIN">
      <value
        string="http://www.dotaeye.com" />
    </item>
    <item
      name="HTTP_X_REQUESTED_WITH">
      <value
        string="XMLHttpRequest" />
    </item>
  </serverVariables>
  <form>
    <item
      name="ids">
      <value
        string="1" />
    </item>
  </form>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="Snfke2uwbgM9z0xWGLClUeKbttEio1SpuZKTNiLJicts7i_feeWEldKF0mVmx_csBrAqvWyD12vc6twe9_y4QYwZEaN7UR9D-baSPHJ4VHQ1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="xv2wq45hobzvrtxy033bgddc" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=1&amp;NickName=%u591c%u5e55%u6d41%u6d6a&amp;Email=shenhaijunmail%40163.com&amp;AvtarUrl=/Upload/Normal/2013/3/15/19e8c4ea-df9f-4e7b-93f5-e4a553dc44af_small.jpg&amp;GroupID=4&amp;Status=2&amp;PWD=fdecb080da7864af95561a47a2e206" />
    </item>
  </cookies>
</error>')
INSERT [dbo].[ELMAH_Error] ([ErrorId], [Application], [Host], [Type], [Source], [Message], [User], [StatusCode], [TimeUtc], [Sequence], [AllXml]) VALUES (N'bcc1d850-449e-4169-802e-fa0be98ed750', N'/LM/W3SVC/5/ROOT', N'NAVY-PC', N'System.NullReferenceException', N'App_Code.2mqmvas9', N'未将对象引用设置到对象的实例。', N'', 0, CAST(0x0000A18400AE15CD AS DateTime), 16, N'<error
  application="/LM/W3SVC/5/ROOT"
  host="NAVY-PC"
  type="System.NullReferenceException"
  message="未将对象引用设置到对象的实例。"
  source="App_Code.2mqmvas9"
  detail="System.NullReferenceException: 未将对象引用设置到对象的实例。&#xD;&#xA;   在 ASP.ViewHelpers.&lt;&gt;c__DisplayClass2.&lt;Alert&gt;b__0(TextWriter __razor_helper_writer) 位置 f:\GitProject\adzhi\CodeFirstEF\App_Code\ViewHelpers.cshtml:行号 18&#xD;&#xA;   在 System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.Write(HelperResult result)&#xD;&#xA;   在 ASP._Page_Views_Company_Index_cshtml.Execute() 位置 f:\GitProject\adzhi\CodeFirstEF\Views\Company\Index.cshtml:行号 51&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.Mvc.WebViewPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.StartPage.RunPage()&#xD;&#xA;   在 System.Web.WebPages.StartPage.ExecutePageHierarchy()&#xD;&#xA;   在 System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)&#xD;&#xA;   在 System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)&#xD;&#xA;   在 System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)&#xD;&#xA;   在 StackExchange.Profiling.MVCHelpers.ProfilingViewEngine.WrappedView.Render(ViewContext viewContext, TextWriter writer) 位置 C:\Users\sam\Desktop\MiniProfiler\StackExchange.Profiling\MVCHelpers\ProfilingViewEngine.cs:行号 34&#xD;&#xA;   在 System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;InvokeActionResultWithFilters&gt;b__17()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.&lt;&gt;c__DisplayClass1a.&lt;&gt;c__DisplayClass1c.&lt;InvokeActionResultWithFilters&gt;b__19()&#xD;&#xA;   在 System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;&gt;c__DisplayClass2a.&lt;BeginInvokeAction&gt;b__20()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.&lt;&gt;c__DisplayClass25.&lt;BeginInvokeAction&gt;b__22(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.&lt;&gt;c__DisplayClass1d.&lt;BeginExecuteCore&gt;b__18(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.&lt;&gt;c__DisplayClass8.&lt;BeginProcessRequest&gt;b__3(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.&lt;&gt;c__DisplayClass4.&lt;MakeVoidDelegate&gt;b__3(IAsyncResult ar)&#xD;&#xA;   在 System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)&#xD;&#xA;   在 System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)&#xD;&#xA;   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()&#xD;&#xA;   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)"
  time="2013-03-17T10:33:49.4825609Z">
  <serverVariables>
    <item
      name="ALL_HTTP">
      <value
        string="HTTP_CACHE_CONTROL:max-age=0&#xD;&#xA;HTTP_CONNECTION:keep-alive&#xD;&#xA;HTTP_ACCEPT:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;HTTP_ACCEPT_CHARSET:GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;HTTP_ACCEPT_ENCODING:gzip,deflate,sdch&#xD;&#xA;HTTP_ACCEPT_LANGUAGE:zh-CN,zh;q=0.8&#xD;&#xA;HTTP_COOKIE:__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;HTTP_HOST:www.dotaeye.com&#xD;&#xA;HTTP_USER_AGENT:Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="ALL_RAW">
      <value
        string="Cache-Control: max-age=0&#xD;&#xA;Connection: keep-alive&#xD;&#xA;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8&#xD;&#xA;Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3&#xD;&#xA;Accept-Encoding: gzip,deflate,sdch&#xD;&#xA;Accept-Language: zh-CN,zh;q=0.8&#xD;&#xA;Cookie: __utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4&#xD;&#xA;Host: www.dotaeye.com&#xD;&#xA;User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17&#xD;&#xA;" />
    </item>
    <item
      name="APPL_MD_PATH">
      <value
        string="/LM/W3SVC/5/ROOT" />
    </item>
    <item
      name="APPL_PHYSICAL_PATH">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\" />
    </item>
    <item
      name="AUTH_TYPE">
      <value
        string="" />
    </item>
    <item
      name="AUTH_USER">
      <value
        string="" />
    </item>
    <item
      name="AUTH_PASSWORD">
      <value
        string="*****" />
    </item>
    <item
      name="LOGON_USER">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_USER">
      <value
        string="" />
    </item>
    <item
      name="CERT_COOKIE">
      <value
        string="" />
    </item>
    <item
      name="CERT_FLAGS">
      <value
        string="" />
    </item>
    <item
      name="CERT_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERIALNUMBER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="CERT_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CERT_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="CONTENT_LENGTH">
      <value
        string="0" />
    </item>
    <item
      name="CONTENT_TYPE">
      <value
        string="" />
    </item>
    <item
      name="GATEWAY_INTERFACE">
      <value
        string="CGI/1.1" />
    </item>
    <item
      name="HTTPS">
      <value
        string="off" />
    </item>
    <item
      name="HTTPS_KEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SECRETKEYSIZE">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_ISSUER">
      <value
        string="" />
    </item>
    <item
      name="HTTPS_SERVER_SUBJECT">
      <value
        string="" />
    </item>
    <item
      name="INSTANCE_ID">
      <value
        string="5" />
    </item>
    <item
      name="INSTANCE_META_PATH">
      <value
        string="/LM/W3SVC/5" />
    </item>
    <item
      name="LOCAL_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="PATH_INFO">
      <value
        string="/Company" />
    </item>
    <item
      name="PATH_TRANSLATED">
      <value
        string="F:\GitProject\adzhi\CodeFirstEF\Company" />
    </item>
    <item
      name="QUERY_STRING">
      <value
        string="" />
    </item>
    <item
      name="REMOTE_ADDR">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_HOST">
      <value
        string="127.0.0.1" />
    </item>
    <item
      name="REMOTE_PORT">
      <value
        string="3624" />
    </item>
    <item
      name="REQUEST_METHOD">
      <value
        string="GET" />
    </item>
    <item
      name="SCRIPT_NAME">
      <value
        string="/Company" />
    </item>
    <item
      name="SERVER_NAME">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="SERVER_PORT">
      <value
        string="80" />
    </item>
    <item
      name="SERVER_PORT_SECURE">
      <value
        string="0" />
    </item>
    <item
      name="SERVER_PROTOCOL">
      <value
        string="HTTP/1.1" />
    </item>
    <item
      name="SERVER_SOFTWARE">
      <value
        string="Microsoft-IIS/7.5" />
    </item>
    <item
      name="URL">
      <value
        string="/Company" />
    </item>
    <item
      name="HTTP_CACHE_CONTROL">
      <value
        string="max-age=0" />
    </item>
    <item
      name="HTTP_CONNECTION">
      <value
        string="keep-alive" />
    </item>
    <item
      name="HTTP_ACCEPT">
      <value
        string="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" />
    </item>
    <item
      name="HTTP_ACCEPT_CHARSET">
      <value
        string="GBK,utf-8;q=0.7,*;q=0.3" />
    </item>
    <item
      name="HTTP_ACCEPT_ENCODING">
      <value
        string="gzip,deflate,sdch" />
    </item>
    <item
      name="HTTP_ACCEPT_LANGUAGE">
      <value
        string="zh-CN,zh;q=0.8" />
    </item>
    <item
      name="HTTP_COOKIE">
      <value
        string="__utma=87782541.1772491962.1363010975.1363010975.1363010975.1; __utmz=87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __RequestVerificationToken=ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1; ASP.NET_SessionId=2n4pdsa2wr2g1hibmgc1ifze; dotaeyeUser=UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
    <item
      name="HTTP_HOST">
      <value
        string="www.dotaeye.com" />
    </item>
    <item
      name="HTTP_USER_AGENT">
      <value
        string="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17" />
    </item>
  </serverVariables>
  <cookies>
    <item
      name="__utma">
      <value
        string="87782541.1772491962.1363010975.1363010975.1363010975.1" />
    </item>
    <item
      name="__utmz">
      <value
        string="87782541.1363010975.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)" />
    </item>
    <item
      name="__RequestVerificationToken">
      <value
        string="ocU72ZtOoRBFn5kvp8ycALVb94Kride0e-jd2x06mU2B0dASq0XfBE16g8RguZk2NdZSloHG-RopFMXsSK7Nxm3s5oL1j5AF6IVSATayn2k1" />
    </item>
    <item
      name="ASP.NET_SessionId">
      <value
        string="2n4pdsa2wr2g1hibmgc1ifze" />
    </item>
    <item
      name="dotaeyeUser">
      <value
        string="UID=2&amp;NickName=%u9e4f%u98de&amp;Email=56404908%40qq.com&amp;AvtarUrl=&amp;GroupID=1&amp;Status=1&amp;PWD=ec9a2060191e0e247b1cdecb2c19b4" />
    </item>
  </cookies>
</error>')
SET IDENTITY_INSERT [dbo].[ELMAH_Error] OFF
/****** Object:  Table [dbo].[Department]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Leader] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description], [Leader]) VALUES (2, N'销售部', N'负责软件的销售', N'郭富城')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description], [Leader]) VALUES (3, N'开发部', N'负责程序的开发和部署', N'刘德华')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description], [Leader]) VALUES (4, N'编辑部', N'负责日常新闻的采集，和发布', N'黎明')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description], [Leader]) VALUES (5, N'人力资源部', N'负责公司人员招聘录用', N'张祖贤')
INSERT [dbo].[Department] ([DepartmentID], [Name], [Description], [Leader]) VALUES (6, N'测试部', N'负责各种测试任务', N'张学友')
SET IDENTITY_INSERT [dbo].[Department] OFF
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 03/18/2013 23:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NVARCHAR(MAX),
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 03/18/2013 23:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 03/18/2013 23:34:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO
GO
/****** Object:  Table [dbo].[OutDoor]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutDoor](
	[MediaID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PriceExten] [nvarchar](100) NULL,
	[Location] [nvarchar](100) NOT NULL,
	[Lng] [decimal](18, 2) NOT NULL,
	[Lat] [decimal](18, 2) NOT NULL,
	[HasLight] [bit] NOT NULL,
	[LightStrat] [nvarchar](50) NULL,
	[LightEnd] [nvarchar](50) NULL,
	[Wdith] [decimal](18, 2) NOT NULL,
	[Height] [decimal](18, 2) NOT NULL,
	[TotalFaces] [int] NOT NULL,
	[TrafficAuto] [int] NOT NULL,
	[TrafficPerson] [int] NOT NULL,
	[CityCode] [nvarchar](20) NOT NULL,
	[FormatCode] [nvarchar](20) NOT NULL,
	[MeidaCode] [nvarchar](20) NOT NULL,
	[PeriodCode] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2500) NOT NULL,
	[Integrity] [int] NOT NULL,
	[Hit] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[LastTime] [datetime] NOT NULL,
	[Favorite] [int] NOT NULL,
	[Message] [int] NOT NULL,
	[AddIP] [nvarchar](50) NULL,
	[AdminUser] [int] NOT NULL,
	[LastIP] [nvarchar](50) NULL,
	[Unapprovedlog] [nvarchar](500) NULL,
	[SeoTitle] [nvarchar](100) NULL,
	[SeoDes] [nvarchar](250) NULL,
	[Seokeywords] [nvarchar](100) NULL,
	[MemberID] [int] NOT NULL,
	[OwnerCode] [nvarchar](20) NOT NULL,
	[Deadline] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OutDoor] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OutDoor] ON
INSERT [dbo].[OutDoor] ([MediaID], [Price], [PriceExten], [Location], [Lng], [Lat], [HasLight], [LightStrat], [LightEnd], [Wdith], [Height], [TotalFaces], [TrafficAuto], [TrafficPerson], [CityCode], [FormatCode], [MeidaCode], [PeriodCode], [Name], [Description], [Integrity], [Hit], [AddTime], [LastTime], [Favorite], [Message], [AddIP], [AdminUser], [LastIP], [Unapprovedlog], [SeoTitle], [SeoDes], [Seokeywords], [MemberID], [OwnerCode], [Deadline], [Status]) VALUES (1, CAST(20000.00 AS Decimal(18, 2)), N'上海市浦东新区灵岩南路333号超市', N'上海市浦东新区灵岩南路333号', CAST(31.15 AS Decimal(18, 2)), CAST(121.50 AS Decimal(18, 2)), 1, N'1140', N'390', CAST(5.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 3, 30000, 400000, N'002012', N'F03', N'D01008', N'P02', N'上海市浦东新区灵岩南路333号超市楼顶大牌', N'上海市浦东新区灵岩南路333号超市', 0, 0, CAST(0x0000A1800103B768 AS DateTime), CAST(0x0000A1800103B768 AS DateTime), 0, 0, N'127.0.0.1', 0, N'127.0.0.1', N'', N'上海市浦东新区灵岩南路333号超市楼顶大牌', N'上海市浦东新区灵岩南路333号超市', N'上海市浦东新区灵岩南路333号超市楼顶大牌', 1, N'O03', CAST(0x0000A17400000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[OutDoor] OFF
/****** Object:  Table [dbo].[Group_Roles]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Roles](
	[GroupID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Group_Roles] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (3, 2)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 2)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 3)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (3, 4)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 4)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (2, 5)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 5)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 6)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 7)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (1, 8)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 8)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 9)
INSERT [dbo].[Group_Roles] ([GroupID], [RoleID]) VALUES (4, 10)
/****** Object:  Table [dbo].[Permissions]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Namespace] [nvarchar](50) NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (2, N'权限管理', N'权限管理（添加、编辑、删除）', N'permission', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (3, N'权限添加', N'权限添加', N'permission', N'create', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (4, N'权限编辑', N'权限编辑', N'permission', N'edit', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (5, N'权限删除', N'权限删除', N'permission', N'delete', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (6, N'角色管理', N'角色管理CURD', N'roles', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (7, N'角色添加', N'角色添加', N'roles', N'create', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (8, N'角色删除', N'角色删除', N'roles', N'delete', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (9, N'角色编辑', N'角色编辑', N'roles', N'edit', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (11, N'用户群组编辑', N'用户群组编辑', N'group', N'edit', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (12, N'用户群组添加', N'用户群组添加', N'group', N'create', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (13, N'用户群组管理', N'用户群组管理', N'group', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (14, N'用户管理', N'用户管理', N'member', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (15, N'部门管理', N'部门管理', N'department', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (16, N'用户群组删除', N'用户群组删除', N'group', N'delete', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (17, N'后台权限', N'后台权限', N'dashboard', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (18, N'基本会员', N'基本会员', N'home', N'controller', N'default', 6)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (19, N'媒体表现形式', N'媒体表现形式', N'formatcate', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (20, N'公司规模管理', N'公司规模管理', N'companyscale', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (21, N'公司注册资金管理', N'公司注册资金管理', N'companyfund', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (22, N'公司业务类型管理', N'公司业务类型管理', N'companybussiness', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (23, N'户外类型管理', N'户外类型管理', N'outdoormediacate', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (24, N'地区列表管理', N'地区列表', N'areas', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (25, N'区域属性管理', N'区域属性管理', N'areaatt', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (26, N'媒体购买周期管理', N'媒体购买周期管理', N'periodcate', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (27, N'媒体所有权管理', N'媒体所有权管理', N'ownercate', N'controller', N'default', 3)
INSERT [dbo].[Permissions] ([ID], [Name], [Description], [Controller], [Action], [Namespace], [DepartmentID]) VALUES (28, N'企业信息审核', N'企业信息审核', N'companyverify', N'controller', N'default', 3)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
/****** Object:  Table [dbo].[TopBase]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopBase](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MediaID] [int] NOT NULL,
	[TopStart] [datetime] NOT NULL,
	[TopEnd] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.TopBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleBase]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleBase](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MediaID] [int] NOT NULL,
	[SaleStart] [datetime] NOT NULL,
	[SaleEnd] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.SaleBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Permissions]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Permissions](
	[RoleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Role_Permissions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (2, 2)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (2, 3)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (2, 4)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (2, 5)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (3, 6)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (3, 7)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (3, 8)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (3, 9)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (4, 11)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (4, 12)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (4, 13)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (7, 14)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (5, 15)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (4, 16)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (6, 17)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (8, 18)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 19)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 20)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 21)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 22)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 23)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 24)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 25)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 26)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (9, 27)
INSERT [dbo].[Role_Permissions] ([RoleID], [PermissionID]) VALUES (10, 28)
/****** Object:  Table [dbo].[OutDoor_AreaAtt]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutDoor_AreaAtt](
	[OutDoorID] [int] NOT NULL,
	[AreaAttID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OutDoor_AreaAtt] PRIMARY KEY CLUSTERED 
(
	[OutDoorID] ASC,
	[AreaAttID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OutDoor_AreaAtt] ([OutDoorID], [AreaAttID]) VALUES (1, 2)
INSERT [dbo].[OutDoor_AreaAtt] ([OutDoorID], [AreaAttID]) VALUES (1, 4)
INSERT [dbo].[OutDoor_AreaAtt] ([OutDoorID], [AreaAttID]) VALUES (1, 5)
INSERT [dbo].[OutDoor_AreaAtt] ([OutDoorID], [AreaAttID]) VALUES (1, 7)
INSERT [dbo].[OutDoor_AreaAtt] ([OutDoorID], [AreaAttID]) VALUES (1, 8)
/****** Object:  Table [dbo].[MediaImg]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaImg](
	[MediaID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ImgUrls] [nvarchar](2000) NOT NULL,
	[FocusImgUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.MediaImg] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MediaImg] ON
INSERT [dbo].[MediaImg] ([MediaID], [ID], [MemberID], [ImgUrls], [FocusImgUrl]) VALUES (1, 1, 1, N'/Upload/Normal/2013/3/13/af569643-e6be-4f83-bbf4-6f9819d3c607_800.jpg', N'/Upload/Normal/2013/3/13/af569643-e6be-4f83-bbf4-6f9819d3c607_800.jpg')
SET IDENTITY_INSERT [dbo].[MediaImg] OFF
/****** Object:  Table [dbo].[MapImg]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapImg](
	[MediaID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ImgUrls] [nvarchar](2000) NOT NULL,
	[FocusImgUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_dbo.MapImg] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CredentialsImg]    Script Date: 03/18/2013 23:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialsImg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[ImgUrls] [nvarchar](2000) NOT NULL,
	[FocusImgUrl] [nvarchar](200) NULL,
	[MediaID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CredentialsImg] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CredentialsImg] ON
INSERT [dbo].[CredentialsImg] ([ID], [MemberID], [ImgUrls], [FocusImgUrl], [MediaID]) VALUES (1, 1, N'/Upload/Normal/2013/3/13/89309dcc-4c12-4d1c-b707-33f3d871a7c0_800.jpg', N'/Upload/Normal/2013/3/13/89309dcc-4c12-4d1c-b707-33f3d871a7c0_800.jpg', 1)
SET IDENTITY_INSERT [dbo].[CredentialsImg] OFF
/****** Object:  Default [DF__Credentia__Media__5165187F]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[CredentialsImg] ADD  DEFAULT ((0)) FOR [MediaID]
GO
/****** Object:  Default [DF_ELMAH_Error_ErrorId]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
/****** Object:  Default [DF__Member__OpenType__4AB81AF0]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member] ADD  DEFAULT ((0)) FOR [OpenType]
GO
/****** Object:  Default [DF__Member_Prof__Lat__4BAC3F29]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member_Profile] ADD  DEFAULT ((0)) FOR [Lat]
GO
/****** Object:  Default [DF__Member_Prof__Lng__4CA06362]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member_Profile] ADD  DEFAULT ((0)) FOR [Lng]
GO
/****** Object:  Default [DF__OutDoor__MemberI__4D94879B]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor] ADD  DEFAULT ((0)) FOR [MemberID]
GO
/****** Object:  Default [DF__OutDoor__OwnerCo__4F7CD00D]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor] ADD  DEFAULT ('') FOR [OwnerCode]
GO
/****** Object:  Default [DF__OutDoor__Deadlin__5070F446]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [Deadline]
GO
/****** Object:  Default [DF__OutDoor__Status__10566F31]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor] ADD  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__WorkItem__Starte__403A8C7D]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[WorkItem] ADD  DEFAULT ('2013-03-18T20:19:11.354+08:00') FOR [Started]
GO
/****** Object:  Default [DF__WorkItem__Comple__412EB0B6]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[WorkItem] ADD  DEFAULT ('2013-03-18T20:19:11.354+08:00') FOR [Completed]
GO
/****** Object:  ForeignKey [FK_dbo.Category_dbo.Category_PCateCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Category_dbo.Category_PCateCode] FOREIGN KEY([PCateCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_dbo.Category_dbo.Category_PCateCode]
GO
/****** Object:  ForeignKey [FK_dbo.Company_dbo.Category_BussinessCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Company_dbo.Category_BussinessCode] FOREIGN KEY([BussinessCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_dbo.Company_dbo.Category_BussinessCode]
GO
/****** Object:  ForeignKey [FK_dbo.Company_dbo.Category_CityCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Company_dbo.Category_CityCode] FOREIGN KEY([CityCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_dbo.Company_dbo.Category_CityCode]
GO
/****** Object:  ForeignKey [FK_dbo.Company_dbo.Category_FundCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Company_dbo.Category_FundCode] FOREIGN KEY([FundCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_dbo.Company_dbo.Category_FundCode]
GO
/****** Object:  ForeignKey [FK_dbo.Company_dbo.Category_ScaleCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Company_dbo.Category_ScaleCode] FOREIGN KEY([ScaleCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_dbo.Company_dbo.Category_ScaleCode]
GO
/****** Object:  ForeignKey [FK_dbo.Company_dbo.Member_MemberID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Company_dbo.Member_MemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_dbo.Company_dbo.Member_MemberID]
GO
/****** Object:  ForeignKey [FK_dbo.CompanyImg_dbo.Company_CompanyID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[CompanyImg]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CompanyImg_dbo.Company_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([MemberID])
GO
ALTER TABLE [dbo].[CompanyImg] CHECK CONSTRAINT [FK_dbo.CompanyImg_dbo.Company_CompanyID]
GO
/****** Object:  ForeignKey [FK_dbo.CredentialsImg_dbo.OutDoor_MediaID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[CredentialsImg]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CredentialsImg_dbo.OutDoor_MediaID] FOREIGN KEY([MediaID])
REFERENCES [dbo].[OutDoor] ([MediaID])
GO
ALTER TABLE [dbo].[CredentialsImg] CHECK CONSTRAINT [FK_dbo.CredentialsImg_dbo.OutDoor_MediaID]
GO
/****** Object:  ForeignKey [FK_dbo.Group_Roles_dbo.Group_GroupID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Group_Roles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Group_Roles_dbo.Group_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Roles] CHECK CONSTRAINT [FK_dbo.Group_Roles_dbo.Group_GroupID]
GO
/****** Object:  ForeignKey [FK_dbo.Group_Roles_dbo.Roles_RoleID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Group_Roles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Group_Roles_dbo.Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Group_Roles] CHECK CONSTRAINT [FK_dbo.Group_Roles_dbo.Roles_RoleID]
GO
/****** Object:  ForeignKey [FK_dbo.LinkManImg_dbo.Company_CompanyID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[LinkManImg]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LinkManImg_dbo.Company_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([MemberID])
GO
ALTER TABLE [dbo].[LinkManImg] CHECK CONSTRAINT [FK_dbo.LinkManImg_dbo.Company_CompanyID]
GO
/****** Object:  ForeignKey [FK_dbo.MapImg_dbo.OutDoor_MediaID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[MapImg]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MapImg_dbo.OutDoor_MediaID] FOREIGN KEY([MediaID])
REFERENCES [dbo].[OutDoor] ([MediaID])
GO
ALTER TABLE [dbo].[MapImg] CHECK CONSTRAINT [FK_dbo.MapImg_dbo.OutDoor_MediaID]
GO
/****** Object:  ForeignKey [FK_dbo.MediaImg_dbo.OutDoor_MediaID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[MediaImg]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MediaImg_dbo.OutDoor_MediaID] FOREIGN KEY([MediaID])
REFERENCES [dbo].[OutDoor] ([MediaID])
GO
ALTER TABLE [dbo].[MediaImg] CHECK CONSTRAINT [FK_dbo.MediaImg_dbo.OutDoor_MediaID]
GO
/****** Object:  ForeignKey [FK_dbo.Member_dbo.Company_CompanyID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Member_dbo.Company_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([MemberID])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_dbo.Member_dbo.Company_CompanyID]
GO
/****** Object:  ForeignKey [FK_dbo.Member_dbo.Group_GroupID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Member_dbo.Group_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_dbo.Member_dbo.Group_GroupID]
GO
/****** Object:  ForeignKey [FK_dbo.Member_Action_dbo.Member_MemberID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member_Action]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Member_Action_dbo.Member_MemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member_Action] CHECK CONSTRAINT [FK_dbo.Member_Action_dbo.Member_MemberID]
GO
/****** Object:  ForeignKey [FK_dbo.Member_Profile_dbo.Category_CityCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member_Profile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Member_Profile_dbo.Category_CityCode] FOREIGN KEY([CityCode])
REFERENCES [dbo].[Category] ([CateCode])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member_Profile] CHECK CONSTRAINT [FK_dbo.Member_Profile_dbo.Category_CityCode]
GO
/****** Object:  ForeignKey [FK_dbo.Member_Profile_dbo.Member_MemberID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Member_Profile]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Member_Profile_dbo.Member_MemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Member_Profile] CHECK CONSTRAINT [FK_dbo.Member_Profile_dbo.Member_MemberID]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_dbo.Category_CityCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_dbo.Category_CityCode] FOREIGN KEY([CityCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[OutDoor] CHECK CONSTRAINT [FK_dbo.OutDoor_dbo.Category_CityCode]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_dbo.Category_FormatCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_dbo.Category_FormatCode] FOREIGN KEY([FormatCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[OutDoor] CHECK CONSTRAINT [FK_dbo.OutDoor_dbo.Category_FormatCode]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_dbo.Category_MeidaCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_dbo.Category_MeidaCode] FOREIGN KEY([MeidaCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[OutDoor] CHECK CONSTRAINT [FK_dbo.OutDoor_dbo.Category_MeidaCode]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_dbo.Category_OwnerCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_dbo.Category_OwnerCode] FOREIGN KEY([OwnerCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[OutDoor] CHECK CONSTRAINT [FK_dbo.OutDoor_dbo.Category_OwnerCode]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_dbo.Category_PeriodCode]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_dbo.Category_PeriodCode] FOREIGN KEY([PeriodCode])
REFERENCES [dbo].[Category] ([CateCode])
GO
ALTER TABLE [dbo].[OutDoor] CHECK CONSTRAINT [FK_dbo.OutDoor_dbo.Category_PeriodCode]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_AreaAtt_dbo.AreaAtt_AreaAttID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor_AreaAtt]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_AreaAtt_dbo.AreaAtt_AreaAttID] FOREIGN KEY([AreaAttID])
REFERENCES [dbo].[AreaAtt] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OutDoor_AreaAtt] CHECK CONSTRAINT [FK_dbo.OutDoor_AreaAtt_dbo.AreaAtt_AreaAttID]
GO
/****** Object:  ForeignKey [FK_dbo.OutDoor_AreaAtt_dbo.OutDoor_OutDoorID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[OutDoor_AreaAtt]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OutDoor_AreaAtt_dbo.OutDoor_OutDoorID] FOREIGN KEY([OutDoorID])
REFERENCES [dbo].[OutDoor] ([MediaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OutDoor_AreaAtt] CHECK CONSTRAINT [FK_dbo.OutDoor_AreaAtt_dbo.OutDoor_OutDoorID]
GO
/****** Object:  ForeignKey [FK_dbo.Permissions_dbo.Department_DepartmentID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Permissions_dbo.Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_dbo.Permissions_dbo.Department_DepartmentID]
GO
/****** Object:  ForeignKey [FK_dbo.Role_Permissions_dbo.Permissions_PermissionID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Role_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Role_Permissions_dbo.Permissions_PermissionID] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_Permissions] CHECK CONSTRAINT [FK_dbo.Role_Permissions_dbo.Permissions_PermissionID]
GO
/****** Object:  ForeignKey [FK_dbo.Role_Permissions_dbo.Roles_RoleID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[Role_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Role_Permissions_dbo.Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_Permissions] CHECK CONSTRAINT [FK_dbo.Role_Permissions_dbo.Roles_RoleID]
GO
/****** Object:  ForeignKey [FK_dbo.SaleBase_dbo.OutDoor_MediaID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[SaleBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SaleBase_dbo.OutDoor_MediaID] FOREIGN KEY([MediaID])
REFERENCES [dbo].[OutDoor] ([MediaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SaleBase] CHECK CONSTRAINT [FK_dbo.SaleBase_dbo.OutDoor_MediaID]
GO
/****** Object:  ForeignKey [FK_dbo.TopBase_dbo.OutDoor_MediaID]    Script Date: 03/18/2013 23:34:35 ******/
ALTER TABLE [dbo].[TopBase]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TopBase_dbo.OutDoor_MediaID] FOREIGN KEY([MediaID])
REFERENCES [dbo].[OutDoor] ([MediaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TopBase] CHECK CONSTRAINT [FK_dbo.TopBase_dbo.OutDoor_MediaID]
GO
