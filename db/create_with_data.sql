/****** Object:  Trigger [UpdateModifiedTime]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UpdateModifiedTime]'))
DROP TRIGGER [dbo].[UpdateModifiedTime]
GO
/****** Object:  StoredProcedure [dbo].[Gender_SelectAll]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Gender_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Gender_Select]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Gender_Select]
GO
/****** Object:  StoredProcedure [dbo].[BearType_SelectAll]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BearType_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BearType_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[BearType_Select]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BearType_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BearType_Select]
GO
/****** Object:  StoredProcedure [dbo].[Bear_Update]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bear_Update]
GO
/****** Object:  StoredProcedure [dbo].[Bear_SelectAll]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bear_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[Bear_Select]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bear_Select]
GO
/****** Object:  StoredProcedure [dbo].[Bear_Insert]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bear_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Bear_Delete]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Bear_Delete]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bear_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bear]'))
ALTER TABLE [dbo].[Bear] DROP CONSTRAINT [FK_Bear_Gender]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bear_BearType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bear]'))
ALTER TABLE [dbo].[Bear] DROP CONSTRAINT [FK_Bear_BearType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Gender_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Gender] DROP CONSTRAINT [DF_Gender_Description]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BearType_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BearType] DROP CONSTRAINT [DF_BearType_Description]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bear_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bear] DROP CONSTRAINT [DF_Bear_ModifiedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bear_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bear] DROP CONSTRAINT [DF_Bear_CreatedDate]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bear_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bear] DROP CONSTRAINT [DF_Bear_Name]
END
GO
/****** Object:  Index [UQ_Gender_Name]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND name = N'UQ_Gender_Name')
ALTER TABLE [dbo].[Gender] DROP CONSTRAINT [UQ_Gender_Name]
GO
/****** Object:  Index [UQ_BearType_Name]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BearType]') AND name = N'UQ_BearType_Name')
ALTER TABLE [dbo].[BearType] DROP CONSTRAINT [UQ_BearType_Name]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND type in (N'U'))
DROP TABLE [dbo].[Gender]
GO
/****** Object:  Table [dbo].[BearType]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BearType]') AND type in (N'U'))
DROP TABLE [dbo].[BearType]
GO
/****** Object:  Table [dbo].[Bear]    Script Date: 4/27/2020 12:12:27 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear]') AND type in (N'U'))
DROP TABLE [dbo].[Bear]
GO
/****** Object:  Table [dbo].[Bear]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bear](
	[BearId] [bigint] IDENTITY(1,1) NOT NULL,
	[BearTypeId] [int] NOT NULL,
	[GenderId] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Age] [smallint] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Bear] PRIMARY KEY CLUSTERED 
(
	[BearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BearType]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BearType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BearType](
	[BearTypeId] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_BearType] PRIMARY KEY CLUSTERED 
(
	[BearTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Bear] ON 
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (2, 3, 2, N'Ponty', 3, CAST(N'2020-04-21T03:19:33.1966667' AS DateTime2), CAST(N'2020-04-27T10:48:58.9170112' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (3, 5, 2, N'Artist', 33, CAST(N'2020-04-21T03:22:20.7400000' AS DateTime2), CAST(N'2020-04-26T22:25:22.5480399' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (4, 3, 1, N'Boo Boo', 3, CAST(N'2020-04-21T03:25:21.3366667' AS DateTime2), CAST(N'2020-04-26T23:55:42.7003883' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (5, 4, 1, N'Oberon', 4, CAST(N'2020-04-21T03:26:55.7200000' AS DateTime2), CAST(N'2020-04-27T00:25:39.3169356' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (7, 6, 1, N'Orsino', 6, CAST(N'2020-04-21T03:35:44.3700000' AS DateTime2), CAST(N'2020-04-27T10:25:05.5766657' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (8, 4, 1, N'Trump', 7, CAST(N'2020-04-21T03:37:24.9333333' AS DateTime2), CAST(N'2020-04-27T06:26:35.3105364' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (9, 8, 1, N'PatJosh', 1, CAST(N'2020-04-21T03:44:21.4133333' AS DateTime2), CAST(N'2020-04-27T00:26:53.8619162' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (10, 9, 1, N'Dusty', 9, CAST(N'2020-04-21T03:48:08.3800000' AS DateTime2), CAST(N'2020-04-23T05:25:26.5565374' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (11, 10, 2, N'Orsina', 10, CAST(N'2020-04-21T03:49:59.4700000' AS DateTime2), CAST(N'2020-04-23T05:25:43.6014692' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (12, 11, 2, N'Nibbs', 11, CAST(N'2020-04-21T03:51:36.1300000' AS DateTime2), CAST(N'2020-04-23T05:25:41.7727486' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (14, 12, 2, N'Nadetta', 12, CAST(N'2020-04-21T03:51:36.1300000' AS DateTime2), CAST(N'2020-04-23T05:25:39.7218688' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (25, 1, 1, N'Lucas', 10, CAST(N'2020-04-27T05:37:41.0500000' AS DateTime2), CAST(N'2020-04-27T05:37:41.0500000' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (41, 12, 1, N'Nike Awesome', 10, CAST(N'2020-04-27T06:16:36.9966667' AS DateTime2), CAST(N'2020-04-27T12:09:40.7994762' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (46, 8, 2, N'Mary May', 13, CAST(N'2020-04-27T08:38:55.9333333' AS DateTime2), CAST(N'2020-04-27T12:09:34.8967968' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (68, 6, 2, N'Nikita', 13, CAST(N'2020-04-27T10:28:46.0800000' AS DateTime2), CAST(N'2020-04-27T12:08:54.7558865' AS DateTime2))
GO
INSERT [dbo].[Bear] ([BearId], [BearTypeId], [GenderId], [Name], [Age], [CreatedDate], [ModifiedDate]) VALUES (69, 1, 1, N'Joshua', 10, CAST(N'2020-04-27T10:43:33.6333333' AS DateTime2), CAST(N'2020-04-27T12:10:17.9404439' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Bear] OFF
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (1, N'Spectacled Bear', N'The spectacled bear (Tremarctos ornatus), also known as the Andean bear, Andean short-faced bear, or mountain bear and locally as jukumari, ukumari (Quechua) or ukuku, is the last remaining short-faced bear (subfamily Tremarctinae). 
Its closest relatives are the extinct Florida spectacled bear, and the giant short-faced bears of the Middle to Late Pleistocene age (Arctodus and Arctotherium).
Spectacled bears are the only surviving species of bear native to South America, and the only surviving member of the subfamily Tremarctinae. ')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (2, N'Polar Bear', N'The polar bear (Ursus maritimus) is a hypercarnivorous bear whose native range lies largely within the Arctic Circle, encompassing the Arctic Ocean, its surrounding seas and surrounding land masses. 
It is a large bear, approximately the same size as the omnivorous Kodiak bear (Ursus arctos middendorffi).')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (3, N'Sun Bear', N'The sun bear is the smallest of all bears, which immediately bumps it up in the bear rankings.
It can weigh as little as 60 pounds as an adult and there have been reports of sun bears being eaten by snakes (!). 
It lives in southeast Asia, from Yunnan province in China down to Borneo, and like many of the other tropical bears, is mostly insectivorous. 
But while the sloth bear specializes in termites, the sun bear earned the nickname "honey bear" for its great love of bees and beehives. ')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (4, N'Sloth Bear', N'It seems impossible that someone might think a bear is a member of the sloth family, but that''s what happened with the sloth bear (Melursus ursinus), a smallish bear and native of India. 
The sloth bear is the first insectivorous bear on our list, specializing in termites, though it also adores honeycomb and a few kinds of fruits (mango, jackfruit, wood apple). 
They have very thick fur, despite being tropical animals, and have specializations for eating insects')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (5, N'American Black Bear', N'The American black bear is the bear most familiar to Americans who don''t live in the Rocky Mountain or extreme northwestern regions of the country. 
It''s the most widespread of all North American bears, but it''s actually not closely related to the brown or polar bears.
It''s fairly similar morphologically to the Asian black bear and a bit less so to the sun bear, but it has a behavior all its own. ')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (6, N'Giant Panda', N'The giant panda is probably the most distinctive-looking bear in the world and also one of the most endangered, which has led to its becoming sort of a symbol of the conservation movement. 
It''s also one of the most frustrating animals to try to save, as its diet is absurd and it seems to have little interest in reproducing. 
The panda, like all bears, has a digestive system designed for an omnivore''s diet--and yet the panda eats almost exclusively bamboo. 
Bamboo is a grass; it has hardly any nutritional value, barely any protein or calories, so the panda is pretty much constantly exhausted.')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (7, N'Spirit Bear', N'The spirit bear (Ursus americanus kermodei), though it looks like a polar bear and lives in brown bear territory, is actually neither.
It''s a subspecies of American black bear. Bears as a rule have a wider array of color.
The spirit bear is notable for a coat somewhere between white and cream. 
It lives along the British Columbia coast, and is protected in BC''s Great Bear Rainforest preserve. ')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (8, N'Grizzly Bear', N'The grizzly bear is named for the grey, grizzled hairs in its otherwise-brown fur
It can be found throughout western Canada and Alaska, and down into some of the western states that straddle the Rocky Mountains. 
It''s also on the California state flag, even though the last California grizzly was shot about a hundred years ago. 
The grizzly is the most common brown bear subspecies in North American and bigger than the Eurasian brown bear but not as big as the Kodiak. ')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (9, N'Himalayan Red Bear', N'The Himalayan red bear (Ursus arctos isabellinus) is actually another subspecies of brown bear. Its name comes from its cinnamon-colored coat. 
It''s the largest animal in the Himalayan range, though for bears (and especially for the usually large brown bear) it''s fairly small. 
It ranks more highly in the list than other brown bears because, bizarrely, it is believed to be the source of the Yeti legend. 
There''s no other animal as big in its range, and it commonly walks on its hind legs, leaving mysterious footprints in the snow that have been interpreted as ape-like.')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (10, N'Kodiak Bear', N'The Kodiak bear (Ursus arctos middendorffi), the largest subspecies of brown bear. 
Is a also known as the Alaskan grizzly bear, though it does not have the "grizzled" fur pattern of the grizzly bear subspecies. 
The Kodiak bear lives exclusively in the Kodiak archipelago in southwestern Alaska, where it feeds mostly on shoots and plants until the salmon return in the summer. 
It is a massive bear, roughly tied with the polar bear as the largest bear species in the world. 
Mature males can weigh up to 1,500 pounds!')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (11, N'Asian Black Bear', N'The Asian black bear (Ursus thibetanus), also known as the moon bear (cool name, admittedly) or the white-chested bear, is the second-worst bear. 
Rudyard Kipling called it "the most bizarre of the ursine species," it is one of the most unpredictable and dangerous bears on the planet. 
That''s despite being closely related to the American black bear, which is mostly docile, and despite being only a medium-sized bear at most. 
The Asian black bear lives throughout eastern Europe and Asia, as far east as Japan (where it''s known as tsukinowaguma, literally "crescent bear"). 
It''s more aggressive towards humans, often when unprovoked, than American black bears or Eurasian brown bears. ')
GO
INSERT [dbo].[BearType] ([BearTypeId], [Name], [Description]) VALUES (12, N'Brown Bear', N'The brown bear (Ursus arctos) is a bear species that is found across much of northern Eurasia and North America.
In North America, the populations of brown bears are often called "grizzly bears". 
It is one of the largest living terrestrial members of the order Carnivora, rivalled in size only by its closest relative, the polar bear (Ursus maritimus), which is much less variable in size and slightly larger on average.')
GO
INSERT [dbo].[Gender] ([GenderId], [Name], [Description]) VALUES (1, N'Boar', N'Bear Male')
GO
INSERT [dbo].[Gender] ([GenderId], [Name], [Description]) VALUES (2, N'Sow', N'Bear Female')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_BearType_Name]    Script Date: 4/27/2020 12:12:27 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BearType]') AND name = N'UQ_BearType_Name')
ALTER TABLE [dbo].[BearType] ADD  CONSTRAINT [UQ_BearType_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Gender_Name]    Script Date: 4/27/2020 12:12:27 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Gender]') AND name = N'UQ_Gender_Name')
ALTER TABLE [dbo].[Gender] ADD  CONSTRAINT [UQ_Gender_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bear_Name]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bear] ADD  CONSTRAINT [DF_Bear_Name]  DEFAULT ('') FOR [Name]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bear_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bear] ADD  CONSTRAINT [DF_Bear_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Bear_ModifiedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Bear] ADD  CONSTRAINT [DF_Bear_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BearType_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BearType] ADD  CONSTRAINT [DF_BearType_Description]  DEFAULT ('') FOR [Description]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Gender_Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Gender] ADD  CONSTRAINT [DF_Gender_Description]  DEFAULT ('') FOR [Description]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bear_BearType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bear]'))
ALTER TABLE [dbo].[Bear]  WITH CHECK ADD  CONSTRAINT [FK_Bear_BearType] FOREIGN KEY([BearTypeId])
REFERENCES [dbo].[BearType] ([BearTypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bear_BearType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bear]'))
ALTER TABLE [dbo].[Bear] CHECK CONSTRAINT [FK_Bear_BearType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bear_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bear]'))
ALTER TABLE [dbo].[Bear]  WITH CHECK ADD  CONSTRAINT [FK_Bear_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bear_Gender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bear]'))
ALTER TABLE [dbo].[Bear] CHECK CONSTRAINT [FK_Bear_Gender]
GO
/****** Object:  StoredProcedure [dbo].[Bear_Delete]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Bear_Delete] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Bear_Delete]
	@bearId bigint
AS
BEGIN
	SET NOCOUNT ON;

    DELETE
		[dbo].[Bear]
	WHERE
		[BearId]=@bearId

END
GO
/****** Object:  StoredProcedure [dbo].[Bear_Insert]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Bear_Insert] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Bear_Insert]
	-- Add the parameters for the stored procedure here
	@bearTypeId int,
	@genderId int,
	@name nvarchar(256),
	@age smallint
	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT 
		[dbo].[Bear]
		([BearTypeId], [GenderId], [Name], [Age])
	VALUES
		(@bearTypeId, @genderId, @name, @age)
	
	DECLARE @newBearId bigint = SCOPE_IDENTITY()
	
	EXEC	[dbo].[Bear_Select]
			@bearId = @newBearId
END
GO
/****** Object:  StoredProcedure [dbo].[Bear_Select]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Bear_Select] AS' 
END
GO
-- =============================================
-- Author:		Alex Bohdanovsky
-- Create date: 2020-04-19
-- Description:	Returns list of genders
-- =============================================
ALTER PROCEDURE [dbo].[Bear_Select]
	@bearId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		b.[BearId],
		b.[BearTypeId],
		b.[GenderId],
		b.[Name],
		b.[Age]
	FROM 
		[dbo].[Bear] b
	WHERE
		b.[BearId] = @bearId
END
GO
/****** Object:  StoredProcedure [dbo].[Bear_SelectAll]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Bear_SelectAll] AS' 
END
GO
-- =============================================
-- Author:		Alex Bohdanovsky
-- Create date: 2020-04-19
-- Description:	Returns list of genders
-- =============================================
ALTER PROCEDURE [dbo].[Bear_SelectAll]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		b.[BearId],
		b.[BearTypeId],
		b.[GenderId],
		b.[Name],
		b.[Age]
	FROM 
		[dbo].[Bear] b
END
GO
/****** Object:  StoredProcedure [dbo].[Bear_Update]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bear_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Bear_Update] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Bear_Update] 
	-- Add the parameters for the stored procedure here
	@bearId bigint,
	@bearTypeId int,
	@genderId int,
	@name nvarchar(256),
	@age smallint
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE 
		[dbo].[Bear]
	SET
		[BearTypeId]=@bearTypeId,
		[GenderId]=@genderId,
		[Name]=@name,
		[Age]=@age
	WHERE
		[BearId]=@bearId
END
GO
/****** Object:  StoredProcedure [dbo].[BearType_Select]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BearType_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BearType_Select] AS' 
END
GO
-- =============================================
-- Author:		Alex Bohdanovsky
-- Create date: 2020-04-19
-- Description:	Returns list of genders
-- =============================================
ALTER PROCEDURE [dbo].[BearType_Select]
	@bearTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		bt.[BearTypeId],
		bt.[Name],
		bt.[Description]
	FROM 
		[dbo].[BearType] bt
	WHERE
		bt.[BearTypeId] = @bearTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[BearType_SelectAll]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BearType_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BearType_SelectAll] AS' 
END
GO
-- =============================================
-- Author:		Alex Bohdanovsky
-- Create date: 2020-04-19
-- Description:	Returns list of genders
-- =============================================
ALTER PROCEDURE [dbo].[BearType_SelectAll]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		bt.[BearTypeId],
		bt.[Name],
		bt.[Description]
	FROM 
		[dbo].[BearType] bt
		
END
GO
/****** Object:  StoredProcedure [dbo].[Gender_Select]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Gender_Select] AS' 
END
GO
-- =============================================
-- Author:		Alex Bohdanovsky
-- Create date: 2020-04-19
-- Description:	Returns list of genders
-- =============================================
ALTER PROCEDURE [dbo].[Gender_Select]
	@genderId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		g.[GenderId],
		g.[Name],
		g.[Description]
	FROM 
		[dbo].[Gender] g
	WHERE
		g.[GenderId] = @genderId
		
END
GO
/****** Object:  StoredProcedure [dbo].[Gender_SelectAll]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gender_SelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Gender_SelectAll] AS' 
END
GO
-- =============================================
-- Author:		Alex Bohdanovsky
-- Create date: 2020-04-19
-- Description:	Returns list of genders
-- =============================================
ALTER PROCEDURE [dbo].[Gender_SelectAll]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		g.[GenderId],
		g.[Name],
		g.[Description]
	FROM 
		[dbo].[Gender] g
		
END
GO
/****** Object:  Trigger [dbo].[UpdateModifiedTime]    Script Date: 4/27/2020 12:12:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[UpdateModifiedTime]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Alex Bohdanovskyi
-- Create date: 2020-18-04
-- Description:	Updates ModifiedDate on each row update
-- =============================================
CREATE TRIGGER [dbo].[UpdateModifiedTime] 
   ON  [dbo].[Bear] 
   AFTER UPDATE
AS 
	declare @bearId bigint;
	select @bearId = ins.BearId from INSERTED ins;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT UPDATE(ModifiedDate)
	BEGIN
		UPDATE dbo.Bear
		SET ModifiedDate = SYSDATETIME()
		WHERE BearId=@bearId
	END

END
' 
GO
ALTER TABLE [dbo].[Bear] ENABLE TRIGGER [UpdateModifiedTime]
GO
