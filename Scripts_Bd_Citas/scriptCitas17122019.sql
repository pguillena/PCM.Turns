USE [db_pcm_gob_pe_turn]
GO
/****** Object:  UserDefinedTableType [dbo].[dtAppointment]    Script Date: 17/12/2019 0:37:41 ******/
CREATE TYPE [dbo].[dtAppointment] AS TABLE(
	[CodeActivity] [int] NULL,
	[CodeServiceEntity] [int] NULL,
	[CodeAttentionCenter] [int] NULL,
	[CodeSchedule] [int] NULL,
	[Dni] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[FirstLastName] [varchar](50) NULL,
	[SecondLastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[AppointmentDate] [varchar](50) NULL,
	[CodeChannelTypeAttention] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[dtBanner]    Script Date: 17/12/2019 0:37:41 ******/
CREATE TYPE [dbo].[dtBanner] AS TABLE(
	[CodeBanner] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[dtServicioEntidad]    Script Date: 17/12/2019 0:37:41 ******/
CREATE TYPE [dbo].[dtServicioEntidad] AS TABLE(
	[CodeServiceEntity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ID_ENTITY]    Script Date: 17/12/2019 0:37:41 ******/
CREATE TYPE [dbo].[ID_ENTITY] AS TABLE(
	[CodeEntity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ID_SERVICIO]    Script Date: 17/12/2019 0:37:41 ******/
CREATE TYPE [dbo].[ID_SERVICIO] AS TABLE(
	[CodeServicio] [int] NULL
)
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activity](
	[CodeActivity] [int] IDENTITY(1,1) NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[StartQuota] [int] NULL,
	[EndQuota] [int] NULL,
	[Available] [bit] NULL,
	[CodeReservationType] [int] NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alomac]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appointment](
	[CodeAppointment] [int] IDENTITY(1,1) NOT NULL,
	[CodePeople] [int] NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeReservationType] [int] NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[CodetypeAttention] [int] NOT NULL,
	[CodeUser] [int] NULL,
	[AppointmentDate] [date] NULL,
	[CodeChannelTypeAttention] [int] NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attention]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BackBannerZone]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BackEntity_AttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BackServiceAttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BackServiceEntity]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[CodeBanner] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](500) NULL,
	[BannerDescription] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Order] [int] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Banner__9F0813839DB1F096] PRIMARY KEY CLUSTERED 
(
	[CodeBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BannerZone]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[Date] [datetime] NULL,
	[CodeDayType] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChannelTypeAttention]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChannelTypeAttention](
	[CodeChannelTypeAttention] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](250) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_ChannelTypeAttention] PRIMARY KEY CLUSTERED 
(
	[CodeChannelTypeAttention] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailGroupService]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity_AttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GeoLocation]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupService]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[People]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[People](
	[CodePeople] [int] IDENTITY(1,1) NOT NULL,
	[CodeTypeDocument] [int] NOT NULL,
	[NumberDocument] [nvarchar](8) NULL,
	[FirstName] [nvarchar](50) NULL,
	[FirstLastName] [nvarchar](50) NULL,
	[SecondLastName] [nvarchar](50) NULL,
	[Name] [nvarchar](550) NULL,
	[Email] [nvarchar](50) NULL,
	[Telephone] [nvarchar](20) NULL,
	[Pide] [bit] NULL,
	[PideDate] [datetime] NULL,
	[Birthdate] [datetime] NULL,
	[Sex] [nvarchar](50) NULL,
	[CivilStatus] [nvarchar](50) NULL,
	[CodeGeoLocation] [char](6) NULL,
	[Address] [nvarchar](200) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__People__EECDDD54170E59B8] PRIMARY KEY CLUSTERED 
(
	[CodePeople] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReservationType]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReservationType](
	[CodeReservationType] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[RegistryUser] [nvarchar](250) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_ReservationType] PRIMARY KEY CLUSTERED 
(
	[CodeReservationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[CodeSchedule] [int] IDENTITY(1,1) NOT NULL,
	[CodeTimeInterval] [int] NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduleAttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleAttentionCenter](
	[CodeScheduleAttentionCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeChannelTypeAttention] [int] NOT NULL,
	[CodeReservationType] [int] NULL,
	[DayName] [nvarchar](100) NULL,
	[DayNumber] [int] NULL,
	[Quota] [int] NULL,
	[AvgAttentionTime] [nvarchar](200) NULL,
	[Description] [nvarchar](50) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_ScheduleAttentionCenter] PRIMARY KEY CLUSTERED 
(
	[CodeScheduleAttentionCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduleException]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleException](
	[CodeScheduleException] [int] IDENTITY(1,1) NOT NULL,
	[CodeServAttenCenter] [int] NOT NULL,
	[CodeSchedule] [int] NOT NULL,
	[CodeChannelTypeAttention] [int] NOT NULL,
	[ExceptionDate] [datetime] NULL,
	[Quota] [int] NULL,
	[AvgAttentionTime] [nvarchar](200) NULL,
	[Description] [nvarchar](50) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_ScheduleException] PRIMARY KEY CLUSTERED 
(
	[CodeScheduleException] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SequenceTicket]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceAttention]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceAttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceAttentionCenter](
	[CodeServAttenCenter] [int] IDENTITY(1,1) NOT NULL,
	[CodeServiceEntity] [int] NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[Active] [char](1) NULL,
	[State] [char](1) NULL,
	[AppointmentService] [bit] NULL,
	[CodeEntityAttentionCenter] [int] NULL,
	[CodeReservationType] [int] NULL,
 CONSTRAINT [PK__Procedur__373E264932516BA7] PRIMARY KEY CLUSTERED 
(
	[CodeServAttenCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceEntity]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceTicket]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[CodeTicket] [int] IDENTITY(1,1) NOT NULL,
	[TicketName] [nvarchar](100) NULL,
	[CodeTicketState] [int] NOT NULL,
	[CodeTicketType] [int] NOT NULL,
	[TicketTime] [datetime] NULL,
	[TicketDate] [datetime] NULL,
	[CodePeople] [int] NOT NULL,
	[CodeAttentionCenter] [int] NOT NULL,
	[OrderArrival] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Ticket__E7BD581B7B173398] PRIMARY KEY CLUSTERED 
(
	[CodeTicket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketState]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketStateHistory]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeDocument]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeDocument](
	[CodeTypeDocument] [int] IDENTITY(1,1) NOT NULL,
	[DescriptionDocument] [varchar](250) NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeTypeDocument] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeService]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[CodeVideo] [int] IDENTITY(1,1) NOT NULL,
	[VideoName] [nvarchar](120) NULL,
	[VideoDescription] [nvarchar](250) NULL,
	[VideoAdress] [nvarchar](250) NULL,
	[CodeVideoState] [int] NOT NULL,
	[RegistryUser] [nvarchar](100) NULL,
	[RegistryDate] [datetime] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK__Video__4E6C0241A98AD68F] PRIMARY KEY CLUSTERED 
(
	[CodeVideo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoState]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VideoState](
	[CodeVideoState] [int] IDENTITY(1,1) NOT NULL,
	[VideoStateName] [varchar](250) NOT NULL,
	[RegistryUser] [varchar](250) NULL,
	[RegistryDate] [date] NULL,
	[State] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodeVideoState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoZone]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Window]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
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
ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF__People__State__18F6A22A]  DEFAULT ('1') FOR [State]
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
ALTER TABLE [dbo].[TypeDocument] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[TypeService] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_CodeVideoState]  DEFAULT ((1)) FOR [CodeVideoState]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF__Video__State__0B5CAFEA]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[VideoState] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[VideoZone] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Window] ADD  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Zone] ADD  CONSTRAINT [DF__Zone__State__13F1F5EB]  DEFAULT ('1') FOR [State]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ReservationType] FOREIGN KEY([CodeReservationType])
REFERENCES [dbo].[ReservationType] ([CodeReservationType])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ReservationType]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_ChannelTypeAttention] FOREIGN KEY([CodeChannelTypeAttention])
REFERENCES [dbo].[ChannelTypeAttention] ([CodeChannelTypeAttention])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_ChannelTypeAttention]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_People] FOREIGN KEY([CodePeople])
REFERENCES [dbo].[People] ([CodePeople])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_People]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_ReservationType] FOREIGN KEY([CodeReservationType])
REFERENCES [dbo].[ReservationType] ([CodeReservationType])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_ReservationType]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Schedule] FOREIGN KEY([CodeSchedule])
REFERENCES [dbo].[Schedule] ([CodeSchedule])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Schedule]
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
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK__People__CodeType__3FA65AF7] FOREIGN KEY([CodeTypeDocument])
REFERENCES [dbo].[TypeDocument] ([CodeTypeDocument])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK__People__CodeType__3FA65AF7]
GO
ALTER TABLE [dbo].[ScheduleAttentionCenter]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleAttentionCenter_Schedule] FOREIGN KEY([CodeSchedule])
REFERENCES [dbo].[Schedule] ([CodeSchedule])
GO
ALTER TABLE [dbo].[ScheduleAttentionCenter] CHECK CONSTRAINT [FK_ScheduleAttentionCenter_Schedule]
GO
ALTER TABLE [dbo].[ScheduleException]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleException_Schedule] FOREIGN KEY([CodeSchedule])
REFERENCES [dbo].[Schedule] ([CodeSchedule])
GO
ALTER TABLE [dbo].[ScheduleException] CHECK CONSTRAINT [FK_ScheduleException_Schedule]
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
ALTER TABLE [dbo].[TicketStateHistory]  WITH CHECK ADD  CONSTRAINT [FK__TicketSta__CodeT__251C81ED] FOREIGN KEY([CodeTicket])
REFERENCES [dbo].[Ticket] ([CodeTicket])
GO
ALTER TABLE [dbo].[TicketStateHistory] CHECK CONSTRAINT [FK__TicketSta__CodeT__251C81ED]
GO
ALTER TABLE [dbo].[TicketStateHistory]  WITH CHECK ADD FOREIGN KEY([CodeTicketState])
REFERENCES [dbo].[TicketState] ([CodeTicketState])
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD FOREIGN KEY([CodeVideoState])
REFERENCES [dbo].[VideoState] ([CodeVideoState])
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
/****** Object:  StoredProcedure [dbo].[ELIMINAR]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[PK_MAS_SERVICE_BUSCAR]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertarCita]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
@vQuota INT,
@vContActivityExist     INT,
@Response INT,
@NumRegistros INT,
@i INT,

@vCodeActivity INT,
@vCodeServiceEntity INT,
@vCodeAttentionCenter INT,
@vCodeSchedule INT,
@Dni INT,
@FirstName VARCHAR(50),
@FirstLastName VARCHAR(50),
@SecondLastName VARCHAR(50),
@Email VARCHAR(50),
@Telephone VARCHAR(50),
@vAppointmentDate VARCHAR(50),
@vCodeChannelTypeAttention INT,
@vCodeReservationType int


   SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmAppointmentEntity FROM @tpmAppointmentEntity;
 
   SET @NumRegistros=(SELECT COUNT(1) FROM #tpmAppointmentEntity);
   SET @i=1;  
    
   WHILE @i<=@NumRegistros
   BEGIN
	SELECT @vCodeServiceEntity = tap.CodeServiceEntity,@vCodeSchedule = tap.CodeSchedule,@vAppointmentDate = tap.AppointmentDate,@Dni = Dni	
	from #tpmAppointmentEntity tap
	WHERE IdRow=@i ;

	SELECT @vContActivityExist = Count(*)
	from  Appointment apo
	inner join ServiceAttentionCenter sac on sac.CodeServAttenCenter = apo.CodeServAttenCenter and sac.state = 1
	inner join ServiceEntity s on s.CodeServiceEntity = sac.CodeServiceEntity and s.state = 1
	inner join People peo on peo.CodePeople = apo.CodePeople and peo.State = '1'	
	WHERE apo.state = 1 and apo.AppointmentDate >=  cast(getdate() As Date) and peo.NumberDocument = @Dni and
	apo.AppointmentDate = @vAppointmentDate and s.CodeServiceEntity = @vCodeServiceEntity;  

	SET @i+=1;

	IF (@vContActivityExist>0)
	BEGIN
		SET	@vContActivityExist+=1;
	END 
   END

  
	SET @i=1;

	IF (@vContActivityExist = 0)
	BEGIN
		WHILE @i<=@NumRegistros
		BEGIN	 
	

	SELECT @vCodeServAttenCenter = sa.CodeServAttenCenter FROM ServiceAttentionCenter sa 
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = '1'
	INNER JOIN #tpmAppointmentEntity tae on tae.CodeServiceEntity = se.CodeServiceEntity and tae.CodeAttentionCenter = sa.CodeAttentionCenter
	WHERE sa.state = '1' and IdRow=@i;

	SELECT @vCodeActivity = tap.CodeActivity,@vCodeServiceEntity = tap.CodeServiceEntity,@vCodeAttentionCenter = CodeAttentionCenter,@vCodeSchedule = tap.CodeSchedule,
	@Dni = tap.Dni, @FirstName = tap.FirstName,@FirstLastName = tap.FirstLastName, @SecondLastName = tap.SecondLastName, @Email = tap.Email,
	@Telephone = tap.Telephone
	from #tpmAppointmentEntity tap
	WHERE IdRow=@i;

	IF @vCodeActivity=0
	BEGIN
		set @vQuota=(select top 1 s.Quota from ScheduleAttentionCenter s 
		where s.CodeServAttenCenter=@vCodeServAttenCenter and s.CodeSchedule=@vCodeSchedule)

		set @vCodeReservationType=(select top 1 s.CodeReservationType from ScheduleAttentionCenter s 
		where s.CodeServAttenCenter=@vCodeServAttenCenter and s.CodeSchedule=@vCodeSchedule)

		INSERT INTO [Activity]
		(CodeSchedule,CodeServAttenCenter,StartQuota,EndQuota,Available
		,CodeReservationType,CodeState,RegistryDate,State,ActivityDate)
		VALUES(@vCodeSchedule,@vCodeServAttenCenter,@vQuota,0,1
		,@vCodeReservationType,1,getdate(),1,@vAppointmentDate)

		SET @vCodeActivity=(select top 1 CodeActivity from Activity where CodeServAttenCenter=@vCodeServAttenCenter and CodeSchedule=@vCodeSchedule)

	END
		

		IF ((SELECT COUNT(*) FROM People where NumberDocument= @Dni) > 0)
		BEGIN
			SELECT @vCodePeople = CodePeople FROM People where NumberDocument = @Dni

			INSERT INTO Appointment
			(CodePeople,CodeSchedule,CodeServAttenCenter,CodetypeAttention, CodeState, RegistryUser, RegistryDate,AppointmentDate,CodeChannelTypeAttention)
			VALUES (@vCodePeople,@vCodeSchedule,@vCodeServAttenCenter, 1,1, 'System', GETDATE(),@vAppointmentDate,@vCodeChannelTypeAttention);       
    
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
			(NumberDocument,CodeTypeDocument, FirstName, FirstLastName, SecondLastName, Email, Telephone, RegistryUser, RegistryDate)
			VALUES (@Dni,1,@FirstName,@FirstLastName,@SecondLastName,@Email ,@Telephone, 'SYSTEM', GETDATE());

			SELECT @vCodePeople = CodePeople FROM People where NumberDocument = @Dni;

			INSERT INTO Appointment
			(CodePeople,CodeSchedule,CodeServAttenCenter,CodetypeAttention, CodeState, RegistryUser, RegistryDate,AppointmentDate,CodeChannelTypeAttention)
			VALUES (@vCodePeople,@vCodeSchedule,@vCodeServAttenCenter, 1,1, 'System', GETDATE(),@vAppointmentDate,@vCodeChannelTypeAttention);

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
	
		SET @i+=1	
		END
	END
	ELSE
	BEGIN
		SET @Response=2;--LA PERSONA YA TIENE CITA RESERVADA
	END 
   
   select @Response as Response;
END



GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarBanner]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCentroAtencion]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ActualizarEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ActualizarServiceAttentionCenterCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarServiceAttentionCenterCitas](
	@CodeServAttenCenter INT,
	@CodeAttentionCenter INT,
	@CodeEntityAttentionCenter INT,
	@CodeReservationType INT,
	@CodeServiceEntity INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN	
	DECLARE  @registrosafectados int = 0;
	BEGIN
		UPDATE ServiceAttentionCenter
			SET CodeAttentionCenter = @CodeAttentionCenter,
				CodeEntityAttentionCenter = @CodeEntityAttentionCenter,
				CodeServiceEntity = @CodeServiceEntity,
				CodeReservationType = @CodeReservationType,
				RegistryUser = @RegistryUser
		WHERE CodeServAttenCenter = @CodeServAttenCenter;
		SET @registrosafectados = @@ROWCOUNT;
	END

	SELECT @registrosafectados;			
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarServicio]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ActualizarTipoTicket]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ActualizarVentanilla]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ActualizarZona]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AprobarVideo]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AprobarVideo](
	@CodeVideo INT,
	@RegistryUser VARCHAR(250)
)
AS
BEGIN
	DECLARE @VALOR INT;
	IF NOT EXISTS (SELECT 1 FROM Video WHERE CodeVideo=@CodeVideo AND State='1')
	BEGIN
		UPDATE Video
			SET CodeVideoState=2
		WHERE CodeVideo=@CodeVideo AND State='1';
		SET @VALOR=1;
	END
	ELSE
	BEGIN
		SET @VALOR=0;--ya esta aprobado
	END;
	SELECT @VALOR;
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocompletar]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXECUTE usp_Autocompletar 8,'BA'
CREATE PROCEDURE [dbo].[usp_Autocompletar](
	@piiMaxFilas int=0, 
	@psiEmpezarCon varchar(30)=''		

)AS
BEGIN
	select 	
		distinct
		TOP (@piiMaxFilas) se.CodeEntity Id,
		e.Description Valor
	from ServiceEntity se inner join Entity e on e.CodeEntity=se.CodeEntity		
	WHERE se.State='1' AND e.State ='1' AND e.Description LIKE '%'+ @psiEmpezarCon + '%';		
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocompletar(prueba)]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_CurrentRow]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarBanner]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarBannerZona]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarBannerZona](
	@CodeAttentionCenter INT,
	@RegistryUser VARCHAR(250)
)
AS
BEGIN
	declare @registrosafectados int = 0;	

	--UPDATE Zone
	--	SET State='0'
	--WHERE CodeAttentionCenter=@CodeAttentionCenter;

	update BannerZone
		set state='0'
	where state ='1' and CodeZone in (select CodeZone from Zone where CodeAttentionCenter=@CodeAttentionCenter); 
	   
	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;








GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencion]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencionServicios]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarCentroAtencionxEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarServiceAttentionCenterCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarServiceAttentionCenterCitas](
	@CodeServAttenCenter INT,
	@RegistryUser VARCHAR(200)
)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE ServiceAttentionCenter
		SET State='0'
	WHERE CodeServAttenCenter=@CodeServAttenCenter;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarServicioxEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarSevicio]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarTipoTicket]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarVideo]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EliminarVideo](
	@CodeVideo INT,
	@RegistryUser VARCHAR(250)

)AS
BEGIN
	declare @registrosafectados int = 0;
	UPDATE Video
		SET State='0'
	WHERE CodeVideo=@CodeVideo;

	set @registrosafectados = @@ROWCOUNT;
	SELECT @registrosafectados;

END


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarWindow]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_EliminarZona]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ExportarCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ExportarCitas](
	@CodeAttentionCenter INT,
	@CodeChannelTypeAttention INT,
	@AppointmentDate VARCHAR(50)

)
AS
BEGIN

	SELECT apo.CodeAppointment,p.NumberDocument,p.FirstName+' '+p.FirstLastName+' '+p.SecondLastName DescriptionName,
	sch.Description DescriptionSchedule,ac.Description DescriptionAttentionCenter,s.Description DescriptionService,
	convert(varchar(300),ca.Description,120) DescriptionChannelTypeAttention,
	convert(varchar(20),apo.AppointmentDate,23) AppointmentDate,apo.state
	from Appointment apo
	inner join People p on p.CodePeople = apo.CodePeople and p.State = '1'
	inner join ChannelTypeAttention ca on ca.CodeChannelTypeAttention = apo.CodeChannelTypeAttention and ca.State = '1'
	inner join Schedule sch ON apo.CodeSchedule=sch.CodeSchedule  and sch.State = '1'
	inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = apo.CodeServAttenCenter and sa.State = '1'
	inner join AttentionCenter ac on ac.CodeAttentionCenter = sa.CodeAttentionCenter and ac.State = '1'
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = '1'
	inner join Service s on s.CodeService = se.CodeService and s.State = '1'
	WHERE apo.state = '1' and 
	1= case when @CodeAttentionCenter = -1 THEN 1  WHEN sa.CodeAttentionCenter = @CodeAttentionCenter  THEN 1 END AND
	1= case when @CodeChannelTypeAttention = -1 THEN 1  WHEN apo.CodeChannelTypeAttention = @CodeChannelTypeAttention THEN 1 END AND
	1= case when @AppointmentDate = '-1' THEN 1  WHEN apo.AppointmentDate = @AppointmentDate THEN 1 END
	 	
END;




GO
/****** Object:  StoredProcedure [dbo].[usp_filtrarEntidadServicios]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_filtrarEntidadServicios -1,-1;
CREATE PROCEDURE [dbo].[usp_filtrarEntidadServicios]
(
	@psCodeService INT,	
	@psCodeEntity INT
)
AS
BEGIN	
		SELECT
			DISTINCT
			se.CodeEntity,
			e.Description,--537
			e.UrlLogo
		FROM ServiceEntity se
		INNER JOIN Entity e ON se.CodeEntity=e.CodeEntity
		--LEFT JOIN ServiceAttentionCenter sa on sa.CodeServiceEntity=se.CodeServiceEntity 
		WHERE 1=CASE 
					WHEN @psCodeService=-1 then 1
					WHEN se.CodeService=@psCodeService THEN 1 END
					AND 1=CASE WHEN @psCodeEntity=-1 THEN 1
							   WHEN se.CodeEntity=@psCodeEntity THEN 1 END;				
			 --AND 1=CASE WHEN @psCodeAttentionCenter=-1 THEN 1
				--		WHEN sa.CodeAttentionCenter=@psCodeAttentionCenter THEN 1 END;
END;









GO
/****** Object:  StoredProcedure [dbo].[usp_generarTicketOrden]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_generarTicketOrden](
	@prioridad INT ,
	@ordenLlegada INT,
	@RegistryUser VARCHAR(120),
	@CodeAttentionCenter INT,
	@CodeTicket INT=18
)AS
DECLARE 
@vOrderSecuence INT,
@vTiempoEsperaMax INT,--PARAMETRO EN HH;MM;SS?
@vTiempoEspera INT,
@VALOR INT;
BEGIN
	BEGIN TRY	
		SET @vTiempoEsperaMax=@vTiempoEsperaMax;
		SET @vTiempoEspera=(select datediff(SECOND,(select TicketDate from ticket where CodeTicket=@CodeTicket),getdate()));--EN SEGUNDOS
		SET @vOrderSecuence=@prioridad-(@prioridad*(@vTiempoEspera/@vTiempoEsperaMax))+(1-(1/@ordenLlegada));--FORMULA DE ORDEN PARA GENERACION DE TICKET
		INSERT INTO SequenceTicket(CodeAttentionCenter,CodeTicket,OrderSecuence,RegistryUser,RegistryDate) VALUES(@CodeAttentionCenter,@CodeTicket,@vOrderSecuence,@RegistryUser,GETDATE());
		SET @VALOR=SCOPE_IDENTITY();
		SELECT @VALOR;
	END TRY
	BEGIN CATCH	
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END;




GO
/****** Object:  StoredProcedure [dbo].[USP_GET_UBIGEO]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListaDataCentroAtencionEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarActividadxIdCalendar]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarActividadxIdCalendar](
@CodeServiceEntity INT,
@CodeAttentionCenter INT
)
AS
BEGIN
   SET NOCOUNT ON
	
	SELECT 0 as CodeActivity,sa.CodeServAttenCenter,se.CodeServiceEntity,
	sch.Description + (CASE WHEN sac.CodeReservationType=1 THEN ' cupos: '+CAST(sac.Quota as nvarchar) ELSE ' Estimado:'+CAST(sac.AvgAttentionTime as nvarchar) END) as DescriptionActivity,
	sch.CodeSchedule, c.Date as ActivityDate,
	convert(varchar(20),c.Date,23) + ' ' + convert(varchar(20),sch.StartTime,8) StartTime,
	convert(varchar(20),c.Date,23) + ' ' + convert(varchar(20),sch.EndTime,8) EndTime,sa.CodeAttentionCenter,
	sac.Quota,1 as Available,(sac.Quota) Quota,se.CodeService
	from Calendar c
	inner join ScheduleAttentionCenter sac on sac.DayNumber=DATEPART(dw, c.Date) --and sac.CodeReservationType=1
	inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = sac.CodeServAttenCenter and sa.State = 1
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.CodeServiceEntity = @CodeServiceEntity  and se.State = 1
	inner join Schedule sch ON sac.CodeSchedule=sch.CodeSchedule and sch.State =1
	WHERE sa.CodeAttentionCenter = @CodeAttentionCenter 
	and c.Date >=getdate() and YEAR(c.Date)=YEAR(getdate())--and c.Date=convert(date,'14/12/2019',103);

	--ANTES
	--SELECT act.CodeActivity,sch.Description DescriptionActivity,sch.CodeSchedule, act.ActivityDate,
	--convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.StartTime,8) StartTime,
	--convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.EndTime,8) EndTime,sa.CodeAttentionCenter,
	--act.StartQuota,act.Available,(act.StartQuota-act.EndQuota) Quota,se.CodeService
	--from Activity act 
	--inner join Schedule sch ON act.CodeSchedule=sch.CodeSchedule 
	--inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = act.CodeServAttenCenter and sa.State = 1
	--inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = 1
	--WHERE act.state = '1' and se.CodeService = @CodeService and sa.CodeAttentionCenter = @CodeAttentionCenter 
	--and act.ActivityDate >=  cast(getdate() As Date);

   SET NOCOUNT OFF
END






GO
/****** Object:  StoredProcedure [dbo].[usp_ListarBanner]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarBannerxAttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--usp_ListarBannerxAttentionCenter 4
CREATE PROCEDURE [dbo].[usp_ListarBannerxAttentionCenter](
	@psCodeZone INT 
)AS
BEGIN
	select ba.CodeBanner,ba.BannerName,ba.[Order],isnull(bz.Active,'0') Active from 
	(select 	
		bz.CodeBanner,	
		bz.Active
	from BannerZone bz
	where bz.State='1'
	and bz.CodeZone=@psCodeZone) bz right JOIN banner ba on bz.CodeBanner=ba.CodeBanner where ba.State='1';
END;





GO
/****** Object:  StoredProcedure [dbo].[usp_ListarBannerxZone]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarBannerxZone 10,1,'CodeAttentionCenter','ASC',-1,'1'
CREATE PROCEDURE [dbo].[usp_ListarBannerxZone]
(
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@psiCbxCentroAtencion INT,
	@psiCboEstado VARCHAR(2)
)AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

 	SET @RecordCount = (select count(distinct zo.CodeAttentionCenter) from zone zo inner join AttentionCenter ac on zo.CodeAttentionCenter=ac.CodeAttentionCenter where zo.State=@psiCboEstado and ac.state='1' AND 1= CASE WHEN @psiCbxCentroAtencion=-1 THEN 1 WHEN zo.CodeAttentionCenter=@psiCbxCentroAtencion THEN 1 END );
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (
		select distinct zo.CodeAttentionCenter,ac.Description,count(zo.CodeZone) Cant_zonas,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+' PageCount from zone zo inner join AttentionCenter ac on zo.CodeAttentionCenter=ac.CodeAttentionCenter		
		where zo.State='+@psiCboEstado+' and ac.state=1 AND 1= CASE WHEN '+CAST(@psiCbxCentroAtencion AS VARCHAR(2))+'=-1 THEN 1 WHEN zo.CodeAttentionCenter='+CAST(@psiCbxCentroAtencion AS VARCHAR(2))+' THEN 1 END  group by zo.CodeAttentionCenter,ac.Description) AS F'  
	print @Query;

    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END




GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencion]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencionServicio]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarCentroAtencionxServicioCombo]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarCentroAtencionxServicioCombo 1
-- DROP PROCEDURE dbo.usp_ListarEntidadxServicioCombo
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarCentroAtencionxServicioCombo](
@CodeServiceEntity INT
)
AS
BEGIN
   SET NOCOUNT ON
   
	select ac.CodeAttentionCenter,convert(varchar(300),ac.Description,120) DescriptionAttentionCenter
	from AttentionCenter ac
	inner join ServiceAttentionCenter sa on sa.CodeAttentionCenter = ac.CodeAttentionCenter and sa.State = 1
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and ac.State = 1
	where se.CodeServiceEntity = @CodeServiceEntity and ac.State = 1
 and sa.AppointmentService=1	group by ac.CodeAttentionCenter,ac.Description;

   SET NOCOUNT OFF
END


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarChannelTypeAttention]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarChannelTypeAttention]
AS
BEGIN
   SET NOCOUNT ON
   
	select ac.CodeChannelTypeAttention,convert(varchar(300),ac.Description) DescriptionChannelTypeAttention
	from ChannelTypeAttention ac	
	where ac.State = 1

   SET NOCOUNT OFF
END




GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarCitas](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@CodeAttentionCenter INT,
	@CodeChannelTypeAttention INT,
	@AppointmentDate VARCHAR(50)

)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SELECT apo.CodeAppointment,p.NumberDocument,p.FirstName+' '+p.FirstLastName+' '+p.SecondLastName DescriptionName,
	sch.Description DescriptionSchedule,ac.Description DescriptionAttentionCenter,s.Description DescriptionService,
	convert(varchar(300),ca.Description,120) DescriptionChannelTypeAttention,
	convert(varchar(20),apo.AppointmentDate,23) AppointmentDate,apo.state
	INTO #tpmAppointmentEntity
	from Appointment apo
	inner join People p on p.CodePeople = apo.CodePeople and p.State = '1'
	inner join ChannelTypeAttention ca on ca.CodeChannelTypeAttention = apo.CodeChannelTypeAttention and ca.State = '1'
	inner join Schedule sch ON apo.CodeSchedule=sch.CodeSchedule  and sch.State = '1'
	inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = apo.CodeServAttenCenter and sa.State = '1'
	inner join AttentionCenter ac on ac.CodeAttentionCenter = sa.CodeAttentionCenter and ac.State = '1'
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = '1'
	inner join Service s on s.CodeService = se.CodeService and s.State = '1'
	WHERE apo.state = '1' and 
	1= case when @CodeAttentionCenter = -1 THEN 1  WHEN sa.CodeAttentionCenter = @CodeAttentionCenter  THEN 1 END AND
	1= case when @CodeChannelTypeAttention = -1 THEN 1  WHEN apo.CodeChannelTypeAttention = @CodeChannelTypeAttention THEN 1 END AND
	1= case when @AppointmentDate = '-1' THEN 1  WHEN apo.AppointmentDate = @AppointmentDate THEN 1 END


	SET @RecordCount = (select count(CodeAppointment) from #tpmAppointmentEntity where State='1')
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')
	  FROM (select *, '
	  + CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+
	   CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from #tpmAppointmentEntity 
	where State = ''1'') AS F'    
	print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;

;





GO
/****** Object:  StoredProcedure [dbo].[usp_ListarCombo]    Script Date: 17/12/2019 0:37:41 ******/
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
		select CodeVideo,VideoName from Video where State='1' order by CodeVideo desc;

	IF(@flag=8) 
		select CodeTicketType,Description,IsPreferential from TicketType where State='1';

	IF(@flag=9) 
		select CodeBanner,BannerName from BANNER where State='1';
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarComboEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarComboEntidadesxCentroAtencionCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXECUTE [dbo].[usp_ListarComboEntidadesxCentroAtencionCitas]  3

CREATE PROCEDURE [dbo].[usp_ListarComboEntidadesxCentroAtencionCitas]
(
	@CodigoCentroAtencion INT
)
AS
BEGIN
	select e.CodeEntity CodeEntity, e.Description as DescriptionEntity, ec.CodeEntityAtentionCenter
	from dbo.Entity_AttentionCenter ec
	inner join dbo.AttentionCenter a on a.CodeAttentionCenter = ec.CodeAttentionCenter
	inner join dbo.Entity e on e.CodeEntity = ec.CodeEntity
	where ec.CodeAttentionCenter = @CodigoCentroAtencion
	and ec.State = '1'
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidadCentroAtencion]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidades]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--execute usp_ListarEntidades 10,1,'CodeEntity','asc',-1,'1';
--execute usp_ListarEntidades 100,1,'RowOrder','DESC',-1,'1';
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

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select CodeEntity,Description,Abreviation,UrlLogo,RowOrder,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from Entity 
	where State = '+ @psiEstado + ' AND  
	1= case when '+ CAST(@psidDescripcion AS VARCHAR(5)) + '= -1 THEN 1  WHEN CodeEntity = '+ CAST(@psidDescripcion AS VARCHAR(5)) + ' THEN 1 END
	) AS F'
    --print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarEntidadxServicio]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--execute usp_ListarEntidadxServicio 1
CREATE PROCEDURE [dbo].[usp_ListarEntidadxServicio](
	--@pstrPagHasta INT,
	--@pstrPagDesde INT,
	--@psiSortColumn VARCHAR(200),
	--@psiSortOrder VARCHAR(200),
	@psCodeEntity INT

)AS
BEGIN

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT * FROM (select DISTINCT se.CodeServiceEntity,se.CodeEntity,se.CodeService,s.Description +'' - ''+ ta.NameTypeService as Description from ServiceEntity se inner join Service s on se.CodeService=s.CodeService
					inner join TypeService ta on ta.CodeTypeService=s.CodeTypeService where se.State=1 and 
					s.State=1 and ta.State=1	AND se.CodeEntity='+ CAST(@psCodeEntity AS VARCHAR(10)) +'
	) AS F' 
	PRINT(@Query);
    EXEC (@Query);

END;


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarNroCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarNroCitas](
	@pstrPagHasta INT,--paginar cada cuanto
	@pstrPagDesde INT,--pagina next
	@psiSortColumn VARCHAR(20),
	@psiSortOrder VARCHAR(4),
	@CodeAttentionCenter INT,
	@CodeChannelTypeAttention INT,
	@AppointmentDateBegin VARCHAR(50)	
	
)
AS
BEGIN
	DECLARE @RecordCount int  
    DECLARE @PageCount int  
    DECLARE @PageIndex int

	SELECT apo.CodeAppointment,ac.CodeAttentionCenter,ac.Description DescriptionAttentionCenter,ca.CodeChannelTypeAttention,convert(varchar(300),
	ca.Description,120) DescriptionChannelTypeAttention, apo.AppointmentDate
	
	INTO #tpmAppointmentEntity
	from Appointment apo
	inner join People p on p.CodePeople = apo.CodePeople and p.State = '1'
	inner join ChannelTypeAttention ca on ca.CodeChannelTypeAttention = apo.CodeChannelTypeAttention and ca.State = '1'
	inner join Schedule sch ON apo.CodeSchedule=sch.CodeSchedule  and sch.State = '1'
	inner join ServiceAttentionCenter sa on sa.CodeServAttenCenter = apo.CodeServAttenCenter and sa.State = '1'
	inner join AttentionCenter ac on ac.CodeAttentionCenter = sa.CodeAttentionCenter and ac.State = '1'
	inner join ServiceEntity se on se.CodeServiceEntity = sa.CodeServiceEntity and se.State = '1'
	inner join Service s on s.CodeService = se.CodeService and s.State = '1'
	WHERE apo.state = '1' and 
	1= case when @CodeAttentionCenter = 0 THEN 1  WHEN sa.CodeAttentionCenter = @CodeAttentionCenter  THEN 1 END AND
	1= case when @CodeChannelTypeAttention = 0 THEN 1  WHEN apo.CodeChannelTypeAttention = @CodeChannelTypeAttention THEN 1 END 
	AND	
	1 = case when @AppointmentDateBegin = '-1' THEN 1 WHEN  apo.AppointmentDate = @AppointmentDateBegin THEN 1 END	
	order by apo.CodeAppointment
	--group by ac.CodeAttentionCenter,ac.Description,ca.CodeChannelTypeAttention,ca.Description,apo.AppointmentDate

	SET @RecordCount = (select count(CodeAppointment) from #tpmAppointmentEntity)
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float)) 
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount 
        SET @PageIndex = @pstrPagDesde - 1; 
    --SELECT RecordCount = @RecordCount, PAGECOUNT = @PageCount, CurrentPage = @piiCurrentPage

	DECLARE @Query varchar(5000)

	SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')
	  FROM (select *, '
	  + CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+
	   CAST(@pstrPagHasta AS VARCHAR(10))+ ' PageCount from #tpmAppointmentEntity) AS F'    
	print @Query;
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))
    EXEC (@Query)
END;

;





GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServicexAttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================================================================
-- Exec dbo.usp_ListarServicexAttentionCenter 2
-- DROP PROCEDURE dbo.usp_ListarServicexAttentionCenter
--===========================================================================================
CREATE PROCEDURE [dbo].[usp_ListarServicexAttentionCenter]
@CodeAttentionCenter INT
AS
BEGIN
   SET NOCOUNT ON
   
	select s.CodeService,s.Description DescriptionService from Service s
	inner join ServiceEntity se on se.CodeService = s.CodeService and se.State = '1'
	inner join ServiceAttentionCenter sac on sac.CodeServiceEntity = se.CodeServiceEntity and sac.State = '1'
	inner join AttentionCenter ac on ac.CodeAttentionCenter = sac.CodeAttentionCenter and ac.State = '1'
	where ac.CodeAttentionCenter = @CodeAttentionCenter and s.State = '1'
	group by s.CodeService,s.Description;

   SET NOCOUNT OFF
END






GO
/****** Object:  StoredProcedure [dbo].[usp_ListarServicioEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarServicios]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarServiciosComboAppointment]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarServiciosComboAppointment]
AS
BEGIN
   SET NOCOUNT ON

	select s.CodeService,se.CodeServiceEntity,ISNULL(e.Abreviation,'')+'-'+convert(varchar(300),S.Description,120) DescriptionService
	from Service s
	inner join ServiceEntity se on se.CodeService=s.CodeService
	inner join Entity e on e.CodeEntity=se.CodeEntity
	where s.state = 1 and
	isnull((SELECT TOP 1 1 FROM ServiceAttentionCenter sa 
			where sa.CodeServiceEntity=se.CodeServiceEntity 
			and sa.AppointmentService =1),0)=1
	
	

   SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTablaServicios]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarTicket]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListarTicket](
	@CodeAttentionCenter INT=5
)
AS
BEGIN
	SELECT CodeTicket,TicketName FROM Ticket where CodeAttentionCenter=@CodeAttentionCenter AND State='1';
END;



GO
/****** Object:  StoredProcedure [dbo].[usp_ListarTipoTicket]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarVentanilla]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarVideo]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--EXECUTE usp_ListarVideo 10,1,'CodeVideo','ASC','0'  
CREATE PROCEDURE [dbo].[usp_ListarVideo]  
(  
 @pstrPagHasta INT,  
 @pstrPagDesde INT,  
 @psiSortColumn VARCHAR(200),  
 @psiSortOrder VARCHAR(200),  
 @psiCboEstado VARCHAR(1),
 @psiCboVideo INT
) AS  
  
BEGIN  
 DECLARE @RecordCount int    
    DECLARE @PageCount int    
    DECLARE @PageIndex int  
  
 SET @RecordCount = (select count(vi.CodeVideo) from Video vi inner join VideoState vs on vi.CodeVideoState=vs.CodeVideoState where vi.State ='1' and vs.State='1' AND 1=case when @psiCboEstado=0 then 1 when vs.CodeVideoState=@psiCboEstado then 1 end
 AND 1=CASE WHEN @psiCboVideo=-1 THEN 1 WHEN vi.CodeVideo=@psiCboVideo then 1 end)  
    SET @PageCount = CEILING(CAST (@RecordCount AS float) / CAST (@pstrPagHasta as float))   
    IF (@pstrPagDesde > @PageCount) SET @pstrPagDesde = @PageCount   
        SET @PageIndex = @pstrPagDesde - 1;   
  
 DECLARE @Query varchar(5000)  
  
 SET @Query ='SELECT *, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @psiSortColumn + ' ' + @psiSortOrder + ')  FROM (select vi.CodeVideo,vi.VideoName,vi.CodeVideoState,vs.VideoStateName,vi.VideoAdress,'+ CAST(@RecordCount AS VARCHAR(10))+ ' TotalRows,'+ CAST(@pstrPagHasta 
AS VARCHAR(10))+ ' PageCount from Video vi inner join VideoState vs on vi.CodeVideoState=vs.CodeVideoState where vi.State =1 and vs.State=1 AND 1=case when '+@psiCboEstado+'=0 then 1 when vs.CodeVideoState='+@psiCboEstado+' then 1 end
and 1=CASE WHEN '+cast(@psiCboVideo as varchar(2))+'=-1 THEN 1 WHEN vi.CodeVideo='+cast(@psiCboVideo as varchar(2))+' then 1 end) AS F'  
    --print @Query;  
    SET @Query = 'SELECT * FROM ( ' + @Query + ' ) AS result WHERE RowNumber BETWEEN ' + cast(@pstrPagHasta * @PageIndex + 1 as varchar(10)) + '  
                    AND ' + cast(@pstrPagHasta * (@PageIndex + 1) as varchar(10))  
    EXEC (@Query)  
END;  


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarZonas]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListarZonexAttentionCenter]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ListaServiciosEntidades]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ListaServiciosEntidades]
AS
BEGIN		
	select 
		--ROW_NUMBER() OVER(ORDER BY CodeServiceEntity desc) AS id,
		se.CodeServiceEntity id,
		se.CodeEntity,
		e.Description,	
		se.CodeService,
		ser.Description NameDescription,
		ts.NameTypeService
	from ServiceEntity se inner join Entity e on e.CodeEntity=se.CodeEntity
	inner join Service ser on se.CodeService=ser.CodeService
	inner join TypeService ts on ts.CodeTypeService=ser.CodeTypeService
	order by se.CodeEntity,se.CodeService asc;	
END;


GO
/****** Object:  StoredProcedure [dbo].[usp_ProgramarCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ProgramarCitas]
@CodeAttentionCenter INT,
@CodeService INT,
@StartQuota INT,
@Intervalo INT,
@FechaInicio VARCHAR(10),
@FechaFin VARCHAR(10)

AS
BEGIN
 SET NOCOUNT ON
 DECLARE  
    @vCodeServAttenCenter INT,
	@vActivityDate VARCHAR(50),
	@vCodeSchedule INT,
	@i INT,
	@j INT,
	@NumRegistros INT,
	@NumDias INT,
	@VALOR INT,
	@vContarExiste INT

BEGIN TRANSACTION	
BEGIN TRY	



 IF(DATEDIFF(day, @FechaInicio, @FechaFin)>=0)
 BEGIN
	SELECT @FechaInicio = convert(varchar(20),convert(date,@FechaInicio),120);
	SELECT @FechaFin = convert(varchar(20),convert(date,@FechaFin),120);

	IF (@Intervalo = 1)
	BEGIN
		SELECT @NumRegistros = COUNT(*) FROM Schedule where CodeTimeInterval = @Intervalo;	---24
		SELECT @vCodeSchedule = min(CodeSchedule) FROM Schedule where CodeTimeInterval = @Intervalo;  --1
	END

	IF (@Intervalo = 2)
	BEGIN
		SELECT @NumRegistros = COUNT(*) FROM Schedule where CodeTimeInterval = @Intervalo;		---18
		SELECT @vCodeSchedule = min(CodeSchedule) FROM Schedule where CodeTimeInterval = @Intervalo; ---25
	END


	select @vCodeServAttenCenter = sac.CodeServAttenCenter from ServiceAttentionCenter sac
	inner join ServiceEntity se on se.CodeServiceEntity = sac.CodeServiceEntity
	where se.CodeService = @CodeService and sac.CodeAttentionCenter = @CodeAttentionCenter;

	SELECT @NumDias = DATEDIFF(day, @FechaInicio, @FechaFin)+1;
	
	SET @i=1; 
	SET @j=1; 
	SET @vContarExiste = 0;

	WHILE @j<=@NumDias
	BEGIN
		select @vContarExiste = count(*) from Activity
		where CodeServAttenCenter = @vCodeServAttenCenter
		and ActivityDate = convert(datetime,@FechaInicio)+@j-1
		and state = '1';		
		
		IF(@vContarExiste<1)
		BEGIN	
			WHILE @i<=@NumRegistros
			BEGIN
				insert into Activity (CodeSchedule,CodeServAttenCenter,StartQuota,RegistryUser,RegistryDate,ActivityDate)
				values (@vCodeSchedule+@i-1,@vCodeServAttenCenter,@StartQuota,'FPalomino',SYSDATETIME(),convert(datetime,@FechaInicio)+@j-1);
							
				SET @i+=1	
			END
		END
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			SET @VALOR=-3;	
			SELECT Response = @VALOR;
		END
		
		SET @i = 1;
		SET @j+=1	
	END
		
	SET @VALOR=SCOPE_IDENTITY();
	SELECT Response = @VALOR;
	COMMIT TRANSACTION;
	
	--SELECT Response = @vContarExiste;
 END
 ELSE
 BEGIN
	SET @VALOR=-2;	
	SELECT Response = @VALOR;
 END
END TRY
	BEGIN CATCH			
		ROLLBACK TRANSACTION
		SET @VALOR=-1;	
		SELECT Response = @VALOR;
	END CATCH	

   SET NOCOUNT OFF
END






GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarBanner]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarBannerxZona]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencion]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencionServicio]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCentroAtencionxEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEntidad]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarEntidadServicio]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarServiceAttentionCenterCitas]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_RegistrarServiceAttentionCenterCitas](
	@CodeAttentionCenter INT,
	@CodeServiceEntity INT,
	@CodeEntityAttentionCenter INT,
	@CodeReservationType INT,
	@RegistryUser VARCHAR(250)
)AS

BEGIN
	BEGIN TRANSACTION		
	BEGIN TRY		
		DECLARE @VALOR INT;
		IF NOT EXISTS (SELECT 1 FROM ServiceAttentionCenter WHERE CodeAttentionCenter = @CodeAttentionCenter 
		AND CodeEntityAttentionCenter = @CodeEntityAttentionCenter AND CodeServiceEntity = @CodeServiceEntity
		AND CodeReservationType = @CodeReservationType AND State = '1')
		BEGIN
			INSERT INTO ServiceAttentionCenter
			(
				CodeServiceEntity,
				CodeAttentionCenter,
				CodeEntityAttentionCenter,
				CodeReservationType,
				RegistryUser,
				RegistryDate
			) 
			VALUES
			(
				@CodeServiceEntity,
				@CodeAttentionCenter,
				@CodeEntityAttentionCenter,
				@CodeReservationType,
				@RegistryUser,
				GETDATE()
			);


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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarServicio]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTicket]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarTicket](
	@NroDoc VARCHAR(18),
	@TipoDoc INT,
	@DatosPersonales NVARCHAR(550),
	@CodeTicketType INT,--PRIORIDAD
	@TablaServiceEntity dtServicioEntidad READONLY,
	@RegistryUser VARCHAR(120),
	@CodeAttentionCenter INT=5,
	@Direccion VARCHAR(550),
	@EstadoCivil VARCHAR(200)
)AS
DECLARE 
@COD INT,
@VALOR INT,
@SERIES_COUNT INT,
@vCodeServiceEntity INT,
@vCodeService INT,
@IDPEOPLE INT;
BEGIN 
	BEGIN TRY
		--REGISTRO DE TICKET
		INSERT INTO PEOPLE(CodeTypeDocument,NumberDocument,Name,CivilStatus,Address,RegistryUser,RegistryDate) 
					VALUES(@TipoDoc,@NroDoc,@DatosPersonales,@EstadoCivil,@Direccion,@RegistryUser,GETDATE());
        SET @IDPEOPLE=SCOPE_IDENTITY();
		--ASUMIREMOS PARA UN CENTRO DE ATENCION LN(Lima-Norte)
		SET @COD=(SELECT isnull(COUNT(*),0) + 1 FROM Ticket WHERE CodeAttentionCenter=@CodeAttentionCenter AND State='1' AND day(RegistryDate)=Day(GetDate()));

		INSERT INTO TICKET(TicketName,CodeTicketState,CodeTicketType,CodePeople,RegistryUser,RegistryDate,CodeAttentionCenter,OrderArrival,TicketDate) 
				    VALUES('LN-'+CAST(@COD AS VARCHAR(100)),1,@CodeTicketType,@IDPEOPLE,@RegistryUser,GETDATE(),@CodeAttentionCenter,@COD,GETDATE())
		SET @VALOR=SCOPE_IDENTITY();
		INSERT INTO TicketStateHistory(CodeTicket,CodeTicketState,RegistryUser,RegistryDate) VALUES(@VALOR,1,@RegistryUser,GETDATE());

		SELECT @SERIES_COUNT = COUNT(*) FROM @TablaServiceEntity;	
		DECLARE @i AS INTEGER;
		SET  @i=1

		SELECT IDENTITY (INT,1,1) AS IdRow,* INTO #tpmTablaServiceEntity FROM @TablaServiceEntity;	
		WHILE @i <= @SERIES_COUNT 
		BEGIN
			SET @vCodeServiceEntity=(SELECT tt.CodeServiceEntity FROM #tpmTablaServiceEntity tt WHERE IdRow=@i);
			SET @vCodeService=(SELECT CodeService FROM ServiceEntity WHERE CodeServiceEntity=@vCodeServiceEntity AND State='1');

			INSERT INTO ServiceTicket(CodeService,CodeTicket,RegistryUser,RegistryDate) VALUES(@vCodeService,@VALOR,@RegistryUser,GETDATE());	
			SET @i = @i + 1;
		END;
		SELECT @VALOR;
	END TRY
	BEGIN CATCH	
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH	
END;





GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTipoTicket]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVentanilla]    Script Date: 17/12/2019 0:37:41 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVideo]    Script Date: 17/12/2019 0:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RegistrarVideo](
	@CodeVideo INT,
	@VideoName VARCHAR(250),
	@VideoAdress VARCHAR(250),
	@RegistryUser VARCHAR(250)

)AS
BEGIN
DECLARE @VALOR INT;
	BEGIN TRY		
		INSERT INTO Video(VideoName,VideoAdress,RegistryUser,RegistryDate) VALUES(@VideoName,@VideoAdress,@RegistryUser,GETDATE());
		SET @VALOR=SCOPE_IDENTITY();
		SELECT @VALOR;
	END TRY
	BEGIN CATCH	
		SET @VALOR=-1;	
		SELECT @VALOR;
	END CATCH
END;




GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarZona]    Script Date: 17/12/2019 0:37:41 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: Dia NOrmal 2: Feriado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Calendar', @level2type=N'COLUMN',@level2name=N'CodeDayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hora de ingreso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'TicketTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Ingreso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'COLUMN',@level2name=N'TicketDate'
GO
