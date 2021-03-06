USE [master]
GO
/****** Object:  Database [SonsuzSozluk]    Script Date: 22.05.2018 17:31:15 ******/
CREATE DATABASE [SonsuzSozluk] ON  PRIMARY 
( NAME = N'SonsuzSozluk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SonsuzSozluk.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SonsuzSozluk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SonsuzSozluk_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SonsuzSozluk] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SonsuzSozluk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SonsuzSozluk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET ARITHABORT OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SonsuzSozluk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SonsuzSozluk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SonsuzSozluk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SonsuzSozluk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SonsuzSozluk] SET RECOVERY FULL 
GO
ALTER DATABASE [SonsuzSozluk] SET  MULTI_USER 
GO
ALTER DATABASE [SonsuzSozluk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SonsuzSozluk] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SonsuzSozluk', N'ON'
GO
USE [SonsuzSozluk]
GO
/****** Object:  Table [dbo].[tblGundemler]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGundemler](
	[Gundemid] [int] IDENTITY(1,1) NOT NULL,
	[GundemBaslik] [nvarchar](max) NULL,
	[GundemIcerik] [nvarchar](max) NULL,
	[GoruntulenmeSayisi] [int] NULL CONSTRAINT [DF_tblGundemler_GoruntulenmeSayisi]  DEFAULT ((0)),
	[Tarih] [datetime] NULL CONSTRAINT [DF_tblGundemler_Tarih]  DEFAULT (getdate()),
	[Yazarid] [int] NULL,
	[Kategoriid] [int] NULL,
	[Onaylandimi] [bit] NULL CONSTRAINT [DF_tblGundemler_Onaylandimi]  DEFAULT ((0)),
 CONSTRAINT [PK_tblGundemler] PRIMARY KEY CLUSTERED 
(
	[Gundemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKategoriler]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKategoriler](
	[Kategoriid] [int] IDENTITY(1,1) NOT NULL,
	[Kategori] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblKategoriler] PRIMARY KEY CLUSTERED 
(
	[Kategoriid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKisiler]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblKisiler](
	[Kisiid] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Parola] [varchar](20) NULL,
	[Puan] [int] NULL CONSTRAINT [DF_tblKisiler_Puan]  DEFAULT ((1)),
	[AltınMadalyasayisi]  AS ([Puan]/(250)),
	[GumusMadalyaSayisi]  AS ([Puan]/(100)+(1)),
	[Tarih] [date] NULL CONSTRAINT [DF_tblKisiler_Tarih]  DEFAULT (getdate()),
	[Rolid] [int] NULL CONSTRAINT [DF_tblKisiler_Rolid]  DEFAULT ((1)),
 CONSTRAINT [PK_tblKisiler] PRIMARY KEY CLUSTERED 
(
	[Kisiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNotlar]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotlar](
	[Notid] [int] IDENTITY(1,1) NOT NULL,
	[Notu] [nvarchar](max) NULL,
	[Kisiid] [int] NULL,
 CONSTRAINT [PK_tblNotlar] PRIMARY KEY CLUSTERED 
(
	[Notid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOncedenBegendimi]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOncedenBegendimi](
	[Oncedenbegendimiid] [int] IDENTITY(1,1) NOT NULL,
	[Kisiid] [int] NULL,
	[Gundemid] [int] NULL,
 CONSTRAINT [PK_tblOncedenBegendimi] PRIMARY KEY CLUSTERED 
(
	[Oncedenbegendimiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOncedenBegenmedimi]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOncedenBegenmedimi](
	[Oncedenbegenmedimi] [int] IDENTITY(1,1) NOT NULL,
	[Kisiid] [int] NULL,
	[Gundemid] [int] NULL,
 CONSTRAINT [PK_tblOncedenBegenmedimi] PRIMARY KEY CLUSTERED 
(
	[Oncedenbegenmedimi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoller]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoller](
	[Rolid] [int] IDENTITY(1,1) NOT NULL,
	[Rol] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblRoller] PRIMARY KEY CLUSTERED 
(
	[Rolid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYorumBegendimi]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYorumBegendimi](
	[Yorumbegendimiid] [int] IDENTITY(1,1) NOT NULL,
	[Kisiid] [int] NULL,
	[Yorumid] [int] NULL,
	[Gundemid] [int] NULL,
 CONSTRAINT [PK_tblYorumBegendimi] PRIMARY KEY CLUSTERED 
(
	[Yorumbegendimiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYorumBegenmedimi]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYorumBegenmedimi](
	[Yorumbegenmedimiid] [int] IDENTITY(1,1) NOT NULL,
	[Kisiid] [int] NULL,
	[Yorumid] [int] NULL,
	[Gundemid] [int] NOT NULL,
 CONSTRAINT [PK_tblYorumBegenmedimi] PRIMARY KEY CLUSTERED 
(
	[Yorumbegenmedimiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYorumlar]    Script Date: 22.05.2018 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYorumlar](
	[Yorumid] [int] IDENTITY(1,1) NOT NULL,
	[Yorum] [nvarchar](max) NULL,
	[Tarih] [datetime] NULL CONSTRAINT [DF_tblYorumlar_Tarih]  DEFAULT (getdate()),
	[Kisiid] [int] NULL,
	[Gundemid] [int] NULL,
 CONSTRAINT [PK_tblYorumlar] PRIMARY KEY CLUSTERED 
(
	[Yorumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblGundemler] ON 

INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (2, N'survivor 2018 all-star', N'sema survivorun gelmiş geçmiş en karaktersiz, varoş ağızlı, en kalitesiz, en vicdansız, en kötü kalpli, en kenafir gözlü kadın yarışmacısı...', 1, CAST(N'2018-03-08 00:00:00.000' AS DateTime), 1083, 12, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (4, N'ciddi ciddi 300-400 sayfa kitap okuyan tip', N'işsizliğin nirvana''sına ulaşmış, asosyalliğin dibine vurmuş ve tüm bu sefilliğini ''kültürleşiyorum'' adı altında kitap okuyarak telafi etmeye çalışan tiptir.

300-400 sayfa kitap nedir arkadaş? evrenin yaradılışını mı okuyorsunuz? 600-800 sayfa okuyanlara hiç değinmiyorum bile, onlar zaten bulmuş belasını. çıkın topluma karışın, sosyalleşin. çok mu zor bu? bahar gelmiş, çiçekler açmış, hava efil efil...

hadi 80 sayfa okursun anlarım, hadi 100 sayfa okudun ona da tamam. fakat abartmıyor musunuz?', 59, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 78, 6, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (6, N'araba kullanmaya yeni başlayanlara tavsiyeler', N'yan aynalara bakarken arkadan gelen arac nekadar yakinimda bunu bilmenin bir mantigi yok mudur. ve aracin burnunu hesaplamak icin illa carpmak mi getekir', 20, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 81, 10, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (7, N'23 mart 2018 ankara''ya toz yağması', N'tuhaf. tüm araçların üstü ince bir toz tabakasıyla kaplı. gökyüzü desen doha'' dayız sanki tozdan sarıya çalıyor.', 4, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 4, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (8, N'izlenilen ilk yabancı dizi', N'sözlükçülerin izledikleri ilk yabancı dizidir. benim için evdekilerin sayesinde yalan rüzgarı olabilir, ama bilinçli bir şekilde oturup izlediğim ilk dizi ise prison break', 4, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 11, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (9, N'serdar aziz', N'yerli sergio ramos''tur ve sergio ramos nasıl dünyanın en iyi takımında oynuyorsa kendisi de türkiye''nin en iyi takımında oynuyordur. eğer olur da avrupaya gitmezse birkaç seneye galatasaray''ın kaptanı olacaktır. zira kendisine pazubandı yakışıyor.', 1, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1083, 1, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (10, N'doların 4 lira olması ülkemiz için olumlu', N'doğrudur. "ekonomimiz" derken kendi cebinin ekonomisinden bahsetmiştir sayın daire başkanı. doların yükselmesi ve yurtdışı alışveriş limitinin düşmesi neticesinde vatandaşı  çok daha kolaylaşmıştır. yurtdışından normalde 100 liraya aldığım ürünü ülkemizden 500 liraya almak zorunda kalarak dolarin 4 lira olmasını ülkemiz için olumlu hale getirmiş bulunmaktayım. kendi cebime olan olumsuzluğu ise hiç umrumda değil, çünkü çomar olmak bunu gerektirir.

edit: haberin gerçek veya uydurma olması durumu değiştirmemekte.', 2, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1083, 15, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (11, N'beni tahrik ettiği için en az benim kadar suçlu', N'erzurum''da yeğenine tecavüz eden imamın kendini savunmak için kurduğu cümle. ölmüşüz ağlayanımız da ölmüş. bu insan artığı 23 yılla yargılanıyor. 15 yıl yatar çıkar.', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1088, 18, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (13, N'doğan kitap ve d&r''ın amazon.com''a satılması', N'chp istanbul milletvekili barış yarkadaş tarafından twitter üzerinde dile getirilmiş bir iddiadır. kaynak

barış yarkadaş tweetinde "doğan medya grubu, kitap ve müzik sektöründe büyük bir pazara sahip olan d&r mağazalarını dünyaca ünlü http://amazon.com/ ''a satacak ve yayıncılık faaliyetlerini tamamen sonlandıracak." demiş. 

bu iddia ne kadar doğrudur merak konusu.', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 20, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (14, N'chp''nin başarısızlığını tek kelime ile açıklamak', N'iki kelime istenirse: gaf kralı.
', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 78, 2, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (15, N'sülük hacamat hipnoz''un sgk kapsamına alınması', N'sağlık bakanlığının ''geleneksel ve tamamlayıcı tıp uygulamaları''nı yaygınlaştırmak kisvesi altında ilaç maliyetini düşürmek için attığı adımdır. milattan sonra 2018 yılında gerçekleşmektedir. bize müstehaktır.', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 7, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (16, N'23 mart 2018 dolar kuru', N'edit. tüm zamanların rekorunu kırmıştır 4.02 ile.

şu saatlerde 3.95 civarında seyreden kur.
sabaha sonumuz hayrola.
https://kur.doviz.com/serbest-piyasa

edit:sabaha kalmadan götümüze soktular.
uyan türkiye, bu bir rekor.
4.02', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 15, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (18, N'çaylak onay listesi', N'ekşi sözlüğe kayıt olduktan sonra yıllarca beklediğiniz , sonuna kimsenin onaylayacağı yok galiba bize layık görülen yer burası dediğiniz iste. 

üzgünüm artık burada değilim. elveda çaylaklar.

tebrikleri özel mesaj olarak bekliyorum.', 0, CAST(N'2018-03-22 00:00:00.000' AS DateTime), 2, 13, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (19, N'mor ve ötesi', N'24 mart dasdas konserine 2 kişilik bilet aranmaktadır elinde olan gitmeyecek olan varsa ulaşabilirdir', 0, CAST(N'2018-03-22 00:00:00.000' AS DateTime), 78, 9, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (20, N'baba olmak', N'çok sıkıntılı bir şekilde doğan canımın içidir. 

başlığı klasik anlamda açtım ancak içerik benim ömrümden 20 yıl aldı götürdü. 15 dakika geç kalınsaydı ölecekmiş ya da başka komplikasyonlar oluşacakmış. ömrümü yedin oğlum!

normal doğumda yaşananlar; 

21 mart gece saat 01.00''da suyumuz geldi az miktarda. akabinde sancı beklemeye başladık. sancılar 03.30''dan sonra gelmeye başladı ama çok hafif ve uzun aralıklı. doktorumuza ulaştık sabaha kadar ağrı olmaza sabah gelin kontrol edelim dedi.', 1, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 2, 18, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (21, N'günübirlik yurtdışına gitmek', N'yarın yapacağım, zagreb gezisi ile bu yıl üçüncüsünü gerçekleştireceğim eylem. pasaport ve vize probleminiz yoksa erken alınmış bir uçak biletinden başka neredeyse masrafınız yok. ', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 3, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (22, N'said nursi', N'ölümünün 58. yıldönümünde saygı ve rahmetle anıyoruz. allah ebeden ve daimen razı olsun. 

"kur''an''dan istinbat buyurarak gösterdiği hakikatlere karşı allah''ın tevfikiyle can u dilden belî dedim, tasdik ettim. "
barla - 29', 0, CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1088, 19, 0)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (23, N'ekşi itiraf', N'seni hiç görmemiş olduğuma bakma, 
yüzünü çizdim ezberimde. 
karşıma çıksan, tanırım. 
o derece.
sesini duymanın bir yolu olmalı. 
duyduğum, duyabileceğim en güzel sestir bence.', 0, CAST(N'2018-03-22 00:00:00.000' AS DateTime), 1088, 13, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (24, N'üstteki yazarın nickinin düşündürdüğü', N'<p>internet &uuml;st&uuml;nden ders veren muzır şakaları olan hoca.&nbsp;</p>', 2, CAST(N'2018-03-22 00:00:00.000' AS DateTime), 2, 13, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (25, N'şekersiz çay', N'bir arkadaşımın vesilesiyle başladığım ve hayatıma kalite katan olay', 0, CAST(N'2018-03-22 00:00:00.000' AS DateTime), 1088, 8, 1)
INSERT [dbo].[tblGundemler] ([Gundemid], [GundemBaslik], [GundemIcerik], [GoruntulenmeSayisi], [Tarih], [Yazarid], [Kategoriid], [Onaylandimi]) VALUES (1043, N'fkhtjzlöh', N'gölbarw', 0, CAST(N'2018-05-20 12:07:03.460' AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[tblGundemler] OFF
SET IDENTITY_INSERT [dbo].[tblKategoriler] ON 

INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (1, N'Tümü')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (2, N'Siyaset')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (3, N'Seyahat')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (4, N'Haber')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (5, N'Eğitim')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (6, N'Edebiyat')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (7, N'Bilim')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (8, N'Anket')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (9, N'Müzik')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (10, N'Otomotiv')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (11, N'TV')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (12, N'Motosiklet')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (13, N'Sözlük')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (14, N'Magazin')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (15, N'Ekonomi')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (16, N'Moda')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (17, N'Havacılık')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (18, N'İlişkiler')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (19, N'Spor')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (20, N'Markalar')
SET IDENTITY_INSERT [dbo].[tblKategoriler] OFF
SET IDENTITY_INSERT [dbo].[tblKisiler] ON 

INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1, N'Öznur', N'Erdem', N'öznur@gmail.com', N'123', 1, CAST(N'2018-02-07' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (2, N'Furkan', N'Yaşar', N'furkan@hotmail.com', N'123', 500, CAST(N'2018-03-04' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (3, N'Adem', N'Eşsiz', N'essiz@gmail.com', N'12121', 12, CAST(N'2018-03-04' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (4, N'Ali', N'Ercan', N'veli@gmail.com', N'53524', 29, CAST(N'2018-03-04' AS Date), 3)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (78, N'Ömer', N'Ali', N'veli@hotmail.com', N'33141', 501, CAST(N'2018-03-05' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (79, N'Sabahattin', N'Kasapoğlu', N'kasap@gmail.com', N'121313', 96, CAST(N'2018-03-08' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (80, N'Buse', N'Karpuz', N'karpuz@hotmail.com', N'123', 600, CAST(N'2018-03-08' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (81, N'Necmettin', N'Kasapoğlu', N'kasap2i@outlook.com', N'1234', 249, CAST(N'2018-03-23' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (82, N'Ahmet', N'Bocut', N'mchtbct18@outlook.com', N'102132', 17, CAST(N'2018-03-23' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (83, N'İsmail', N'Serçe', N'ismailserce@outlool.com', N'1223', 20, CAST(N'2018-03-23' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1082, N'Salih', N'Sahin', N'veysel@gmail.com', N'897', 33, CAST(N'2018-03-23' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1083, N'Nizamettin', N'Oktay', N'oktay@hotmail.com', N'1245', 35, CAST(N'2018-03-23' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1084, N'Gurkan', N'Yamuk', N'yamuk@gmail.com', N'4466', 77, CAST(N'2018-03-23' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1085, N'Emir', N'Han', N'suzen@outlook.com', N'1256', 65, CAST(N'2018-03-23' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1086, N'Kerem', N'Yılmaz', N'kerem@gmail.com', N'123', 362, CAST(N'2018-03-23' AS Date), 3)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1087, N'Yiğit', N'Kirpi', N'kirpi88@gmail.com', N'8899', 90, CAST(N'2018-03-23' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1088, N'Mihriban', N'Green', N'kalır@gmail.com', N'5544', 82, CAST(N'2018-03-23' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1089, N'Ayşe', N'Ünal', N'ayse@outlook.com', N'9080', 45, CAST(N'2018-03-23' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1090, N'Aysel', N'Nurcan', N'nur@hotmail.com', N'4477', 88, CAST(N'2018-03-23' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1091, N'şerif', N'tunç', N'tunc@hotmail.com', N'123', 10, CAST(N'2018-04-09' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1092, N'şura', N'seo', N'sura@gmail.com', N'123', 20, CAST(N'2018-04-09' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1093, N'İsmail', N'Serçe', N'şura@gmail.com', N'123', 30, CAST(N'2018-04-09' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1094, N'fwfwfw', N'fwfwfwf', N'ççç@gmail.com', N'123', 10, CAST(N'2018-04-09' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1095, N'İsmail', N'Serçe', N'çç@gmail.com', N'123', 20, CAST(N'2018-04-09' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1096, N'samet', N'essiz', N'samets@hotmail.com', N'123', 20, CAST(N'2018-04-16' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1097, N'samet1', N'essiz', N'sametss@hotmail.com', N'123', 50, CAST(N'2018-04-16' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1098, N'samet', N'2 essiz', N'sssamet@hotmail.com', N'123', 20, CAST(N'2018-04-16' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1099, N'dfdf', N'dfdf', N'sada@gmail.com', N'123', 300, CAST(N'2018-04-16' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1100, N'1dfdf', N'dfdf', N'saada@gmail.com', N'123', 10, CAST(N'2018-04-16' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1101, N'şahab', N'eren', N'sahab@gmail.com', N'123', 20, CAST(N'2018-04-16' AS Date), 1)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1102, N'şermin', N'sema', N'sermin@gmail.com', N'123', 250, CAST(N'2018-04-16' AS Date), 2)
INSERT [dbo].[tblKisiler] ([Kisiid], [Ad], [Soyad], [Mail], [Parola], [Puan], [Tarih], [Rolid]) VALUES (1103, N'şelim', N'yılmaz', N'selim@gmail.com', N'123', 1, CAST(N'2018-04-16' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblKisiler] OFF
SET IDENTITY_INSERT [dbo].[tblNotlar] ON 

INSERT [dbo].[tblNotlar] ([Notid], [Notu], [Kisiid]) VALUES (5, N'<p>Furkan &Ccedil;alışkandır (D&uuml;zenlendi)</p>', 2)
INSERT [dbo].[tblNotlar] ([Notid], [Notu], [Kisiid]) VALUES (6, N'<p>&Ouml;mer Ali &Ccedil;ok İyi Admindir</p>', 78)
INSERT [dbo].[tblNotlar] ([Notid], [Notu], [Kisiid]) VALUES (1002, N'<p>sa as</p>', 1083)
SET IDENTITY_INSERT [dbo].[tblNotlar] OFF
SET IDENTITY_INSERT [dbo].[tblRoller] ON 

INSERT [dbo].[tblRoller] ([Rolid], [Rol]) VALUES (1, N'Uye')
INSERT [dbo].[tblRoller] ([Rolid], [Rol]) VALUES (2, N'Yazar')
INSERT [dbo].[tblRoller] ([Rolid], [Rol]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[tblRoller] OFF
SET IDENTITY_INSERT [dbo].[tblYorumBegendimi] ON 

INSERT [dbo].[tblYorumBegendimi] ([Yorumbegendimiid], [Kisiid], [Yorumid], [Gundemid]) VALUES (1041, 2, 35, NULL)
SET IDENTITY_INSERT [dbo].[tblYorumBegendimi] OFF
SET IDENTITY_INSERT [dbo].[tblYorumlar] ON 

INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (3, N'ülkede metallica''ya ve kitap okumaya bok atarak prim kasmaya çalışan adamlar bir bitmedi ona yanıyorum.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (6, N'ilk kez bugünkü 5 aralık 2010 beşiktaş bursaspor maçı maçında izlediğim, oyunu takip yeteneğini ve ilk müdahalelerini beğendiğim gelecek vaadeden defans oyuncusu.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 4, 9)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (12, N'kullanıldığı durumlar vardır.ancak suistimale çok açık.gerçek bir bel fıtığını bunlarla iyi etmeye çalışırken kaybedilen vakit çok önemli', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1083, 15)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (13, N'insanı,çevreyi veya olan biteni anlayamamak,görememek.

herşeyin en güzelini yapmaya çalışmak sadece kendini mutlu eder.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1082, 14)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (15, N'an itibariyle 4.01 ile rabia demiştir. sarı kafa ulusal güvenlik danışmanı mcmaster''ı kovmuş. gelen adam da john bolton, ırak teskeresinden sonra türkiye''yi kara listeye alan ekipten.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 4, 16)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (17, N'daha tam olmamis liste. sozluge caylak modunda giris yapan yazarlari da otomatikman siralamaya aliyor, misal az once ben 12. siradaydim.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 81, 19)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (18, N'türkiye''de oturduğun koltuğa yapışmak, politikadan ayrılmamak için ayak diremek anlamında da kullanılır.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 79, 20)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (19, N'abartanın zaten olmadığı eylem. 

gereksiz anlamlar yükleyip, "ben zaten her haftasonu yapıyorum yea" deyip işi cool''luğa vurmaya çalışanlar utansın.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 83, 21)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (20, N'ne dense dolu
dogunun kalkinmasinin egitimle olacagini dusunup zamanin padisahiyla bile mucadele edip universite kurulmasi icin caba gostermistir, ataturkle mucadeleside bu yondedir. gotumuzu sere sere rahat icinde oturup ota boka laf atmak neyin cozumu olacaksa, yerler adami yerler.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 82, 22)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (21, N'en begenilen entry''lerim oylanmadan yer değiştiğinde korkuyorum, uc kulhuvallah bir elham okuyorum, allahım beni cinden ruhdan uzak tut diyorum. tam mag-mallık biliyorum ama elimde değil.
', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1088, 23)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (22, N'kendisini gayet iyi aciklayan bir nick .', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1089, 24)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (23, N'sirius black''in galonla tükettiği, şekerli içmeye alışık insanlarda sıcak acı su içiyomuş etkisi bırakan bi garip şey.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 2, 25)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (24, N'anlik 4u asti, euro 4.99 gordum, o kadar sert cikti indi ki grafiklere yansimadi...', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 4, 16)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (26, N'amazon''un türkiye pazarına girişinin etkili olacağını zaten düşünüyorduk ama bu kadar etkili bir giriş beklemiyordum. umarım doğrudur ve uluslararası kalitesini türkiye pazarında da görebilme olacağımız olur. türkiye özellikle amazon gibi markalar için ihmal edilemeyecek kadar büyük ve etkin bir pazar çünkü.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1089, 13)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (27, N'ehliyetiniz yoksa trafiğe çıkmayın. sonra polis çevirince büyük problem oluyor. benden söylemesi.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 78, 6)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (28, N'daha yağamadı ki. bulutlar dolup taşmış durumda. gündüz de gece gibi oldu şehir. bir türlü düşemedi yere yağış. toz da keyfince gezmiş her yeri. araçların hepsi toprak rengine bürünmüş.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 81, 7)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (29, N'3 gündür adamlar söylüyor. güneyden toz aşımı olacak diye.yağmur da yağmayınca toz olarak indi.yoksa 1 karış çamur yağacaktı.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1090, 7)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (30, N'bu listedeki sıra eğer fiziksel ve düz bir kuyruk oluştursaydı, sıranın başından yaklaşık 10km kadar geride olacaktım. hadi ona razıyız da bir de araya kaynayanlar var..
', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 1085, 18)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (33, N'acun ılıcalının nerdeyse her sene anıl adlı yarışmacı yarıştırma isteğinin istatistiki olarak göze çarptığı yarışma.yani 2019 da anıl ismine sahipseniz bu yarışmada olma ihtimaliniz hiç de az degil.', CAST(N'2018-03-23 00:00:00.000' AS DateTime), 81, 2)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (35, N'<p>aaaaa</p>', CAST(N'2018-04-10 11:51:24.107' AS DateTime), 1, 21)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (37, N'<p>dasdasdfas</p>', CAST(N'2018-04-10 12:20:00.523' AS DateTime), 2, 10)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Gundemid]) VALUES (41, N'<p>şermin deneme</p>', CAST(N'2018-04-16 20:52:14.320' AS DateTime), 1102, 7)
SET IDENTITY_INSERT [dbo].[tblYorumlar] OFF
ALTER TABLE [dbo].[tblGundemler]  WITH CHECK ADD  CONSTRAINT [FK_tblGundemler_tblKategoriler] FOREIGN KEY([Kategoriid])
REFERENCES [dbo].[tblKategoriler] ([Kategoriid])
GO
ALTER TABLE [dbo].[tblGundemler] CHECK CONSTRAINT [FK_tblGundemler_tblKategoriler]
GO
ALTER TABLE [dbo].[tblGundemler]  WITH CHECK ADD  CONSTRAINT [FK_tblGundemler_tblKisiler] FOREIGN KEY([Yazarid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblGundemler] CHECK CONSTRAINT [FK_tblGundemler_tblKisiler]
GO
ALTER TABLE [dbo].[tblKisiler]  WITH CHECK ADD  CONSTRAINT [FK_tblKisiler_tblRoller] FOREIGN KEY([Rolid])
REFERENCES [dbo].[tblRoller] ([Rolid])
GO
ALTER TABLE [dbo].[tblKisiler] CHECK CONSTRAINT [FK_tblKisiler_tblRoller]
GO
ALTER TABLE [dbo].[tblNotlar]  WITH CHECK ADD  CONSTRAINT [FK_tblNotlar_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblNotlar] CHECK CONSTRAINT [FK_tblNotlar_tblKisiler]
GO
ALTER TABLE [dbo].[tblOncedenBegendimi]  WITH CHECK ADD  CONSTRAINT [FK_tblOncedenBegendimi_tblGundemler] FOREIGN KEY([Gundemid])
REFERENCES [dbo].[tblGundemler] ([Gundemid])
GO
ALTER TABLE [dbo].[tblOncedenBegendimi] CHECK CONSTRAINT [FK_tblOncedenBegendimi_tblGundemler]
GO
ALTER TABLE [dbo].[tblOncedenBegendimi]  WITH CHECK ADD  CONSTRAINT [FK_tblOncedenBegendimi_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblOncedenBegendimi] CHECK CONSTRAINT [FK_tblOncedenBegendimi_tblKisiler]
GO
ALTER TABLE [dbo].[tblOncedenBegenmedimi]  WITH CHECK ADD  CONSTRAINT [FK_tblOncedenBegenmedimi_tblGundemler] FOREIGN KEY([Gundemid])
REFERENCES [dbo].[tblGundemler] ([Gundemid])
GO
ALTER TABLE [dbo].[tblOncedenBegenmedimi] CHECK CONSTRAINT [FK_tblOncedenBegenmedimi_tblGundemler]
GO
ALTER TABLE [dbo].[tblOncedenBegenmedimi]  WITH CHECK ADD  CONSTRAINT [FK_tblOncedenBegenmedimi_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblOncedenBegenmedimi] CHECK CONSTRAINT [FK_tblOncedenBegenmedimi_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumBegendimi]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumBegendimi_tblGundemler] FOREIGN KEY([Gundemid])
REFERENCES [dbo].[tblGundemler] ([Gundemid])
GO
ALTER TABLE [dbo].[tblYorumBegendimi] CHECK CONSTRAINT [FK_tblYorumBegendimi_tblGundemler]
GO
ALTER TABLE [dbo].[tblYorumBegendimi]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumBegendimi_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblYorumBegendimi] CHECK CONSTRAINT [FK_tblYorumBegendimi_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumBegendimi]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumBegendimi_tblYorumlar] FOREIGN KEY([Yorumid])
REFERENCES [dbo].[tblYorumlar] ([Yorumid])
GO
ALTER TABLE [dbo].[tblYorumBegendimi] CHECK CONSTRAINT [FK_tblYorumBegendimi_tblYorumlar]
GO
ALTER TABLE [dbo].[tblYorumBegenmedimi]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumBegenmedimi_tblGundemler] FOREIGN KEY([Gundemid])
REFERENCES [dbo].[tblGundemler] ([Gundemid])
GO
ALTER TABLE [dbo].[tblYorumBegenmedimi] CHECK CONSTRAINT [FK_tblYorumBegenmedimi_tblGundemler]
GO
ALTER TABLE [dbo].[tblYorumBegenmedimi]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumBegenmedimi_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblYorumBegenmedimi] CHECK CONSTRAINT [FK_tblYorumBegenmedimi_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumBegenmedimi]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumBegenmedimi_tblYorumlar] FOREIGN KEY([Yorumid])
REFERENCES [dbo].[tblYorumlar] ([Yorumid])
GO
ALTER TABLE [dbo].[tblYorumBegenmedimi] CHECK CONSTRAINT [FK_tblYorumBegenmedimi_tblYorumlar]
GO
ALTER TABLE [dbo].[tblYorumlar]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumlar_tblGundemler] FOREIGN KEY([Gundemid])
REFERENCES [dbo].[tblGundemler] ([Gundemid])
GO
ALTER TABLE [dbo].[tblYorumlar] CHECK CONSTRAINT [FK_tblYorumlar_tblGundemler]
GO
ALTER TABLE [dbo].[tblYorumlar]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumlar_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblYorumlar] CHECK CONSTRAINT [FK_tblYorumlar_tblKisiler]
GO
USE [master]
GO
ALTER DATABASE [SonsuzSozluk] SET  READ_WRITE 
GO
