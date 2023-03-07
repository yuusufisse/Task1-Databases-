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

INSERT INTO [dbo].[Personnel]
           ([Firstname]
           ,[Lastname]
           ,[EmployeeStartDate]
           ,[Salary]
           ,[CarOptions])
     VALUES
           (N'Donald', N'Duck', '2022-2-20', 1234.55, N'Drowsiness Detection'),           
           (N'Mickey', N'Mouse', NULL, 1267.55, N'Autonomous Driving'), 
           (N'Gyro', N'Gearloose', '2022-2-1', 2234.55, N'Adaptive Cruise Control'),
           (N'Elmer', N'Elephant', '2022-1-25', 2234.55, N'Adaptive Cruise Control'),
           (N'Big Bad', N'Wolf', NULL, 3267.55, N'Autonomous Driving'),
           (N'Minnie', N'Nouse', '2022-1-26', 3234.55, N'Drowsiness Detection')          
GO



