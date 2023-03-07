USE [Company]
GO

/****** Object:  Table [dbo].[Personnel]    Script Date: 24/01/2022 20.15.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personnel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[EmployeeStartDate] [datetime] NULL,
	[Salary] [decimal](7, 2) NULL,
	[CarOptions] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Personnel] ADD  CONSTRAINT [DF_Personnel_EmployeeStartDate]  DEFAULT (getdate()) FOR [EmployeeStartDate]
GO

ALTER TABLE [dbo].[Personnel]  WITH NOCHECK ADD  CONSTRAINT [CK_Personnel_CarOptions] CHECK  (([CarOptions]='Drowsiness Detection' OR [CarOptions]='Autonomous Driving' OR [CarOptions]='Adaptive Cruise Control'))
GO

ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [CK_Personnel_CarOptions]
GO

ALTER TABLE [dbo].[Personnel]  WITH NOCHECK ADD  CONSTRAINT [CK_Personnel_Salary] CHECK  (([Salary]>=(1000)))
GO

ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [CK_Personnel_Salary]
GO

ALTER TABLE [dbo].[Personnel]  WITH NOCHECK ADD  CONSTRAINT [CK_Personnel_StartDate] CHECK  (([EmployeeStartDate]>=getdate()))
GO

ALTER TABLE [dbo].[Personnel] CHECK CONSTRAINT [CK_Personnel_StartDate]
GO

