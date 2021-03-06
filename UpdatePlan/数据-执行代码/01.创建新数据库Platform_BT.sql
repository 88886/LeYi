USE [master]
GO
/****** Object:  Database [Platform_BT]    Script Date: 2015/3/31 11:52:56 ******/
CREATE DATABASE [Platform_BT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Homory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HOMORY\MSSQL\DATA\Platform_BT.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Homory.Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.HOMORY\MSSQL\DATA\Platform_BT.ldf' , SIZE = 26816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Platform_BT] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Platform_BT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Platform_BT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Platform_BT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Platform_BT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Platform_BT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Platform_BT] SET ARITHABORT OFF 
GO
ALTER DATABASE [Platform_BT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Platform_BT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Platform_BT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Platform_BT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Platform_BT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Platform_BT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Platform_BT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Platform_BT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Platform_BT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Platform_BT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Platform_BT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Platform_BT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Platform_BT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Platform_BT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Platform_BT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Platform_BT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Platform_BT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Platform_BT] SET RECOVERY FULL 
GO
ALTER DATABASE [Platform_BT] SET  MULTI_USER 
GO
ALTER DATABASE [Platform_BT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Platform_BT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Platform_BT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Platform_BT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Platform_BT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Platform_BT', N'ON'
GO
USE [Platform_BT]
GO
/****** Object:  User [Homory]    Script Date: 2015/3/31 11:52:56 ******/
CREATE USER [Homory] FOR LOGIN [Homory] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Homory]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Id1] [uniqueidentifier] NOT NULL,
	[Id2] [uniqueidentifier] NOT NULL,
	[Id3] [uniqueidentifier] NULL,
	[Id4] [uniqueidentifier] NULL,
	[Content1] [nvarchar](max) NULL,
	[Content2] [nvarchar](max) NULL,
	[Content3] [nvarchar](max) NULL,
	[Content4] [nvarchar](max) NULL,
	[Time] [datetime2](7) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Api]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Api](
	[Id] [uniqueidentifier] NOT NULL,
	[ProviderId] [nvarchar](256) NOT NULL,
	[ProviderKey] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Api] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApiLog]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiLog](
	[Id] [uniqueidentifier] NOT NULL,
	[ApiId] [uniqueidentifier] NOT NULL,
	[ProviderId] [nvarchar](256) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ApiLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Application]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Icon] [nvarchar](256) NULL,
	[Home] [nvarchar](256) NULL,
	[Quit] [nvarchar](256) NULL,
	[Type] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationPolicy]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationPolicy](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[State] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ApplicationPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRole](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserType] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationRole] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC,
	[UserType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssessTable]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessTable](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[GradeId] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AssessTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[TopId] [uniqueidentifier] NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[TopId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[Level] [int] NOT NULL,
	[Hidden] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[AutoId] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepartmentUser]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentUser](
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TopDepartmentId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentUser] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dictionary]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dictionary](
	[Key] [nvarchar](16) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Dictionary] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Serial] [nvarchar](16) NOT NULL,
	[Type] [int] NOT NULL,
	[Icon] [nvarchar](256) NOT NULL,
	[OpenType] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[Introduction] [nvarchar](max) NOT NULL,
	[GradeId] [uniqueidentifier] NULL,
	[CourseId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupUser](
	[GroupId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
 CONSTRAINT [PK_GroupUser] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Learned]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Learned](
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Learned] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [uniqueidentifier] NOT NULL,
	[Action] [int] NOT NULL,
	[ActionContent] [nvarchar](max) NOT NULL,
	[ObjectA] [uniqueidentifier] NOT NULL,
	[ObjectB] [uniqueidentifier] NOT NULL,
	[ObjectC] [uniqueidentifier] NOT NULL,
	[NotifiedA] [bit] NOT NULL,
	[NotifiedB] [bit] NOT NULL,
	[NotifiedC] [bit] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginLog]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[Account] [nvarchar](max) NOT NULL,
	[Browser] [nvarchar](max) NULL,
	[IP] [nvarchar](max) NULL,
	[MAC] [nvarchar](max) NULL,
	[Login] [bit] NOT NULL,
 CONSTRAINT [PK_LoginLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaNote]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaNote](
	[ResourceId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[A] [nvarchar](max) NOT NULL,
	[B] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MediaNote] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[UserId] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Redirect] [nvarchar](256) NOT NULL,
	[Icon] [nvarchar](256) NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[RightName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notice]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[State] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OperationStatistics]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationStatistics](
	[Id] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Create] [int] NOT NULL,
	[Retrieve] [int] NOT NULL,
	[Update] [int] NOT NULL,
	[Delete] [int] NOT NULL,
 CONSTRAINT [PK_OperationStatistics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrizeCredit]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrizeCredit](
	[PrizeRange] [int] NOT NULL,
	[PrizeLevel] [int] NOT NULL,
	[Credit] [int] NOT NULL,
 CONSTRAINT [PK_PrizeCredit] PRIMARY KEY CLUSTERED 
(
	[PrizeRange] ASC,
	[PrizeLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[OpenType] [int] NOT NULL,
	[FileType] [int] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Author] [nvarchar](64) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Converted] [bit] NOT NULL,
	[Thumbnail] [nvarchar](256) NULL,
	[SourceName] [nvarchar](256) NULL,
	[Source] [nvarchar](256) NULL,
	[Preview] [nvarchar](256) NULL,
	[Image] [nvarchar](256) NULL,
	[Prize] [bit] NOT NULL,
	[PrizeRange] [int] NULL,
	[PrizeLevel] [int] NULL,
	[Credit] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Favourite] [int] NOT NULL,
	[Comment] [int] NOT NULL,
	[Rate] [int] NOT NULL,
	[Grade] [decimal](18, 2) NOT NULL,
	[View] [int] NOT NULL,
	[Download] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceAssess]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceAssess](
	[ResourceId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[AssessTableId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ResourceAssess] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[UserId] ASC,
	[AssessTableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceAttachment]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceAttachment](
	[Id] [uniqueidentifier] NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[FileType] [int] NOT NULL,
	[Title] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](256) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_ResourceAttachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceCatalog]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceCatalog](
	[ResourceId] [uniqueidentifier] NOT NULL,
	[CatalogId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_ResourceCatalog] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC,
	[CatalogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceComment]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceComment](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Level] [int] NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Start] [decimal](18, 2) NULL,
	[End] [decimal](18, 2) NULL,
	[Timed] [bit] NULL,
	[Time] [datetime2](7) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_ResourceComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceCommentTemp]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceCommentTemp](
	[Id] [uniqueidentifier] NOT NULL,
	[RoomId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_ResourceCommentTemp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceRoom]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceRoom](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](256) NOT NULL,
	[Ordinal] [int] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_ResourceRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceStatisticsMonthly]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceStatisticsMonthly](
	[Id] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Favourite] [int] NOT NULL,
	[Comment] [int] NOT NULL,
	[Rate] [int] NOT NULL,
	[Grade] [decimal](18, 2) NOT NULL,
	[View] [int] NOT NULL,
	[Download] [int] NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StatisticsResourceMonthly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResourceTag]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceTag](
	[Tag] [nvarchar](16) NOT NULL,
	[ResourceId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_ResourceTag] PRIMARY KEY CLUSTERED 
(
	[Tag] ASC,
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Right]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Right](
	[Name] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Right] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleRight]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleRight](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RightName] [nvarchar](256) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_RoleRight] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[RightName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [uniqueidentifier] NOT NULL,
	[IDCard] [nvarchar](64) NOT NULL,
	[UniqueId] [nvarchar](64) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Birthplace] [nvarchar](16) NULL,
	[Address] [nvarchar](256) NULL,
	[Nationality] [nvarchar](16) NULL,
	[Charger] [nvarchar](16) NULL,
	[ChargerContact] [nvarchar](64) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Taught]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taught](
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Taught] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC,
	[CourseId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [uniqueidentifier] NOT NULL,
	[Phone] [nvarchar](16) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Birthplace] [nvarchar](16) NULL,
	[Address] [nvarchar](256) NULL,
	[Nationality] [nvarchar](16) NULL,
	[IDCard] [nvarchar](64) NULL,
	[AutoId] [int] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherStatisticsMonthly]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherStatisticsMonthly](
	[Id] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Article] [int] NOT NULL,
	[Courseware] [int] NOT NULL,
	[Paper] [int] NOT NULL,
	[Media] [int] NOT NULL,
	[View] [int] NOT NULL,
	[Download] [int] NOT NULL,
	[Credit] [int] NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TeacherStatisticsMonthly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Year] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Account] [nvarchar](64) NOT NULL,
	[RealName] [nvarchar](64) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[Icon] [nvarchar](256) NULL,
	[Stamp] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PasswordEx] [nvarchar](max) NULL,
	[CryptoKey] [nvarchar](max) NULL,
	[CryptoSalt] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCatalog]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCatalog](
	[UserId] [uniqueidentifier] NOT NULL,
	[CatalogId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_UserCatalog] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[CatalogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFavourite]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFavourite](
	[UserId] [uniqueidentifier] NOT NULL,
	[FavouriteUserId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_UserFavourite] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FavouriteUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOnline]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOnline](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserOnline] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewStudent]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStudent] AS
SELECT 
S.Id,
U.Account,
U.RealName,
U.DisplayName,
S.IDCard,
S.UniqueId,
S.Gender,
S.Birthday,
S.Birthplace,
S.Address,
S.Nationality,
S.Charger,
S.ChargerContact,
U.Ordinal,
DU.DepartmentId,
DU.TopDepartmentId,
DU.State,
D.Name DepartmentName,
D.DisplayName DeaprtmentDisplayName,
D.Level
FROM [Student] S INNER JOIN [User] U
ON S.Id = U.Id AND U.State < 2 LEFT JOIN [DepartmentUser] DU
ON S.Id = DU.UserId AND DU.Type = 1 AND DU.State < 5 LEFT JOIN [Department] D
ON DU.DepartmentId = D.Id AND D.State < 2


GO
/****** Object:  View [dbo].[ViewQueryStudent]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewQueryStudent] AS
SELECT VS.RealName AS 姓名, 
CASE VS.State WHEN 0 THEN '内置' WHEN 1 THEN '启用' WHEN 2 THEN '审核' WHEN 3 THEN '默认' WHEN 4 THEN '停用' ELSE '删除' END 状态,
VS.Account AS 账号,
D.Name 校区,
SUBSTRING (VS.Account, 3,4) 届,
VS.DepartmentName 班级,
VS.Ordinal 学号,
VS.UniqueId 学籍号,
VS.IDCard 身份证号,
CASE VS.Gender WHEN 'True' THEN '男' WHEN 'False' THEN '女' ELSE NULL END 性别,
VS.Birthplace 籍贯,
VS.Birthday 出生日期,
VS.Address 现居住地,
VS.Nationality 民族,
VS.Charger 联系人,
VS.ChargerContact 联系号码
FROM ViewStudent VS INNER JOIN Department D ON
VS.TopDepartmentId = D.Id AND D.State < 2


GO
/****** Object:  View [dbo].[ViewTeacher]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTeacher] AS
SELECT 
T.Id,
U.Account,
U.RealName,
U.DisplayName,
T.Phone,
T.Email,
T.Gender,
T.Birthday,
T.Birthplace,
T.Address,
T.Nationality,
T.IDCard,
U.Ordinal PriorOrdinal,
DU.DepartmentId,
DU.TopDepartmentId,
DU.State,
D.Name DepartmentName,
D.DisplayName DeaprtmentDisplayName,
D.Level,
DU.Ordinal MinorOrdinal,
DU.Type
FROM [Teacher] T INNER JOIN [User] U
ON T.Id = U.Id AND U.State < 2 LEFT JOIN [DepartmentUser] DU
ON T.Id = DU.UserId AND DU.State < 5 LEFT JOIN [Department] D
ON DU.DepartmentId = D.Id AND D.State < 2


GO
/****** Object:  View [dbo].[ViewRole]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewRole] AS
SELECT UR.RoleId, UR.UserId, V_T.RealName AS UserName, V_T.DepartmentId, R.Name AS RoleName, UR.State FROM ViewTeacher V_T INNER JOIN UserRole UR ON
V_T.Id = UR.UserId INNER JOIN [Role] R ON UR.RoleId = R.Id


GO
/****** Object:  View [dbo].[ViewQueryTeacher]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewQueryTeacher] AS
SELECT VT.RealName AS 姓名, 
CASE VT.State WHEN 0 THEN '内置' WHEN 1 THEN '启用' WHEN 2 THEN '审核' WHEN 3 THEN '默认' WHEN 4 THEN '停用' ELSE '删除' END 状态,
D.Name 校区,
VT.DepartmentName 部门,
CASE VT.Type WHEN -1 THEN '主职' ELSE '兼职' END 主兼职,
VT.Phone 手机号码,
VT.Email 电子邮件,
VT.IDCard 身份证号,
CASE VT.Gender WHEN 'True' THEN '男' WHEN 'False' THEN '女' ELSE NULL END 性别,
VT.Birthplace 籍贯,
VT.Birthday 出生日期,
VT.Address 现居住地,
VT.Nationality 民族
FROM ViewTeacher VT INNER JOIN Department D ON
VT.TopDepartmentId = D.Id AND D.State < 2 AND VT.Type < 0


GO
/****** Object:  View [dbo].[ViewTeacherExport]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE VIEW [dbo].[ViewTeacherExport] AS
  SELECT VT.Account AS 账号, VT.RealName AS 姓名, 
CASE VT.State WHEN 0 THEN '内置' WHEN 1 THEN '启用' WHEN 2 THEN '审核' WHEN 3 THEN '默认' WHEN 4 THEN '停用' ELSE '删除' END 状态,
D.Name 校区,
VT.DepartmentName 部门,
CASE VT.Type WHEN -1 THEN '主职' ELSE '兼职' END 主兼职,
VT.Phone 手机号码,
VT.Email 电子邮件,
VT.IDCard 身份证号,
CASE VT.Gender WHEN 'True' THEN '男' WHEN 'False' THEN '女' ELSE NULL END 性别,
VT.Birthplace 籍贯,
VT.Birthday 出生日期,
VT.Address 现居住地,
VT.Nationality 民族
FROM ViewTeacher VT INNER JOIN Department D ON
VT.TopDepartmentId = D.Id AND D.State < 2 AND VT.Type < 0


GO
/****** Object:  View [dbo].[ViewLearned]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewLearned] AS 
SELECT L.DepartmentId, L.CourseId, C.Name AS CourseName, C.Ordinal AS Ordinal FROM Learned L INNER JOIN Department D
ON L.DepartmentId = D.Id AND L.State = 1 AND D.State = 1
INNER JOIN Catalog C ON L.CourseId = C.Id AND C.State < 2 AND C.Type = 2


GO
/****** Object:  View [dbo].[ViewQueryTaught]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewQueryTaught] AS
SELECT L.*,DPP.Name AS 校区, DP.Ordinal AS 届, D.Name 班级, C.Name 课程名称, U.RealName 教师 FROM Learned L LEFT JOIN Department D
ON L.State = 1 AND D.State < 2 AND L.DepartmentId = D.Id
LEFT JOIN Catalog C ON L.CourseId = C.Id AND C.State < 2 AND C.Type = 2 LEFT JOIN Department DP
ON D.ParentId = DP.Id AND DP.State < 2 LEFT JOIN Department DPP
ON DP.ParentId = DPP.Id AND DP.State < 2 LEFT JOIN Taught T ON L.DepartmentId = T.DepartmentId AND
L.CourseId = T.CourseId AND T.State = 1 LEFT JOIN [User] U ON T.UserId = U.Id AND U.State < 2


GO
/****** Object:  View [dbo].[ViewResource]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ViewResource] AS
SELECT ResourceCatalog.CatalogId AS RC, [Resource].* FROM ResourceCatalog INNER JOIN [Resource] ON ResourceCatalog.ResourceId = [Resource].Id
AND ResourceCatalog.State < 2 AND [Resource].State < 2



GO
/****** Object:  View [dbo].[ViewResourceX]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewResourceX] AS

SELECT C.Id CatalogId, R.* FROM Resource R INNER JOIN ResourceCatalog RC ON R.Id = RC.ResourceId AND R.State < 2 AND RC.State < 2
INNER JOIN Catalog C ON RC.CatalogId = C.Id AND C.State < 2

GO
/****** Object:  View [dbo].[ViewTaught]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTaught] AS
SELECT T.*, U.RealName AS UserName FROM Taught T INNER JOIN [User] U ON T.UserId = U.Id
AND T.State = 1 AND U.State < 2


GO
/****** Object:  View [dbo].[ViewTS]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTS] AS
SELECT U.*, ISNULL(C.Article, 0) Article , ISNULL(C.Courseware, 0) Courseware , ISNULL(C.Paper, 0) Paper , ISNULL(C.Media, 0) Media , ISNULL(C.[View], 0) [View] , ISNULL(C.Download, 0) Download , ISNULL(C.Credit, 0) Credit FROM [User] U LEFT JOIN
(
SELECT Id, SUM(Article) Article, SUM(Courseware) Courseware, SUM(Paper) Paper, SUM(Media) Media, SUM([View]) [View], SUM(Download) Download, SUM(Credit) Credit FROM TeacherStatisticsMonthly GROUP BY Id
) C ON U.Id = C.Id


GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 2015/3/31 11:52:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Ordinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[ApplicationPolicy] ADD  CONSTRAINT [DF_Policy_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[ApplicationPolicy] ADD  CONSTRAINT [DF_Policy_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Catalog] ADD  CONSTRAINT [DF_Catalog_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Catalog] ADD  CONSTRAINT [DF_Catalog_Ordinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Level]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Ordinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[DepartmentUser] ADD  CONSTRAINT [DF_DepartmentUser_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[DepartmentUser] ADD  CONSTRAINT [DF_DepartmentUser_Ordinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_GroupIconUrl]  DEFAULT ('') FOR [Icon]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_GroupState]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_GroupOrdinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[GroupUser] ADD  CONSTRAINT [DF_GroupUser_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[GroupUser] ADD  CONSTRAINT [DF_GroupUser_Ordinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[Learned] ADD  CONSTRAINT [DF_CourseLearning_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Statistics_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IconUrl]  DEFAULT ('') FOR [Icon]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Credit]  DEFAULT ((0)) FOR [Credit]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Favourite]  DEFAULT ((0)) FOR [Favourite]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Comment]  DEFAULT ((0)) FOR [Comment]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Grade]  DEFAULT ((0)) FOR [Grade]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_View]  DEFAULT ((0)) FOR [View]
GO
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Download]  DEFAULT ((0)) FOR [Download]
GO
ALTER TABLE [dbo].[ResourceAttachment] ADD  CONSTRAINT [DF_ResourceAttachment_ResourceAttachmentState]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[ResourceComment] ADD  CONSTRAINT [DF_ResourceComment_Level]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_Favourite]  DEFAULT ((0)) FOR [Favourite]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_Comment]  DEFAULT ((0)) FOR [Comment]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_Grade]  DEFAULT ((0.00)) FOR [Grade]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_Visit]  DEFAULT ((0)) FOR [View]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_Download]  DEFAULT ((0)) FOR [Download]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] ADD  CONSTRAINT [DF_StatisticsResource_TimeStamp]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_RoleState]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_RoleOrdinal]  DEFAULT ((1)) FOR [Ordinal]
GO
ALTER TABLE [dbo].[RoleRight] ADD  CONSTRAINT [DF_RoleRight_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Taught] ADD  CONSTRAINT [DF_CourseTeaching_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
ALTER TABLE [dbo].[ApiLog]  WITH CHECK ADD  CONSTRAINT [FK_ApiLog_Api] FOREIGN KEY([ApiId], [ProviderId])
REFERENCES [dbo].[Api] ([Id], [ProviderId])
GO
ALTER TABLE [dbo].[ApiLog] CHECK CONSTRAINT [FK_ApiLog_Api]
GO
ALTER TABLE [dbo].[ApplicationPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationPolicy_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ApplicationPolicy] CHECK CONSTRAINT [FK_ApplicationPolicy_Application]
GO
ALTER TABLE [dbo].[ApplicationRole]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationRole_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ApplicationRole] CHECK CONSTRAINT [FK_ApplicationRole_Application]
GO
ALTER TABLE [dbo].[AssessTable]  WITH CHECK ADD  CONSTRAINT [FK_AssessTable_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[AssessTable] CHECK CONSTRAINT [FK_AssessTable_Course]
GO
ALTER TABLE [dbo].[AssessTable]  WITH CHECK ADD  CONSTRAINT [FK_AssessTable_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[AssessTable] CHECK CONSTRAINT [FK_AssessTable_Grade]
GO
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_Catalog] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_Catalog]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_DepartmentParent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_DepartmentParent]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_DepartmentTop] FOREIGN KEY([TopId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_DepartmentTop]
GO
ALTER TABLE [dbo].[DepartmentUser]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentUser_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[DepartmentUser] CHECK CONSTRAINT [FK_DepartmentUser_Department]
GO
ALTER TABLE [dbo].[DepartmentUser]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentUser_DepartmentCampus] FOREIGN KEY([TopDepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[DepartmentUser] CHECK CONSTRAINT [FK_DepartmentUser_DepartmentCampus]
GO
ALTER TABLE [dbo].[DepartmentUser]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DepartmentUser] CHECK CONSTRAINT [FK_DepartmentUser_User]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Grade]
GO
ALTER TABLE [dbo].[GroupUser]  WITH CHECK ADD  CONSTRAINT [FK_GroupUser_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[GroupUser] CHECK CONSTRAINT [FK_GroupUser_Group]
GO
ALTER TABLE [dbo].[GroupUser]  WITH CHECK ADD  CONSTRAINT [FK_GroupUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupUser] CHECK CONSTRAINT [FK_GroupUser_User]
GO
ALTER TABLE [dbo].[Learned]  WITH CHECK ADD  CONSTRAINT [FK_Learned_Catalog] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Learned] CHECK CONSTRAINT [FK_Learned_Catalog]
GO
ALTER TABLE [dbo].[Learned]  WITH CHECK ADD  CONSTRAINT [FK_Learned_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Learned] CHECK CONSTRAINT [FK_Learned_Department]
GO
ALTER TABLE [dbo].[MediaNote]  WITH CHECK ADD  CONSTRAINT [FK_MediaNote_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[MediaNote] CHECK CONSTRAINT [FK_MediaNote_Resource]
GO
ALTER TABLE [dbo].[MediaNote]  WITH CHECK ADD  CONSTRAINT [FK_MediaNote_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MediaNote] CHECK CONSTRAINT [FK_MediaNote_User]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Application]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Right] FOREIGN KEY([RightName])
REFERENCES [dbo].[Right] ([Name])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Right]
GO
ALTER TABLE [dbo].[Notice]  WITH CHECK ADD  CONSTRAINT [FK_Notice_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Notice] CHECK CONSTRAINT [FK_Notice_User]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK__Resource_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK__Resource_User]
GO
ALTER TABLE [dbo].[ResourceAssess]  WITH CHECK ADD  CONSTRAINT [FK_ResourceAssess_AssessTable] FOREIGN KEY([AssessTableId])
REFERENCES [dbo].[AssessTable] ([Id])
GO
ALTER TABLE [dbo].[ResourceAssess] CHECK CONSTRAINT [FK_ResourceAssess_AssessTable]
GO
ALTER TABLE [dbo].[ResourceAssess]  WITH CHECK ADD  CONSTRAINT [FK_ResourceAssess_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceAssess] CHECK CONSTRAINT [FK_ResourceAssess_Resource]
GO
ALTER TABLE [dbo].[ResourceAssess]  WITH CHECK ADD  CONSTRAINT [FK_ResourceAssess_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ResourceAssess] CHECK CONSTRAINT [FK_ResourceAssess_User]
GO
ALTER TABLE [dbo].[ResourceAttachment]  WITH CHECK ADD  CONSTRAINT [FK_ResourceAttachment_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceAttachment] CHECK CONSTRAINT [FK_ResourceAttachment_Resource]
GO
ALTER TABLE [dbo].[ResourceCatalog]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCatalog_Catalog] FOREIGN KEY([CatalogId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[ResourceCatalog] CHECK CONSTRAINT [FK_ResourceCatalog_Catalog]
GO
ALTER TABLE [dbo].[ResourceCatalog]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCatalog_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceCatalog] CHECK CONSTRAINT [FK_ResourceCatalog_Resource]
GO
ALTER TABLE [dbo].[ResourceComment]  WITH CHECK ADD  CONSTRAINT [FK_ResourceComment_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceComment] CHECK CONSTRAINT [FK_ResourceComment_Resource]
GO
ALTER TABLE [dbo].[ResourceComment]  WITH CHECK ADD  CONSTRAINT [FK_ResourceComment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ResourceComment] CHECK CONSTRAINT [FK_ResourceComment_User]
GO
ALTER TABLE [dbo].[ResourceCommentTemp]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCommentTemp_ResourceRoom] FOREIGN KEY([RoomId])
REFERENCES [dbo].[ResourceRoom] ([Id])
GO
ALTER TABLE [dbo].[ResourceCommentTemp] CHECK CONSTRAINT [FK_ResourceCommentTemp_ResourceRoom]
GO
ALTER TABLE [dbo].[ResourceCommentTemp]  WITH CHECK ADD  CONSTRAINT [FK_ResourceCommentTemp_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ResourceCommentTemp] CHECK CONSTRAINT [FK_ResourceCommentTemp_User]
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly]  WITH CHECK ADD  CONSTRAINT [FK_ResourceStatisticsMonthly_Resource] FOREIGN KEY([Id])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceStatisticsMonthly] CHECK CONSTRAINT [FK_ResourceStatisticsMonthly_Resource]
GO
ALTER TABLE [dbo].[ResourceTag]  WITH CHECK ADD  CONSTRAINT [FK_ResourceTag_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
ALTER TABLE [dbo].[ResourceTag] CHECK CONSTRAINT [FK_ResourceTag_Resource]
GO
ALTER TABLE [dbo].[Right]  WITH CHECK ADD  CONSTRAINT [FK_Right_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[Right] CHECK CONSTRAINT [FK_Right_Application]
GO
ALTER TABLE [dbo].[RoleRight]  WITH CHECK ADD  CONSTRAINT [FK_RoleRight_Right] FOREIGN KEY([RightName])
REFERENCES [dbo].[Right] ([Name])
GO
ALTER TABLE [dbo].[RoleRight] CHECK CONSTRAINT [FK_RoleRight_Right]
GO
ALTER TABLE [dbo].[RoleRight]  WITH CHECK ADD  CONSTRAINT [FK_RoleRight_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleRight] CHECK CONSTRAINT [FK_RoleRight_Role]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_User]
GO
ALTER TABLE [dbo].[Taught]  WITH CHECK ADD  CONSTRAINT [FK_Taught_Catalog] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Taught] CHECK CONSTRAINT [FK_Taught_Catalog]
GO
ALTER TABLE [dbo].[Taught]  WITH CHECK ADD  CONSTRAINT [FK_Taught_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Taught] CHECK CONSTRAINT [FK_Taught_Department]
GO
ALTER TABLE [dbo].[Taught]  WITH CHECK ADD  CONSTRAINT [FK_Taught_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Taught] CHECK CONSTRAINT [FK_Taught_User]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_User]
GO
ALTER TABLE [dbo].[TeacherStatisticsMonthly]  WITH CHECK ADD  CONSTRAINT [FK_TeacherStatisticsMonthly_User] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TeacherStatisticsMonthly] CHECK CONSTRAINT [FK_TeacherStatisticsMonthly_User]
GO
ALTER TABLE [dbo].[UserCatalog]  WITH CHECK ADD  CONSTRAINT [FK_UserCatalog_Catalog] FOREIGN KEY([CatalogId])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[UserCatalog] CHECK CONSTRAINT [FK_UserCatalog_Catalog]
GO
ALTER TABLE [dbo].[UserCatalog]  WITH CHECK ADD  CONSTRAINT [FK_UserCatalog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserCatalog] CHECK CONSTRAINT [FK_UserCatalog_User]
GO
ALTER TABLE [dbo].[UserFavourite]  WITH CHECK ADD  CONSTRAINT [FK_UserFavourite_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserFavourite] CHECK CONSTRAINT [FK_UserFavourite_User]
GO
ALTER TABLE [dbo].[UserFavourite]  WITH CHECK ADD  CONSTRAINT [FK_UserFavourite_UserFavourite] FOREIGN KEY([FavouriteUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserFavourite] CHECK CONSTRAINT [FK_UserFavourite_UserFavourite]
GO
ALTER TABLE [dbo].[UserOnline]  WITH CHECK ADD  CONSTRAINT [FK_UserOnline_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserOnline] CHECK CONSTRAINT [FK_UserOnline_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  StoredProcedure [dbo].[ResetPolicyCommon]    Script Date: 2015/3/31 11:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ResetPolicyCommon]
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE ApplicationPolicy SET Value = 'True' WHERE Name = 'UserRegistration'
	UPDATE ApplicationPolicy SET Value = '^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\.(?:com|cn)$' WHERE Name = 'UserEmailRegex'
	UPDATE ApplicationPolicy SET Value = '^((13|14|15|18)+\d{9})$' WHERE Name = 'UserPhoneRegex'
	UPDATE ApplicationPolicy SET Value = '6' WHERE Name = 'UserPasswordLength'
	UPDATE ApplicationPolicy SET Value = '10080' WHERE Name = 'UserCookieExpire'
	UPDATE ApplicationPolicy SET Value = 'longchengdichan@163.com' WHERE Name = 'SmtpAccount'
	UPDATE ApplicationPolicy SET Value = 'lc2011' WHERE Name = 'SmtpPassword'
	UPDATE ApplicationPolicy SET Value = 'smtp.163.com' WHERE Name = 'SmtpHost'
	UPDATE ApplicationPolicy SET Value = '25' WHERE Name = 'SmtpPort'
	UPDATE ApplicationPolicy SET Value = '北塘教育' WHERE Name = 'SmtpSender'
	UPDATE ApplicationPolicy SET Value = 'False' WHERE Name = 'PermanentParttime'
END



GO
USE [master]
GO
ALTER DATABASE [Platform_BT] SET  READ_WRITE 
GO
