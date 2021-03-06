USE [db_pcm_gob_pe_turn]
GO
/****** Object:  User [usr_pcm_gob_pe_turns]    Script Date: 25/10/2019 19:53:20 ******/
CREATE USER [usr_pcm_gob_pe_turns] FOR LOGIN [usr_pcm_gob_pe_turn] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'usr_pcm_gob_pe_turns'
GO
/****** Object:  UserDefinedTableType [dbo].[dtAppointment]    Script Date: 25/10/2019 19:53:20 ******/
CREATE TYPE [dbo].[dtAppointment] AS TABLE(
	[CodeActivity] [int] NULL,
	[CodeService] [int] NULL,
	[CodeAttentionCenter] [int] NULL,
	[CodeSchedule] [int] NULL,
	[Dni] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[FirstLastName] [varchar](50) NULL,
	[SecondLastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[dtBanner]    Script Date: 25/10/2019 19:53:20 ******/
CREATE TYPE [dbo].[dtBanner] AS TABLE(
	[CodeBanner] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[dtServicioEntidad]    Script Date: 25/10/2019 19:53:20 ******/
CREATE TYPE [dbo].[dtServicioEntidad] AS TABLE(
	[CodeServiceEntity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ID_ENTITY]    Script Date: 25/10/2019 19:53:20 ******/
CREATE TYPE [dbo].[ID_ENTITY] AS TABLE(
	[CodeEntity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ID_SERVICIO]    Script Date: 25/10/2019 19:53:20 ******/
CREATE TYPE [dbo].[ID_SERVICIO] AS TABLE(
	[CodeServicio] [int] NULL
)
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[CodeActivity] [int] IDENTITY(1,10) NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[StartQuota] [int] NULL,
	[EndQuota] [int] NULL,
	[Available] [bit] NULL,
	[RegistryDate1] [datetime] NULL,
	[CodeState] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[ActivityDate] [date] NULL,
 CONSTRAINT [PK__Activity__FEA2B62B1DEB6800] PRIMARY KEY CLUSTERED 
(
	[CodeActivity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alomac]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alomac](
	[CodeAlomac] [int] IDENTITY(1,1) NOT NULL,
	[CodeUser] [int] NOT NULL,
	[Dni] [nvarchar](8) NULL,
	[Telephone] [nvarchar](10) NULL,
	[Annexed] [nvarchar](10) NULL,
	[Wav] [nvarchar](10) NULL,
	[CodePeople] [int] NOT NULL,
	[StarDateAten] [datetime] NULL,
	[EndDateAten] [datetime] NULL,
	[Querys] [nvarchar](1000) NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodetypeAttention] [int] NOT NULL,
	[CodeProcedure] [int] NOT NULL,
	[AtentionTime] [int] NULL,
	[Channel] [nvarchar](100) NULL,
	[ChannelAnswered] [nvarchar](100) NULL,
	[AgentAnswer] [nvarchar](100) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeAlomac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[CodeAppointment] [int] IDENTITY(1,1) NOT NULL,
	[CodePeople] [int] NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[CodetypeAttention] [int] NOT NULL,
	[CodeUser] [int] NULL,
	[AppointmentDate] [date] NULL,
	[Observation] [nvarchar](200) NULL,
	[CodePayment] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[CodeState] [int] NULL,
 CONSTRAINT [PK__Appointm__80CE02B35AB11122] PRIMARY KEY CLUSTERED 
(
	[CodeAppointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attention]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attention](
	[CodeAttention] [int] IDENTITY(1,1) NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeAttention] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttentionCenter]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttentionCenter](
	[CodeAttentionCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeCompany] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[CodeGeoLocation] [char](6) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Attentio__C21AE541FD50FE64] PRIMARY KEY CLUSTERED 
(
	[CodeAttentionCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackBannerZone]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackBannerZone](
	[CodeBannerZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeBanner] [int] NOT NULL,
	[CodeZone] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Order] [int] NULL,
	[Active] [char](1) NOT NULL,
	[State] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackEntity_AttentionCenter]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackEntity_AttentionCenter](
	[CodeEntityAtentionCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodeEntity] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackServiceAttentionCenter]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackServiceAttentionCenter](
	[CodeServAttenCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeServiceEntity] [int] NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Active] [char](1) NULL,
	[State] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackServiceEntity]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackServiceEntity](
	[CodeServiceEntity] [int] IDENTITY(1,1) NOT NULL,
	[CodeEntity] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [varchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[CodeBanner] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](500) NULL,
	[BannerDescription] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Order] [int] NOT NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Banner__9F0813839DB1F096] PRIMARY KEY CLUSTERED 
(
	[CodeBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BannerZone]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerZone](
	[CodeBannerZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeBanner] [int] NOT NULL,
	[CodeZone] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Active] [char](1) NOT NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__BannerZo__04A42DCD0307610B] PRIMARY KEY CLUSTERED 
(
	[CodeBannerZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CodeCompany] [int] IDENTITY(1,1) NOT NULL,
	[NameCompany] [varchar](250) NOT NULL,
	[AbreviationCompany] [varchar](250) NULL,
	[RegistryUser] [varchar](250) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailGroupService]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailGroupService](
	[CodeDetailGroupService] [int] IDENTITY(1,1) NOT NULL,
	[CodeGroupService] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [varchar](200) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeDetailGroupService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[CodeEntity] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Abreviation] [varchar](50) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[RowOrder] [int] NULL,
	[UrlLogo] [nvarchar](250) NULL,
 CONSTRAINT [PK__Entity__6D5166EC102CE1AB] PRIMARY KEY CLUSTERED 
(
	[CodeEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity_AttentionCenter]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_AttentionCenter](
	[CodeEntityAtentionCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodeEntity] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NOT NULL,
 CONSTRAINT [PK__Entity_A__F6275DDD897F1BAA] PRIMARY KEY CLUSTERED 
(
	[CodeEntityAtentionCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeoLocation]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoLocation](
	[cCodGeoLocation] [char](6) NOT NULL,
	[nvDepartment] [nvarchar](2) NOT NULL,
	[nvProvince] [nvarchar](2) NOT NULL,
	[nvDistrict] [nvarchar](2) NOT NULL,
	[nvDenomination] [nvarchar](200) NOT NULL,
	[nvDescription] [nvarchar](500) NOT NULL,
	[nvObservation] [nvarchar](500) NOT NULL,
	[nvUserRegistry] [nvarchar](100) NOT NULL,
	[dtDateregistry] [datetime] NULL,
	[iCountModification] [int] NOT NULL,
	[bState] [bit] NOT NULL,
 CONSTRAINT [PK_GeoLocation] PRIMARY KEY CLUSTERED 
(
	[cCodGeoLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupService]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupService](
	[CodeGroupService] [int] IDENTITY(1,1) NOT NULL,
	[CodeZone] [int] NOT NULL,
	[Name] [varchar](200) NULL,
	[Description] [varchar](300) NULL,
	[RegistryUser] [varchar](200) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeGroupService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[CodePeople] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[FirstLastName] [nvarchar](50) NULL,
	[SecondLastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telephone] [nvarchar](20) NULL,
	[Pide] [bit] NULL,
	[PideDate] [datetime] NULL,
	[Birthdate] [datetime] NULL,
	[Sex] [char](1) NULL,
	[CivilStatus] [char](1) NULL,
	[CodeGeoLocation] [char](6) NULL,
	[Address] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodePeople] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[CodeSchedule] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Schedule__A1F9D6BE134FE7A5] PRIMARY KEY CLUSTERED 
(
	[CodeSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SequenceTicket]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SequenceTicket](
	[CodeSequenceTicket] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[CodeGroupService] [int] NOT NULL,
	[CodeTicket] [int] NOT NULL,
	[OrderSecuence] [int] NOT NULL,
	[RegistryUser] [varchar](250) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeSequenceTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[CodeService] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
	[CodeTypeService] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceAttention]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAttention](
	[CodeServiceAttention] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttention] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeServiceAttention] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceAttentionCenter]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAttentionCenter](
	[CodeServAttenCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeServiceEntity] [int] NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Active] [char](1) NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Procedur__373E264932516BA7] PRIMARY KEY CLUSTERED 
(
	[CodeServAttenCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceEntity]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceEntity](
	[CodeServiceEntity] [int] IDENTITY(1,1) NOT NULL,
	[CodeEntity] [int] NOT NULL,
	[CodeService] [int] NOT NULL,
	[RegistryUser] [varchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__ServiceE__945EF6442DF1BF10] PRIMARY KEY CLUSTERED 
(
	[CodeServiceEntity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceTicket]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceTicket](
	[CodeServiceTicket] [int] IDENTITY(1,1) NOT NULL,
	[CodeService] [int] NOT NULL,
	[CodeTicket] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeServiceTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[CodeState] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[CodeTicket] [int] IDENTITY(1,1) NOT NULL,
	[TicketName] [nvarchar](100) NULL,
	[CodeTicketState] [int] NOT NULL,
	[CodeTicketType] [int] NOT NULL,
	[TicketTime] [datetime] NULL,
	[TicketDate] [datetime] NULL,
	[CodePeople] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Ticket__E7BD581B7B173398] PRIMARY KEY CLUSTERED 
(
	[CodeTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketState]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketState](
	[CodeTicketState] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTicketState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketStateHistory]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketStateHistory](
	[CodeTicketStateHistory] [int] IDENTITY(1,1) NOT NULL,
	[CodeTicket] [int] NOT NULL,
	[CodeTicketState] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTicketStateHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketType](
	[CodeTicketType] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Priority] [int] NULL,
	[IsPreferential] [bit] NULL,
	[Visible] [char](1) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__TypeAtte__E532FC438A62F62E] PRIMARY KEY CLUSTERED 
(
	[CodeTicketType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeService]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeService](
	[CodeTypeService] [int] IDENTITY(1,1) NOT NULL,
	[NameTypeService] [nvarchar](120) NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTypeService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[CodeVideo] [int] IDENTITY(1,1) NOT NULL,
	[VideoName] [nvarchar](120) NULL,
	[VideoDescription] [nvarchar](250) NULL,
	[VideoAdress] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Video__4E6C0241A98AD68F] PRIMARY KEY CLUSTERED 
(
	[CodeVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoZone]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoZone](
	[CodeVideoZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeVideo] [int] NOT NULL,
	[CodeZone] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeVideoZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Window]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Window](
	[CodeWindow] [int] IDENTITY(1,1) NOT NULL,
	[WindowName] [nvarchar](100) NULL,
	[CodeZone] [int] NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeWindow] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 25/10/2019 19:53:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[CodeZone] [int] IDENTITY(1,1) NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[ZoneName] [nvarchar](120) NULL,
	[ZoneDescription] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Zone__13912F3596215FC6] PRIMARY KEY CLUSTERED 
(
	[CodeZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (1, 2, 2, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:32:04.453' AS DateTime), NULL, 1)
INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (2, 2, 2, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:36:09.420' AS DateTime), NULL, 1)
INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (3, 2, 2, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:37:59.590' AS DateTime), NULL, 1)
INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (4, 2, 2, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:39:06.717' AS DateTime), NULL, 1)
INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (5, 2, 3, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:43:23.063' AS DateTime), NULL, 1)
INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (6, 3, 10, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:51:23.673' AS DateTime), NULL, 1)
INSERT [dbo].[Appointment] ([CodeAppointment], [CodePeople], [CodeSchedule], [CodeServAttenCenter], [CodetypeAttention], [CodeUser], [AppointmentDate], [Observation], [CodePayment], [RegistryUser], [RegistryDate], [State], [CodeState]) VALUES (7, 3, 9, 1002, 1, NULL, NULL, NULL, NULL, N'System', CAST(N'2019-10-12T17:51:23.677' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
SET IDENTITY_INSERT [dbo].[AttentionCenter] ON 

INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1, NULL, N'Arequipa', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (2, NULL, N'Lima Este', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (3, NULL, N'Piura', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (4, NULL, N'Callao', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (5, NULL, N'Lima Norte', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (6, NULL, N'Ventanilla', NULL, NULL, NULL, N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1002, NULL, N'DQDQ1', NULL, N'Admin', CAST(N'2019-08-26T17:39:40.023' AS DateTime), N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1003, NULL, N'VEEWGGEW', NULL, N'Admin', CAST(N'2019-08-26T17:40:23.990' AS DateTime), N'0')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1004, NULL, N'PRUEBA144', NULL, N'Admin', CAST(N'2019-08-27T17:42:37.020' AS DateTime), N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1005, NULL, N'PRUEBA1', NULL, N'Admin', CAST(N'2019-08-27T17:43:06.440' AS DateTime), N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1006, NULL, N'PRUEBA22', NULL, N'Admin', CAST(N'2019-09-03T13:54:36.310' AS DateTime), N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1007, NULL, N'PRUEBA222211sdsd', NULL, N'Admin', CAST(N'2019-09-03T13:54:49.227' AS DateTime), N'1')
INSERT [dbo].[AttentionCenter] ([CodeAttentionCenter], [CodeCompany], [Description], [CodeGeoLocation], [RegistryUser], [RegistryDate], [State]) VALUES (1008, NULL, N'PRUEBA 09102019', NULL, N'Admin', CAST(N'2019-10-09T13:05:23.220' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[AttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[BackBannerZone] ON 

INSERT [dbo].[BackBannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Order], [Active], [State]) VALUES (7, 3, 3, N'Admin', CAST(N'2019-10-25T18:00:53.817' AS DateTime), NULL, N'1', N'1')
INSERT [dbo].[BackBannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Order], [Active], [State]) VALUES (8, 10, 3, N'Admin', CAST(N'2019-10-25T18:00:53.817' AS DateTime), NULL, N'1', N'1')
INSERT [dbo].[BackBannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Order], [Active], [State]) VALUES (11, 3, 4, N'Admin', CAST(N'2019-10-25T18:24:25.443' AS DateTime), NULL, N'1', N'1')
INSERT [dbo].[BackBannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Order], [Active], [State]) VALUES (12, 6, 4, N'Admin', CAST(N'2019-10-25T18:24:25.443' AS DateTime), NULL, N'1', N'1')
INSERT [dbo].[BackBannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Order], [Active], [State]) VALUES (13, 9, 4, N'Admin', CAST(N'2019-10-25T18:24:25.443' AS DateTime), NULL, N'1', N'1')
SET IDENTITY_INSERT [dbo].[BackBannerZone] OFF
SET IDENTITY_INSERT [dbo].[BackEntity_AttentionCenter] ON 

INSERT [dbo].[BackEntity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (11, 5, 9, N'Admin', CAST(N'2019-10-18T12:16:35.297' AS DateTime), N'1')
INSERT [dbo].[BackEntity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (12, 5, 5, N'Admin', CAST(N'2019-10-18T12:16:35.297' AS DateTime), N'1')
INSERT [dbo].[BackEntity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (13, 6, 5, N'Admin', CAST(N'2019-10-22T11:14:02.230' AS DateTime), N'1')
INSERT [dbo].[BackEntity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (14, 6, 1, N'Admin', CAST(N'2019-10-22T11:14:02.230' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[BackEntity_AttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[BackServiceAttentionCenter] ON 

INSERT [dbo].[BackServiceAttentionCenter] ([CodeServAttenCenter], [CodeServiceEntity], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (24, 85, 5, N'Admin', CAST(N'2019-10-22T18:07:10.577' AS DateTime), N'1', N'0')
INSERT [dbo].[BackServiceAttentionCenter] ([CodeServAttenCenter], [CodeServiceEntity], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (23, 84, 6, N'Admin', CAST(N'2019-10-22T18:06:59.997' AS DateTime), N'1', N'0')
SET IDENTITY_INSERT [dbo].[BackServiceAttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[BackServiceEntity] ON 

INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (33, 1, 6, N'Admin', CAST(N'2019-10-17T20:15:14.980' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (34, 1, 3, N'Admin', CAST(N'2019-10-17T20:15:14.980' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (35, 1, 2, N'Admin', CAST(N'2019-10-17T20:15:14.980' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (36, 1, 1, N'Admin', CAST(N'2019-10-17T20:15:14.980' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (37, 5, 6, N'Admin', CAST(N'2019-10-18T11:05:43.053' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (38, 5, 1, N'Admin', CAST(N'2019-10-18T11:05:43.053' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (29, 2, 1028, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (30, 2, 6, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (31, 2, 4, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), NULL)
INSERT [dbo].[BackServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (32, 2, 1, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[BackServiceEntity] OFF
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (1, N'ANTES DE RETIRARSE VERIFIQUE SUS DATOS', N'Antes de retirarse verifique sus datos', N'admin', CAST(N'2019-08-13T19:39:36.247' AS DateTime), 1, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (2, N'BANNER DEL CENTRO MAC DE CONO ESTE', N'centro MAC', N'admin', CAST(N'2019-08-13T19:37:05.710' AS DateTime), 2, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (3, N'POR SU SEGURIDAD SE SOLICITA PRESENTAR SU DNI Y TARJETA MULTIRED GLOBAL DÉBITO PARA OPERACIONES DE RETIRO POR VENTANILLA SUPERIORES A S/. 1,500.00 O $ 550.00.', NULL, N'Admin', CAST(N'2019-09-06T12:42:46.060' AS DateTime), 3, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (4, N'DQWDWD', NULL, N'Admin', CAST(N'2019-10-04T11:49:44.380' AS DateTime), 4, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (5, N'PRUEBA2', NULL, N'Admin', CAST(N'2019-10-04T11:50:05.623' AS DateTime), 5, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (6, N'PRUEBA4', NULL, N'Admin', CAST(N'2019-10-04T11:50:15.067' AS DateTime), 6, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (7, N'PRUEBA5', NULL, N'Admin', CAST(N'2019-10-04T11:50:22.810' AS DateTime), 7, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (8, N'PRUEBA6', NULL, N'Admin', CAST(N'2019-10-04T11:50:36.350' AS DateTime), 8, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (9, N'PRUEBA7', NULL, N'Admin', CAST(N'2019-10-04T11:50:45.153' AS DateTime), 9, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (10, N'PRUEBA8', NULL, N'Admin', CAST(N'2019-10-04T11:51:05.310' AS DateTime), 10, N'1')
INSERT [dbo].[Banner] ([CodeBanner], [BannerName], [BannerDescription], [RegistryUser], [RegistryDate], [Order], [State]) VALUES (11, N'PRUEBA9', NULL, N'Admin', CAST(N'2019-10-04T11:51:16.180' AS DateTime), 11, N'0')
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[BannerZone] ON 

INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (7, 3, 3, N'Admin', CAST(N'2019-10-25T18:00:53.817' AS DateTime), N'1', N'1')
INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (8, 10, 3, N'Admin', CAST(N'2019-10-25T18:00:53.817' AS DateTime), N'1', N'1')
INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (9, 2, 4, N'Admin', CAST(N'2019-10-25T18:23:01.523' AS DateTime), N'0', N'0')
INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (10, 8, 4, N'Admin', CAST(N'2019-10-25T18:23:01.523' AS DateTime), N'0', N'0')
INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (11, 3, 4, N'Admin', CAST(N'2019-10-25T18:24:25.443' AS DateTime), N'1', N'1')
INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (12, 6, 4, N'Admin', CAST(N'2019-10-25T18:24:25.443' AS DateTime), N'1', N'1')
INSERT [dbo].[BannerZone] ([CodeBannerZone], [CodeBanner], [CodeZone], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (13, 9, 4, N'Admin', CAST(N'2019-10-25T18:24:25.443' AS DateTime), N'1', N'1')
SET IDENTITY_INSERT [dbo].[BannerZone] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1, N'Banco de la Nacion', NULL, N'system', CAST(N'2019-08-05T23:11:38.957' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (2, N'Caja Piura', NULL, N'system', CAST(N'2019-08-05T23:11:38.960' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (3, N'Colegio de Notarios de Lima', NULL, N'system', CAST(N'2019-08-05T23:11:38.960' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (4, N'EPS Grau', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (5, N'ESSALUD', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (6, N'GORE Arequipa', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (7, N'GORE Callao', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (8, N'GORE Piura', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (9, N'INDECOPI', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (10, N'INPE', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (11, N'JNE', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (12, N'MIDIS', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (13, N'Migraciones', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (14, N'MININTER', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (15, N'MTC', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (16, N'MTPE', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (17, N'MUNICIPALIDAD DE VENTANILLA', N'', N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (18, N'MUNICIPALIDAD PROVINCIAL DE AREQUIPA', N'', N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (19, N'OSCE', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (20, N'OSINERGMIN', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (21, N'PODER JUDICIAL', N'', N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (22, N'PRODUCE', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (23, N'RENIEC', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (24, N'RREE', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (25, N'SAT', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (26, N'SAT Piura', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (27, N'SBS', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (28, N'SEDAPAL', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (29, N'SIS', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (30, N'SUNARP', NULL, N'system', CAST(N'2019-08-05T23:11:38.963' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (31, N'SUNAT', NULL, N'system', CAST(N'2019-08-05T23:11:38.967' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (32, N'SUNEDU', NULL, N'system', CAST(N'2019-08-05T23:11:38.967' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1003, N'prueba de inercion', NULL, N'Admin', CAST(N'2019-08-15T12:51:06.653' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1004, N'fqwfqwf', NULL, N'Admin', CAST(N'2019-08-15T12:50:44.107' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1005, N'fergfreferf', NULL, N'Admin', CAST(N'2019-08-20T17:57:55.233' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1006, N'gregrgrwgrw', NULL, N'Admin', CAST(N'2019-08-20T18:02:28.087' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1007, N'pruebaaaa 20082019', NULL, N'Admin', CAST(N'2019-08-20T18:05:57.733' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1008, N'20082019', NULL, N'Admin', CAST(N'2019-08-20T18:14:08.477' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1009, N'06:17 20190820', NULL, N'Admin', CAST(N'2019-08-20T18:18:04.030' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1010, N'svsff', NULL, N'Admin', CAST(N'2019-08-20T18:19:18.563' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1011, N'PRUEBA11112', N'', N'Admin', CAST(N'2019-08-20T18:19:35.157' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1012, N'GEWGEHQHGQ', N'', N'Admin', CAST(N'2019-08-20T18:20:33.137' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1013, N'gewqgeqrhrwhrg', NULL, N'Admin', CAST(N'2019-08-20T18:21:17.590' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1014, N'qwvwf', NULL, N'Admin', CAST(N'2019-08-20T18:24:14.537' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1015, N'vewgeqrhgwh', NULL, N'Admin', CAST(N'2019-08-20T19:05:36.567' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1016, N'guarddadadadadadadadoooo', NULL, N'Admin', CAST(N'2019-08-20T19:05:15.277' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1017, N'g', NULL, N'Admin', CAST(N'2019-08-20T19:04:19.220' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1018, N'MILKI', NULL, N'Admin', CAST(N'2019-08-20T19:05:44.287' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1019, N'CAMBIO', N'', N'Admin', CAST(N'2019-08-20T19:05:53.693' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1020, N'WQFQWFWQF', NULL, N'Admin', CAST(N'2019-08-21T10:13:35.150' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1021, N'1', NULL, N'Admin', CAST(N'2019-08-21T10:13:48.647' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1022, N'W', NULL, N'Admin', CAST(N'2019-08-21T16:47:00.260' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1023, N'dwqdd', NULL, N'Admin', CAST(N'2019-08-21T17:45:02.180' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1024, N'FWFWRQ', NULL, N'Admin', CAST(N'2019-08-21T17:47:16.837' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1025, N'DWQDWQDWQD', NULL, N'Admin', CAST(N'2019-08-21T17:56:12.353' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1026, N'hg6h5h56h', NULL, N'Admin', CAST(N'2019-08-23T12:09:14.900' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1027, N'PRUEBA1111', N'', N'Admin', CAST(N'2019-08-23T14:39:58.030' AS DateTime), N'1', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1028, N'HH56H65H', N'DWQDQD', N'Admin', CAST(N'2019-08-23T14:48:06.737' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1029, N'FWEFW', N'GWG', N'Admin', CAST(N'2019-08-23T15:05:17.750' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1030, N'FF', N'F2', N'Admin', CAST(N'2019-08-23T15:07:41.407' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1031, N'WEGW', N'F2', N'Admin', CAST(N'2019-08-23T15:10:43.930' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1032, N'DDD', N'CCSCS', N'cd', CAST(N'2019-08-23T15:21:41.400' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1033, N'HUACJIIUCKHFKWH', N'vwefewf', N'Admin', CAST(N'2019-09-18T14:44:12.313' AS DateTime), N'0', NULL, NULL)
INSERT [dbo].[Entity] ([CodeEntity], [Description], [Abreviation], [RegistryUser], [RegistryDate], [State], [RowOrder], [UrlLogo]) VALUES (1034, N'JJJ', N'huac', N'Admin', CAST(N'2019-09-18T14:46:59.770' AS DateTime), N'0', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[Entity_AttentionCenter] ON 

INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89918, 5, 5, N'Admin', CAST(N'2019-10-18T11:51:41.357' AS DateTime), N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89919, 5, 1, N'Admin', CAST(N'2019-10-18T11:51:41.357' AS DateTime), N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89921, 5, 9, N'Admin', CAST(N'2019-10-18T12:15:00.483' AS DateTime), N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89922, 5, 8, N'Admin', CAST(N'2019-10-18T12:15:00.483' AS DateTime), N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89923, 5, 2, N'Admin', CAST(N'2019-10-18T12:15:00.483' AS DateTime), N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89924, 6, 5, N'Admin', CAST(N'2019-10-22T11:14:02.230' AS DateTime), N'1')
INSERT [dbo].[Entity_AttentionCenter] ([CodeEntityAtentionCenter], [CodeAttentionCenter], [CodeEntity], [RegistryUser], [RegistryDate], [State]) VALUES (89925, 6, 1, N'Admin', CAST(N'2019-10-22T11:14:02.230' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Entity_AttentionCenter] OFF
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010000', N'01', N'00', N'00', N'AMAZONAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010100', N'01', N'01', N'00', N'CHACHAPOYAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010101', N'01', N'01', N'01', N'CHACHAPOYAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010102', N'01', N'01', N'02', N'ASUNCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010103', N'01', N'01', N'03', N'BALSAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010104', N'01', N'01', N'04', N'CHETO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010105', N'01', N'01', N'05', N'CHILIQUIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010106', N'01', N'01', N'06', N'CHUQUIBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010107', N'01', N'01', N'07', N'GRANADA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010108', N'01', N'01', N'08', N'HUANCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010109', N'01', N'01', N'09', N'LA JALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010110', N'01', N'01', N'10', N'LEIMEBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010111', N'01', N'01', N'11', N'LEVANTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010112', N'01', N'01', N'12', N'MAGDALENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010113', N'01', N'01', N'13', N'MARISCAL CASTILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010114', N'01', N'01', N'14', N'MOLINOPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010115', N'01', N'01', N'15', N'MONTEVIDEO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010116', N'01', N'01', N'16', N'OLLEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010117', N'01', N'01', N'17', N'QUINJALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010118', N'01', N'01', N'18', N'SAN FRANCISCO DE DAGUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010119', N'01', N'01', N'19', N'SAN ISIDRO DE MAINO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010120', N'01', N'01', N'20', N'SOLOCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010121', N'01', N'01', N'21', N'SONCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010200', N'01', N'02', N'00', N'BAGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010201', N'01', N'02', N'01', N'LA PECA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010202', N'01', N'02', N'02', N'ARAMANGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010203', N'01', N'02', N'03', N'COPALLIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010204', N'01', N'02', N'04', N'EL PARCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010205', N'01', N'02', N'05', N'IMAZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010206', N'01', N'02', N'06', N'PECA', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010300', N'01', N'03', N'00', N'BONGARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010301', N'01', N'03', N'01', N'JUMBILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010302', N'01', N'03', N'02', N'CHISQUILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010303', N'01', N'03', N'03', N'CHURUJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010304', N'01', N'03', N'04', N'COROSHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010305', N'01', N'03', N'05', N'CUISPES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010306', N'01', N'03', N'06', N'FLORIDA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010307', N'01', N'03', N'07', N'JAZAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010308', N'01', N'03', N'08', N'RECTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010309', N'01', N'03', N'09', N'SAN CARLOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010310', N'01', N'03', N'10', N'SHIPASBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010311', N'01', N'03', N'11', N'VALERA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010312', N'01', N'03', N'12', N'YAMBRASBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010400', N'01', N'04', N'00', N'CONDORCANQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010401', N'01', N'04', N'01', N'NIEVA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010402', N'01', N'04', N'02', N'EL CENEPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010403', N'01', N'04', N'03', N'RIO SANTIAGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010500', N'01', N'05', N'00', N'LUYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010501', N'01', N'05', N'01', N'LAMUD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010502', N'01', N'05', N'02', N'CAMPORREDONDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010503', N'01', N'05', N'03', N'COCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010504', N'01', N'05', N'04', N'COLCAMAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010505', N'01', N'05', N'05', N'CONILA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010506', N'01', N'05', N'06', N'INGUILPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010507', N'01', N'05', N'07', N'LONGUITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010508', N'01', N'05', N'08', N'LONYA CHICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010509', N'01', N'05', N'09', N'LUYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010510', N'01', N'05', N'10', N'LUYA VIEJO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010511', N'01', N'05', N'11', N'MARIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010512', N'01', N'05', N'12', N'OCALLI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010513', N'01', N'05', N'13', N'OCUMAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010514', N'01', N'05', N'14', N'PISUQUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010515', N'01', N'05', N'15', N'PROVIDENCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010516', N'01', N'05', N'16', N'SAN CRISTOBAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010517', N'01', N'05', N'17', N'SAN FRANCISCO DEL YESO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010518', N'01', N'05', N'18', N'SAN JERONIMO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010519', N'01', N'05', N'19', N'SAN JUAN DE LOPECANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010520', N'01', N'05', N'20', N'SANTA CATALINA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010521', N'01', N'05', N'21', N'SANTO TOMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010522', N'01', N'05', N'22', N'TINGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010523', N'01', N'05', N'23', N'TRITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010600', N'01', N'06', N'00', N'RODRIGUEZ DE MENDOZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010601', N'01', N'06', N'01', N'SAN NICOLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010602', N'01', N'06', N'02', N'CHIRIMOTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010603', N'01', N'06', N'03', N'COCHAMAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010604', N'01', N'06', N'04', N'HUAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010605', N'01', N'06', N'05', N'LIMABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010606', N'01', N'06', N'06', N'LONGAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010607', N'01', N'06', N'07', N'MARISCAL BENAVIDES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010608', N'01', N'06', N'08', N'MILPUC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010609', N'01', N'06', N'09', N'OMIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010610', N'01', N'06', N'10', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010611', N'01', N'06', N'11', N'TOTORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010612', N'01', N'06', N'12', N'VISTA ALEGRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010700', N'01', N'07', N'00', N'UTCUBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010701', N'01', N'07', N'01', N'BAGUA GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010702', N'01', N'07', N'02', N'CAJARURO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010703', N'01', N'07', N'03', N'CUMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010704', N'01', N'07', N'04', N'EL MILAGRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010705', N'01', N'07', N'05', N'JAMALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010706', N'01', N'07', N'06', N'LONYA GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'010707', N'01', N'07', N'07', N'YAMON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020000', N'02', N'00', N'00', N'ANCASH', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020100', N'02', N'01', N'00', N'HUARAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020101', N'02', N'01', N'01', N'HUARAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020102', N'02', N'01', N'02', N'COCHABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020103', N'02', N'01', N'03', N'COLCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020104', N'02', N'01', N'04', N'HUANCHAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020105', N'02', N'01', N'05', N'INDEPENDENCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020106', N'02', N'01', N'06', N'JANGAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020107', N'02', N'01', N'07', N'LA LIBERTAD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020108', N'02', N'01', N'08', N'OLLEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020109', N'02', N'01', N'09', N'PAMPAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020110', N'02', N'01', N'10', N'PARIACOTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020111', N'02', N'01', N'11', N'PIRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020112', N'02', N'01', N'12', N'TARICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020200', N'02', N'02', N'00', N'AIJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020201', N'02', N'02', N'01', N'AIJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020202', N'02', N'02', N'02', N'CORIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020203', N'02', N'02', N'03', N'HUACLLAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020204', N'02', N'02', N'04', N'LA MERCED', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020205', N'02', N'02', N'05', N'SUCCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020300', N'02', N'03', N'00', N'ANTONIO RAYMONDI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020301', N'02', N'03', N'01', N'LLAMELLIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020302', N'02', N'03', N'02', N'ACZO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020303', N'02', N'03', N'03', N'CHACCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020304', N'02', N'03', N'04', N'CHINGAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020305', N'02', N'03', N'05', N'MIRGAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020306', N'02', N'03', N'06', N'SAN JUAN DE RONTOY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020400', N'02', N'04', N'00', N'ASUNCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020401', N'02', N'04', N'01', N'CHACAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020402', N'02', N'04', N'02', N'ACOCHACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020500', N'02', N'05', N'00', N'BOLOGNESI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020501', N'02', N'05', N'01', N'CHIQUIAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020502', N'02', N'05', N'02', N'ABELARDO PARDO LEZAMETA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020503', N'02', N'05', N'03', N'ANTONIO RAYMONDI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020504', N'02', N'05', N'04', N'AQUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020505', N'02', N'05', N'05', N'CAJACAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020506', N'02', N'05', N'06', N'CANIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020507', N'02', N'05', N'07', N'COLQUIOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020508', N'02', N'05', N'08', N'HUALLANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020509', N'02', N'05', N'09', N'HUASTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020510', N'02', N'05', N'10', N'HUAYLLACAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020511', N'02', N'05', N'11', N'LA PRIMAVERA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020512', N'02', N'05', N'12', N'MANGAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020513', N'02', N'05', N'13', N'PACLLON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020514', N'02', N'05', N'14', N'SAN MIGUEL DE CORPANQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020515', N'02', N'05', N'15', N'TICLLOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020600', N'02', N'06', N'00', N'CARHUAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020601', N'02', N'06', N'01', N'CARHUAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020602', N'02', N'06', N'02', N'ACOPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020603', N'02', N'06', N'03', N'AMASHCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020604', N'02', N'06', N'04', N'ANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020605', N'02', N'06', N'05', N'ATAQUERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020606', N'02', N'06', N'06', N'MARCARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020607', N'02', N'06', N'07', N'PARIAHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020608', N'02', N'06', N'08', N'SAN MIGUEL DE ACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020609', N'02', N'06', N'09', N'SHILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020610', N'02', N'06', N'10', N'TINCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020611', N'02', N'06', N'11', N'YUNGAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020700', N'02', N'07', N'00', N'CARLOS FERMIN FITZCARRALD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020701', N'02', N'07', N'01', N'SAN LUIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020702', N'02', N'07', N'02', N'SAN NICOLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020703', N'02', N'07', N'03', N'YAUYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020800', N'02', N'08', N'00', N'CASMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020801', N'02', N'08', N'01', N'CASMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020802', N'02', N'08', N'02', N'BUENA VISTA ALTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020803', N'02', N'08', N'03', N'COMANDANTE NOEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020804', N'02', N'08', N'04', N'YAUTAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020900', N'02', N'09', N'00', N'CORONGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020901', N'02', N'09', N'01', N'CORONGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020902', N'02', N'09', N'02', N'ACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020903', N'02', N'09', N'03', N'BAMBAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020904', N'02', N'09', N'04', N'CUSCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020905', N'02', N'09', N'05', N'LA PAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020906', N'02', N'09', N'06', N'YANAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'020907', N'02', N'09', N'07', N'YUPAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021000', N'02', N'10', N'00', N'HUARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021001', N'02', N'10', N'01', N'HUARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021002', N'02', N'10', N'02', N'ANRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021003', N'02', N'10', N'03', N'CAJAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021004', N'02', N'10', N'04', N'CHAVIN DE HUANTAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021005', N'02', N'10', N'05', N'HUACACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021006', N'02', N'10', N'06', N'HUACCHIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021007', N'02', N'10', N'07', N'HUACHIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021008', N'02', N'10', N'08', N'HUANTAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021009', N'02', N'10', N'09', N'MASIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021010', N'02', N'10', N'10', N'PAUCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021011', N'02', N'10', N'11', N'PONTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021012', N'02', N'10', N'12', N'RAHUAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021013', N'02', N'10', N'13', N'RAPAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021014', N'02', N'10', N'14', N'SAN MARCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021015', N'02', N'10', N'15', N'SAN PEDRO DE CHANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021016', N'02', N'10', N'16', N'UCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021100', N'02', N'11', N'00', N'HUARMEY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021101', N'02', N'11', N'01', N'HUARMEY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021102', N'02', N'11', N'02', N'COCHAPETI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021103', N'02', N'11', N'03', N'CULEBRAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021104', N'02', N'11', N'04', N'HUAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021105', N'02', N'11', N'05', N'MALVAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021200', N'02', N'12', N'00', N'HUAYLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021201', N'02', N'12', N'01', N'CARAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021202', N'02', N'12', N'02', N'HUALLANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021203', N'02', N'12', N'03', N'HUATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021204', N'02', N'12', N'04', N'HUAYLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021205', N'02', N'12', N'05', N'MATO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021206', N'02', N'12', N'06', N'PAMPAROMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021207', N'02', N'12', N'07', N'PUEBLO LIBRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021208', N'02', N'12', N'08', N'SANTA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021209', N'02', N'12', N'09', N'SANTO TORIBIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021210', N'02', N'12', N'10', N'YURACMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021300', N'02', N'13', N'00', N'MARISCAL LUZURIAGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021301', N'02', N'13', N'01', N'PISCOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021302', N'02', N'13', N'02', N'CASCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021303', N'02', N'13', N'03', N'ELEAZAR GUZMAN BARRON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021304', N'02', N'13', N'04', N'FIDEL OLIVAS ESCUDERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021305', N'02', N'13', N'05', N'LLAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021306', N'02', N'13', N'06', N'LLUMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021307', N'02', N'13', N'07', N'LUCMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021308', N'02', N'13', N'08', N'MUSGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021400', N'02', N'14', N'00', N'OCROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021401', N'02', N'14', N'01', N'OCROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021402', N'02', N'14', N'02', N'ACAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021403', N'02', N'14', N'03', N'CAJAMARQUILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021404', N'02', N'14', N'04', N'CARHUAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021405', N'02', N'14', N'05', N'COCHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021406', N'02', N'14', N'06', N'CONGAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021407', N'02', N'14', N'07', N'LLIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021408', N'02', N'14', N'08', N'SAN CRISTOBAL DE RAJAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021409', N'02', N'14', N'09', N'SAN PEDRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021410', N'02', N'14', N'10', N'SANTIAGO DE CHILCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021500', N'02', N'15', N'00', N'PALLASCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021501', N'02', N'15', N'01', N'CABANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021502', N'02', N'15', N'02', N'BOLOGNESI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021503', N'02', N'15', N'03', N'CONCHUCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021504', N'02', N'15', N'04', N'HUACASCHUQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021505', N'02', N'15', N'05', N'HUANDOVAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021506', N'02', N'15', N'06', N'LACABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021507', N'02', N'15', N'07', N'LLAPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021508', N'02', N'15', N'08', N'PALLASCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021509', N'02', N'15', N'09', N'PAMPAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021510', N'02', N'15', N'10', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021511', N'02', N'15', N'11', N'TAUCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021600', N'02', N'16', N'00', N'POMABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021601', N'02', N'16', N'01', N'POMABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021602', N'02', N'16', N'02', N'HUAYLLAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021603', N'02', N'16', N'03', N'PAROBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021604', N'02', N'16', N'04', N'QUINUABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021700', N'02', N'17', N'00', N'RECUAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021701', N'02', N'17', N'01', N'RECUAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021702', N'02', N'17', N'02', N'CATAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021703', N'02', N'17', N'03', N'COTAPARACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021704', N'02', N'17', N'04', N'HUAYLLAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021705', N'02', N'17', N'05', N'LLACLLIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021706', N'02', N'17', N'06', N'MARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021707', N'02', N'17', N'07', N'PAMPAS CHICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021708', N'02', N'17', N'08', N'PARARIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021709', N'02', N'17', N'09', N'TAPACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021710', N'02', N'17', N'10', N'TICAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021800', N'02', N'18', N'00', N'SANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021801', N'02', N'18', N'01', N'CHIMBOTE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021802', N'02', N'18', N'02', N'CACERES DEL PERU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021803', N'02', N'18', N'03', N'COISHCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021804', N'02', N'18', N'04', N'MACATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021805', N'02', N'18', N'05', N'MORO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021806', N'02', N'18', N'06', N'NEPEÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021807', N'02', N'18', N'07', N'SAMANCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021808', N'02', N'18', N'08', N'SANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021809', N'02', N'18', N'09', N'NUEVO CHIMBOTE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021900', N'02', N'19', N'00', N'SIHUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021901', N'02', N'19', N'01', N'SIHUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021902', N'02', N'19', N'02', N'ACOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021903', N'02', N'19', N'03', N'ALFONSO UGARTE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021904', N'02', N'19', N'04', N'CASHAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021905', N'02', N'19', N'05', N'CHINGALPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021906', N'02', N'19', N'06', N'HUAYLLABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021907', N'02', N'19', N'07', N'QUICHES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021908', N'02', N'19', N'08', N'RAGASH', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021909', N'02', N'19', N'09', N'SAN JUAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'021910', N'02', N'19', N'10', N'SICSIBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022000', N'02', N'20', N'00', N'YUNGAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022001', N'02', N'20', N'01', N'YUNGAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022002', N'02', N'20', N'02', N'CASCAPARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022003', N'02', N'20', N'03', N'MANCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022004', N'02', N'20', N'04', N'MATACOTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022005', N'02', N'20', N'05', N'QUILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022006', N'02', N'20', N'06', N'RANRAHIRCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022007', N'02', N'20', N'07', N'SHUPLUY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'022008', N'02', N'20', N'08', N'YANAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030000', N'03', N'00', N'00', N'APURIMAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030100', N'03', N'01', N'00', N'ABANCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030101', N'03', N'01', N'01', N'ABANCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030102', N'03', N'01', N'02', N'CHACOCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030103', N'03', N'01', N'03', N'CIRCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030104', N'03', N'01', N'04', N'CURAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030105', N'03', N'01', N'05', N'HUANIPACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030106', N'03', N'01', N'06', N'LAMBRAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030107', N'03', N'01', N'07', N'PICHIRHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030108', N'03', N'01', N'08', N'SAN PEDRO DE CACHORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030109', N'03', N'01', N'09', N'TAMBURCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030200', N'03', N'02', N'00', N'ANDAHUAYLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030201', N'03', N'02', N'01', N'ANDAHUAYLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030202', N'03', N'02', N'02', N'ANDARAPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030203', N'03', N'02', N'03', N'CHIARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030204', N'03', N'02', N'04', N'HUANCARAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030205', N'03', N'02', N'05', N'HUANCARAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030206', N'03', N'02', N'06', N'HUAYANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030207', N'03', N'02', N'07', N'KISHUARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030208', N'03', N'02', N'08', N'PACOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030209', N'03', N'02', N'09', N'PACUCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030210', N'03', N'02', N'10', N'PAMPACHIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030211', N'03', N'02', N'11', N'POMACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030212', N'03', N'02', N'12', N'SAN ANTONIO DE CACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030213', N'03', N'02', N'13', N'SAN JERONIMO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030214', N'03', N'02', N'14', N'SAN MIGUEL DE CHACCRAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030215', N'03', N'02', N'15', N'SANTA MARIA DE CHICMO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030216', N'03', N'02', N'16', N'TALAVERA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030217', N'03', N'02', N'17', N'TUMAY HUARACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030218', N'03', N'02', N'18', N'TURPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030219', N'03', N'02', N'19', N'KAQUIABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030300', N'03', N'03', N'00', N'ANTABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030301', N'03', N'03', N'01', N'ANTABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030302', N'03', N'03', N'02', N'EL ORO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030303', N'03', N'03', N'03', N'HUAQUIRCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030304', N'03', N'03', N'04', N'JUAN ESPINOZA MEDRANO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030305', N'03', N'03', N'05', N'OROPESA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030306', N'03', N'03', N'06', N'PACHACONAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030307', N'03', N'03', N'07', N'SABAINO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030400', N'03', N'04', N'00', N'AYMARAES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030401', N'03', N'04', N'01', N'CHALHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030402', N'03', N'04', N'02', N'CAPAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030403', N'03', N'04', N'03', N'CARAYBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030404', N'03', N'04', N'04', N'CHAPIMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030405', N'03', N'04', N'05', N'COLCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030406', N'03', N'04', N'06', N'COTARUSE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030407', N'03', N'04', N'07', N'HUAYLLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030408', N'03', N'04', N'08', N'JUSTO APU SAHUARAURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030409', N'03', N'04', N'09', N'LUCRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030410', N'03', N'04', N'10', N'POCOHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030411', N'03', N'04', N'11', N'SAN JUAN DE CHACÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030412', N'03', N'04', N'12', N'SAÑAYCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030413', N'03', N'04', N'13', N'SORAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030414', N'03', N'04', N'14', N'TAPAIRIHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030415', N'03', N'04', N'15', N'TINTAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030416', N'03', N'04', N'16', N'TORAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030417', N'03', N'04', N'17', N'YANACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030500', N'03', N'05', N'00', N'COTABAMBAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030501', N'03', N'05', N'01', N'TAMBOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030502', N'03', N'05', N'02', N'COTABAMBAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030503', N'03', N'05', N'03', N'COYLLURQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030504', N'03', N'05', N'04', N'HAQUIRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030505', N'03', N'05', N'05', N'MARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030506', N'03', N'05', N'06', N'CHALLHUAHUACHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030600', N'03', N'06', N'00', N'CHINCHEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030601', N'03', N'06', N'01', N'CHINCHEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030602', N'03', N'06', N'02', N'ANCOÑHUALLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030603', N'03', N'06', N'03', N'COCHARCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030604', N'03', N'06', N'04', N'HUACCANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030605', N'03', N'06', N'05', N'OCOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030606', N'03', N'06', N'06', N'ONGOY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030607', N'03', N'06', N'07', N'URANMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030608', N'03', N'06', N'08', N'RANRACANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030700', N'03', N'07', N'00', N'GRAU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030701', N'03', N'07', N'01', N'CHUQUIBAMBILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030702', N'03', N'07', N'02', N'CURPAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030703', N'03', N'07', N'03', N'GAMARRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030704', N'03', N'07', N'04', N'HUAYLLATI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030705', N'03', N'07', N'05', N'MAMARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030706', N'03', N'07', N'06', N'MICAELA BASTIDAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030707', N'03', N'07', N'07', N'PATAYPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030708', N'03', N'07', N'08', N'PROGRESO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030709', N'03', N'07', N'09', N'SAN ANTONIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030710', N'03', N'07', N'10', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030711', N'03', N'07', N'11', N'TURPAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030712', N'03', N'07', N'12', N'VILCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030713', N'03', N'07', N'13', N'VIRUNDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'030714', N'03', N'07', N'14', N'CURASCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040000', N'04', N'00', N'00', N'AREQUIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040100', N'04', N'01', N'00', N'AREQUIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040101', N'04', N'01', N'01', N'AREQUIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040102', N'04', N'01', N'02', N'ALTO SELVA ALEGRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040103', N'04', N'01', N'03', N'CAYMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040104', N'04', N'01', N'04', N'CERRO COLORADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040105', N'04', N'01', N'05', N'CHARACATO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040106', N'04', N'01', N'06', N'CHIGUATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040107', N'04', N'01', N'07', N'JACOBO HUNTER', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040108', N'04', N'01', N'08', N'LA JOYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040109', N'04', N'01', N'09', N'MARIANO MELGAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040110', N'04', N'01', N'10', N'MIRAFLORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040111', N'04', N'01', N'11', N'MOLLEBAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040112', N'04', N'01', N'12', N'PAUCARPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040113', N'04', N'01', N'13', N'POCSI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040114', N'04', N'01', N'14', N'POLOBAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040115', N'04', N'01', N'15', N'QUEQUEÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040116', N'04', N'01', N'16', N'SABANDIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040117', N'04', N'01', N'17', N'SACHACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040118', N'04', N'01', N'18', N'SAN JUAN DE SIGUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040119', N'04', N'01', N'19', N'SAN JUAN DE TARUCANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040120', N'04', N'01', N'20', N'SANTA ISABEL DE SIGUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040121', N'04', N'01', N'21', N'SANTA RITA DE SIGUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040122', N'04', N'01', N'22', N'SOCABAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040123', N'04', N'01', N'23', N'TIABAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040124', N'04', N'01', N'24', N'UCHUMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040125', N'04', N'01', N'25', N'VITOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040126', N'04', N'01', N'26', N'YANAHUARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040127', N'04', N'01', N'27', N'YARABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040128', N'04', N'01', N'28', N'YURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040129', N'04', N'01', N'29', N'JOSE LUIS BUSTAMANTE Y RIVERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040200', N'04', N'02', N'00', N'CAMANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040201', N'04', N'02', N'01', N'CAMANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040202', N'04', N'02', N'02', N'JOSE MARIA QUIMPER', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040203', N'04', N'02', N'03', N'MARIANO NICOLAS VALCARCEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040204', N'04', N'02', N'04', N'MARISCAL CACERES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040205', N'04', N'02', N'05', N'NICOLAS DE PIEROLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040206', N'04', N'02', N'06', N'OCOÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040207', N'04', N'02', N'07', N'QUILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040208', N'04', N'02', N'08', N'SAMUEL PASTOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040300', N'04', N'03', N'00', N'CARAVELI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040301', N'04', N'03', N'01', N'CARAVELI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040302', N'04', N'03', N'02', N'ACARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040303', N'04', N'03', N'03', N'ATICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040304', N'04', N'03', N'04', N'ATIQUIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040305', N'04', N'03', N'05', N'BELLA UNION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040306', N'04', N'03', N'06', N'CAHUACHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040307', N'04', N'03', N'07', N'CHALA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040308', N'04', N'03', N'08', N'CHAPARRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040309', N'04', N'03', N'09', N'HUANUHUANU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040310', N'04', N'03', N'10', N'JAQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040311', N'04', N'03', N'11', N'LOMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040312', N'04', N'03', N'12', N'QUICACHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040313', N'04', N'03', N'13', N'YAUCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040400', N'04', N'04', N'00', N'CASTILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040401', N'04', N'04', N'01', N'APLAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040402', N'04', N'04', N'02', N'ANDAGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040403', N'04', N'04', N'03', N'AYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040404', N'04', N'04', N'04', N'CHACHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040405', N'04', N'04', N'05', N'CHILCAYMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040406', N'04', N'04', N'06', N'CHOCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040407', N'04', N'04', N'07', N'HUANCARQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040408', N'04', N'04', N'08', N'MACHAGUAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040409', N'04', N'04', N'09', N'ORCOPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040410', N'04', N'04', N'10', N'PAMPACOLCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040411', N'04', N'04', N'11', N'TIPAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040412', N'04', N'04', N'12', N'UÑON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040413', N'04', N'04', N'13', N'URACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040414', N'04', N'04', N'14', N'VIRACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040500', N'04', N'05', N'00', N'CAYLLOMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040501', N'04', N'05', N'01', N'CHIVAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040502', N'04', N'05', N'02', N'ACHOMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040503', N'04', N'05', N'03', N'CABANACONDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040504', N'04', N'05', N'04', N'CALLALLI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040505', N'04', N'05', N'05', N'CAYLLOMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040506', N'04', N'05', N'06', N'COPORAQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040507', N'04', N'05', N'07', N'HUAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040508', N'04', N'05', N'08', N'HUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040509', N'04', N'05', N'09', N'ICHUPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040510', N'04', N'05', N'10', N'LARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040511', N'04', N'05', N'11', N'LLUTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040512', N'04', N'05', N'12', N'MACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040513', N'04', N'05', N'13', N'MADRIGAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040514', N'04', N'05', N'14', N'SAN ANTONIO DE CHUCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040515', N'04', N'05', N'15', N'SIBAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040516', N'04', N'05', N'16', N'TAPAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040517', N'04', N'05', N'17', N'TISCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040518', N'04', N'05', N'18', N'TUTI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040519', N'04', N'05', N'19', N'YANQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040520', N'04', N'05', N'20', N'MAJES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040600', N'04', N'06', N'00', N'CONDESUYOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040601', N'04', N'06', N'01', N'CHUQUIBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040602', N'04', N'06', N'02', N'ANDARAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040603', N'04', N'06', N'03', N'CAYARANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040604', N'04', N'06', N'04', N'CHICHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040605', N'04', N'06', N'05', N'IRAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040606', N'04', N'06', N'06', N'RIO GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040607', N'04', N'06', N'07', N'SALAMANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040608', N'04', N'06', N'08', N'YANAQUIHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040700', N'04', N'07', N'00', N'ISLAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040701', N'04', N'07', N'01', N'MOLLENDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040702', N'04', N'07', N'02', N'COCACHACRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040703', N'04', N'07', N'03', N'DEAN VALDIVIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040704', N'04', N'07', N'04', N'ISLAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040705', N'04', N'07', N'05', N'MEJIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040706', N'04', N'07', N'06', N'PUNTA DE BOMBON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040800', N'04', N'08', N'00', N'LA UNION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040801', N'04', N'08', N'01', N'COTAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040802', N'04', N'08', N'02', N'ALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040803', N'04', N'08', N'03', N'CHARCANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040804', N'04', N'08', N'04', N'HUAYNACOTAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040805', N'04', N'08', N'05', N'PAMPAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040806', N'04', N'08', N'06', N'PUYCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040807', N'04', N'08', N'07', N'QUECHUALLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040808', N'04', N'08', N'08', N'SAYLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040809', N'04', N'08', N'09', N'TAURIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040810', N'04', N'08', N'10', N'TOMEPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'040811', N'04', N'08', N'11', N'TORO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050000', N'05', N'00', N'00', N'AYACUCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050100', N'05', N'01', N'00', N'HUAMANGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050101', N'05', N'01', N'01', N'AYACUCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050102', N'05', N'01', N'02', N'ACOCRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050103', N'05', N'01', N'03', N'ACOS VINCHOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050104', N'05', N'01', N'04', N'CARMEN ALTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050105', N'05', N'01', N'05', N'CHIARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050106', N'05', N'01', N'06', N'OCROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050107', N'05', N'01', N'07', N'PACAYCASA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050108', N'05', N'01', N'08', N'QUINUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050109', N'05', N'01', N'09', N'SAN JOSE DE TICLLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050110', N'05', N'01', N'10', N'SAN JUAN BAUTISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050111', N'05', N'01', N'11', N'SANTIAGO DE PISCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050112', N'05', N'01', N'12', N'SOCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050113', N'05', N'01', N'13', N'TAMBILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050114', N'05', N'01', N'14', N'VINCHOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050115', N'05', N'01', N'15', N'JESUS NAZARENO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050116', N'05', N'01', N'16', N'ANDRES AVELINO CACERES DORREGAY', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050200', N'05', N'02', N'00', N'CANGALLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050201', N'05', N'02', N'01', N'CANGALLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050202', N'05', N'02', N'02', N'CHUSCHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050203', N'05', N'02', N'03', N'LOS MOROCHUCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050204', N'05', N'02', N'04', N'MARIA PARADO DE BELLIDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050205', N'05', N'02', N'05', N'PARAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050206', N'05', N'02', N'06', N'TOTOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050300', N'05', N'03', N'00', N'HUANCA SANCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050301', N'05', N'03', N'01', N'SANCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050302', N'05', N'03', N'02', N'CARAPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050303', N'05', N'03', N'03', N'SACSAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050304', N'05', N'03', N'04', N'SANTIAGO DE LUCANAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050400', N'05', N'04', N'00', N'HUANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050401', N'05', N'04', N'01', N'HUANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050402', N'05', N'04', N'02', N'AYAHUANCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050403', N'05', N'04', N'03', N'HUAMANGUILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050404', N'05', N'04', N'04', N'IGUAIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050405', N'05', N'04', N'05', N'LURICOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050406', N'05', N'04', N'06', N'SANTILLANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050407', N'05', N'04', N'07', N'SIVIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050408', N'05', N'04', N'08', N'LLOCHEGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050409', N'05', N'04', N'09', N'CANAYRE', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050500', N'05', N'05', N'00', N'LA MAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050501', N'05', N'05', N'01', N'SAN MIGUEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050502', N'05', N'05', N'02', N'ANCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050503', N'05', N'05', N'03', N'AYNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050504', N'05', N'05', N'04', N'CHILCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050505', N'05', N'05', N'05', N'CHUNGUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050506', N'05', N'05', N'06', N'LUIS CARRANZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050507', N'05', N'05', N'07', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050508', N'05', N'05', N'08', N'TAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050509', N'05', N'05', N'09', N'SAMUGARI', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050510', N'05', N'05', N'10', N'ANCHIHUAY', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050600', N'05', N'06', N'00', N'LUCANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050601', N'05', N'06', N'01', N'PUQUIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050602', N'05', N'06', N'02', N'AUCARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050603', N'05', N'06', N'03', N'CABANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050604', N'05', N'06', N'04', N'CARMEN SALCEDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050605', N'05', N'06', N'05', N'CHAVIÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050606', N'05', N'06', N'06', N'CHIPAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050607', N'05', N'06', N'07', N'HUACÑHUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050608', N'05', N'06', N'08', N'LARAMATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050609', N'05', N'06', N'09', N'LEONCIO PRADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050610', N'05', N'06', N'10', N'LLAUTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050611', N'05', N'06', N'11', N'LUCANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050612', N'05', N'06', N'12', N'OCAÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050613', N'05', N'06', N'13', N'OTOCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050614', N'05', N'06', N'14', N'SAISA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050615', N'05', N'06', N'15', N'SAN CRISTOBAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050616', N'05', N'06', N'16', N'SAN JUAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050617', N'05', N'06', N'17', N'SAN PEDRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050618', N'05', N'06', N'18', N'SAN PEDRO DE PALCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050619', N'05', N'06', N'19', N'SANCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050620', N'05', N'06', N'20', N'SANTA ANA DE HUAYCAHUACHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050621', N'05', N'06', N'21', N'SANTA LUCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050700', N'05', N'07', N'00', N'PARINACOCHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050701', N'05', N'07', N'01', N'CORACORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050702', N'05', N'07', N'02', N'CHUMPI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050703', N'05', N'07', N'03', N'CORONEL CASTAÑEDA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050704', N'05', N'07', N'04', N'PACAPAUSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050705', N'05', N'07', N'05', N'PULLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050706', N'05', N'07', N'06', N'PUYUSCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050707', N'05', N'07', N'07', N'SAN FRANCISCO DE RAVACAYCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050708', N'05', N'07', N'08', N'UPAHUACHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050800', N'05', N'08', N'00', N'PAUCAR DEL SARA SARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050801', N'05', N'08', N'01', N'PAUSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050802', N'05', N'08', N'02', N'COLTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050803', N'05', N'08', N'03', N'CORCULLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050804', N'05', N'08', N'04', N'LAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050805', N'05', N'08', N'05', N'MARCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050806', N'05', N'08', N'06', N'OYOLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050807', N'05', N'08', N'07', N'PARARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050808', N'05', N'08', N'08', N'SAN JAVIER DE ALPABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050809', N'05', N'08', N'09', N'SAN JOSE DE USHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050810', N'05', N'08', N'10', N'SARA SARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050900', N'05', N'09', N'00', N'SUCRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050901', N'05', N'09', N'01', N'QUEROBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050902', N'05', N'09', N'02', N'BELEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050903', N'05', N'09', N'03', N'CHALCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050904', N'05', N'09', N'04', N'CHILCAYOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050905', N'05', N'09', N'05', N'HUACAÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050906', N'05', N'09', N'06', N'MORCOLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050907', N'05', N'09', N'07', N'PAICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050908', N'05', N'09', N'08', N'SAN PEDRO DE LARCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050909', N'05', N'09', N'09', N'SAN SALVADOR DE QUIJE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050910', N'05', N'09', N'10', N'SANTIAGO DE PAUCARAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'050911', N'05', N'09', N'11', N'SORAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051000', N'05', N'10', N'00', N'VICTOR FAJARDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051001', N'05', N'10', N'01', N'HUANCAPI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051002', N'05', N'10', N'02', N'ALCAMENCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051003', N'05', N'10', N'03', N'APONGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051004', N'05', N'10', N'04', N'ASQUIPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051005', N'05', N'10', N'05', N'CANARIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051006', N'05', N'10', N'06', N'CAYARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051007', N'05', N'10', N'07', N'COLCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051008', N'05', N'10', N'08', N'HUAMANQUIQUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051009', N'05', N'10', N'09', N'HUANCARAYLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051010', N'05', N'10', N'10', N'HUAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051011', N'05', N'10', N'11', N'SARHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051012', N'05', N'10', N'12', N'VILCANCHOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051100', N'05', N'11', N'00', N'VILCAS HUAMAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051101', N'05', N'11', N'01', N'VILCAS HUAMAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051102', N'05', N'11', N'02', N'ACCOMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051103', N'05', N'11', N'03', N'CARHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051104', N'05', N'11', N'04', N'CONCEPCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051105', N'05', N'11', N'05', N'HUAMBALPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051106', N'05', N'11', N'06', N'INDEPENDENCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051107', N'05', N'11', N'07', N'SAURAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'051108', N'05', N'11', N'08', N'VISCHONGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060000', N'06', N'00', N'00', N'CAJAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060100', N'06', N'01', N'00', N'CAJAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060101', N'06', N'01', N'01', N'CAJAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060102', N'06', N'01', N'02', N'ASUNCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060103', N'06', N'01', N'03', N'CHETILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060104', N'06', N'01', N'04', N'COSPAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060105', N'06', N'01', N'05', N'ENCAÑADA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060106', N'06', N'01', N'06', N'JESUS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060107', N'06', N'01', N'07', N'LLACANORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060108', N'06', N'01', N'08', N'LOS BAÑOS DEL INCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060109', N'06', N'01', N'09', N'MAGDALENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060110', N'06', N'01', N'10', N'MATARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060111', N'06', N'01', N'11', N'NAMORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060112', N'06', N'01', N'12', N'SAN JUAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060200', N'06', N'02', N'00', N'CAJABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060201', N'06', N'02', N'01', N'CAJABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060202', N'06', N'02', N'02', N'CACHACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060203', N'06', N'02', N'03', N'CONDEBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060204', N'06', N'02', N'04', N'SITACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060300', N'06', N'03', N'00', N'CELENDIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060301', N'06', N'03', N'01', N'CELENDIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060302', N'06', N'03', N'02', N'CHUMUCH', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060303', N'06', N'03', N'03', N'CORTEGANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060304', N'06', N'03', N'04', N'HUASMIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060305', N'06', N'03', N'05', N'JORGE CHAVEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060306', N'06', N'03', N'06', N'JOSE GALVEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060307', N'06', N'03', N'07', N'MIGUEL IGLESIAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060308', N'06', N'03', N'08', N'OXAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060309', N'06', N'03', N'09', N'SOROCHUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060310', N'06', N'03', N'10', N'SUCRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060311', N'06', N'03', N'11', N'UTCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060312', N'06', N'03', N'12', N'LA LIBERTAD DE PALLAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060400', N'06', N'04', N'00', N'CHOTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060401', N'06', N'04', N'01', N'CHOTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060402', N'06', N'04', N'02', N'ANGUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060403', N'06', N'04', N'03', N'CHADIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060404', N'06', N'04', N'04', N'CHIGUIRIP', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060405', N'06', N'04', N'05', N'CHIMBAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060406', N'06', N'04', N'06', N'CHOROPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060407', N'06', N'04', N'07', N'COCHABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060408', N'06', N'04', N'08', N'CONCHAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060409', N'06', N'04', N'09', N'HUAMBOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060410', N'06', N'04', N'10', N'LAJAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060411', N'06', N'04', N'11', N'LLAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060412', N'06', N'04', N'12', N'MIRACOSTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060413', N'06', N'04', N'13', N'PACCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060414', N'06', N'04', N'14', N'PION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060415', N'06', N'04', N'15', N'QUEROCOTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060416', N'06', N'04', N'16', N'SAN JUAN DE LICUPIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060417', N'06', N'04', N'17', N'TACABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060418', N'06', N'04', N'18', N'TOCMOCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060419', N'06', N'04', N'19', N'CHALAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060500', N'06', N'05', N'00', N'CONTUMAZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060501', N'06', N'05', N'01', N'CONTUMAZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060502', N'06', N'05', N'02', N'CHILETE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060503', N'06', N'05', N'03', N'CUPISNIQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060504', N'06', N'05', N'04', N'GUZMANGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060505', N'06', N'05', N'05', N'SAN BENITO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060506', N'06', N'05', N'06', N'SANTA CRUZ DE TOLED', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060507', N'06', N'05', N'07', N'TANTARICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060508', N'06', N'05', N'08', N'YONAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060600', N'06', N'06', N'00', N'CUTERVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060601', N'06', N'06', N'01', N'CUTERVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060602', N'06', N'06', N'02', N'CALLAYUC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060603', N'06', N'06', N'03', N'CHOROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060604', N'06', N'06', N'04', N'CUJILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060605', N'06', N'06', N'05', N'LA RAMADA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060606', N'06', N'06', N'06', N'PIMPINGOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060607', N'06', N'06', N'07', N'QUEROCOTILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060608', N'06', N'06', N'08', N'SAN ANDRES DE CUTERVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060609', N'06', N'06', N'09', N'SAN JUAN DE CUTERVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060610', N'06', N'06', N'10', N'SAN LUIS DE LUCMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060611', N'06', N'06', N'11', N'SANTA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060612', N'06', N'06', N'12', N'SANTO DOMINGO DE LA CAPILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060613', N'06', N'06', N'13', N'SANTO TOMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060614', N'06', N'06', N'14', N'SOCOTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060615', N'06', N'06', N'15', N'TORIBIO CASANOVA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060700', N'06', N'07', N'00', N'HUALGAYOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060701', N'06', N'07', N'01', N'BAMBAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060702', N'06', N'07', N'02', N'CHUGUR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060703', N'06', N'07', N'03', N'HUALGAYOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060800', N'06', N'08', N'00', N'JAEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060801', N'06', N'08', N'01', N'JAEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060802', N'06', N'08', N'02', N'BELLAVISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060803', N'06', N'08', N'03', N'CHONTALI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060804', N'06', N'08', N'04', N'COLASAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060805', N'06', N'08', N'05', N'HUABAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060806', N'06', N'08', N'06', N'LAS PIRIAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060807', N'06', N'08', N'07', N'POMAHUACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060808', N'06', N'08', N'08', N'PUCARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060809', N'06', N'08', N'09', N'SALLIQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060810', N'06', N'08', N'10', N'SAN FELIPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060811', N'06', N'08', N'11', N'SAN JOSE DEL ALTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060812', N'06', N'08', N'12', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060900', N'06', N'09', N'00', N'SAN IGNACIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060901', N'06', N'09', N'01', N'SAN IGNACIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060902', N'06', N'09', N'02', N'CHIRINOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060903', N'06', N'09', N'03', N'HUARANGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060904', N'06', N'09', N'04', N'LA COIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060905', N'06', N'09', N'05', N'NAMBALLE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060906', N'06', N'09', N'06', N'SAN JOSE DE LOURDES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'060907', N'06', N'09', N'07', N'TABACONAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061000', N'06', N'10', N'00', N'SAN MARCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061001', N'06', N'10', N'01', N'PEDRO GALVEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061002', N'06', N'10', N'02', N'CHANCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061003', N'06', N'10', N'03', N'EDUARDO VILLANUEVA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061004', N'06', N'10', N'04', N'GREGORIO PITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061005', N'06', N'10', N'05', N'ICHOCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061006', N'06', N'10', N'06', N'JOSE MANUEL QUIROZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061007', N'06', N'10', N'07', N'JOSE SABOGAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061100', N'06', N'11', N'00', N'SAN MIGUEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061101', N'06', N'11', N'01', N'SAN MIGUEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061102', N'06', N'11', N'02', N'BOLIVAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061103', N'06', N'11', N'03', N'CALQUIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061104', N'06', N'11', N'04', N'CATILLUC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061105', N'06', N'11', N'05', N'EL PRADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061106', N'06', N'11', N'06', N'LA FLORIDA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061107', N'06', N'11', N'07', N'LLAPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061108', N'06', N'11', N'08', N'NANCHOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061109', N'06', N'11', N'09', N'NIEPOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061110', N'06', N'11', N'10', N'SAN GREGORIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061111', N'06', N'11', N'11', N'SAN SILVESTRE DE COCHAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061112', N'06', N'11', N'12', N'TONGOD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061113', N'06', N'11', N'13', N'UNION AGUA BLANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061200', N'06', N'12', N'00', N'SAN PABLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061201', N'06', N'12', N'01', N'SAN PABLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061202', N'06', N'12', N'02', N'SAN BERNARDINO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061203', N'06', N'12', N'03', N'SAN LUIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061204', N'06', N'12', N'04', N'TUMBADEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061300', N'06', N'13', N'00', N'SANTA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061301', N'06', N'13', N'01', N'SANTA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061302', N'06', N'13', N'02', N'ANDABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061303', N'06', N'13', N'03', N'CATACHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061304', N'06', N'13', N'04', N'CHANCAYBAÑOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061305', N'06', N'13', N'05', N'LA ESPERANZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061306', N'06', N'13', N'06', N'NINABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061307', N'06', N'13', N'07', N'PULAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061308', N'06', N'13', N'08', N'SAUCEPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061309', N'06', N'13', N'09', N'SEXI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061310', N'06', N'13', N'10', N'UTICYACU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'061311', N'06', N'13', N'11', N'YAUYUCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070000', N'07', N'00', N'00', N'CALLAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070100', N'07', N'01', N'00', N'CALLAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070101', N'07', N'01', N'01', N'CALLAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070102', N'07', N'01', N'02', N'BELLAVISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070103', N'07', N'01', N'03', N'CARMEN DE LA LEGUA REYNOSO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070104', N'07', N'01', N'04', N'LA PERLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070105', N'07', N'01', N'05', N'LA PUNTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'070106', N'07', N'01', N'06', N'VENTANILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080000', N'08', N'00', N'00', N'CUSCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080100', N'08', N'01', N'00', N'CUSCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080101', N'08', N'01', N'01', N'CUSCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080102', N'08', N'01', N'02', N'CCORCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080103', N'08', N'01', N'03', N'POROY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080104', N'08', N'01', N'04', N'SAN JERONIMO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080105', N'08', N'01', N'05', N'SAN SEBASTIAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080106', N'08', N'01', N'06', N'SANTIAGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080107', N'08', N'01', N'07', N'SAYLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080108', N'08', N'01', N'08', N'WANCHAQ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080200', N'08', N'02', N'00', N'ACOMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080201', N'08', N'02', N'01', N'ACOMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080202', N'08', N'02', N'02', N'ACOPIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080203', N'08', N'02', N'03', N'ACOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080204', N'08', N'02', N'04', N'MOSOC LLACTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080205', N'08', N'02', N'05', N'POMACANCHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080206', N'08', N'02', N'06', N'RONDOCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080207', N'08', N'02', N'07', N'SANGARARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080300', N'08', N'03', N'00', N'ANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080301', N'08', N'03', N'01', N'ANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080302', N'08', N'03', N'02', N'ANCAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080303', N'08', N'03', N'03', N'CACHIMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080304', N'08', N'03', N'04', N'CHINCHAYPUJIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080305', N'08', N'03', N'05', N'HUAROCONDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080306', N'08', N'03', N'06', N'LIMATAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080307', N'08', N'03', N'07', N'MOLLEPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080308', N'08', N'03', N'08', N'PUCYURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080309', N'08', N'03', N'09', N'ZURITE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080400', N'08', N'04', N'00', N'CALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080401', N'08', N'04', N'01', N'CALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080402', N'08', N'04', N'02', N'COYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080403', N'08', N'04', N'03', N'LAMAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080404', N'08', N'04', N'04', N'LARES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080405', N'08', N'04', N'05', N'PISAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080406', N'08', N'04', N'06', N'SAN SALVADOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080407', N'08', N'04', N'07', N'TARAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080408', N'08', N'04', N'08', N'YANATILE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080500', N'08', N'05', N'00', N'CANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080501', N'08', N'05', N'01', N'YANAOCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080502', N'08', N'05', N'02', N'CHECCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080503', N'08', N'05', N'03', N'KUNTURKANKI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080504', N'08', N'05', N'04', N'LANGUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080505', N'08', N'05', N'05', N'LAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080506', N'08', N'05', N'06', N'PAMPAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080507', N'08', N'05', N'07', N'QUEHUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080508', N'08', N'05', N'08', N'TUPAC AMARU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080600', N'08', N'06', N'00', N'CANCHIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080601', N'08', N'06', N'01', N'SICUANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080602', N'08', N'06', N'02', N'CHECACUPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080603', N'08', N'06', N'03', N'COMBAPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080604', N'08', N'06', N'04', N'MARANGANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080605', N'08', N'06', N'05', N'PITUMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080606', N'08', N'06', N'06', N'SAN PABLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080607', N'08', N'06', N'07', N'SAN PEDRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080608', N'08', N'06', N'08', N'TINTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080700', N'08', N'07', N'00', N'CHUMBIVILCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080701', N'08', N'07', N'01', N'SANTO TOMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080702', N'08', N'07', N'02', N'CAPACMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080703', N'08', N'07', N'03', N'CHAMACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080704', N'08', N'07', N'04', N'COLQUEMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080705', N'08', N'07', N'05', N'LIVITACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080706', N'08', N'07', N'06', N'LLUSCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080707', N'08', N'07', N'07', N'QUIÑOTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080708', N'08', N'07', N'08', N'VELILLE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080800', N'08', N'08', N'00', N'ESPINAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080801', N'08', N'08', N'01', N'ESPINAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080802', N'08', N'08', N'02', N'CONDOROMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080803', N'08', N'08', N'03', N'COPORAQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080804', N'08', N'08', N'04', N'OCORURO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080805', N'08', N'08', N'05', N'PALLPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080806', N'08', N'08', N'06', N'PICHIGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080807', N'08', N'08', N'07', N'SUYCKUTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080808', N'08', N'08', N'08', N'ALTO PICHIGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080900', N'08', N'09', N'00', N'LA CONVENCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080901', N'08', N'09', N'01', N'SANTA ANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080902', N'08', N'09', N'02', N'ECHARATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080903', N'08', N'09', N'03', N'HUAYOPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080904', N'08', N'09', N'04', N'MARANURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080905', N'08', N'09', N'05', N'OCOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080906', N'08', N'09', N'06', N'QUELLOUNO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080907', N'08', N'09', N'07', N'KIMBIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080908', N'08', N'09', N'08', N'SANTA TERESA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080909', N'08', N'09', N'09', N'VILCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'080910', N'08', N'09', N'10', N'PICHARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081000', N'08', N'10', N'00', N'PARURO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081001', N'08', N'10', N'01', N'PARURO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081002', N'08', N'10', N'02', N'ACCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081003', N'08', N'10', N'03', N'CCAPI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081004', N'08', N'10', N'04', N'COLCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081005', N'08', N'10', N'05', N'HUANOQUITE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081006', N'08', N'10', N'06', N'OMACHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081007', N'08', N'10', N'07', N'PACCARITAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081008', N'08', N'10', N'08', N'PILLPINTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081009', N'08', N'10', N'09', N'YAURISQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081100', N'08', N'11', N'00', N'PAUCARTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081101', N'08', N'11', N'01', N'PAUCARTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081102', N'08', N'11', N'02', N'CAICAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081103', N'08', N'11', N'03', N'CHALLABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081104', N'08', N'11', N'04', N'COLQUEPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081105', N'08', N'11', N'05', N'HUANCARANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081106', N'08', N'11', N'06', N'KOSÑIPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081200', N'08', N'12', N'00', N'QUISPICANCHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081201', N'08', N'12', N'01', N'URCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081202', N'08', N'12', N'02', N'ANDAHUAYLILLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081203', N'08', N'12', N'03', N'CAMANTI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081204', N'08', N'12', N'04', N'CCARHUAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081205', N'08', N'12', N'05', N'CCATCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081206', N'08', N'12', N'06', N'CUSIPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081207', N'08', N'12', N'07', N'HUARO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081208', N'08', N'12', N'08', N'LUCRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081209', N'08', N'12', N'09', N'MARCAPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081210', N'08', N'12', N'10', N'OCONGATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081211', N'08', N'12', N'11', N'OROPESA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081212', N'08', N'12', N'12', N'QUIQUIJANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081300', N'08', N'13', N'00', N'URUBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081301', N'08', N'13', N'01', N'URUBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081302', N'08', N'13', N'02', N'CHINCHERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081303', N'08', N'13', N'03', N'HUAYLLABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081304', N'08', N'13', N'04', N'MACHUPICCHU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081305', N'08', N'13', N'05', N'MARAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081306', N'08', N'13', N'06', N'OLLANTAYTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'081307', N'08', N'13', N'07', N'YUCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090000', N'09', N'00', N'00', N'HUANCAVELICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090100', N'09', N'01', N'00', N'HUANCAVELICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090101', N'09', N'01', N'01', N'HUANCAVELICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090102', N'09', N'01', N'02', N'ACOBAMBILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090103', N'09', N'01', N'03', N'ACORIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090104', N'09', N'01', N'04', N'CONAYCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090105', N'09', N'01', N'05', N'CUENCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090106', N'09', N'01', N'06', N'HUACHOCOLPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090107', N'09', N'01', N'07', N'HUAYLLAHUARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090108', N'09', N'01', N'08', N'IZCUCHACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090109', N'09', N'01', N'09', N'LARIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090110', N'09', N'01', N'10', N'MANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090111', N'09', N'01', N'11', N'MARISCAL CACERES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090112', N'09', N'01', N'12', N'MOYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090113', N'09', N'01', N'13', N'NUEVO OCCORO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090114', N'09', N'01', N'14', N'PALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090115', N'09', N'01', N'15', N'PILCHACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090116', N'09', N'01', N'16', N'VILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090117', N'09', N'01', N'17', N'YAULI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090118', N'09', N'01', N'18', N'ASCENSION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090119', N'09', N'01', N'19', N'HUANDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090200', N'09', N'02', N'00', N'ACOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090201', N'09', N'02', N'01', N'ACOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090202', N'09', N'02', N'02', N'ANDABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090203', N'09', N'02', N'03', N'ANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090204', N'09', N'02', N'04', N'CAJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090205', N'09', N'02', N'05', N'MARCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090206', N'09', N'02', N'06', N'PAUCARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090207', N'09', N'02', N'07', N'POMACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090208', N'09', N'02', N'08', N'ROSARIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090300', N'09', N'03', N'00', N'ANGARAES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090301', N'09', N'03', N'01', N'LIRCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090302', N'09', N'03', N'02', N'ANCHONGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090303', N'09', N'03', N'03', N'CALLANMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090304', N'09', N'03', N'04', N'CCOCHACCASA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090305', N'09', N'03', N'05', N'CHINCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090306', N'09', N'03', N'06', N'CONGALLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090307', N'09', N'03', N'07', N'HUANCAÑHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090308', N'09', N'03', N'08', N'HUAYLLAY GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090309', N'09', N'03', N'09', N'JULCAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090310', N'09', N'03', N'10', N'SAN ANTONIO DE ANTAPARCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090311', N'09', N'03', N'11', N'SANTO TOMAS DE PATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090312', N'09', N'03', N'12', N'SECCLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090400', N'09', N'04', N'00', N'CASTROVIRREYNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090401', N'09', N'04', N'01', N'CASTROVIRREYNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090402', N'09', N'04', N'02', N'ARMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090403', N'09', N'04', N'03', N'AURAHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090404', N'09', N'04', N'04', N'CAPILLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090405', N'09', N'04', N'05', N'CHUPAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090406', N'09', N'04', N'06', N'COCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090407', N'09', N'04', N'07', N'HUACHOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090408', N'09', N'04', N'08', N'HUAMATAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090409', N'09', N'04', N'09', N'MOLLEPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090410', N'09', N'04', N'10', N'SAN JUAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090411', N'09', N'04', N'11', N'SANTA ANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090412', N'09', N'04', N'12', N'TANTARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090413', N'09', N'04', N'13', N'TICRAPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090500', N'09', N'05', N'00', N'CHURCAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090501', N'09', N'05', N'01', N'CHURCAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090502', N'09', N'05', N'02', N'ANCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090503', N'09', N'05', N'03', N'CHINCHIHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090504', N'09', N'05', N'04', N'EL CARMEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090505', N'09', N'05', N'05', N'LA MERCED', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090506', N'09', N'05', N'06', N'LOCROJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090507', N'09', N'05', N'07', N'PAUCARBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090508', N'09', N'05', N'08', N'SAN MIGUEL DE MAYOCC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090509', N'09', N'05', N'09', N'SAN PEDRO DE CORIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090510', N'09', N'05', N'10', N'PACHAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090511', N'09', N'05', N'11', N'COSME', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090600', N'09', N'06', N'00', N'HUAYTARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090601', N'09', N'06', N'01', N'HUAYTARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090602', N'09', N'06', N'02', N'AYAVI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090603', N'09', N'06', N'03', N'CORDOVA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090604', N'09', N'06', N'04', N'HUAYACUNDO ARMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090605', N'09', N'06', N'05', N'LARAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090606', N'09', N'06', N'06', N'OCOYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090607', N'09', N'06', N'07', N'PILPICHACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090608', N'09', N'06', N'08', N'QUERCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090609', N'09', N'06', N'09', N'QUITOÑARMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090610', N'09', N'06', N'10', N'SAN ANTONIO DE CUSICANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090611', N'09', N'06', N'11', N'SAN FRANCISCO DE SANGAYAICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090612', N'09', N'06', N'12', N'SAN ISIDRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090613', N'09', N'06', N'13', N'SANTIAGO DE CHOCORVOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090614', N'09', N'06', N'14', N'SANTIAGO DE QUIRAHUARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090615', N'09', N'06', N'15', N'SANTO DOMINGO DE CAPILLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090616', N'09', N'06', N'16', N'TAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090700', N'09', N'07', N'00', N'TAYACAJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090701', N'09', N'07', N'01', N'PAMPAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090702', N'09', N'07', N'02', N'ACOSTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090703', N'09', N'07', N'03', N'ACRAQUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090704', N'09', N'07', N'04', N'AHUAYCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090705', N'09', N'07', N'05', N'COLCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090706', N'09', N'07', N'06', N'DANIEL HERNANDEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090707', N'09', N'07', N'07', N'HUACHOCOLPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090709', N'09', N'07', N'09', N'HUARIBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090710', N'09', N'07', N'10', N'ÑAHUIMPUQUIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090711', N'09', N'07', N'11', N'PAZOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090713', N'09', N'07', N'13', N'QUISHUAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090714', N'09', N'07', N'14', N'SALCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090715', N'09', N'07', N'15', N'SALCAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090716', N'09', N'07', N'16', N'SAN MARCOS DE ROCCHAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090717', N'09', N'07', N'17', N'SURCUBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'090718', N'09', N'07', N'18', N'TINTAY PUNCU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100000', N'10', N'00', N'00', N'HUANUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100100', N'10', N'01', N'00', N'HUANUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100101', N'10', N'01', N'01', N'HUANUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100102', N'10', N'01', N'02', N'AMARILIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100103', N'10', N'01', N'03', N'CHINCHAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100104', N'10', N'01', N'04', N'CHURUBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100105', N'10', N'01', N'05', N'MARGOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100106', N'10', N'01', N'06', N'QUISQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100107', N'10', N'01', N'07', N'SAN FRANCISCO DE CAYRAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100108', N'10', N'01', N'08', N'SAN PEDRO DE CHAULAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100109', N'10', N'01', N'09', N'SANTA MARIA DEL VALLE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100110', N'10', N'01', N'10', N'YARUMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100111', N'10', N'01', N'11', N'PILLCO MARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100112', N'10', N'01', N'12', N'YACUS', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100200', N'10', N'02', N'00', N'AMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100201', N'10', N'02', N'01', N'AMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100202', N'10', N'02', N'02', N'CAYNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100203', N'10', N'02', N'03', N'COLPAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100204', N'10', N'02', N'04', N'CONCHAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100205', N'10', N'02', N'05', N'HUACAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100206', N'10', N'02', N'06', N'SAN FRANCISCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100207', N'10', N'02', N'07', N'SAN RAFAEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100208', N'10', N'02', N'08', N'TOMAY KICHWA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100300', N'10', N'03', N'00', N'DOS DE MAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100301', N'10', N'03', N'01', N'LA UNION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100307', N'10', N'03', N'07', N'CHUQUIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100311', N'10', N'03', N'11', N'MARIAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100313', N'10', N'03', N'13', N'PACHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100316', N'10', N'03', N'16', N'QUIVILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100317', N'10', N'03', N'17', N'RIPAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100321', N'10', N'03', N'21', N'SHUNQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100322', N'10', N'03', N'22', N'SILLAPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100323', N'10', N'03', N'23', N'YANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100400', N'10', N'04', N'00', N'HUACAYBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100401', N'10', N'04', N'01', N'HUACAYBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100402', N'10', N'04', N'02', N'CANCHABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100403', N'10', N'04', N'03', N'COCHABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100404', N'10', N'04', N'04', N'PINRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100500', N'10', N'05', N'00', N'HUAMALIES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100501', N'10', N'05', N'01', N'LLATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100502', N'10', N'05', N'02', N'ARANCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100503', N'10', N'05', N'03', N'CHAVIN DE PARIARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100504', N'10', N'05', N'04', N'JACAS GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100505', N'10', N'05', N'05', N'JIRCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100506', N'10', N'05', N'06', N'MIRAFLORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100507', N'10', N'05', N'07', N'MONZON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100508', N'10', N'05', N'08', N'PUNCHAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100509', N'10', N'05', N'09', N'PUÑOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100510', N'10', N'05', N'10', N'SINGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100511', N'10', N'05', N'11', N'TANTAMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100600', N'10', N'06', N'00', N'LEONCIO PRADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100601', N'10', N'06', N'01', N'RUPAÑRUPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100602', N'10', N'06', N'02', N'DANIEL ALOMIA ROBLES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100603', N'10', N'06', N'03', N'HERMILIO VALDIZAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100604', N'10', N'06', N'04', N'JOSE CRESPO Y CASTILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100605', N'10', N'06', N'05', N'LUYANDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100606', N'10', N'06', N'06', N'MARIANO DAMASO BERAUN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100700', N'10', N'07', N'00', N'MARAÑON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100701', N'10', N'07', N'01', N'HUACRACHUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100702', N'10', N'07', N'02', N'CHOLON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100703', N'10', N'07', N'03', N'SAN BUENAVENTURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100800', N'10', N'08', N'00', N'PACHITEA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100801', N'10', N'08', N'01', N'PANAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100802', N'10', N'08', N'02', N'CHAGLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100803', N'10', N'08', N'03', N'MOLINO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100804', N'10', N'08', N'04', N'UMARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100900', N'10', N'09', N'00', N'PUERTO INCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100901', N'10', N'09', N'01', N'PUERTO INCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100902', N'10', N'09', N'02', N'CODO DEL POZUZO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100903', N'10', N'09', N'03', N'HONORIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100904', N'10', N'09', N'04', N'TOURNAVISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'100905', N'10', N'09', N'05', N'YUYAPICHIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101000', N'10', N'10', N'00', N'LAURICOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101001', N'10', N'10', N'01', N'JESUS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101002', N'10', N'10', N'02', N'BAÑOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101003', N'10', N'10', N'03', N'JIVIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101004', N'10', N'10', N'04', N'QUEROPALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101005', N'10', N'10', N'05', N'RONDOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101006', N'10', N'10', N'06', N'SAN FRANCISCO DE ASIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101007', N'10', N'10', N'07', N'SAN MIGUEL DE CAURI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101100', N'10', N'11', N'00', N'YAROWILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101101', N'10', N'11', N'01', N'CHAVINILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101102', N'10', N'11', N'02', N'CAHUAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101103', N'10', N'11', N'03', N'CHACABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101104', N'10', N'11', N'04', N'APARICIO POMARES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101105', N'10', N'11', N'05', N'JACAS CHICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101106', N'10', N'11', N'06', N'OBAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101107', N'10', N'11', N'07', N'PAMPAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'101108', N'10', N'11', N'08', N'CHORAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110000', N'11', N'00', N'00', N'ICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110100', N'11', N'01', N'00', N'ICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110101', N'11', N'01', N'01', N'ICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110102', N'11', N'01', N'02', N'LA TINGUIÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110103', N'11', N'01', N'03', N'LOS AQUIJES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110104', N'11', N'01', N'04', N'OCUCAJE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110105', N'11', N'01', N'05', N'PACHACUTEC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110106', N'11', N'01', N'06', N'PARCONA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110107', N'11', N'01', N'07', N'PUEBLO NUEVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110108', N'11', N'01', N'08', N'SALAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110109', N'11', N'01', N'09', N'SAN JOSE DE LOS MOLINOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110110', N'11', N'01', N'10', N'SAN JUAN BAUTISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110111', N'11', N'01', N'11', N'SANTIAGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110112', N'11', N'01', N'12', N'SUBTANJALLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110113', N'11', N'01', N'13', N'TATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110114', N'11', N'01', N'14', N'YAUCA DEL ROSARIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110200', N'11', N'02', N'00', N'CHINCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110201', N'11', N'02', N'01', N'CHINCHA ALTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110202', N'11', N'02', N'02', N'ALTO LARAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110203', N'11', N'02', N'03', N'CHAVIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110204', N'11', N'02', N'04', N'CHINCHA BAJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110205', N'11', N'02', N'05', N'EL CARMEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110206', N'11', N'02', N'06', N'GROCIO PRADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110207', N'11', N'02', N'07', N'PUEBLO NUEVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110208', N'11', N'02', N'08', N'SAN JUAN DE YANAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110209', N'11', N'02', N'09', N'SAN PEDRO DE HUACARPANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110210', N'11', N'02', N'10', N'SUNAMPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110211', N'11', N'02', N'11', N'TAMBO DE MORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110300', N'11', N'03', N'00', N'NAZCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110301', N'11', N'03', N'01', N'NAZCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110302', N'11', N'03', N'02', N'CHANGUILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110303', N'11', N'03', N'03', N'EL INGENIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110304', N'11', N'03', N'04', N'MARCONA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110305', N'11', N'03', N'05', N'VISTA ALEGRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110400', N'11', N'04', N'00', N'PALPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110401', N'11', N'04', N'01', N'PALPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110402', N'11', N'04', N'02', N'LLIPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110403', N'11', N'04', N'03', N'RIO GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110404', N'11', N'04', N'04', N'SANTA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110405', N'11', N'04', N'05', N'TIBILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110500', N'11', N'05', N'00', N'PISCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110501', N'11', N'05', N'01', N'PISCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110502', N'11', N'05', N'02', N'HUANCANO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110503', N'11', N'05', N'03', N'HUMAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110504', N'11', N'05', N'04', N'INDEPENDENCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110505', N'11', N'05', N'05', N'PARACAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110506', N'11', N'05', N'06', N'SAN ANDRES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110507', N'11', N'05', N'07', N'SAN CLEMENTE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'110508', N'11', N'05', N'08', N'TUPAC AMARU INCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120000', N'12', N'00', N'00', N'JUNIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120100', N'12', N'01', N'00', N'HUANCAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120101', N'12', N'01', N'01', N'HUANCAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120104', N'12', N'01', N'04', N'CARHUACALLANGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120105', N'12', N'01', N'05', N'CHACAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120106', N'12', N'01', N'06', N'CHICCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120107', N'12', N'01', N'07', N'CHILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120108', N'12', N'01', N'08', N'CHONGOS ALTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120111', N'12', N'01', N'11', N'CHUPURO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120112', N'12', N'01', N'12', N'COLCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120113', N'12', N'01', N'13', N'CULLHUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120114', N'12', N'01', N'14', N'EL TAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120116', N'12', N'01', N'16', N'HUACRAPUQUIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120117', N'12', N'01', N'17', N'HUALHUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120119', N'12', N'01', N'19', N'HUANCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120120', N'12', N'01', N'20', N'HUASICANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120121', N'12', N'01', N'21', N'HUAYUCACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120122', N'12', N'01', N'22', N'INGENIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120124', N'12', N'01', N'24', N'PARIAHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120125', N'12', N'01', N'25', N'PILCOMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120126', N'12', N'01', N'26', N'PUCARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120127', N'12', N'01', N'27', N'QUICHUAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120128', N'12', N'01', N'28', N'QUILCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120129', N'12', N'01', N'29', N'SAN AGUSTIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120130', N'12', N'01', N'30', N'SAN JERONIMO DE TUNAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120132', N'12', N'01', N'32', N'SAÑO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120133', N'12', N'01', N'33', N'SAPALLANGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120134', N'12', N'01', N'34', N'SICAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120135', N'12', N'01', N'35', N'SANTO DOMINGO DE ACOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120136', N'12', N'01', N'36', N'VIQUES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120200', N'12', N'02', N'00', N'CONCEPCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120201', N'12', N'02', N'01', N'CONCEPCION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120202', N'12', N'02', N'02', N'ACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120203', N'12', N'02', N'03', N'ANDAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120204', N'12', N'02', N'04', N'CHAMBARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120205', N'12', N'02', N'05', N'COCHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120206', N'12', N'02', N'06', N'COMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120207', N'12', N'02', N'07', N'HEROINAS TOLEDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120208', N'12', N'02', N'08', N'MANZANARES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120209', N'12', N'02', N'09', N'MARISCAL CASTILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120210', N'12', N'02', N'10', N'MATAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120211', N'12', N'02', N'11', N'MITO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120212', N'12', N'02', N'12', N'NUEVE DE JULIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120213', N'12', N'02', N'13', N'ORCOTUNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120214', N'12', N'02', N'14', N'SAN JOSE DE QUERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120215', N'12', N'02', N'15', N'SANTA ROSA DE OCOPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120300', N'12', N'03', N'00', N'CHANCHAMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120301', N'12', N'03', N'01', N'CHANCHAMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120302', N'12', N'03', N'02', N'PERENE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120303', N'12', N'03', N'03', N'PICHANAQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120304', N'12', N'03', N'04', N'SAN LUIS DE SHUARO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120305', N'12', N'03', N'05', N'SAN RAMON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120306', N'12', N'03', N'06', N'VITOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120400', N'12', N'04', N'00', N'JAUJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120401', N'12', N'04', N'01', N'JAUJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120402', N'12', N'04', N'02', N'ACOLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120403', N'12', N'04', N'03', N'APATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120404', N'12', N'04', N'04', N'ATAURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120405', N'12', N'04', N'05', N'CANCHAYLLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120406', N'12', N'04', N'06', N'CURICACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120407', N'12', N'04', N'07', N'EL MANTARO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120408', N'12', N'04', N'08', N'HUAMALI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120409', N'12', N'04', N'09', N'HUARIPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120410', N'12', N'04', N'10', N'HUERTAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120411', N'12', N'04', N'11', N'JANJAILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120412', N'12', N'04', N'12', N'JULCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120413', N'12', N'04', N'13', N'LEONOR ORDOÑEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120414', N'12', N'04', N'14', N'LLOCLLAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120415', N'12', N'04', N'15', N'MARCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120416', N'12', N'04', N'16', N'MASMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120417', N'12', N'04', N'17', N'MASMA CHICCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120418', N'12', N'04', N'18', N'MOLINOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120419', N'12', N'04', N'19', N'MONOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120420', N'12', N'04', N'20', N'MUQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120421', N'12', N'04', N'21', N'MUQUIYAUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120422', N'12', N'04', N'22', N'PACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120423', N'12', N'04', N'23', N'PACCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120424', N'12', N'04', N'24', N'PANCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120425', N'12', N'04', N'25', N'PARCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120426', N'12', N'04', N'26', N'POMACANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120427', N'12', N'04', N'27', N'RICRAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120428', N'12', N'04', N'28', N'SAN LORENZO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120429', N'12', N'04', N'29', N'SAN PEDRO DE CHUNAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120430', N'12', N'04', N'30', N'SAUSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120431', N'12', N'04', N'31', N'SINCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120432', N'12', N'04', N'32', N'TUNAN MARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120433', N'12', N'04', N'33', N'YAULI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120434', N'12', N'04', N'34', N'YAUYOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120500', N'12', N'05', N'00', N'JUNIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120501', N'12', N'05', N'01', N'JUNIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120502', N'12', N'05', N'02', N'CARHUAMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120503', N'12', N'05', N'03', N'ONDORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120504', N'12', N'05', N'04', N'ULCUMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120600', N'12', N'06', N'00', N'SATIPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120601', N'12', N'06', N'01', N'SATIPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120602', N'12', N'06', N'02', N'COVIRIALI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120603', N'12', N'06', N'03', N'LLAYLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120604', N'12', N'06', N'04', N'MAZAMARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120605', N'12', N'06', N'05', N'PAMPA HERMOSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120606', N'12', N'06', N'06', N'PANGOA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120607', N'12', N'06', N'07', N'RIO NEGRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120608', N'12', N'06', N'08', N'RIO TAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120700', N'12', N'07', N'00', N'TARMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120701', N'12', N'07', N'01', N'TARMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120702', N'12', N'07', N'02', N'ACOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120703', N'12', N'07', N'03', N'HUARICOLCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120704', N'12', N'07', N'04', N'HUASAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120705', N'12', N'07', N'05', N'LA UNION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120706', N'12', N'07', N'06', N'PALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120707', N'12', N'07', N'07', N'PALCAMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120708', N'12', N'07', N'08', N'SAN PEDRO DE CAJAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120709', N'12', N'07', N'09', N'TAPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120800', N'12', N'08', N'00', N'YAULI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120801', N'12', N'08', N'01', N'LA OROYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120802', N'12', N'08', N'02', N'CHACAPALPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120803', N'12', N'08', N'03', N'HUAYÑHUAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120804', N'12', N'08', N'04', N'MARCAPOMACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120805', N'12', N'08', N'05', N'MOROCOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120806', N'12', N'08', N'06', N'PACCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120807', N'12', N'08', N'07', N'SANTA BARBARA DE CARHUACAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120808', N'12', N'08', N'08', N'SANTA ROSA DE SACCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120809', N'12', N'08', N'09', N'SUITUCANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120810', N'12', N'08', N'10', N'YAULI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120900', N'12', N'09', N'00', N'CHUPACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120901', N'12', N'09', N'01', N'CHUPACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120902', N'12', N'09', N'02', N'AHUAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120903', N'12', N'09', N'03', N'CHONGOS BAJO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120904', N'12', N'09', N'04', N'HUACHAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120905', N'12', N'09', N'05', N'HUAMANCACA CHICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120906', N'12', N'09', N'06', N'SAN JUAN DE ISCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120907', N'12', N'09', N'07', N'SAN JUAN DE JARPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120908', N'12', N'09', N'08', N'TRES DE DICIEMBRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'120909', N'12', N'09', N'09', N'YANACANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130000', N'13', N'00', N'00', N'LA LIBERTAD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130100', N'13', N'01', N'00', N'TRUJILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130101', N'13', N'01', N'01', N'TRUJILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130102', N'13', N'01', N'02', N'EL PORVENIR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130103', N'13', N'01', N'03', N'FLORENCIA DE MORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130104', N'13', N'01', N'04', N'HUANCHACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130105', N'13', N'01', N'05', N'LA ESPERANZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130106', N'13', N'01', N'06', N'LAREDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130107', N'13', N'01', N'07', N'MOCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130108', N'13', N'01', N'08', N'POROTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130109', N'13', N'01', N'09', N'SALAVERRY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130110', N'13', N'01', N'10', N'SIMBAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130111', N'13', N'01', N'11', N'VICTOR LARCO HERRERA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130200', N'13', N'02', N'00', N'ASCOPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130201', N'13', N'02', N'01', N'ASCOPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130202', N'13', N'02', N'02', N'CHICAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130203', N'13', N'02', N'03', N'CHOCOPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130204', N'13', N'02', N'04', N'MAGDALENA DE CAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130205', N'13', N'02', N'05', N'PAIJAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130206', N'13', N'02', N'06', N'RAZURI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130207', N'13', N'02', N'07', N'SANTIAGO DE CAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130208', N'13', N'02', N'08', N'CASA GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130300', N'13', N'03', N'00', N'BOLIVAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130301', N'13', N'03', N'01', N'BOLIVAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130302', N'13', N'03', N'02', N'BAMBAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130303', N'13', N'03', N'03', N'CONDORMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130304', N'13', N'03', N'04', N'LONGOTEA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130305', N'13', N'03', N'05', N'UCHUMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130306', N'13', N'03', N'06', N'UCUNCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130400', N'13', N'04', N'00', N'CHEPEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130401', N'13', N'04', N'01', N'CHEPEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130402', N'13', N'04', N'02', N'PACANGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130403', N'13', N'04', N'03', N'PUEBLO NUEVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130500', N'13', N'05', N'00', N'JULCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130501', N'13', N'05', N'01', N'JULCAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130502', N'13', N'05', N'02', N'CALAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130503', N'13', N'05', N'03', N'CARABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130504', N'13', N'05', N'04', N'HUASO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130600', N'13', N'06', N'00', N'OTUZCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130601', N'13', N'06', N'01', N'OTUZCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130602', N'13', N'06', N'02', N'AGALLPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130604', N'13', N'06', N'04', N'CHARAT', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130605', N'13', N'06', N'05', N'HUARANCHAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130606', N'13', N'06', N'06', N'LA CUESTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130608', N'13', N'06', N'08', N'MACHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130610', N'13', N'06', N'10', N'PARANDAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130611', N'13', N'06', N'11', N'SALPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130613', N'13', N'06', N'13', N'SINSICAP', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130614', N'13', N'06', N'14', N'USQUIL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130700', N'13', N'07', N'00', N'PACASMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130701', N'13', N'07', N'01', N'SAN PEDRO DE LLOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130702', N'13', N'07', N'02', N'GUADALUPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130703', N'13', N'07', N'03', N'JEQUETEPEQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130704', N'13', N'07', N'04', N'PACASMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130705', N'13', N'07', N'05', N'SAN JOSE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130800', N'13', N'08', N'00', N'PATAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130801', N'13', N'08', N'01', N'TAYABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130802', N'13', N'08', N'02', N'BULDIBUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130803', N'13', N'08', N'03', N'CHILLIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130804', N'13', N'08', N'04', N'HUANCASPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130805', N'13', N'08', N'05', N'HUAYLILLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130806', N'13', N'08', N'06', N'HUAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130807', N'13', N'08', N'07', N'ONGON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130808', N'13', N'08', N'08', N'PARCOY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130809', N'13', N'08', N'09', N'PATAZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130810', N'13', N'08', N'10', N'PIAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130811', N'13', N'08', N'11', N'SANTIAGO DE CHALLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130812', N'13', N'08', N'12', N'TAURIJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130813', N'13', N'08', N'13', N'URPAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130900', N'13', N'09', N'00', N'SANCHEZ CARRION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130901', N'13', N'09', N'01', N'HUAMACHUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130902', N'13', N'09', N'02', N'CHUGAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130903', N'13', N'09', N'03', N'COCHORCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130904', N'13', N'09', N'04', N'CURGOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130905', N'13', N'09', N'05', N'MARCABAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130906', N'13', N'09', N'06', N'SANAGORAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130907', N'13', N'09', N'07', N'SARIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'130908', N'13', N'09', N'08', N'SARTIMBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131000', N'13', N'10', N'00', N'SANTIAGO DE CHUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131001', N'13', N'10', N'01', N'SANTIAGO DE CHUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131002', N'13', N'10', N'02', N'ANGASMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131003', N'13', N'10', N'03', N'CACHICADAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131004', N'13', N'10', N'04', N'MOLLEBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131005', N'13', N'10', N'05', N'MOLLEPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131006', N'13', N'10', N'06', N'QUIRUVILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131007', N'13', N'10', N'07', N'SANTA CRUZ DE CHUCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131008', N'13', N'10', N'08', N'SITABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131100', N'13', N'11', N'00', N'GRAN CHIMU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131101', N'13', N'11', N'01', N'CASCAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131102', N'13', N'11', N'02', N'LUCMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131103', N'13', N'11', N'03', N'MARMOT', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131104', N'13', N'11', N'04', N'SAYAPULLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131200', N'13', N'12', N'00', N'VIRU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131201', N'13', N'12', N'01', N'VIRU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131202', N'13', N'12', N'02', N'CHAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'131203', N'13', N'12', N'03', N'GUADALUPITO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140000', N'14', N'00', N'00', N'LAMBAYEQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140100', N'14', N'01', N'00', N'CHICLAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140101', N'14', N'01', N'01', N'CHICLAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140102', N'14', N'01', N'02', N'CHONGOYAPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140103', N'14', N'01', N'03', N'ETEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140104', N'14', N'01', N'04', N'ETEN PUERTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140105', N'14', N'01', N'05', N'JOSE LEONARDO ORTIZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140106', N'14', N'01', N'06', N'LA VICTORIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140107', N'14', N'01', N'07', N'LAGUNAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140108', N'14', N'01', N'08', N'MONSEFU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140109', N'14', N'01', N'09', N'NUEVA ARICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140110', N'14', N'01', N'10', N'OYOTUN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140111', N'14', N'01', N'11', N'PICSI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140112', N'14', N'01', N'12', N'PIMENTEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140113', N'14', N'01', N'13', N'REQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140114', N'14', N'01', N'14', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140115', N'14', N'01', N'15', N'SAÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140116', N'14', N'01', N'16', N'CAYALTI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140117', N'14', N'01', N'17', N'PATAPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140118', N'14', N'01', N'18', N'POMALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140119', N'14', N'01', N'19', N'PUCALA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140120', N'14', N'01', N'20', N'TUMAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140200', N'14', N'02', N'00', N'FERREÑAFE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140201', N'14', N'02', N'01', N'FERREÑAFE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140202', N'14', N'02', N'02', N'CAÑARIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140203', N'14', N'02', N'03', N'INCAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140204', N'14', N'02', N'04', N'MANUEL ANTONIO MESONES MURO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140205', N'14', N'02', N'05', N'PITIPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140206', N'14', N'02', N'06', N'PUEBLO NUEVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140300', N'14', N'03', N'00', N'LAMBAYEQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140301', N'14', N'03', N'01', N'LAMBAYEQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140302', N'14', N'03', N'02', N'CHOCHOPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140303', N'14', N'03', N'03', N'ILLIMO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140304', N'14', N'03', N'04', N'JAYANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140305', N'14', N'03', N'05', N'MOCHUMI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140306', N'14', N'03', N'06', N'MORROPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140307', N'14', N'03', N'07', N'MOTUPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140308', N'14', N'03', N'08', N'OLMOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140309', N'14', N'03', N'09', N'PACORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140310', N'14', N'03', N'10', N'SALAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140311', N'14', N'03', N'11', N'SAN JOSE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'140312', N'14', N'03', N'12', N'TUCUME', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150000', N'15', N'00', N'00', N'LIMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150100', N'15', N'01', N'00', N'LIMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150101', N'15', N'01', N'01', N'LIMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150102', N'15', N'01', N'02', N'ANCON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150103', N'15', N'01', N'03', N'ATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150104', N'15', N'01', N'04', N'BARRANCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150105', N'15', N'01', N'05', N'BREÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150106', N'15', N'01', N'06', N'CARABAYLLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150107', N'15', N'01', N'07', N'CHACLACAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150108', N'15', N'01', N'08', N'CHORRILLOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150109', N'15', N'01', N'09', N'CIENEGUILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150110', N'15', N'01', N'10', N'COMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150111', N'15', N'01', N'11', N'EL AGUSTINO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150112', N'15', N'01', N'12', N'INDEPENDENCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150113', N'15', N'01', N'13', N'JESUS MARIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150114', N'15', N'01', N'14', N'LA MOLINA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150115', N'15', N'01', N'15', N'LA VICTORIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150116', N'15', N'01', N'16', N'LINCE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150117', N'15', N'01', N'17', N'LOS OLIVOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150118', N'15', N'01', N'18', N'LURIGANCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150119', N'15', N'01', N'19', N'LURIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150120', N'15', N'01', N'20', N'MAGDALENA DEL MAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150121', N'15', N'01', N'21', N'MAGDALENA VIEJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150122', N'15', N'01', N'22', N'MIRAFLORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150123', N'15', N'01', N'23', N'PACHACAMAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150124', N'15', N'01', N'24', N'PUCUSANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150125', N'15', N'01', N'25', N'PUEBLO LIBRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2011-10-05T11:02:55.590' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150126', N'15', N'01', N'26', N'PUENTE PIEDRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150127', N'15', N'01', N'27', N'PUNTA HERMOSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150128', N'15', N'01', N'28', N'PUNTA NEGRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150129', N'15', N'01', N'29', N'RIMAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150130', N'15', N'01', N'30', N'SAN BARTOLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150131', N'15', N'01', N'31', N'SAN BORJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150132', N'15', N'01', N'32', N'SAN ISIDRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150133', N'15', N'01', N'33', N'SAN JUAN DE LURIGANCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150134', N'15', N'01', N'34', N'SAN JUAN DE MIRAFLORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150135', N'15', N'01', N'35', N'SAN LUIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150136', N'15', N'01', N'36', N'SAN MARTIN DE PORRES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150137', N'15', N'01', N'37', N'SAN MIGUEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150138', N'15', N'01', N'38', N'SANTA ANITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150139', N'15', N'01', N'39', N'SANTA MARIA DEL MAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150140', N'15', N'01', N'40', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150141', N'15', N'01', N'41', N'SANTIAGO DE SURCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150142', N'15', N'01', N'42', N'SURQUILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150143', N'15', N'01', N'43', N'VILLA EL SALVADOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150144', N'15', N'01', N'44', N'VILLA MARIA DEL TRIUNFO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150200', N'15', N'02', N'00', N'BARRANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150201', N'15', N'02', N'01', N'BARRANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150202', N'15', N'02', N'02', N'PARAMONGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150203', N'15', N'02', N'03', N'PATIVILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150204', N'15', N'02', N'04', N'SUPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150205', N'15', N'02', N'05', N'SUPE PUERTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150300', N'15', N'03', N'00', N'CAJATAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150301', N'15', N'03', N'01', N'CAJATAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150302', N'15', N'03', N'02', N'COPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150303', N'15', N'03', N'03', N'GORGOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150304', N'15', N'03', N'04', N'HUANCAPON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150305', N'15', N'03', N'05', N'MANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150400', N'15', N'04', N'00', N'CANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150401', N'15', N'04', N'01', N'CANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150402', N'15', N'04', N'02', N'ARAHUAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150403', N'15', N'04', N'03', N'HUAMANTANGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150404', N'15', N'04', N'04', N'HUAROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150405', N'15', N'04', N'05', N'LACHAQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150406', N'15', N'04', N'06', N'SAN BUENAVENTURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150407', N'15', N'04', N'07', N'SANTA ROSA DE QUIVES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150500', N'15', N'05', N'00', N'CAÑETE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150501', N'15', N'05', N'01', N'SAN VICENTE DE CAÑETE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150502', N'15', N'05', N'02', N'ASIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150503', N'15', N'05', N'03', N'CALANGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150504', N'15', N'05', N'04', N'CERRO AZUL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150505', N'15', N'05', N'05', N'CHILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150506', N'15', N'05', N'06', N'COAYLLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150507', N'15', N'05', N'07', N'IMPERIAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150508', N'15', N'05', N'08', N'LUNAHUANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150509', N'15', N'05', N'09', N'MALA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150510', N'15', N'05', N'10', N'NUEVO IMPERIAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150511', N'15', N'05', N'11', N'PACARAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150512', N'15', N'05', N'12', N'QUILMANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150513', N'15', N'05', N'13', N'SAN ANTONIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150514', N'15', N'05', N'14', N'SAN LUIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150515', N'15', N'05', N'15', N'SANTA CRUZ DE FLORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150516', N'15', N'05', N'16', N'ZUÑIGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150600', N'15', N'06', N'00', N'HUARAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150601', N'15', N'06', N'01', N'HUARAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150602', N'15', N'06', N'02', N'ATAVILLOS ALTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150603', N'15', N'06', N'03', N'ATAVILLOS BAJO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150604', N'15', N'06', N'04', N'AUCALLAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150605', N'15', N'06', N'05', N'CHANCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150606', N'15', N'06', N'06', N'IHUARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150607', N'15', N'06', N'07', N'LAMPIAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150608', N'15', N'06', N'08', N'PACARAOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150609', N'15', N'06', N'09', N'SAN MIGUEL DE ACOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150610', N'15', N'06', N'10', N'SANTA CRUZ DE ANDAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150611', N'15', N'06', N'11', N'SUMBILCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150612', N'15', N'06', N'12', N'VEINTISIETE DE NOVIEMBRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150700', N'15', N'07', N'00', N'HUAROCHIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150701', N'15', N'07', N'01', N'MATUCANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150702', N'15', N'07', N'02', N'ANTIOQUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150703', N'15', N'07', N'03', N'CALLAHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150704', N'15', N'07', N'04', N'CARAMPOMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150705', N'15', N'07', N'05', N'CHICLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150706', N'15', N'07', N'06', N'CUENCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150707', N'15', N'07', N'07', N'HUACHUPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150708', N'15', N'07', N'08', N'HUANZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150709', N'15', N'07', N'09', N'HUAROCHIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150710', N'15', N'07', N'10', N'LAHUAYTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150711', N'15', N'07', N'11', N'LANGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150712', N'15', N'07', N'12', N'LARAOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150713', N'15', N'07', N'13', N'MARIATANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150714', N'15', N'07', N'14', N'RICARDO PALMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150715', N'15', N'07', N'15', N'SAN ANDRES DE TUPICOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150716', N'15', N'07', N'16', N'SAN ANTONIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150717', N'15', N'07', N'17', N'SAN BARTOLOME', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150718', N'15', N'07', N'18', N'SAN DAMIAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150719', N'15', N'07', N'19', N'SAN JUAN DE IRIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150720', N'15', N'07', N'20', N'SAN JUAN DE TANTARANCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150721', N'15', N'07', N'21', N'SAN LORENZO DE QUINTI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150722', N'15', N'07', N'22', N'SAN MATEO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150723', N'15', N'07', N'23', N'SAN MATEO DE OTAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150724', N'15', N'07', N'24', N'SAN PEDRO DE CASTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150725', N'15', N'07', N'25', N'SAN PEDRO DE HUANCAYRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150726', N'15', N'07', N'26', N'SANGALLAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150727', N'15', N'07', N'27', N'SANTA CRUZ DE COCACHACRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150728', N'15', N'07', N'28', N'SANTA EULALIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150729', N'15', N'07', N'29', N'SANTIAGO DE ANCHUCAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150730', N'15', N'07', N'30', N'SANTIAGO DE TUNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150731', N'15', N'07', N'31', N'SANTO DOMINGO DE LOS OLLEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150732', N'15', N'07', N'32', N'SURCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150800', N'15', N'08', N'00', N'HUAURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150801', N'15', N'08', N'01', N'HUACHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150802', N'15', N'08', N'02', N'AMBAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150803', N'15', N'08', N'03', N'CALETA DE CARQUIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150804', N'15', N'08', N'04', N'CHECRAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150805', N'15', N'08', N'05', N'HUALMAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150806', N'15', N'08', N'06', N'HUAURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150807', N'15', N'08', N'07', N'LEONCIO PRADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150808', N'15', N'08', N'08', N'PACCHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150809', N'15', N'08', N'09', N'SANTA LEONOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150810', N'15', N'08', N'10', N'SANTA MARIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150811', N'15', N'08', N'11', N'SAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150812', N'15', N'08', N'12', N'VEGUETA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150900', N'15', N'09', N'00', N'OYON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150901', N'15', N'09', N'01', N'OYON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150902', N'15', N'09', N'02', N'ANDAJES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150903', N'15', N'09', N'03', N'CAUJUL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150904', N'15', N'09', N'04', N'COCHAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150905', N'15', N'09', N'05', N'NAVAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'150906', N'15', N'09', N'06', N'PACHANGARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151000', N'15', N'10', N'00', N'YAUYOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151001', N'15', N'10', N'01', N'YAUYOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151002', N'15', N'10', N'02', N'ALIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151003', N'15', N'10', N'03', N'AYAUCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151004', N'15', N'10', N'04', N'AYAVIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151005', N'15', N'10', N'05', N'AZANGARO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151006', N'15', N'10', N'06', N'CACRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151007', N'15', N'10', N'07', N'CARANIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151008', N'15', N'10', N'08', N'CATAHUASI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151009', N'15', N'10', N'09', N'CHOCOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151010', N'15', N'10', N'10', N'COCHAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151011', N'15', N'10', N'11', N'COLONIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151012', N'15', N'10', N'12', N'HONGOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151013', N'15', N'10', N'13', N'HUAMPARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151014', N'15', N'10', N'14', N'HUANCAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151015', N'15', N'10', N'15', N'HUANGASCAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151016', N'15', N'10', N'16', N'HUANTAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151017', N'15', N'10', N'17', N'HUAÑEC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151018', N'15', N'10', N'18', N'LARAOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151019', N'15', N'10', N'19', N'LINCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151020', N'15', N'10', N'20', N'MADEAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151021', N'15', N'10', N'21', N'MIRAFLORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151022', N'15', N'10', N'22', N'OMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151023', N'15', N'10', N'23', N'PUTINZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151024', N'15', N'10', N'24', N'QUINCHES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151025', N'15', N'10', N'25', N'QUINOCAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151026', N'15', N'10', N'26', N'SAN JOAQUIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151027', N'15', N'10', N'27', N'SAN PEDRO DE PILAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151028', N'15', N'10', N'28', N'TANTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151029', N'15', N'10', N'29', N'TAURIPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151030', N'15', N'10', N'30', N'TOMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151031', N'15', N'10', N'31', N'TUPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151032', N'15', N'10', N'32', N'VIÑAC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'151033', N'15', N'10', N'33', N'VITIS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160000', N'16', N'00', N'00', N'LORETO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160100', N'16', N'01', N'00', N'MAYNAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160101', N'16', N'01', N'01', N'IQUITOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160102', N'16', N'01', N'02', N'ALTO NANAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160103', N'16', N'01', N'03', N'FERNANDO LORES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160104', N'16', N'01', N'04', N'INDIANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160105', N'16', N'01', N'05', N'LAS AMAZONAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160106', N'16', N'01', N'06', N'MAZAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160107', N'16', N'01', N'07', N'NAPO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160108', N'16', N'01', N'08', N'PUNCHANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160109', N'16', N'01', N'09', N'PUTUMAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160110', N'16', N'01', N'10', N'TORRES CAUSANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160112', N'16', N'01', N'12', N'BELEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160113', N'16', N'01', N'13', N'SAN JUAN BAUTISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160114', N'16', N'01', N'14', N'MANUEL CLAVERO', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160200', N'16', N'02', N'00', N'ALTO AMAZONAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160201', N'16', N'02', N'01', N'YURIMAGUAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160202', N'16', N'02', N'02', N'BALSAPUERTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160203', N'16', N'02', N'03', N'BARRANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160204', N'16', N'02', N'04', N'CAHUAPANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160205', N'16', N'02', N'05', N'JEBEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160206', N'16', N'02', N'06', N'LAGUNAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160207', N'16', N'02', N'07', N'MANSERICHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160208', N'16', N'02', N'08', N'MORONA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160209', N'16', N'02', N'09', N'PASTAZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160210', N'16', N'02', N'10', N'SANTA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160211', N'16', N'02', N'11', N'TENIENTE CESAR LOPEZ ROJAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160300', N'16', N'03', N'00', N'LORETO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160301', N'16', N'03', N'01', N'NAUTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160302', N'16', N'03', N'02', N'PARINARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160303', N'16', N'03', N'03', N'TIGRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160304', N'16', N'03', N'04', N'TROMPETEROS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160305', N'16', N'03', N'05', N'URARINAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160400', N'16', N'04', N'00', N'MARISCAL RAMON CASTILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160401', N'16', N'04', N'01', N'RAMON CASTILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160402', N'16', N'04', N'02', N'PEBAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160403', N'16', N'04', N'03', N'YAVARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160404', N'16', N'04', N'04', N'SAN PABLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160500', N'16', N'05', N'00', N'REQUENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160501', N'16', N'05', N'01', N'REQUENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160502', N'16', N'05', N'02', N'ALTO TAPICHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160503', N'16', N'05', N'03', N'CAPELO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160504', N'16', N'05', N'04', N'EMILIO SAN MARTIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160505', N'16', N'05', N'05', N'MAQUIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160506', N'16', N'05', N'06', N'PUINAHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160507', N'16', N'05', N'07', N'SAQUENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160508', N'16', N'05', N'08', N'SOPLIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160509', N'16', N'05', N'09', N'TAPICHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160510', N'16', N'05', N'10', N'JENARO HERRERA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160511', N'16', N'05', N'11', N'YAQUERANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160600', N'16', N'06', N'00', N'UCAYALI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160601', N'16', N'06', N'01', N'CONTAMANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160602', N'16', N'06', N'02', N'INAHUAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160603', N'16', N'06', N'03', N'PADRE MARQUEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160604', N'16', N'06', N'04', N'PAMPA HERMOSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160605', N'16', N'06', N'05', N'SARAYACU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160606', N'16', N'06', N'06', N'VARGAS GUERRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160701', N'16', N'07', N'01', N'BARRANCA', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160702', N'16', N'07', N'02', N'CAHUAPANAS', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160703', N'16', N'07', N'03', N'MANSERICHE', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160704', N'16', N'07', N'04', N'MORONA', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160705', N'16', N'07', N'05', N'PASTAZA', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'160706', N'16', N'07', N'06', N'ANDOAS', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170000', N'17', N'00', N'00', N'MADRE DE DIOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170100', N'17', N'01', N'00', N'TAMBOPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170101', N'17', N'01', N'01', N'TAMBOPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170102', N'17', N'01', N'02', N'INAMBARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170103', N'17', N'01', N'03', N'LAS PIEDRAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170104', N'17', N'01', N'04', N'LABERINTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170200', N'17', N'02', N'00', N'MANU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170201', N'17', N'02', N'01', N'MANU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170202', N'17', N'02', N'02', N'FITZCARRALD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170203', N'17', N'02', N'03', N'MADRE DE DIOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170204', N'17', N'02', N'04', N'HUEPETUHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170300', N'17', N'03', N'00', N'TAHUAMANU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170301', N'17', N'03', N'01', N'IÑAPARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170302', N'17', N'03', N'02', N'IBERIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'170303', N'17', N'03', N'03', N'TAHUAMANU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180000', N'18', N'00', N'00', N'MOQUEGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180100', N'18', N'01', N'00', N'MARISCAL NIETO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180101', N'18', N'01', N'01', N'MOQUEGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180102', N'18', N'01', N'02', N'CARUMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180103', N'18', N'01', N'03', N'CUCHUMBAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180104', N'18', N'01', N'04', N'SAMEGUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180105', N'18', N'01', N'05', N'SAN CRISTOBAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180106', N'18', N'01', N'06', N'TORATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180200', N'18', N'02', N'00', N'GENERAL SANCHEZ CERRO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180201', N'18', N'02', N'01', N'OMATE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180202', N'18', N'02', N'02', N'CHOJATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180203', N'18', N'02', N'03', N'COALAQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180204', N'18', N'02', N'04', N'ICHUÑA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180205', N'18', N'02', N'05', N'LA CAPILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180206', N'18', N'02', N'06', N'LLOQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180207', N'18', N'02', N'07', N'MATALAQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180208', N'18', N'02', N'08', N'PUQUINA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180209', N'18', N'02', N'09', N'QUINISTAQUILLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180210', N'18', N'02', N'10', N'UBINAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180211', N'18', N'02', N'11', N'YUNGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180300', N'18', N'03', N'00', N'ILO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180301', N'18', N'03', N'01', N'ILO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180302', N'18', N'03', N'02', N'EL ALGARROBAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'180303', N'18', N'03', N'03', N'PACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190000', N'19', N'00', N'00', N'PASCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190100', N'19', N'01', N'00', N'PASCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190101', N'19', N'01', N'01', N'CHAUPIMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190102', N'19', N'01', N'02', N'HUACHON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190103', N'19', N'01', N'03', N'HUARIACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190104', N'19', N'01', N'04', N'HUAYLLAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190105', N'19', N'01', N'05', N'NINACACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190106', N'19', N'01', N'06', N'PALLANCHACRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190107', N'19', N'01', N'07', N'PAUCARTAMBO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190108', N'19', N'01', N'08', N'SAN FCO.DE ASIS DE YARUSYACAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190109', N'19', N'01', N'09', N'SIMON BOLIVAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190110', N'19', N'01', N'10', N'TICLACAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190111', N'19', N'01', N'11', N'TINYAHUARCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190112', N'19', N'01', N'12', N'VICCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190113', N'19', N'01', N'13', N'YANACANCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190200', N'19', N'02', N'00', N'DANIEL ALCIDES CARRION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190201', N'19', N'02', N'01', N'YANAHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190202', N'19', N'02', N'02', N'CHACAYAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190203', N'19', N'02', N'03', N'GOYLLARISQUIZGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190204', N'19', N'02', N'04', N'PAUCAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190205', N'19', N'02', N'05', N'SAN PEDRO DE PILLAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190206', N'19', N'02', N'06', N'SANTA ANA DE TUSI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190207', N'19', N'02', N'07', N'TAPUC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190208', N'19', N'02', N'08', N'VILCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190300', N'19', N'03', N'00', N'OXAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190301', N'19', N'03', N'01', N'OXAPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190302', N'19', N'03', N'02', N'CHONTABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190303', N'19', N'03', N'03', N'HUANCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190304', N'19', N'03', N'04', N'PALCAZU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190305', N'19', N'03', N'05', N'POZUZO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190306', N'19', N'03', N'06', N'PUERTO BERMUDEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190307', N'19', N'03', N'07', N'VILLA RICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'190308', N'19', N'03', N'08', N'CONSTITUCION', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200000', N'20', N'00', N'00', N'PIURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200100', N'20', N'01', N'00', N'PIURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200101', N'20', N'01', N'01', N'PIURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200104', N'20', N'01', N'04', N'CASTILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200105', N'20', N'01', N'05', N'CATACAOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200107', N'20', N'01', N'07', N'CURA MORI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200108', N'20', N'01', N'08', N'EL TALLAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200109', N'20', N'01', N'09', N'LA ARENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200110', N'20', N'01', N'10', N'LA UNION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200111', N'20', N'01', N'11', N'LAS LOMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200114', N'20', N'01', N'14', N'TAMBO GRANDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200115', N'20', N'01', N'15', N'VEINTISEIS DE OCTUBRE', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200200', N'20', N'02', N'00', N'AYABACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200201', N'20', N'02', N'01', N'AYABACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200202', N'20', N'02', N'02', N'FRIAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200203', N'20', N'02', N'03', N'JILILI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200204', N'20', N'02', N'04', N'LAGUNAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200205', N'20', N'02', N'05', N'MONTERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200206', N'20', N'02', N'06', N'PACAIPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200207', N'20', N'02', N'07', N'PAIMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200208', N'20', N'02', N'08', N'SAPILLICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200209', N'20', N'02', N'09', N'SICCHEZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200210', N'20', N'02', N'10', N'SUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200300', N'20', N'03', N'00', N'HUANCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200301', N'20', N'03', N'01', N'HUANCABAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200302', N'20', N'03', N'02', N'CANCHAQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200303', N'20', N'03', N'03', N'EL CARMEN DE LA FRONTERA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200304', N'20', N'03', N'04', N'HUARMACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200305', N'20', N'03', N'05', N'LALAQUIZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200306', N'20', N'03', N'06', N'SAN MIGUEL DE EL FAIQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200307', N'20', N'03', N'07', N'SONDOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200308', N'20', N'03', N'08', N'SONDORILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200400', N'20', N'04', N'00', N'MORROPON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200401', N'20', N'04', N'01', N'CHULUCANAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200402', N'20', N'04', N'02', N'BUENOS AIRES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200403', N'20', N'04', N'03', N'CHALACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200404', N'20', N'04', N'04', N'LA MATANZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200405', N'20', N'04', N'05', N'MORROPON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200406', N'20', N'04', N'06', N'SALITRAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200407', N'20', N'04', N'07', N'SAN JUAN DE BIGOTE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200408', N'20', N'04', N'08', N'SANTA CATALINA DE MOSSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200409', N'20', N'04', N'09', N'SANTO DOMINGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200410', N'20', N'04', N'10', N'YAMANGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200500', N'20', N'05', N'00', N'PAITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200501', N'20', N'05', N'01', N'PAITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200502', N'20', N'05', N'02', N'AMOTAPE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200503', N'20', N'05', N'03', N'ARENAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200504', N'20', N'05', N'04', N'COLAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200505', N'20', N'05', N'05', N'LA HUACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200506', N'20', N'05', N'06', N'TAMARINDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200507', N'20', N'05', N'07', N'VICHAYAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200600', N'20', N'06', N'00', N'SULLANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200601', N'20', N'06', N'01', N'SULLANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200602', N'20', N'06', N'02', N'BELLAVISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200603', N'20', N'06', N'03', N'IGNACIO ESCUDERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200604', N'20', N'06', N'04', N'LANCONES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200605', N'20', N'06', N'05', N'MARCAVELICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200606', N'20', N'06', N'06', N'MIGUEL CHECA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200607', N'20', N'06', N'07', N'QUERECOTILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200608', N'20', N'06', N'08', N'SALITRAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200700', N'20', N'07', N'00', N'TALARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200701', N'20', N'07', N'01', N'PARIÑAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200702', N'20', N'07', N'02', N'EL ALTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200703', N'20', N'07', N'03', N'LA BREA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200704', N'20', N'07', N'04', N'LOBITOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200705', N'20', N'07', N'05', N'LOS ORGANOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200706', N'20', N'07', N'06', N'MANCORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200800', N'20', N'08', N'00', N'SECHURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200801', N'20', N'08', N'01', N'SECHURA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200802', N'20', N'08', N'02', N'BELLAVISTA DE LA UNION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200803', N'20', N'08', N'03', N'BERNAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200804', N'20', N'08', N'04', N'CRISTO NOS VALGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200805', N'20', N'08', N'05', N'VICE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'200806', N'20', N'08', N'06', N'RINCONADA LLICUAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210000', N'21', N'00', N'00', N'PUNO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210100', N'21', N'01', N'00', N'PUNO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210101', N'21', N'01', N'01', N'PUNO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210102', N'21', N'01', N'02', N'ACORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210103', N'21', N'01', N'03', N'AMANTANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210104', N'21', N'01', N'04', N'ATUNCOLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210105', N'21', N'01', N'05', N'CAPACHICA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210106', N'21', N'01', N'06', N'CHUCUITO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210107', N'21', N'01', N'07', N'COATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210108', N'21', N'01', N'08', N'HUATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210109', N'21', N'01', N'09', N'MAÑAZO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210110', N'21', N'01', N'10', N'PAUCARCOLLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210111', N'21', N'01', N'11', N'PICHACANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210112', N'21', N'01', N'12', N'PLATERIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210113', N'21', N'01', N'13', N'SAN ANTONIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210114', N'21', N'01', N'14', N'TIQUILLACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210115', N'21', N'01', N'15', N'VILQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210200', N'21', N'02', N'00', N'AZANGARO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210201', N'21', N'02', N'01', N'AZANGARO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210202', N'21', N'02', N'02', N'ACHAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210203', N'21', N'02', N'03', N'ARAPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210204', N'21', N'02', N'04', N'ASILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210205', N'21', N'02', N'05', N'CAMINACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210206', N'21', N'02', N'06', N'CHUPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210207', N'21', N'02', N'07', N'JOSE DOMINGO CHOQUEHUANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210208', N'21', N'02', N'08', N'MUÑANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210209', N'21', N'02', N'09', N'POTONI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210210', N'21', N'02', N'10', N'SAMAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210211', N'21', N'02', N'11', N'SAN ANTON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210212', N'21', N'02', N'12', N'SAN JOSE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210213', N'21', N'02', N'13', N'SAN JUAN DE SALINAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210214', N'21', N'02', N'14', N'SANTIAGO DE PUPUJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210215', N'21', N'02', N'15', N'TIRAPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210300', N'21', N'03', N'00', N'CARABAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210301', N'21', N'03', N'01', N'MACUSANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210302', N'21', N'03', N'02', N'AJOYANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210303', N'21', N'03', N'03', N'AYAPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210304', N'21', N'03', N'04', N'COASA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210305', N'21', N'03', N'05', N'CORANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210306', N'21', N'03', N'06', N'CRUCERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210307', N'21', N'03', N'07', N'ITUATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210308', N'21', N'03', N'08', N'OLLACHEA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210309', N'21', N'03', N'09', N'SAN GABAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210310', N'21', N'03', N'10', N'USICAYOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210400', N'21', N'04', N'00', N'CHUCUITO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210401', N'21', N'04', N'01', N'JULI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210402', N'21', N'04', N'02', N'DESAGUADERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210403', N'21', N'04', N'03', N'HUACULLANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210404', N'21', N'04', N'04', N'KELLUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210405', N'21', N'04', N'05', N'PISACOMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210406', N'21', N'04', N'06', N'POMATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210407', N'21', N'04', N'07', N'ZEPITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210500', N'21', N'05', N'00', N'EL COLLAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210501', N'21', N'05', N'01', N'ILAVE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210502', N'21', N'05', N'02', N'CAPAZO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210503', N'21', N'05', N'03', N'PILCUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210504', N'21', N'05', N'04', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210505', N'21', N'05', N'05', N'CONDURIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210600', N'21', N'06', N'00', N'HUANCANE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210601', N'21', N'06', N'01', N'HUANCANE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210602', N'21', N'06', N'02', N'COJATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210603', N'21', N'06', N'03', N'HUATASANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210604', N'21', N'06', N'04', N'INCHUPALLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210605', N'21', N'06', N'05', N'PUSI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210606', N'21', N'06', N'06', N'ROSASPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210607', N'21', N'06', N'07', N'TARACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210608', N'21', N'06', N'08', N'VILQUE CHICO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210700', N'21', N'07', N'00', N'LAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210701', N'21', N'07', N'01', N'LAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210702', N'21', N'07', N'02', N'CABANILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210703', N'21', N'07', N'03', N'CALAPUJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210704', N'21', N'07', N'04', N'NICASIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210705', N'21', N'07', N'05', N'OCUVIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210706', N'21', N'07', N'06', N'PALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210707', N'21', N'07', N'07', N'PARATIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210708', N'21', N'07', N'08', N'PUCARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210709', N'21', N'07', N'09', N'SANTA LUCIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210710', N'21', N'07', N'10', N'VILAVILA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210800', N'21', N'08', N'00', N'MELGAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210801', N'21', N'08', N'01', N'AYAVIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210802', N'21', N'08', N'02', N'ANTAUTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210803', N'21', N'08', N'03', N'CUPI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210804', N'21', N'08', N'04', N'LLALLI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210805', N'21', N'08', N'05', N'MACARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210806', N'21', N'08', N'06', N'NUÑOA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210807', N'21', N'08', N'07', N'ORURILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210808', N'21', N'08', N'08', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210809', N'21', N'08', N'09', N'UMACHIRI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210900', N'21', N'09', N'00', N'MOHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210901', N'21', N'09', N'01', N'MOHO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210902', N'21', N'09', N'02', N'CONIMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210903', N'21', N'09', N'03', N'HUAYRAPATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'210904', N'21', N'09', N'04', N'TILALI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211000', N'21', N'10', N'00', N'SAN ANTONIO DE PUTINA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211001', N'21', N'10', N'01', N'PUTINA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211002', N'21', N'10', N'02', N'ANANEA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211003', N'21', N'10', N'03', N'PEDRO VILCA APAZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211004', N'21', N'10', N'04', N'QUILCAPUNCU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211005', N'21', N'10', N'05', N'SINA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211100', N'21', N'11', N'00', N'SAN ROMAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211101', N'21', N'11', N'01', N'JULIACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211102', N'21', N'11', N'02', N'CABANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211103', N'21', N'11', N'03', N'CABANILLAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211104', N'21', N'11', N'04', N'CARACOTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211200', N'21', N'12', N'00', N'SANDIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211201', N'21', N'12', N'01', N'SANDIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211202', N'21', N'12', N'02', N'CUYOCUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211203', N'21', N'12', N'03', N'LIMBANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211204', N'21', N'12', N'04', N'PATAMBUCO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211205', N'21', N'12', N'05', N'PHARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211206', N'21', N'12', N'06', N'QUIACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211207', N'21', N'12', N'07', N'SAN JUAN DEL ORO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211208', N'21', N'12', N'08', N'YANAHUAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211209', N'21', N'12', N'09', N'ALTO INAMBARI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211210', N'21', N'12', N'10', N'SAN PEDRO DE PUTINA PUNCO', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211300', N'21', N'13', N'00', N'YUNGUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211301', N'21', N'13', N'01', N'YUNGUYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211302', N'21', N'13', N'02', N'ANAPIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211303', N'21', N'13', N'03', N'COPANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211304', N'21', N'13', N'04', N'CUTURAPI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211305', N'21', N'13', N'05', N'OLLARAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211306', N'21', N'13', N'06', N'TINICACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'211307', N'21', N'13', N'07', N'UNICACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220000', N'22', N'00', N'00', N'SAN MARTIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220100', N'22', N'01', N'00', N'MOYOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220101', N'22', N'01', N'01', N'MOYOBAMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220102', N'22', N'01', N'02', N'CALZADA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220103', N'22', N'01', N'03', N'HABANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220104', N'22', N'01', N'04', N'JEPELACIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220105', N'22', N'01', N'05', N'SORITOR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220106', N'22', N'01', N'06', N'YANTALO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220200', N'22', N'02', N'00', N'BELLAVISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220201', N'22', N'02', N'01', N'BELLAVISTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220202', N'22', N'02', N'02', N'ALTO BIAVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220203', N'22', N'02', N'03', N'BAJO BIAVO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220204', N'22', N'02', N'04', N'HUALLAGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220205', N'22', N'02', N'05', N'SAN PABLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220206', N'22', N'02', N'06', N'SAN RAFAEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220300', N'22', N'03', N'00', N'EL DORADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220301', N'22', N'03', N'01', N'SAN JOSE DE SISA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220302', N'22', N'03', N'02', N'AGUA BLANCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220303', N'22', N'03', N'03', N'SAN MARTIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220304', N'22', N'03', N'04', N'SANTA ROSA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220305', N'22', N'03', N'05', N'SHATOJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220400', N'22', N'04', N'00', N'HUALLAGA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220401', N'22', N'04', N'01', N'SAPOSOA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220402', N'22', N'04', N'02', N'ALTO SAPOSOA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220403', N'22', N'04', N'03', N'EL ESLABON', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220404', N'22', N'04', N'04', N'PISCOYACU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220405', N'22', N'04', N'05', N'SACANCHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220406', N'22', N'04', N'06', N'TINGO DE SAPOSOA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220500', N'22', N'05', N'00', N'LAMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220501', N'22', N'05', N'01', N'LAMAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220502', N'22', N'05', N'02', N'ALONSO DE ALVARADO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220503', N'22', N'05', N'03', N'BARRANQUITA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220504', N'22', N'05', N'04', N'CAYNARACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220505', N'22', N'05', N'05', N'CUÑUMBUQUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220506', N'22', N'05', N'06', N'PINTO RECODO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220507', N'22', N'05', N'07', N'RUMISAPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220508', N'22', N'05', N'08', N'SAN ROQUE DE CUMBAZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220509', N'22', N'05', N'09', N'SHANAO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220510', N'22', N'05', N'10', N'TABALOSOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220511', N'22', N'05', N'11', N'ZAPATERO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220600', N'22', N'06', N'00', N'MARISCAL CACERES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220601', N'22', N'06', N'01', N'JUANJUI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220602', N'22', N'06', N'02', N'CAMPANILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220603', N'22', N'06', N'03', N'HUICUNGO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220604', N'22', N'06', N'04', N'PACHIZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220605', N'22', N'06', N'05', N'PAJARILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220700', N'22', N'07', N'00', N'PICOTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220701', N'22', N'07', N'01', N'PICOTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220702', N'22', N'07', N'02', N'BUENOS AIRES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220703', N'22', N'07', N'03', N'CASPISAPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220704', N'22', N'07', N'04', N'PILLUANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220705', N'22', N'07', N'05', N'PUCACACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220706', N'22', N'07', N'06', N'SAN CRISTOBAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220707', N'22', N'07', N'07', N'SAN HILARION', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220708', N'22', N'07', N'08', N'SHAMBOYACU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220709', N'22', N'07', N'09', N'TINGO DE PONASA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220710', N'22', N'07', N'10', N'TRES UNIDOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220800', N'22', N'08', N'00', N'RIOJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220801', N'22', N'08', N'01', N'RIOJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220802', N'22', N'08', N'02', N'AWAJUN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220803', N'22', N'08', N'03', N'ELIAS SOPLIN VARGAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220804', N'22', N'08', N'04', N'NUEVA CAJAMARCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220805', N'22', N'08', N'05', N'PARDO MIGUEL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220806', N'22', N'08', N'06', N'POSIC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220807', N'22', N'08', N'07', N'SAN FERNANDO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220808', N'22', N'08', N'08', N'YORONGOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220809', N'22', N'08', N'09', N'YURACYACU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220900', N'22', N'09', N'00', N'SAN MARTIN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220901', N'22', N'09', N'01', N'TARAPOTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220902', N'22', N'09', N'02', N'ALBERTO LEVEAU', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220903', N'22', N'09', N'03', N'CACATACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220904', N'22', N'09', N'04', N'CHAZUTA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220905', N'22', N'09', N'05', N'CHIPURANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220906', N'22', N'09', N'06', N'EL PORVENIR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220907', N'22', N'09', N'07', N'HUIMBAYOC', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220908', N'22', N'09', N'08', N'JUAN GUERRA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220909', N'22', N'09', N'09', N'LA BANDA DE SHILCAYO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220910', N'22', N'09', N'10', N'MORALES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220911', N'22', N'09', N'11', N'PAPAPLAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220912', N'22', N'09', N'12', N'SAN ANTONIO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220913', N'22', N'09', N'13', N'SAUCE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'220914', N'22', N'09', N'14', N'SHAPAJA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'221000', N'22', N'10', N'00', N'TOCACHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'221001', N'22', N'10', N'01', N'TOCACHE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'221002', N'22', N'10', N'02', N'NUEVO PROGRESO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'221003', N'22', N'10', N'03', N'POLVORA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'221004', N'22', N'10', N'04', N'SHUNTE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'221005', N'22', N'10', N'05', N'UCHIZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230000', N'23', N'00', N'00', N'TACNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230100', N'23', N'01', N'00', N'TACNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
GO
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230101', N'23', N'01', N'01', N'TACNA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230102', N'23', N'01', N'02', N'ALTO DE LA ALIANZA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230103', N'23', N'01', N'03', N'CALANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230104', N'23', N'01', N'04', N'CIUDAD NUEVA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230105', N'23', N'01', N'05', N'INCLAN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230106', N'23', N'01', N'06', N'PACHIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230107', N'23', N'01', N'07', N'PALCA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230108', N'23', N'01', N'08', N'POCOLLAY', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230109', N'23', N'01', N'09', N'SAMA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230110', N'23', N'01', N'10', N'CORONEL GREGORIO ALBARRACIN LANCHIPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230200', N'23', N'02', N'00', N'CANDARAVE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230201', N'23', N'02', N'01', N'CANDARAVE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230202', N'23', N'02', N'02', N'CAIRANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230203', N'23', N'02', N'03', N'CAMILACA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230204', N'23', N'02', N'04', N'CURIBAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230205', N'23', N'02', N'05', N'HUANUARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230206', N'23', N'02', N'06', N'QUILAHUANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230300', N'23', N'03', N'00', N'JORGE BASADRE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230301', N'23', N'03', N'01', N'LOCUMBA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230302', N'23', N'03', N'02', N'ILABAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230303', N'23', N'03', N'03', N'ITE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230400', N'23', N'04', N'00', N'TARATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230401', N'23', N'04', N'01', N'TARATA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230402', N'23', N'04', N'02', N'CHUCATAMANI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230403', N'23', N'04', N'03', N'ESTIQUE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230404', N'23', N'04', N'04', N'ESTIQUEÑPAMPA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230405', N'23', N'04', N'05', N'SITAJARA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230406', N'23', N'04', N'06', N'SUSAPAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230407', N'23', N'04', N'07', N'TARUCACHI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'230408', N'23', N'04', N'08', N'TICACO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240000', N'24', N'00', N'00', N'TUMBES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240100', N'24', N'01', N'00', N'TUMBES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240101', N'24', N'01', N'01', N'TUMBES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240102', N'24', N'01', N'02', N'CORRALES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240103', N'24', N'01', N'03', N'LA CRUZ', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240104', N'24', N'01', N'04', N'PAMPAS DE HOSPITAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240105', N'24', N'01', N'05', N'SAN JACINTO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240106', N'24', N'01', N'06', N'SAN JUAN DE LA VIRGEN', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240200', N'24', N'02', N'00', N'CONTRALMIRANTE VILLAR', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240201', N'24', N'02', N'01', N'ZORRITOS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240202', N'24', N'02', N'02', N'CASITAS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240203', N'21', N'12', N'10', N'CANOAS DE PUNTA SAL', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240300', N'24', N'03', N'00', N'ZARUMILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240301', N'24', N'03', N'01', N'ZARUMILLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240302', N'24', N'03', N'02', N'AGUAS VERDES', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240303', N'24', N'03', N'03', N'MATAPALO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'240304', N'24', N'03', N'04', N'PAPAYAL', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250000', N'25', N'00', N'00', N'UCAYALI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250100', N'25', N'01', N'00', N'CORONEL PORTILLO', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250101', N'25', N'01', N'01', N'CALLERIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250102', N'25', N'01', N'02', N'CAMPOVERDE', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250103', N'25', N'01', N'03', N'IPARIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250104', N'25', N'01', N'04', N'MASISEA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250105', N'25', N'01', N'05', N'YARINACOCHA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250106', N'25', N'01', N'06', N'NUEVA REQUENA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250107', N'25', N'01', N'07', N'MANANTAY', N'BEGIN', N'', N'1', CAST(N'2014-08-22T12:06:53.770' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250200', N'25', N'02', N'00', N'ATALAYA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250201', N'25', N'02', N'01', N'RAYMONDI', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250202', N'25', N'02', N'02', N'SEPAHUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250203', N'25', N'02', N'03', N'TAHUANIA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250204', N'25', N'02', N'04', N'YURUA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250300', N'25', N'03', N'00', N'PADRE ABAD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250301', N'25', N'03', N'01', N'PADRE ABAD', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250302', N'25', N'03', N'02', N'IRAZOLA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250303', N'25', N'03', N'03', N'CURIMANA', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250400', N'25', N'04', N'00', N'PURUS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
INSERT [dbo].[GeoLocation] ([cCodGeoLocation], [nvDepartment], [nvProvince], [nvDistrict], [nvDenomination], [nvDescription], [nvObservation], [nvUserRegistry], [dtDateregistry], [iCountModification], [bState]) VALUES (N'250401', N'25', N'04', N'01', N'PURUS', N'BEGIN', N'MIGRATED', N'1', CAST(N'2007-07-31T21:38:51.047' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([CodePeople], [Dni], [FirstName], [FirstLastName], [SecondLastName], [Email], [Telephone], [Pide], [PideDate], [Birthdate], [Sex], [CivilStatus], [CodeGeoLocation], [Address], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'45654584', N'pablo', N'rivadeneira', N'alarcon', N'privadeneiraala@hotmail.com', N'9845822', NULL, NULL, NULL, N'M', NULL, NULL, NULL, NULL, NULL, N'1')
INSERT [dbo].[People] ([CodePeople], [Dni], [FirstName], [FirstLastName], [SecondLastName], [Email], [Telephone], [Pide], [PideDate], [Birthdate], [Sex], [CivilStatus], [CodeGeoLocation], [Address], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'43171962', N'Francis', N'Palomino', N'Marino', N'Fapmarino@gmai.com', N'960315844', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SYSTEM', CAST(N'2019-10-12T17:32:04.330' AS DateTime), N'1')
INSERT [dbo].[People] ([CodePeople], [Dni], [FirstName], [FirstLastName], [SecondLastName], [Email], [Telephone], [Pide], [PideDate], [Birthdate], [Sex], [CivilStatus], [CodeGeoLocation], [Address], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'41888128', N'Percy', N'Castillo', N'Poma', N'pcastillo@gmail.com', N'999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SYSTEM', CAST(N'2019-10-12T17:51:23.667' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'08:00 - 08:30', CAST(N'2019-08-06T08:00:00.000' AS DateTime), CAST(N'1900-01-01T08:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'08:30 - 09:00', CAST(N'2019-08-06T08:30:00.000' AS DateTime), CAST(N'1900-01-01T09:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'09:00 - 09:30', CAST(N'2019-08-06T09:00:00.000' AS DateTime), CAST(N'1900-01-01T09:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'09:30 - 10:00', CAST(N'2019-08-06T09:30:00.000' AS DateTime), CAST(N'2019-08-06T10:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (5, N'10:00 - 10:30', CAST(N'2019-08-06T10:00:00.000' AS DateTime), CAST(N'2019-08-06T10:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (6, N'10:30 - 11:00', CAST(N'2019-08-06T10:30:00.000' AS DateTime), CAST(N'2019-08-06T11:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (7, N'11:00 - 11:30', CAST(N'2019-08-06T11:00:00.000' AS DateTime), CAST(N'2019-08-06T11:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (8, N'11:30 - 12:00', CAST(N'2019-08-06T11:30:00.000' AS DateTime), CAST(N'2019-08-06T12:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (9, N'12:00 - 12:30', CAST(N'2019-08-06T12:00:00.000' AS DateTime), CAST(N'2019-08-06T12:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (10, N'12:30 - 13:00', CAST(N'2019-08-06T12:30:00.000' AS DateTime), CAST(N'2019-08-06T13:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (11, N'13:00 - 13:30', CAST(N'2019-08-06T13:00:00.000' AS DateTime), CAST(N'2019-08-06T13:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (12, N'13:30 - 14:00', CAST(N'2019-08-06T13:30:00.000' AS DateTime), CAST(N'2019-08-06T14:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (13, N'14:00 - 14:30', CAST(N'2019-08-06T14:00:00.000' AS DateTime), CAST(N'2019-08-06T14:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (14, N'14:30 - 15:00', CAST(N'2019-08-06T14:30:00.000' AS DateTime), CAST(N'2019-08-06T15:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (15, N'15:00 - 15:30', CAST(N'2019-08-06T15:00:00.000' AS DateTime), CAST(N'2019-08-06T15:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (16, N'15:30 - 16:00', CAST(N'2019-08-06T15:30:00.000' AS DateTime), CAST(N'2019-08-06T16:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (17, N'16:00 - 16:30', CAST(N'2019-08-06T16:00:00.000' AS DateTime), CAST(N'2019-08-06T16:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (18, N'16:30 - 17:00', CAST(N'2019-08-06T16:30:00.000' AS DateTime), CAST(N'2019-08-06T17:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (19, N'17:00 - 17:30', CAST(N'2019-08-06T17:00:00.000' AS DateTime), CAST(N'2019-08-06T17:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (20, N'17:30 - 18:00', CAST(N'2019-08-06T17:30:00.000' AS DateTime), CAST(N'2019-08-06T18:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (21, N'18:00 - 18:30', CAST(N'2019-08-06T18:00:00.000' AS DateTime), CAST(N'2019-08-06T18:30:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (22, N'18:30 - 19:00', CAST(N'2019-08-06T18:30:00.000' AS DateTime), CAST(N'2019-08-06T19:00:00.000' AS DateTime), NULL, NULL, N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (23, N'19:00 - 19:30', CAST(N'2019-08-06T19:00:00.000' AS DateTime), CAST(N'2019-08-06T19:30:00.000' AS DateTime), N'FPALOMINO', CAST(N'2019-07-21T17:53:16.717' AS DateTime), N'1')
INSERT [dbo].[Schedule] ([CodeSchedule], [Description], [StartTime], [EndTime], [RegistryUser], [RegistryDate], [State]) VALUES (24, N'19:30 - 20:00', CAST(N'2019-08-06T19:30:00.000' AS DateTime), CAST(N'2019-08-06T20:00:00.000' AS DateTime), NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1, N'Transferencia de Capital Social', N'system', CAST(N'2019-08-05T23:41:42.463' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (2, N'Apertura de Cuenta Corriente Mype', N'system', CAST(N'2019-08-05T23:41:42.467' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (3, N'Depósito de Capital Social', N'system', CAST(N'2019-08-05T23:41:42.467' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (4, N'Depósito de Cuenta Corriente Mype', N'system', CAST(N'2019-08-05T23:41:42.467' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (5, N'Devolución de Capital Social', N'system', CAST(N'2019-08-05T23:41:42.467' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (6, N'PAGO DE TASAS', N'system', CAST(N'2019-08-05T23:41:42.467' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1004, N'MJHGJ', N'Admin', CAST(N'2019-08-22T23:06:20.153' AS DateTime), N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1005, N'GJYGFJYG', N'Admin', CAST(N'2019-08-22T23:07:09.317' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1006, N'eliminar', N'Admin', CAST(N'2019-08-22T23:08:25.410' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1007, N'JGFJYFH', N'Admin', CAST(N'2019-08-22T23:10:11.240' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1008, N'GJYFGYJ', N'Admin', CAST(N'2019-08-22T23:10:27.057' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1009, N'gjgjyg', N'Admin', CAST(N'2019-08-22T23:14:31.323' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1010, N'PERCYPRUEBA', N'Admin', CAST(N'2019-08-22T23:53:46.440' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1011, N'jfhfftffffffffffaca', N'Admin', CAST(N'2019-08-22T23:59:12.380' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1012, N'fhfhf', N'Admin', CAST(N'2019-08-23T00:01:22.290' AS DateTime), N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1013, N'mhvnv', N'Admin', CAST(N'2019-08-23T00:03:50.960' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1014, N'jgjhgjg', N'Admin', CAST(N'2019-08-23T00:05:05.810' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1015, N'hfhf', N'Admin', CAST(N'2019-08-23T00:07:51.110' AS DateTime), N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1016, N'xasxsax', N'Admin', CAST(N'2019-08-23T00:08:05.740' AS DateTime), N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1017, N'vng', N'Admin', CAST(N'2019-08-23T00:08:30.697' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1018, N'n,jhj', N'Admin', CAST(N'2019-08-23T00:08:52.243' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1019, N'hdtrgd', N'Admin', CAST(N'2019-08-23T00:10:02.500' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1020, N'bthbtbtb', N'Admin', CAST(N'2019-08-23T12:11:14.347' AS DateTime), N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1021, N'prueba', N'Admin', CAST(N'2019-08-23T13:46:39.230' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1022, N'sqsqs', N'Admin', CAST(N'2019-08-23T13:47:58.157' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1023, N'fewfwf', N'Admin', CAST(N'2019-08-23T14:00:39.060' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1024, N'dwdqd', N'Admin', CAST(N'2019-08-23T14:00:53.957' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1025, N'dqdqd', N'Admin', CAST(N'2019-08-23T14:01:57.357' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1026, N'PRUEBA', N'Admin', CAST(N'2019-08-23T14:02:12.623' AS DateTime), N'1', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1027, N'fwdwf', N'Admin', CAST(N'2019-08-23T14:08:17.047' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1028, N'PRUEBA2', N'Admin', CAST(N'2019-08-23T14:08:33.590' AS DateTime), N'1', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1029, N'fff232f32f32f', N'Admin', CAST(N'2019-08-23T14:08:40.180' AS DateTime), N'0', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1030, N'cwqdqwd', N'Admin', CAST(N'2019-08-23T14:16:53.363' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1031, N'CQWCWQC111fff', N'Admin', CAST(N'2019-08-23T17:05:44.600' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1032, N'PRUEBAAAAA', N'Admin', CAST(N'2019-08-23T17:05:54.330' AS DateTime), N'0', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1033, N'PAGO DE TASAS', N'Admin', CAST(N'2019-08-28T19:36:08.690' AS DateTime), N'1', 2)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1034, N'FRANCIS EL PERDIDO2', N'Admin', CAST(N'2019-09-11T17:03:37.630' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1035, N'PRUEBA3', N'Admin', CAST(N'2019-10-04T17:03:59.423' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1036, N'PRUEBA DE SERVICIO 09102019', N'Admin', CAST(N'2019-10-09T12:08:42.910' AS DateTime), N'1', 1)
INSERT [dbo].[Service] ([CodeService], [Description], [RegistryUser], [RegistryDate], [State], [CodeTypeService]) VALUES (1038, N'CERTIFICADO DE INSCRIPCIÓN DE IDENTIDAD   ', N'FPALOMINO', CAST(N'2019-10-12T00:00:00.000' AS DateTime), N'1', 1)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceAttentionCenter] ON 

INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeServiceEntity], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (1034, 84, 5, N'Admin', CAST(N'2019-10-22T16:11:16.983' AS DateTime), N'0', N'0')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeServiceEntity], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (1035, 85, 5, N'Admin', CAST(N'2019-10-22T16:11:23.733' AS DateTime), N'1', N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeServiceEntity], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (1036, 84, 6, N'Admin', CAST(N'2019-10-22T19:36:34.383' AS DateTime), N'1', N'1')
INSERT [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter], [CodeServiceEntity], [CodeAttentionCenter], [RegistryUser], [RegistryDate], [Active], [State]) VALUES (1037, 85, 6, N'Admin', CAST(N'2019-10-22T18:06:33.200' AS DateTime), N'0', N'0')
SET IDENTITY_INSERT [dbo].[ServiceAttentionCenter] OFF
SET IDENTITY_INSERT [dbo].[ServiceEntity] ON 

INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (76, 1, 3, N'Admin', CAST(N'2019-10-17T19:19:10.190' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (77, 1, 2, N'Admin', CAST(N'2019-10-17T19:19:10.190' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (78, 1, 1, N'Admin', CAST(N'2019-10-17T19:19:10.190' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (79, 2, 1028, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (80, 2, 6, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (81, 2, 4, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (82, 2, 1, N'Admin', CAST(N'2019-10-17T20:09:16.997' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (83, 1, 6, N'Admin', CAST(N'2019-10-17T20:15:14.980' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (84, 5, 6, N'Admin', CAST(N'2019-10-18T11:05:43.053' AS DateTime), N'1')
INSERT [dbo].[ServiceEntity] ([CodeServiceEntity], [CodeEntity], [CodeService], [RegistryUser], [RegistryDate], [State]) VALUES (85, 5, 1, N'Admin', CAST(N'2019-10-18T11:05:43.053' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[ServiceEntity] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([CodeState], [Description], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'Programado', NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[TicketState] ON 

INSERT [dbo].[TicketState] ([CodeTicketState], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'En espera', N'system', CAST(N'2019-08-05T23:07:47.890' AS DateTime), N'1')
INSERT [dbo].[TicketState] ([CodeTicketState], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'Abandono', N'system', CAST(N'2019-08-05T23:07:47.890' AS DateTime), N'1')
INSERT [dbo].[TicketState] ([CodeTicketState], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'Reactivado', N'system', CAST(N'2019-08-05T23:07:47.890' AS DateTime), N'1')
INSERT [dbo].[TicketState] ([CodeTicketState], [StateName], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'Atendido', N'system', CAST(N'2019-08-05T23:07:47.890' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[TicketState] OFF
SET IDENTITY_INSERT [dbo].[TicketType] ON 

INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'MENOR DE  EDAD', 4, 0, N'1', NULL, NULL, N'0')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'NORMAL', 1, 0, N'1', N'Admin', CAST(N'2019-09-13T16:58:44.220' AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'DISCAPACITADO', 2, 1, N'1', N'Admin', CAST(N'2019-09-13T17:01:24.353' AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'ADULTO MAYOR', 3, 1, N'1', N'Admin', CAST(N'2019-09-13T18:22:56.663' AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (5, N'MENOR DE   EDAD', 5, 1, N'1', N'Admin', CAST(N'2019-09-13T18:29:51.943' AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (6, N'MENOR DE EDAD', 100, 0, N'1', N'Admin', CAST(N'2019-09-13T18:39:56.113' AS DateTime), N'0')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (7, N'WDW', 1, 1, N'1', N'Admin', CAST(N'2019-09-13T19:52:50.760' AS DateTime), N'0')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (8, N'GESTANTE', 15, 1, N'1', N'Admin', CAST(N'2019-09-16T12:27:11.690' AS DateTime), N'1')
INSERT [dbo].[TicketType] ([CodeTicketType], [Description], [Priority], [IsPreferential], [Visible], [RegistryUser], [RegistryDate], [State]) VALUES (9, N'MINISTRO', 1, 0, N'1', N'Admin', CAST(N'2019-10-07T12:09:37.043' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[TicketType] OFF
SET IDENTITY_INSERT [dbo].[TypeService] ON 

INSERT [dbo].[TypeService] ([CodeTypeService], [NameTypeService], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'Tramite', N'system', CAST(N'2019-08-05T23:08:19.010' AS DateTime), N'1')
INSERT [dbo].[TypeService] ([CodeTypeService], [NameTypeService], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'Orientación', N'system', CAST(N'2019-08-05T23:08:19.010' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[TypeService] OFF
SET IDENTITY_INSERT [dbo].[Window] ON 

INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (1, N'1', 1, N'Admin', CAST(N'2019-09-04T11:17:05.900' AS DateTime), N'1')
INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (2, N'2', 1, N'Admin', CAST(N'2019-09-04T12:30:28.913' AS DateTime), N'1')
INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (3, N'2', 3, N'Admin', CAST(N'2019-09-04T12:31:43.053' AS DateTime), N'1')
INSERT [dbo].[Window] ([CodeWindow], [WindowName], [CodeZone], [RegistryUser], [RegistryDate], [State]) VALUES (4, N'1A', 2, N'Admin', CAST(N'2019-09-05T12:02:02.647' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Window] OFF
SET IDENTITY_INSERT [dbo].[Zone] ON 

INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (1, 1, N'A', NULL, N'Admin', CAST(N'2019-09-03T14:33:02.680' AS DateTime), N'1')
INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (2, 2, N'B', NULL, N'Admin', CAST(N'2019-09-03T16:35:22.693' AS DateTime), N'1')
INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (3, 5, N'A', NULL, N'Admin', CAST(N'2019-09-04T12:31:20.977' AS DateTime), N'1')
INSERT [dbo].[Zone] ([CodeZone], [CodeAttentionCenter], [ZoneName], [ZoneDescription], [RegistryUser], [RegistryDate], [State]) VALUES (4, 5, N'B', NULL, N'Admin', CAST(N'2019-10-24T11:19:49.630' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Zone] OFF
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF__Activity__State__4C6B5938]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Alomac] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Attention] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[AttentionCenter] ADD  CONSTRAINT [DF__Attention__State__57DD0BE4]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[BackBannerZone] ADD  CONSTRAINT [DF_BackBannerZone_Active]  DEFAULT ('0') FOR [Active]
GO
ALTER TABLE [dbo].[BackBannerZone] ADD  CONSTRAINT [DF__BackBanne__State__62307D25]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[BackEntity_AttentionCenter] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[BackServiceAttentionCenter] ADD  DEFAULT ('0') FOR [State]
GO
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF__Banner__State__5AB9788F]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[BannerZone] ADD  CONSTRAINT [DF_BannerZone_Active]  DEFAULT ('0') FOR [Active]
GO
ALTER TABLE [dbo].[BannerZone] ADD  CONSTRAINT [DF__BannerZon__State__5DA0D232]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF__Entity__State__607251E5]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Entity_AttentionCenter] ADD  CONSTRAINT [DF__Entity_At__State__318258D2]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[People] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[SequenceTicket] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Service] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceAttention] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] ADD  CONSTRAINT [DF_ServiceAttentionCenter_Active]  DEFAULT ('0') FOR [Active]
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] ADD  CONSTRAINT [DF__ServiceAt__State__2B155265]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceEntity] ADD  CONSTRAINT [DF__ServiceEn__State__2FDA0782]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[ServiceTicket] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[State] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF__Ticket__State__7A3223E8]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TicketState] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TicketStateHistory] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF_TicketType_prioridad]  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF_TicketType_IsPreferential]  DEFAULT ((0)) FOR [IsPreferential]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF_TicketType_Visible]  DEFAULT ('1') FOR [Visible]
GO
ALTER TABLE [dbo].[TicketType] ADD  CONSTRAINT [DF__TypeAtten__State__02C769E9]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TypeService] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__Video__State__0B5CAFEA]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[VideoZone] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Window] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF__Zone__State__13F1F5EB]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK__Activity__CodeSc__4222D4EF] FOREIGN KEY([CodeSchedule])
REFERENCES [dbo].[Schedule] ([CodeSchedule])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK__Activity__CodeSc__4222D4EF]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK__Activity__CodeSt__4316F928] FOREIGN KEY([CodeState])
REFERENCES [dbo].[State] ([CodeState])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK__Activity__CodeSt__4316F928]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ServiceAttentionCenter] FOREIGN KEY([CodeServAttenCenter])
REFERENCES [dbo].[ServiceAttentionCenter] ([CodeServAttenCenter])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ServiceAttentionCenter]
GO
ALTER TABLE [dbo].[AttentionCenter]  WITH CHECK ADD FOREIGN KEY([CodeCompany])
REFERENCES [dbo].[Company] ([CodeCompany])
GO
ALTER TABLE [dbo].[BannerZone]  WITH CHECK ADD  CONSTRAINT [FK__BannerZon__CodeB__1B9317B3] FOREIGN KEY([CodeBanner])
REFERENCES [dbo].[Banner] ([CodeBanner])
GO
ALTER TABLE [dbo].[BannerZone] CHECK CONSTRAINT [FK__BannerZon__CodeB__1B9317B3]
GO
ALTER TABLE [dbo].[BannerZone]  WITH CHECK ADD  CONSTRAINT [FK__BannerZon__CodeZ__1C873BEC] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[BannerZone] CHECK CONSTRAINT [FK__BannerZon__CodeZ__1C873BEC]
GO
ALTER TABLE [dbo].[DetailGroupService]  WITH CHECK ADD  CONSTRAINT [FK_DetailGroupService_GroupService] FOREIGN KEY([CodeGroupService])
REFERENCES [dbo].[GroupService] ([CodeGroupService])
GO
ALTER TABLE [dbo].[DetailGroupService] CHECK CONSTRAINT [FK_DetailGroupService_GroupService]
GO
ALTER TABLE [dbo].[DetailGroupService]  WITH CHECK ADD  CONSTRAINT [FK_DetailGroupService_Service] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[DetailGroupService] CHECK CONSTRAINT [FK_DetailGroupService_Service]
GO
ALTER TABLE [dbo].[Entity_AttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK__Entity_At__CodeA__10E07F16] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
ALTER TABLE [dbo].[Entity_AttentionCenter] CHECK CONSTRAINT [FK__Entity_At__CodeA__10E07F16]
GO
ALTER TABLE [dbo].[Entity_AttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK_Entity_AttentionCenter_Entity] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[Entity] ([CodeEntity])
GO
ALTER TABLE [dbo].[Entity_AttentionCenter] CHECK CONSTRAINT [FK_Entity_AttentionCenter_Entity]
GO
ALTER TABLE [dbo].[GroupService]  WITH CHECK ADD  CONSTRAINT [FK_GroupService_Zone] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[GroupService] CHECK CONSTRAINT [FK_GroupService_Zone]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([CodeTypeService])
REFERENCES [dbo].[TypeService] ([CodeTypeService])
GO
ALTER TABLE [dbo].[ServiceAttention]  WITH CHECK ADD FOREIGN KEY([CodeAttention])
REFERENCES [dbo].[Attention] ([CodeAttention])
GO
ALTER TABLE [dbo].[ServiceAttention]  WITH CHECK ADD FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceAttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK__Procedure__CodeA__46E78A0C] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] CHECK CONSTRAINT [FK__Procedure__CodeA__46E78A0C]
GO
ALTER TABLE [dbo].[ServiceAttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK_ServiceAttentionCenter_ServiceEntity] FOREIGN KEY([CodeServiceEntity])
REFERENCES [dbo].[ServiceEntity] ([CodeServiceEntity])
GO
ALTER TABLE [dbo].[ServiceAttentionCenter] CHECK CONSTRAINT [FK_ServiceAttentionCenter_ServiceEntity]
GO
ALTER TABLE [dbo].[ServiceEntity]  WITH CHECK ADD  CONSTRAINT [FK__ServiceEn__CodeS__75785BC3] FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceEntity] CHECK CONSTRAINT [FK__ServiceEn__CodeS__75785BC3]
GO
ALTER TABLE [dbo].[ServiceTicket]  WITH CHECK ADD FOREIGN KEY([CodeService])
REFERENCES [dbo].[Service] ([CodeService])
GO
ALTER TABLE [dbo].[ServiceTicket]  WITH CHECK ADD  CONSTRAINT [FK__ServiceTi__CodeT__24285DB4] FOREIGN KEY([CodeTicket])
REFERENCES [dbo].[Ticket] ([CodeTicket])
GO
ALTER TABLE [dbo].[ServiceTicket] CHECK CONSTRAINT [FK__ServiceTi__CodeT__24285DB4]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK__Ticket__CodeTick__23F3538A] FOREIGN KEY([CodeTicketType])
REFERENCES [dbo].[TicketType] ([CodeTicketType])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__CodeTick__23F3538A]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_People] FOREIGN KEY([CodePeople])
REFERENCES [dbo].[People] ([CodePeople])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_People]
GO
ALTER TABLE [dbo].[TicketStateHistory]  WITH CHECK ADD  CONSTRAINT [FK__TicketSta__CodeT__251C81ED] FOREIGN KEY([CodeTicket])
REFERENCES [dbo].[Ticket] ([CodeTicket])
GO
ALTER TABLE [dbo].[TicketStateHistory] CHECK CONSTRAINT [FK__TicketSta__CodeT__251C81ED]
GO
ALTER TABLE [dbo].[TicketStateHistory]  WITH CHECK ADD FOREIGN KEY([CodeTicketState])
REFERENCES [dbo].[TicketState] ([CodeTicketState])
GO
ALTER TABLE [dbo].[VideoZone]  WITH CHECK ADD  CONSTRAINT [FK__VideoZone__CodeV__2704CA5F] FOREIGN KEY([CodeVideo])
REFERENCES [dbo].[Video] ([CodeVideo])
GO
ALTER TABLE [dbo].[VideoZone] CHECK CONSTRAINT [FK__VideoZone__CodeV__2704CA5F]
GO
ALTER TABLE [dbo].[VideoZone]  WITH CHECK ADD  CONSTRAINT [FK__VideoZone__CodeZ__27F8EE98] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[VideoZone] CHECK CONSTRAINT [FK__VideoZone__CodeZ__27F8EE98]
GO
ALTER TABLE [dbo].[Window]  WITH CHECK ADD  CONSTRAINT [FK__Window__CodeZone__28ED12D1] FOREIGN KEY([CodeZone])
REFERENCES [dbo].[Zone] ([CodeZone])
GO
ALTER TABLE [dbo].[Window] CHECK CONSTRAINT [FK__Window__CodeZone__28ED12D1]
GO
ALTER TABLE [dbo].[Zone]  WITH CHECK ADD  CONSTRAINT [FK__Zone__CodeAttent__7CD98669] FOREIGN KEY([CodeAttentionCenter])
REFERENCES [dbo].[AttentionCenter] ([CodeAttentionCenter])
GO
ALTER TABLE [dbo].[Zone] CHECK CONSTRAINT [FK__Zone__CodeAttent__7CD98669]
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELIMINAR]
(
	@CodeEntity INT ,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	update Entity set State=0,RegistryUser=@RegistryUser,RegistryDate=GETDATE() where CodeEntity=@CodeEntity;
	RETURN 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[PK_MAS_SERVICE_BUSCAR]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[PK_MAS_SERVICE_BUSCAR]
	-- Add the parameters for the stored procedure here
@P_NOMBRE NVARCHAR,
@P_PAGDESDE int,
@P_PAGHASTA int

AS
BEGIN
 select * from MasService
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCita]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.sp_InsertarCita  '43171962'
-- DROP PROCEDURE dbo.sp_InsertarCita
--===========================================================================================
CREATE PROCEDURE [dbo].[sp_InsertarCita]
  @tpmAppointmentEntity dbo.dtAppointment  READONLY

AS
BEGIN
   SET NOCOUNT ON
   SET DATEFORMAT dmy
   SET DATEFIRST 1  

 
   --SELECT @variable=dato FROM tabla
   DECLARE  
    @vCodePeople            INT,
@vCodeServAttenCenter INT,
@vCodetypeAttention INT,
@vCodeState INT,
@vContActivityExist     INT,
@Response INT,
@NumRegistros INT,
@i INT,

@vCodeActivity INT,
@vCodeService INT,
@vCodeAttentionCenter INT,
@vCodeSchedule INT,
@Dni INT,
@FirstName VARCHAR(50),
@FirstLastName VARCHAR(50),
@SecondLastName VARCHAR(50),
@Email VARCHAR(50),
@Telephone VARCHAR(50)


   SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmAppointmentEntity FROM @tpmAppointmentEntity
 
   SET @NumRegistros=(SELECT COUNT(1) FROM #tpmAppointmentEntity)
   SET @i=1  


   WHILE @i<=@NumRegistros
   BEGIN
	SELECT @vContActivityExist = Count(*)
	from  Appointment apo
	inner join People peo on peo.CodePeople = apo.CodePeople and peo.State = '1'
	INNER JOIN #tpmAppointmentEntity tae on tae.Dni = peo.Dni
	WHERE apo.state = 1 and apo.AppointmentDate >=  cast(getdate() As Date) and peo.Dni = @Dni and tae.IdRow=@i; 
	
	  
	
	SELECT @vCodeServAttenCenter = sa.CodeServAttenCenter FROM ServiceAttentionCenter sa 
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = '1'
	INNER JOIN #tpmAppointmentEntity tae on tae.CodeService = se.CodeService and tae.CodeAttentionCenter = sa.CodeAttentionCenter
	WHERE sa.state = '1' and IdRow=@i;

	SELECT @vCodeActivity = tap.CodeActivity,@vCodeService = tap.CodeService,@vCodeAttentionCenter = CodeAttentionCenter,@vCodeSchedule = tap.CodeSchedule,
	@Dni = tap.Dni, @FirstName = tap.FirstName,@FirstLastName = tap.FirstLastName, @SecondLastName = tap.SecondLastName, @Email = tap.Email,
	@Telephone = tap.Telephone
	from #tpmAppointmentEntity tap
	WHERE IdRow=@i;
	
	
	IF (@vContActivityExist = 0)
	BEGIN
		IF ((SELECT COUNT(*) FROM People where Dni= @Dni) > 0)
		BEGIN
			SELECT @vCodePeople = CodePeople FROM People where Dni = @Dni

			INSERT INTO Appointment
			(CodePeople,CodeSchedule,CodeServAttenCenter,CodetypeAttention, CodeState, RegistryUser, RegistryDate)
			VALUES (@vCodePeople,@vCodeSchedule,@vCodeServAttenCenter, 1,1, 'System', GETDATE());       
    
			UPDATE Activity
			SET EndQuota = EndQuota + 1
			WHERE CodeActivity = @vCodeActivity and State = '1' and Available = 1;

			IF ((SELECT COUNT(*) FROM Activity WHERE State = '1' and
			CodeState = 1 and (StartQuota-EndQuota)=0 and CodeActivity = @vCodeActivity) > 0)
			BEGIN
				UPDATE Activity
				SET Available = 0
				WHERE CodeActivity = @vCodeActivity and State = '1';

				SET @Response=1;--CITA RESERVADA CON EXITO
			END
			ELSE
			BEGIN
				SET @Response=1;--CITA RESERVADA CON EXITO
			END
		END
		ELSE		
		BEGIN
			INSERT INTO People
			(Dni, FirstName, FirstLastName, SecondLastName, Email, Telephone, RegistryUser, RegistryDate)
			VALUES (@Dni,@FirstName,@FirstLastName,@SecondLastName,@Email ,@Telephone, 'SYSTEM', GETDATE());

			SELECT @vCodePeople = CodePeople FROM People where Dni = @Dni;

			INSERT INTO Appointment
			(CodePeople,CodeSchedule,CodeServAttenCenter,CodetypeAttention, CodeState, RegistryUser, RegistryDate)
			VALUES (@vCodePeople,@vCodeSchedule,@vCodeServAttenCenter, 1,1, 'System', GETDATE());

			UPDATE Activity
			SET EndQuota = EndQuota + 1
			WHERE CodeActivity = @vCodeActivity and State = '1' and Available = 1;

			IF ((SELECT COUNT(*) FROM Activity WHERE State = '1' and
			CodeState = 1 and (StartQuota-EndQuota)=0 and CodeActivity = @vCodeActivity) > 0)
			BEGIN
				UPDATE Activity
				SET Available = 0
				WHERE CodeActivity = @vCodeActivity and State = '1';
				SET @Response=1;--CITA RESERVADA CON EXITO
			END
			IF ((SELECT COUNT(*) FROM Activity WHERE State = '1' and
			CodeState = 1 and (StartQuota-EndQuota)=0 and CodeActivity = @vCodeActivity) > 0)
			BEGIN
				UPDATE Activity
				SET Available = 0
				WHERE CodeActivity = @vCodeActivity and State = '1';
				SET @Response=1;--CITA RESERVADA CON EXITO
			END
		END	
	
	END
	ELSE
	BEGIN
		SET @Response=2;--LA PERSONA YA TIENE CITA RESERVADA
	END  
    
	SET @i+=1
	
   END
   
   select @Response as Response;
END
GO
/****** Object:  StoredProcedure [dbo].[spMa_Activity_List]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--===========================================================================================
-- Exec dbo.spMa_Schedule_List
-- DROP PROCEDURE dbo.spMa_Schedule_List
--===========================================================================================
CREATE PROCEDURE [dbo].[spMa_Activity_List]
AS
BEGIN
   SET NOCOUNT ON

SELECT act.CodeActivity ,sch.StartTime ,sch.EndTime,sch.Description ,act.Quota,act.Available 
FROM [db_pcm_gob_pe_turn].[dbo].[Activity] act, [db_pcm_gob_pe_turn].[dbo].[Schedule] sch 
WHERE  sch.CodeSchedule = act.CodeSchedule AND sch.state = 1 AND act.state = 1;

   SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[spMa_Schedule_Delete]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.spMa_Schedule_Delete  25
-- DROP PROCEDURE dbo.spMa_Schedule_Delete
--===========================================================================================
CREATE PROCEDURE [dbo].[spMa_Schedule_Delete]
   @piCodSchedule            INT
  
AS
BEGIN
   SET NOCOUNT ON

   DECLARE
      @dtmodificationdate     DATETIME,
	  @dtcState				  CHAR
   
   SET @dtmodificationdate = GETDATE()
   SET @dtcState = '0'
   
   UPDATE dbo.Schedule
   SET cState = @dtcState   
   WHERE iCodSchedule = @piCodSchedule

   SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[spMa_Schedule_Insert]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
--'Horario de 07:45 a 15:00','07:45:00','15:00:00'
-- Exec dbo.spMa_Schedule_Insert  '20:30-21:00','20:30','21:00','FPALOMINO'
-- DROP PROCEDURE dbo.spMa_Schedule_Insert
--===========================================================================================
CREATE PROCEDURE [dbo].[spMa_Schedule_Insert]
   @pnvDespription           VARCHAR(50),
   @ptStartTime              TIME,
   @ptEndTime                TIME,
   @pnvRegistryUser			 VARCHAR(50)
AS
BEGIN
   SET NOCOUNT ON

   DECLARE
      @dtRegistryDate     DATETIME,
	  @CState Char
   
   SET @dtRegistryDate = GETDATE()
   SET @cState = '1'
   
   INSERT INTO dbo.Schedule(nvDespription,tStartTime,tEndTime,nvRegistryUser,dtRegistryDate,cState)
   VALUES(@pnvDespription,@ptStartTime,@ptEndTime,@pnvRegistryUser,@dtRegistryDate,@cState)
   
   SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[spMa_Schedule_List]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--===========================================================================================
-- Exec dbo.spMa_Schedule_List
-- DROP PROCEDURE dbo.spMa_Schedule_List
--===========================================================================================
CREATE PROCEDURE [dbo].[spMa_Schedule_List]
AS
BEGIN
   SET NOCOUNT ON

 SELECT
      nvDespription
      ,tStartTime
      ,tEndTime
      ,cState
  FROM [db_pcm_gob_pe_turn].[dbo].[Schedule]
  WHERE cState = '1'

   SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[spMa_Schedule_Update]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
--'Horario de 07:45 a 15:00','07:45:00','15:00:00'
-- Exec dbo.spMa_Schedule_Update  1,'08:00-08:30','08:00','08:30'
-- DROP PROCEDURE dbo.spMa_Schedule_Update
--===========================================================================================
CREATE PROCEDURE [dbo].[spMa_Schedule_Update]
   @piCodSchedule            INT,
   @pnvDespription           VARCHAR(50),
   @ptStartTime              TIME,
   @ptEndTime                TIME
AS
BEGIN
   SET NOCOUNT ON

   DECLARE
      @dtmodificationdate     DATETIME
   
   SET @dtmodificationdate = GETDATE()
   
   UPDATE dbo.Schedule
   SET nvDespription = @pnvDespription,
       tStartTime = @ptStartTime,
       tEndTime = @ptEndTime     
   WHERE iCodSchedule = @piCodSchedule
   
   SELECT iCodSchedule = @piCodSchedule

   SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarBanner]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarBanner](
	@Description VARCHAR(500),
	@RegistryUser VARCHAR(200),
	@CodeBanner INT
)AS
BEGIN
	--BEGIN TRANSACTION 
	--	BEGIN TRY
	DECLARE  @registrosafectados int = 0;
	IF (@Description=(SELECT BannerName FROM Banner WHERE CodeBanner=@CodeBanner AND State='1')) 
	BEGIN			
		UPDATE Banner 
			SET BannerName=UPPER(@Description)			
		WHERE CodeBanner=@CodeBanner;
		SET @registrosafectados = @@ROWCOUNT;
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banner WHERE UPPER(BannerName)=UPPER(@Description) AND State='1') 
		BEGIN
			UPDATE Banner 
			SET BannerName=UPPER(@Description)			
			WHERE CodeBanner=@CodeBanner;
			SET @registrosafectados = @@ROWCOUNT;			
		END
		ELSE
		BEGIN
			SET @registrosafectados=0;
		END
	END			
	SELECT @registrosafectados;
		--	COMMIT;
		--END TRY
		--BEGIN CATCH	
		--	ROLLBACK TRANSACTION
		--	SET @registrosafectados=-1;
		--	SELECT @registrosafectados;
		--END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCentroAtencion]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarCentroAtencion](
  @Description  VARCHAR(250),  
  @RegistryUser VARCHAR(200),
  @CodeAttentionCenter INT
)AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY
		
		--IF (UPPER(@Description)<>(SELECT UPPER(ac.Description) FROM AttentionCenter ac WHERE ac.CodeAttentionCenter=@CodeAttentionCenter AND State='1'))
		IF NOT EXISTS (SELECT * FROM AttentionCenter WHERE UPPER(Description)=UPPER(@Description))
		BEGIN
			DECLARE  @registrosafectados int = 0;
			UPDATE AttentionCenter 
				SET Description=@Description		
			WHERE CodeAttentionCenter=@CodeAttentionCenter;
			SET @registrosafectados = @@ROWCOUNT;			
		END
		ELSE
		BEGIN
			SET @registrosafectados = 0;
		END
		SELECT @registrosafectados;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH	
		ROLLBACK TRANSACTION
		SET @registrosafectados=-1;
		SELECT @registrosafectados;
	END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarEntidad](
  @Description  VARCHAR(250),
  @Abreviation VARCHAR(250),
  @RegistryUser VARCHAR(200),
  @CodeEntity INT
)AS
BEGIN	
	DECLARE  @registrosafectados int = 0;
	IF(@Description=(SELECT Description FROM Entity WHERE CodeEntity=@CodeEntity )) 
	BEGIN
		UPDATE Entity 
			SET Description=UPPER(@Description),
			Abreviation=@Abreviation
		WHERE CodeEntity=@CodeEntity;
		SET @registrosafectados = @@ROWCOUNT;
	END
	ELSE
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Entity WHERE UPPER(Description)=@Description ) 
		BEGIN
			UPDATE Entity 
				SET Description=UPPER(@Description),
				Abreviation=@Abreviation
			WHERE CodeEntity=@CodeEntity;
			SET @registrosafectados = @@ROWCOUNT;
		END
		ELSE
		BEGIN
			SET @registrosafectados=0;
		END;

	END
	SELECT @registrosafectados;			

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarServicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarServicio](
	@CodeService INT,
	@CodeTypeService INT,
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250)
)AS
BEGIN
	--BEGIN TRANSACTION 
	--BEGIN TRY

		DECLARE @registrosafectados int = 0;
		IF(@Description=(SELECT Description FROM Service WHERE CodeService=@CodeService AND State='1')) 
		BEGIN
			UPDATE  Service
				SET Description=UPPER(@Description),
				CodeTypeService=@CodeTypeService 
			WHERE CodeService=@CodeService;
		
			SET @registrosafectados = @@ROWCOUNT;
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Service WHERE UPPER(Description)=UPPER(@Description) AND State='1')
			BEGIN
				UPDATE  Service
					SET Description=UPPER(@Description),
					CodeTypeService=@CodeTypeService 
				WHERE CodeService=@CodeService;
		
				SET @registrosafectados = @@ROWCOUNT;				
			END
			ELSE
			BEGIN
				SET @registrosafectados=0;	
			END
		END		
		SELECT @registrosafectados;
		--COMMIT;
	--	END TRY
	--BEGIN CATCH	
	--	ROLLBACK TRANSACTION
	--	SET @registrosafectados=-1;
	--	SELECT @registrosafectados;
	--END CATCH

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarTipoTicket]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarTipoTicket](
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250),
	@Priority INT,
	@CodeTicketType INT,
	@IsPreferential BIT
)AS
BEGIN
	DECLARE @registrosafectados int;
	IF (@Description=(SELECT Description FROM TicketType WHERE CodeTicketType=@CodeTicketType AND State='1')) 
	BEGIN
		UPDATE  TicketType
			SET Description=UPPER(@Description),
			Priority=@Priority,
			IsPreferential=@IsPreferential
		WHERE CodeTicketType=@CodeTicketType;
		SET @registrosafectados = @@ROWCOUNT;
	END
	ELSE
	BEGIN	
		IF NOT EXISTS(SELECT 1 FROM TicketType WHERE UPPER(Description)=@Description AND State='1') 
		BEGIN
			UPDATE  TicketType
				SET Description=UPPER(@Description),
				Priority=@Priority 
			WHERE CodeTicketType=@CodeTicketType;
			SET @registrosafectados = @@ROWCOUNT;
		END
		ELSE
		BEGIN
			SET @registrosafectados=0;
		END;		
	END	
	SELECT @registrosafectados;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarVentanilla]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarVentanilla](
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeWindow INT,
	@CodeZone INT 
)AS
BEGIN
	--BEGIN TRANSACTION 
	--BEGIN TRY
		DECLARE  @registrosafectados int = 0;
		IF(@Description=(SELECT WindowName FROM Window WHERE CodeWindow=@CodeWindow AND State='1' AND CodeZone=@CodeZone)) 
		BEGIN
			UPDATE Window 
				SET WindowName=UPPER(@Description)	,
				CodeZone=@CodeZone		
			WHERE CodeWindow=@CodeWindow;
			SET @registrosafectados = @@ROWCOUNT;
		END
		ELSE
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Window WHERE UPPER(WindowName)=UPPER(@Description) AND State='1' AND CodeZone=@CodeZone) 
			BEGIN
				UPDATE Window 
					SET WindowName=UPPER(@Description)	,
					CodeZone=@CodeZone		
				WHERE CodeWindow=@CodeWindow;
				SET @registrosafectados = @@ROWCOUNT;
			END
			ELSE
			BEGIN
				SET @registrosafectados=0;	
			END
		END
		SELECT @registrosafectados;
		--COMMIT;
	--END TRY
	--BEGIN CATCH	
	--	ROLLBACK TRANSACTION
	--	SET @registrosafectados=-1;
	--	SELECT @registrosafectados;
	--END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarZona]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarZona]
(
	@Description VARCHAR(200),
	@CodeAttentionCenter INT,
	@RegistryUser VARCHAR(200),
	@CodeZone INT

)AS
BEGIN
		BEGIN TRANSACTION 
		BEGIN TRY
			DECLARE  @registrosafectados int = 0;
			UPDATE Zone 
				SET ZoneName=UPPER(@Description),
				CodeAttentionCenter=@CodeAttentionCenter			
			WHERE CodeZone=@CodeZone;

			SET @registrosafectados = @@ROWCOUNT;
			SELECT @registrosafectados;
			COMMIT;
		END TRY
		BEGIN CATCH	
			ROLLBACK TRANSACTION
			SET @registrosafectados=-1;
			SELECT @registrosafectados;
		END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocompletar(prueba)]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_Autocompletar 8,'BA',1
CREATE PROCEDURE [dbo].[usp_Autocompletar(prueba)](
	@piiMaxFilas int=0, 
	@psiEmpezarCon varchar(30)='',
	@piiFlag INT		

)AS
BEGIN
	IF(@piiFlag=1) 
	BEGIN
		SELECT TOP (@piiMaxFilas) e.CodeEntity AS Id, e.Description Valor FROM Entity  e  
		WHERE e.State ='1' AND e.Description LIKE '%'+ @psiEmpezarCon + '%'; 
	END;
	--IF(@piiFlag=2)
	--BEGIN
	--	SELECT TOP (@piiMaxFilas) ser.CodeService AS Id, ser.Description Valor FROM Service ser  
	--	WHERE ser.State ='1' AND ser.Description LIKE '%'+ @psiEmpezarCon + '%'; 
	--END;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_CurrentRow]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CurrentRow](
	@FLAG INT,
	@ID INT
)AS
BEGIN
	IF(@FLAG=1) --lista una fila de entidad
	BEGIN
		SELECT CodeEntity,Description,Abreviation,State FROM Entity WHERE CodeEntity=@ID;				
	END;
	IF(@FLAG=2) --lista una fila de servicio
	BEGIN
		--SELECT CodeService,Description FROM Service WHERE State='1' AND CodeService=@ID;
		select CodeService,Description,ts.NameTypeService,ts.CodeTypeService from Service se inner join TypeService  ts on se.CodeTypeService=ts.CodeTypeService 
		where se.State = '1' AND CodeService=@ID;
	END;
	IF(@FLAG=3)
	BEGIN
		SELECT at.CodeAttentionCenter,at.Description,at.State FROM AttentionCenter at WHERE at.CodeAttentionCenter=@ID;
	END;	

	IF(@FLAG=4)
	BEGIN
		SELECT zo.CodeZone,zo.ZoneName,zo.CodeAttentionCenter FROM Zone zo WHERE zo.State='1' AND zo.CodeZone=@ID;
	END;

	IF(@FLAG=5)
	BEGIN
		SELECT ba.CodeBanner,ba.BannerName FROM Banner ba WHERE ba.State='1' AND ba.CodeBanner=@ID;
	END;

	IF(@FLAG=6)
	BEGIN
		SELECT wi.CodeWindow,wi.WindowName,wi.CodeZone FROM Window wi WHERE wi.State='1' AND wi.CodeWindow=@ID;
	END;

	IF(@FLAG=7)
	BEGIN
		SELECT tt.CodeTicketType,tt.Description,tt.Priority,tt.IsPreferential FROM TicketType tt WHERE tt.State='1' AND tt.CodeTicketType=@ID;
	END;

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarBanner]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarBanner]
(
	@CodeBanner INT,
	@RegistryUser VARCHAR(200)

)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Banner
		SET State='0'
	WHERE CodeBanner=@CodeBanner;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencion]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_EliminarCentroAtencion](
	@CodeAttentionCenter INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE AttentionCenter
		SET State='0'
	WHERE CodeAttentionCenter=@CodeAttentionCenter;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencionServicios]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarCentroAtencionServicios](
	@CodeAttentionCenter INT,
	@CodeServiceEntity INT,
	@RegistryUser VARCHAR(250)

)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE ServiceAttentionCenter
		SET State='0',
			RegistryDate=GETDATE(),
			RegistryUser=@RegistryUser
	WHERE CodeAttentionCenter=@CodeAttentionCenter and CodeServiceEntity=@CodeServiceEntity;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencionxEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarCentroAtencionxEntidad](
	@CodeCodeAttentionCenter INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	DECLARE @registrosafectados INT = 0;
	UPDATE Entity_AttentionCenter
		SET State='0',
		RegistryUser=@RegistryUser,
		RegistryDate=GETDATE()
	WHERE CodeAttentionCenter=@CodeCodeAttentionCenter;

	SET @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarEntidad](
	@CodeEntity INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Entity
		SET State='0'
	WHERE CodeEntity=@CodeEntity;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarServicioxEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarServicioxEntidad](
	@CodeEntity INT,
	@RegistryUser VARCHAR(250)
)AS
BEGIN
	DECLARE @registrosafectados INT = 0;
	UPDATE ServiceEntity
		SET State='0',
		RegistryUser=@RegistryUser,
		RegistryDate=GETDATE()
	WHERE CodeEntity=@CodeEntity;

	SET @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarSevicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarSevicio]
(
	@CodeServicio INT,
	@RegistryUser VARCHAR(250)
)
AS
BEGIN
	DECLARE @registrosafectados int = 0;
	UPDATE Service
	SET State='0'
	WHERE CodeService=@CodeServicio;

	SET @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTipoTicket]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarTipoTicket](
	@CodeTicketType INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE TicketType
		SET State='0'
	WHERE CodeTicketType=@CodeTicketType;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarWindow]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarWindow]
(
	@CodeWindow INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Window
		SET State='0'
	WHERE CodeWindow=@CodeWindow;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarZona]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarZona]
(
	@CodeZone INT,
	@RegistryUser VARCHAR(200)	
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Zone
		SET State='0'
	WHERE CodeZone=@CodeZone;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_GET_UBIGEO]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- USP_GET_UBIGEO '150201'
CREATE PROCEDURE [dbo].[USP_GET_UBIGEO](@IDE_UBIGEO VARCHAR(6))AS
BEGIN
IF LEN(@IDE_UBIGEO) = 1
BEGIN
	SELECT DISTINCT SUBSTRING(cCodGeoLocation,1,2) AS CodeLocation, RTRIM(nvDenomination) AS LocationName
	FROM GEOLOCATION WHERE SUBSTRING(cCodGeoLocation,3,4) = '0000' AND bState = '1'
END
IF LEN(@IDE_UBIGEO) = 2
BEGIN
	SELECT DISTINCT SUBSTRING(cCodGeoLocation,3,2) AS CodeLocation, RTRIM(nvDenomination) AS LocationName  
	FROM GEOLOCATION 
	WHERE SUBSTRING(cCodGeoLocation,1,2) = @IDE_UBIGEO AND SUBSTRING(cCodGeoLocation,5,2) = '00' AND SUBSTRING(cCodGeoLocation,3,2) <> '00'
	AND bState = '1'
END
IF LEN(@IDE_UBIGEO) = 4
BEGIN
	SELECT DISTINCT SUBSTRING(cCodGeoLocation,5,2) AS CodeLocation, RTRIM(nvDenomination) AS LocationName  
	FROM GEOLOCATION 
	WHERE SUBSTRING(cCodGeoLocation,1,4) =  @IDE_UBIGEO AND SUBSTRING(cCodGeoLocation,3,4) <> '0000' AND SUBSTRING(cCodGeoLocation,5,2) <> '00'
	AND bState = '1' ORDER BY 1
END
END
-- SELECT * FROM GeoLocation
GO
/****** Object:  StoredProcedure [dbo].[usp_ListaDataCentroAtencionEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_ListaDataCentroAtencionEntidad 1008;
CREATE PROCEDURE [dbo].[usp_ListaDataCentroAtencionEntidad]
(
	@psCodeAttentionCenter INT
)AS
BEGIN

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT * FROM (select eca.CodeAttentionCenter,eca.CodeEntity,e.Description from Entity_AttentionCenter eca left JOIN AttentionCenter ac on eca.CodeAttentionCenter=ac.CodeAttentionCenter
				inner join Entity e on eca.CodeEntity=e.CodeEntity where eca.State=1 and 
				e.State=1 and ac.State=1 AND ac.CodeAttentionCenter='+ CAST(@psCodeAttentionCenter AS VARCHAR(10)) +'
	) AS F' 
    EXEC (@Query)

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarActividadxIdCalendar]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.[usp_ListarActividadxIdCalendar] 1,1
-- DROP PROCEDURE dbo.[usp_ListarActividadxIdCalendar]
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarActividadxIdCalendar](
@CodeService INT,
@CodeAttentionCenter INT
)
AS
BEGIN
   SET NOCOUNT ON
	
	SELECT act.CodeActivity,sch.Description DescriptionActivity,sch.CodeSchedule, act.ActivityDate,
	convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.StartTime,8) StartTime,
	convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.EndTime,8) EndTime,sa.CodeAttentionCenter,
	act.StartQuota,act.Available,(act.StartQuota-act.EndQuota) Quota
	from Activity act 
	inner join Schedule sch ON act.CodeSchedule=sch.CodeSchedule 
	inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = act.CodeServAttenCenter and sa.State = 1
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = 1
	WHERE act.state = '1' and se.CodeService = @CodeService and sa.CodeAttentionCenter = @CodeAttentionCenter 
	and act.ActivityDate >=  cast(getdate() As Date);

   SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarBanner]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_ListarBanner 10,1,'CodeBanner','DESC'
CREATE PROCEDURE [dbo].[usp_ListarBanner]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4)
	--@psiIdServicio INT,
	--@psiIdTipoServicio INT
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeBanner) FROM Banner WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select ba.CodeBanner,ba.BannerName,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Banner ba where ba.State=1) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;


--where 
--	1= case when '+ CAST(@psiIdServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN se.CodeService = '+ CAST(@psiIdServicio AS VARCHAR(5)) + ' THEN 1 END AND
--		  1= case when '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN ts.CodeTypeService = '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + ' THEN 1 END 
--	AND 
--	se.State=1) AS F'
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarBannerxAttentionCenter]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarBannerxAttentionCenter](
	@psCodeAttentionCenter INT,
	@psCodeZone INT 
)AS
BEGIN
	SELECT 
	BZ.* 
	FROM BannerZone bz LEFT JOIN Banner b on bz.CodeBanner=b.CodeBanner
	--WHERE bz.CodeZone=4;
	SELECT * FROM Banner;
END;

SELECT 
	*
FROM Banner BA LEFT JOIN BannerZone BZ ON BA.CodeBanner=BZ.CodeBanner
WHERE BA.State='1' AND BZ.State='1';

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarBannerxZone]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarBannerxZone 10,1,'CodeAttentionCenter','ASC'
CREATE PROCEDURE [dbo].[usp_ListarBannerxZone](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4)
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT count(ac.CodeAttentionCenter) FROM BannerZone bz inner join Zone zo on bz.CodeZone=zo.CodeZone inner join Banner ba on ba.CodeBanner=bz.CodeBanner
																								inner join AttentionCenter ac on zo.CodeAttentionCenter=ac.CodeAttentionCenter
																								where bz.State='1' and zo.State='1' and ba.State='1' and ac.State='1');
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (
	select distinct ac.CodeAttentionCenter,ac.Description,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+' PageCount from BannerZone bz inner join Zone zo on bz.CodeZone=zo.CodeZone
			inner join Banner ba on ba.CodeBanner=bz.CodeBanner
			inner join AttentionCenter ac on zo.CodeAttentionCenter=ac.CodeAttentionCenter
	where bz.State=1 and zo.State=1 and ba.State=1 and ac.State=1 ) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencion]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_ListarCentroAtencion  10,2,'CodeAttentionCenter','ASC',-1,'1'

CREATE PROCEDURE [dbo].[usp_ListarCentroAtencion]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiCbxCentroAtencion INT,
	@psiEstado VARCHAR(4)
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeAttentionCenter) FROM AttentionCenter WHERE State=@psiEstado)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
	--print @PageCount
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  
	FROM (select ca.CodeAttentionCenter,ca.Description,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from AttentionCenter ca 
	WHERE ca.State='+@psiEstado+' AND 1=CASE WHEN  ca.CodeAttentionCenter = '+ CAST(@psiCbxCentroAtencion AS VARCHAR(5)) + '  THEN 1 
								WHEN '+ CAST(@psiCbxCentroAtencion AS VARCHAR(5)) + ' =-1 THEN 1 END
	) AS F'
  
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencionServicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_ListarCentroAtencionServicio 10,1,'CodeAttentionCenter','DESC',5,'1'
CREATE PROCEDURE [dbo].[usp_ListarCentroAtencionServicio](
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(25),
	@psiSortOrder VARCHAR(25),
	@psiCentroAtencion INT,
	@psiCboEstado VARCHAR(5)
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT 	COUNT(DISTINCT ac.CodeAttentionCenter) FROM ServiceAttentionCenter sac INNER JOIN AttentionCenter ac on sac.CodeAttentionCenter=ac.CodeAttentionCenter
																									   INNER JOIN ServiceEntity se on se.CodeServiceEntity=sac.CodeServiceEntity
																									   INNER JOIN Entity E ON E.CodeEntity=se.CodeEntity
																									   where sac.State=@psiCboEstado and ac.State='1' and se.State='1' and e.State='1' AND 1=CASE WHEN @psiCentroAtencion=-1 THEN 1 WHEN AC.CodeAttentionCenter=@psiCentroAtencion THEN 1 END)
	--print @RecordCount;
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1;     

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select DISTINCT	sac.CodeServiceEntity,ac.CodeAttentionCenter,ac.Description CentroAtencion,se.CodeEntity,E.Description Entidad,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from ServiceAttentionCenter sac 
	INNER JOIN AttentionCenter ac on sac.CodeAttentionCenter=ac.CodeAttentionCenter
	INNER JOIN ServiceEntity se on se.CodeServiceEntity=sac.CodeServiceEntity
	INNER JOIN Entity E ON E.CodeEntity=se.CodeEntity
	where sac.State='+@psiCboEstado+' and ac.State=1 and se.State=1 and e.State=1 AND 1=CASE WHEN '+CAST(@psiCentroAtencion AS VARCHAR(2))+'=-1 THEN 1 WHEN AC.CodeAttentionCenter='+CAST(@psiCentroAtencion AS VARCHAR(5))+' THEN 1 END) AS F'
    
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencionxServicioCombo]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarCentroAtencionxServicioCombo 1
-- DROP PROCEDURE dbo.usp_ListarEntidadxServicioCombo
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarCentroAtencionxServicioCombo](
@CodeService INT
)
AS
BEGIN
   SET NOCOUNT ON
   
	select ac.CodeAttentionCenter,convert(varchar(300),ac.Description,120) DescriptionAttentionCenter
	from AttentionCenter ac
	inner join ServiceAttentionCenter sa on sa.CodeAttentionCenter = ac.CodeAttentionCenter and sa.State = 1
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and ac.State = 1
	where se.CodeService = @CodeService and ac.State = 1
	group by ac.CodeAttentionCenter,ac.Description;

   SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCombo]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ListarCombo](
	@flag INT
)
AS
BEGIN
	IF(@flag=1) 
		--SELECT CodeService,Description FROM Service ser WHERE ser.State=1;
		SELECT CodeService,Description,ts.NameTypeService FROM Service ser inner join TypeService ts on ser.CodeTypeService=ts.CodeTypeService  WHERE ser.State='1' AND ts.State='1';

	IF(@flag=2) 
		SELECT CodeAttentionCenter,Description FROM AttentionCenter ac WHERE ac.State='1';
	
	IF(@flag=3) 
		select CodeTypeService,NameTypeService from TypeService where State='1';

	IF(@flag=4) 
		select CodeEntity,Description from Entity where State='1';

	IF(@flag=5) 
		select zo.CodeZone,zo.ZoneName,ca.Description from Zone zo inner join AttentionCenter ca on zo.CodeAttentionCenter=ca.CodeAttentionCenter where zo.State='1' and ca.State='1';

	IF(@flag=6) 
		select CodeWindow,WindowName from Window where State='1';

	IF(@flag=7) 
	select CodeVideo,VideoName from Video where State='1';

	IF(@flag=8) 
	select CodeTicketType,Description from TicketType where State='1';

	IF(@flag=9) 
	select CodeBanner,BannerName from BANNER where State='1';
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarComboEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ListarComboEntidad](
 @pCodeAttentionCenter INT
) AS
BEGIN
	SELECT 
		AC.CODEATTENTIONCENTER,
		E.CODEENTITY,
		E.DESCRIPTION 
	FROM ENTITY E INNER JOIN ENTITY_ATTENTIONCENTER AC ON E.CODEENTITY=AC.CODEENTITY AND E.STATE='1' AND AC.STATE='1'
	WHERE AC.CODEATTENTIONCENTER=@pCodeAttentionCenter;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidadCentroAtencion]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute  usp_ListarEntidadCentroAtencion 10,1,'CodeAttentionCenter','DESC',-1 ,'1'
CREATE PROCEDURE [dbo].[usp_ListarEntidadCentroAtencion]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiCboCentroAtencion INT,
	@psiCboEstado VARCHAR
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int
	SET @RecordCount = (select COUNT(ac.CodeAttentionCenter) CodeEntity from Entity_AttentionCenter eac  Right join AttentionCenter ac on ac.CodeAttentionCenter=eac.CodeAttentionCenter WHERE ac.State='1' --AND eac.State='1' 
	)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select DISTINCT ac.CodeAttentionCenter,ac.Description,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Entity_AttentionCenter eac 
	INNER join AttentionCenter ac on ac.CodeAttentionCenter=eac.CodeAttentionCenter where Eac.State='+CAST(@psiCboEstado AS VARCHAR(1))+' AND ac.State=1 AND 1=CASE WHEN '+CAST(@psiCboCentroAtencion AS VARCHAR(5))+'=-1 THEN 1 WHEN '+CAST(@psiCboCentroAtencion AS VARCHAR(5))+'=eac.CodeAttentionCenter THEN 1 END
	) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;







GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidades]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarEntidades 10,1,'CodeEntity','asc',-1,'1';
CREATE PROCEDURE [dbo].[usp_ListarEntidades](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psidDescripcion INT,
	@psiEstado VARCHAR(4)
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (select count(CodeEntity) from Entity where State=@psiEstado)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select CodeEntity,Description,Abreviation,UrlLogo,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Entity 
	where State = '+ CAST(@psiEstado AS VARCHAR(1)) + ' AND  
	1= case when '+ CAST(@psidDescripcion AS VARCHAR(5)) + '= -1 THEN 1  WHEN CodeEntity = '+ CAST(@psidDescripcion AS VARCHAR(5)) + ' THEN 1 END
	) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidadxServicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_ListarEntidadxServicio 1019
CREATE PROCEDURE [dbo].[usp_ListarEntidadxServicio](
	--@pstrPagHasta INT,
	--@pstrPagDesde INT,
	--@psiSortColumn VARCHAR(200),
	--@psiSortOrder VARCHAR(200),
	@psCodeEntity INT

)AS
BEGIN

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT * FROM (select DISTINCT se.CodeEntity,se.CodeService,s.Description +'' - ''+ ta.NameTypeService as Description from ServiceEntity se inner join Service s on se.CodeService=s.CodeService
					inner join TypeService ta on ta.CodeTypeService=s.CodeTypeService where se.State=1 and 
					s.State=1 and ta.State=1	AND se.CodeEntity='+ CAST(@psCodeEntity AS VARCHAR(10)) +'
	) AS F' 
    EXEC (@Query)

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServicioEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarServicioEntidad 10,1,'CodeEntity','DESC','-1',1;
CREATE PROCEDURE [dbo].[usp_ListarServicioEntidad](
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(250),
	@psiSortOrder VARCHAR(250),
	@psiEntidad INT,
	@psiCboEstado VARCHAR(5)
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (SELECT COUNT(e.CodeEntity) FROM Entity e inner join ServiceEntity se on e.CodeEntity=se.CodeEntity where e.State='1' --AND se.State='1' 
	)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1;   

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select  distinct e.CodeEntity,e.Description,e.Abreviation,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Entity e inner join ServiceEntity se on e.CodeEntity=se.CodeEntity
	where se.State='+@psiCboEstado+' AND e.State=1 AND 1=CASE WHEN '+CAST(@psiEntidad AS VARCHAR(5))+'=-1 THEN 1 WHEN e.CodeEntity='+CAST(@psiEntidad AS VARCHAR(5))+' THEN 1 END) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServicios]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarServicios 10,1,'CodeService','DESC','PAGO DE TASAS',-1;
CREATE PROCEDURE [dbo].[usp_ListarServicios](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiServicio VARCHAR(300),
	@psiIdTipoServicio INT
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int


	SET @RecordCount = (SELECT COUNT(CodeService) FROM Service WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select CodeService,Description,ts.NameTypeService,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Service se inner join TypeService  ts on se.CodeTypeService=ts.CodeTypeService  and ts.State=1 and se.State=1
	where 1= case when '''+ @psiServicio + '''=''-1'' THEN 1  WHEN se.Description = '''+ @psiServicio + ''' THEN 1 END AND
		  1= case when '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + '= -1 THEN 1  WHEN ts.CodeTypeService = '+ CAST(@psiIdTipoServicio AS VARCHAR(5)) + ' THEN 1 END 
	AND se.State=1) AS F'
    print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServiciosComboAppointment]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Exec dbo.usp_ListarServiciosComboAppointment
-- DROP PROCEDURE dbo.usp_ListarServiciosComboAppointment
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarServiciosComboAppointment]
AS
BEGIN
   SET NOCOUNT ON

	select s.CodeService,convert(varchar(300),S.Description,120) DescriptionService
	from Service s
	where s.state = 1;
	

   SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTablaServicios]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXECUTE usp_ListarTablaServicios 5,5
CREATE PROCEDURE [dbo].[usp_ListarTablaServicios](
	@pCodeEntity INT,
	@pCodeAttentionCenter INT
)AS

BEGIN

	select 
		se.CodeEntity,
		se.CodeService,
		se.CodeServiceEntity,
		eac.CodeAttentionCenter,
		ser.Description,
		TS.NameTypeService,
		case when (select count(*) from ServiceAttentionCenter sac where sac.CodeServiceEntity=se.CodeServiceEntity and sac.CodeAttentionCenter=eac.CodeAttentionCenter and sac.State='1')=1 then 1
		else 
			0
		end Active
	from ServiceEntity se 
	inner join Service ser on se.CodeService=ser.CodeService
	INNER JOIN TypeService TS ON TS.CodeTypeService=SER.CodeTypeService
	inner join Entity_AttentionCenter eac on eac.CodeEntity=se.CodeEntity
	where se.CodeEntity=@pCodeEntity and eac.CodeAttentionCenter=@pCodeAttentionCenter


	--SELECT
	--	distinct 
	--	se.CodeEntity,
	--	se.CodeService,
	--	se.CodeServiceEntity,
	--	ser.Description,
	--	TS.NameTypeService,
	--	--se.Active,
	--	sa.Active
	--FROM Entity_AttentionCenter ecc 
	--inner join ServiceEntity se on ecc.CodeEntity=se.CodeEntity
	--inner join ServiceAttentionCenter sa on sa.CodeServiceEntity=se.CodeServiceEntity
	--inner join service ser on ser. CodeService=se.CodeService
	--INNER JOIN TypeService TS ON TS.CodeTypeService=SER.CodeTypeService
	--where ecc.CodeAttentionCenter=@pCodeAttentionCenter and ecc.CodeEntity=@pCodeEntity;

	--SELECT 
	--	se.CodeEntity,
	--	se.CodeService,
	--	se.CodeServiceEntity,
	--	ser.Description,
	--	TS.NameTypeService,
	--	SA.Active
	--FROM ServiceAttentionCenter SA 
	--INNER JOIN ServiceEntity SE ON SA.CodeServiceEntity=SE.CodeServiceEntity
	--INNER JOIN service ser on ser. CodeService=se.CodeService
	--INNER JOIN TypeService TS ON TS.CodeTypeService=SER.CodeTypeService
	--WHERE SA.CodeAttentionCenter=@pCodeAttentionCenter AND SE.CodeEntity=@pCodeEntity;
END














GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTipoTicket]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_ListarTipoTicket 10,1,'CodeTicketType','DESC',-1,3;
CREATE PROCEDURE [dbo].[usp_ListarTipoTicket](
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200),
	@psiTipoTicket INT,
	@psiPrioridad  INT
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (select count(CodeTicketType) from TicketType where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select TT.CodeTicketType,TT.Description,TT.Priority ,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from TicketType TT where TT.State =1
	AND 1=CASE WHEN '+CAST(@psiTipoTicket AS VARCHAR(5))+'=-1 THEN 1 WHEN TT.CodeTicketType='''+CAST(@psiTipoTicket AS VARCHAR(5))+''' THEN 1 END
	AND 1=CASE WHEN '+CAST(@psiPrioridad AS VARCHAR(5))+'=-1 THEN 1 WHEN TT.Priority='''+CAST(@psiPrioridad AS VARCHAR(5))+''' THEN 1 END
	) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarVentanilla]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_ListarVentanilla 10,1,'CodeWindow','DESC',1,1

CREATE PROCEDURE [dbo].[usp_ListarVentanilla]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiCboZona INT,
	@psiCboVentanilla INT
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (SELECT COUNT(CodeWindow) FROM Window WHERE State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select ca.Description,zo.ZoneName,wi.CodeWindow,wi.WindowName,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Window wi inner join Zone zo  ON  wi.CodeZone=zo.CodeZone inner join  AttentionCenter ca ON ca.CodeAttentionCenter=zo.CodeAttentionCenter  where wi.State=1 and zo.State=1 AND ca.State=1
	AND 1= CASE WHEN '+CAST(@psiCboZona AS VARCHAR(5))+'=-1 THEN 1 WHEN wi.CodeZone='''+CAST(@psiCboZona AS VARCHAR(5))+''' THEN 1 END
	AND 1= CASE WHEN '+CAST(@psiCboVentanilla AS VARCHAR(5))+'=-1 THEN 1 WHEN wi.CodeWindow='''+CAST(@psiCboVentanilla AS VARCHAR(5))+''' THEN 1 END ) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarVideo]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_ListarVideo 10,1,'CodeVideo','ASC'
CREATE PROCEDURE [dbo].[usp_ListarVideo]
(
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200)
) AS

BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (select count(CodeVideo) from Video where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select vi.CodeVideo,vi.VideoName,vi.VideoDescription,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Video vi where vi.State =1) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarZonas]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_ListarZonas 10,1,'CodeZone','DESC','a',1
CREATE PROCEDURE [dbo].[usp_ListarZonas]
(
	@pstrPagHasta INT,
	@pstrPagDesde INT,
	@psiSortColumn VARCHAR(200),
	@psiSortOrder VARCHAR(200),
	@psiTxtZona  VARCHAR(120),
	@psiCodeAttentionCenter INT
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SET @RecordCount = (select count(CodeZone) from Zone where State=1)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select zo.CodeZone,zo.ZoneName,zo.ZoneDescription,at.Description,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Zone zo inner join AttentionCenter at on zo.CodeAttentionCenter=at.CodeAttentionCenter
	where zo.State =1  AND at.State=1 AND
	1=CASE WHEN '''+@psiTxtZona+''' =CAST(-1 AS VARCHAR(5)) THEN 1 WHEN zo.ZoneName ='''+@psiTxtZona+''' THEN 1 END AND
	1=CASE  
			WHEN  '+ CAST(@psiCodeAttentionCenter AS VARCHAR(5))+'=-1 THEN 1
			WHEN at.CodeAttentionCenter='+CAST(@psiCodeAttentionCenter AS VARCHAR(5))+' THEN 1 END
	
	) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)

END;

GO
/****** Object:  StoredProcedure [dbo].[usp_ListarZonexAttentionCenter]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ListarZonexAttentionCenter](
	@psCodeAttentionCenter INT
)AS
BEGIN
	SELECT CodeZone,ZoneName FROM Zone
	WHERE CodeAttentionCenter=@psCodeAttentionCenter;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarBanner]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarBanner]
(
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeBanner INT
)AS
BEGIN
	--BEGIN TRANSACTION		
	--BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Banner WHERE UPPER(BannerName)=UPPER(@Description) AND State='1')
		BEGIN
			INSERT INTO Banner(BannerName,RegistryUser,RegistryDate) VALUES(UPPER(@Description),@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			--COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	--END TRY
	--BEGIN CATCH			
	--	ROLLBACK TRANSACTION
	--	SET @VALOR=-1;	
	--	SELECT @VALOR;
	--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarBannerxZona]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarBannerxZona](
	@CodeZone INT,
	@TablaBanner dtBanner READONLY,
	@RegistryUser VARCHAR(250)
)AS
BEGIN
	DECLARE
	@SERIES_COUNT INT,
	@vCodeBanner INT;
	
	SELECT @SERIES_COUNT = COUNT(*) FROM @TablaBanner;	
	DECLARE @i AS INTEGER;
    SET  @i=1
	SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmTablaBanner FROM @TablaBanner;
	
	DELETE FROM BackBannerZone WHERE CodeZone=@CodeZone;--//LIMPIAMOS LA TABLA CON EL CODIGO DE LA ENTIDAD
	WHILE @i <= @SERIES_COUNT 
    BEGIN
		SET @vCodeBanner=(SELECT tt.CodeBanner FROM #tpmTablaBanner tt WHERE IdRow=@i);		
		INSERT INTO BackBannerZone(CodeBanner,CodeZone,RegistryUser,Active,RegistryDate) VALUES(@vCodeBanner,@CodeZone,@RegistryUser,'1',GETDATE());
		SET @i = @i + 1;
	END;

	/*****************************************************/
	/************ACTUALIZAMOS TABLA BannerZone************/
	/*****************************************************/
		MERGE BannerZone AS SE USING BackBannerZone AS BSE
		ON (SE.CodeBanner=BSE.CodeBanner AND SE.CodeZone=BSE.CodeZone)
		WHEN MATCHED 
			THEN UPDATE SET SE.State='1',SE.Active='1'
		WHEN NOT MATCHED BY TARGET 
			THEN INSERT (CodeBanner,CodeZone,RegistryUser,Active,RegistryDate) VALUES(BSE.CodeBanner,BSE.CodeZone,BSE.RegistryUser,BSE.Active,BSE.RegistryDate)
		WHEN NOT MATCHED BY SOURCE --AND SE.CodeEntity=@CodeEntity
			THEN UPDATE SET SE.State='0', SE.Active='0';

	SELECT @vCodeBanner;

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencion]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarCentroAtencion](
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250),
	@CodeAttentionCenter INT
)AS

BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM AttentionCenter WHERE UPPER(Description)=UPPER(@Description))
		BEGIN
			INSERT INTO AttentionCenter(Description,RegistryUser,RegistryDate) VALUES(UPPER(@Description),@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH	
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencionServicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarCentroAtencionServicio](
	@CodeAttentionCenter INT,
	@CodeEntity INT,
	@TablaServicioEntidad dtServicioEntidad READONLY,
	@RegistryUser VARCHAR(250)
)AS
BEGIN
	DECLARE
	@SERIES_COUNT INT,
	@vCodeServiceEntity INT;
	
	SELECT @SERIES_COUNT = COUNT(*) FROM @TablaServicioEntidad;	
	DECLARE @i AS INTEGER;
    SET  @i=1
	SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmTablaServiceEntity FROM @TablaServicioEntidad;

	delete from BackServiceAttentionCenter WHERE CodeAttentionCenter=@CodeAttentionCenter;
	--update  se
	--		set se.Active='0'
	--from ServiceEntity se inner join ServiceAttentionCenter sa on se.CodeServiceEntity=sa.CodeServiceEntity 
	--where se.CodeEntity=@CodeEntity and sa.CodeAttentionCenter=@CodeAttentionCenter;


	WHILE @i <= @SERIES_COUNT 
    BEGIN	 
		SET @vCodeServiceEntity=(SELECT tt.CodeServiceEntity FROM #tpmTablaServiceEntity tt WHERE IdRow=@i);
		INSERT INTO BackServiceAttentionCenter(CodeServiceEntity,CodeAttentionCenter,Active,RegistryUser,RegistryDate) VALUES(@vCodeServiceEntity,@CodeAttentionCenter,1,@RegistryUser,GETDATE());
		
		--UPDATE ServiceEntity
		--	SET Active='1'
		--WHERE CodeServiceEntity=@vCodeServiceEntity;

		SET @i = @i + 1;
	END;

	/******************ACTUALIZAMOS LA TABLA DE SERVICEATTENTIONCENTER**************/
	/*******************************************************************************/
	--MERGE ServiceAttentionCenter AS SE USING BackServiceAttentionCenter AS BSE
	--ON (SE.CodeServiceEntity=BSE.CodeServiceEntity AND SE.CodeAttentionCenter=BSE.CodeAttentionCenter)
	--WHEN MATCHED 
	--	THEN UPDATE SET SE.State='1'	
	--WHEN NOT MATCHED BY TARGET 
	--	THEN INSERT (CodeServiceEntity,CodeAttentionCenter,RegistryUser,RegistryDate) VALUES(BSE.CodeServiceEntity,BSE.CodeAttentionCenter,BSE.RegistryUser,BSE.RegistryDate)
	--WHEN NOT MATCHED BY SOURCE AND SE.CodeAttentionCenter=@CodeAttentionCenter
	--	THEN UPDATE SET SE.State='0';	
	MERGE ServiceAttentionCenter AS SE USING BackServiceAttentionCenter AS BSE
	ON (SE.CodeServiceEntity=BSE.CodeServiceEntity AND SE.CodeAttentionCenter=BSE.CodeAttentionCenter)
	WHEN MATCHED 
		THEN UPDATE SET SE.Active='1',SE.State='1'
	WHEN NOT MATCHED BY TARGET 
		THEN INSERT (CodeServiceEntity,CodeAttentionCenter,Active,RegistryUser,RegistryDate) VALUES(BSE.CodeServiceEntity,BSE.CodeAttentionCenter,BSE.Active,BSE.RegistryUser,BSE.RegistryDate)
	WHEN NOT MATCHED BY SOURCE AND SE.CodeAttentionCenter=@CodeAttentionCenter
		THEN UPDATE SET SE.Active='0',SE.State='0';
	
	/*******************************************************************************/
	SELECT @vCodeServiceEntity;
END;





GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencionxEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE usp_RegistrarCentroAtencionxEntidad 1,'1,5,7','USER'
CREATE PROCEDURE [dbo].[usp_RegistrarCentroAtencionxEntidad](
	@CodeAttentionCenter INT,
	@TablaEntity ID_ENTITY READONLY,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	DECLARE
	@SERIES_COUNT INT,
	@vCodeEntity INT;	
	
	SELECT @SERIES_COUNT = COUNT(*) FROM @TablaEntity;	
	DECLARE @i AS INTEGER;
    SET  @i=1

	SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmTablaEntity FROM @TablaEntity;
	delete from BackEntity_AttentionCenter WHERE CodeAttentionCenter=@CodeAttentionCenter;
	WHILE @i <= @SERIES_COUNT 
    BEGIN
		SET @vCodeEntity=(SELECT tt.CodeEntity FROM #tpmTablaEntity tt WHERE IdRow=@i);		
		--INSERT INTO Entity_AttentionCenter(CodeAttentionCenter,CodeEntity,RegistryUser,RegistryDate) VALUES(@CodeAttentionCenter,@vCodeEntity,@RegistryUser,GETDATE());		
		INSERT INTO BackEntity_AttentionCenter(CodeAttentionCenter,CodeEntity,RegistryUser,RegistryDate) VALUES(@CodeAttentionCenter,@vCodeEntity,@RegistryUser,GETDATE());		
		
		SET @i = @i + 1;
	END;
	/******************ACTUALIZAMOS LA TABLA************************/

	MERGE Entity_AttentionCenter AS SE USING BackEntity_AttentionCenter AS BSE
		ON (SE.CodeAttentionCenter=BSE.CodeAttentionCenter AND SE.CodeEntity=BSE.CodeEntity)
		WHEN MATCHED 
			THEN UPDATE SET SE.State='1'	
		WHEN NOT MATCHED BY TARGET 
			THEN INSERT (CodeAttentionCenter,CodeEntity,RegistryUser,RegistryDate) VALUES(BSE.CodeAttentionCenter,BSE.CodeEntity,BSE.RegistryUser,BSE.RegistryDate)
		WHEN NOT MATCHED BY SOURCE AND SE.CodeAttentionCenter=@CodeAttentionCenter  
			THEN UPDATE SET SE.State='0';
	/*************************************************************/
	SELECT @vCodeEntity;
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEntidad]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_RegistrarEntidad 'CAMBIO','ccscs','cd',1

CREATE PROCEDURE [dbo].[usp_RegistrarEntidad](
	@Description VARCHAR(250),
	@Abreviation VARCHAR(250),
	@RegistryUser VARCHAR(250),
	@CodeEntity INT
)AS

BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Entity WHERE UPPER(Description)=UPPER(@Description))
		BEGIN
			INSERT INTO Entity(Description,abreviation,RegistryUser,RegistryDate) VALUES(UPPER(@Description),UPPER(@Abreviation),@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH	
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEntidadServicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarEntidadServicio]
(
	@CodeEntity INT,
	@TablaServicio ID_SERVICIO READONLY,
	@RegistryUser VARCHAR(250)

)AS
BEGIN
	DECLARE
	@SERIES_COUNT INT,
	@vCodeServicio INT;	

	SELECT @SERIES_COUNT = COUNT(*) FROM @TablaServicio;	
	DECLARE @i AS INTEGER;
    SET  @i=1

	SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmTablaServicio FROM @TablaServicio;	

	DELETE FROM BackServiceEntity WHERE CodeEntity=@CodeEntity;--//LIMPIAMOS LA TABLA CON EL CODIGO DE LA ENTIDAD

	WHILE @i <= @SERIES_COUNT 
    BEGIN
		SET @vCodeServicio=(SELECT tt.CodeServicio FROM #tpmTablaServicio tt WHERE IdRow=@i);		
		INSERT INTO BackServiceEntity(CodeEntity,CodeService,RegistryUser,RegistryDate) VALUES(@CodeEntity,@vCodeServicio,@RegistryUser,GETDATE());
		SET @i = @i + 1;
	END;

	/*****************************************************/
	/************ACTUALIZAMOS TABLA ServiceEntity*********/
	/*****************************************************/
		MERGE ServiceEntity AS SE USING BackServiceEntity AS BSE
		ON (SE.CodeEntity=BSE.CodeEntity AND SE.CodeService=BSE.CodeService)
		WHEN MATCHED 
			THEN UPDATE SET SE.State='1'	
		WHEN NOT MATCHED BY TARGET 
			THEN INSERT (CodeEntity,CodeService,RegistryUser,RegistryDate) VALUES(BSE.CodeEntity,BSE.CodeService,BSE.RegistryUser,BSE.RegistryDate)
		WHEN NOT MATCHED BY SOURCE AND SE.CodeEntity=@CodeEntity
			THEN UPDATE SET SE.State='0';

	/*************ACTUALIZAMOS TABLA ServiceAttentionCenter*******/

		--MERGE ServiceAttentionCenter AS SAC USING ServiceEntity AS SER ON (SAC.CodeServiceEntity=SER.CodeServiceEntity)
		--WHEN MATCHED AND SER.State='0'
		--	THEN UPDATE SET SAC.State='0';
	
	/*************************************************************/
	/*************************************************************/
	SELECT @vCodeServicio;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarServicio]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarServicio]
(
	@CodeService INT,
	@CodeTypeService INT,
	@Description VARCHAR(250),
	@RegistryUser VARCHAR(250)
)AS

BEGIN
	DECLARE @VALOR INT;
	BEGIN TRANSACTION	
	BEGIN TRY
		IF NOT EXISTS(SELECT 1 FROM Service WHERE UPPER(Description)=UPPER(@Description) --AND CodeTypeService=@CodeTypeService 
		AND State='1') 
		BEGIN
			INSERT INTO Service(Description,CodeTypeService,RegistryUser,RegistryDate) VALUES(UPPER(@Description),@CodeTypeService,@RegistryUser,GETDATE());
			SET @VALOR=SCOPE_IDENTITY();
			SELECT @VALOR;
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UN SERVICIO REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTipoTicket]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarTipoTicket](
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@Priority INT,
	@CodeTicketType INT,
	@IsPreferential BIT
)AS
BEGIN
	DECLARE @VALOR INT;
	IF NOT EXISTS (SELECT 1 FROM TicketType WHERE UPPER(Description)=UPPER(@Description) AND State='1')
	BEGIN
		INSERT INTO TicketType(Description,Priority,RegistryUser,RegistryDate,IsPreferential) VALUES(UPPER(@Description),@Priority,@RegistryUser,GETDATE(),@IsPreferential);
		SET @VALOR=SCOPE_IDENTITY();
	END
	ELSE
	BEGIN
		SET @VALOR=0;--YA EXISTE UNA TIPO DE TICKET REGISTRADA
	END	
	SELECT @VALOR;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVentanilla]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarVentanilla]
(
	@Description VARCHAR(200),
	@RegistryUser VARCHAR(200),
	@CodeWindow INT,
	@CodeZone INT 
)AS
BEGIN
	--BEGIN TRANSACTION		
	--BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Window WHERE UPPER(WindowName)=UPPER(@Description) AND State='1' AND CodeZone=@CodeZone)
		BEGIN
			INSERT INTO Window(WindowName,RegistryUser,RegistryDate,CodeZone) VALUES(UPPER(@Description),@RegistryUser,GETDATE(),@CodeZone);
			SET @VALOR=SCOPE_IDENTITY();
			--COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	--END TRY
	--BEGIN CATCH			
	--	ROLLBACK TRANSACTION
	--	SET @VALOR=-1;	
	--	SELECT @VALOR;
	--END CATCH

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarZona]    Script Date: 25/10/2019 19:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarZona]
(
	@Description VARCHAR(200),
	@CodeAttentionCenter INT,
	@RegistryUser VARCHAR(200),
	@CodeZone VARCHAR(100)

)AS
BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM Zone WHERE UPPER(ZoneName)=UPPER(@Description) AND State='1' AND CodeAttentionCenter=@CodeAttentionCenter)
		BEGIN
			INSERT INTO Zone(ZoneName,RegistryUser,RegistryDate,CodeAttentionCenter) VALUES(UPPER(@Description),@RegistryUser,GETDATE(),@CodeAttentionCenter);
			SET @VALOR=SCOPE_IDENTITY();
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			SET @VALOR=0;--YA EXISTE UNA ENTIDAD REGISTRADA
		END	
		SELECT @VALOR;
	END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END;

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hora de ingreso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'TicketTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Ingreso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'TicketDate'
GO
