<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SonsuzSozluk.Landing.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>SONSUZ SOZLUK</title>
    <link href="css/Langingstil.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.superslides.js" type="text/javascript"></script>
    <script src="js/jquery.appear.js"></script>
    <script src="js/custom.js" type="text/javascript"></script>
    <%-- Animated--%>
    <link href="css/animate.css" rel="stylesheet" />
    <%-- Carousel--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" media="all" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" media="all" />

    <!--NASIL CALISIR-->
    <link href="css/yazarlar.css" rel="stylesheet" />
   <%-- <link rel="short icon" href="img/favicon.ico" />--%>
    <!--paketler--->
    <link href="css/theme-classic.css" rel="stylesheet" />
    <!--/paketler-->
    <link href="css/style.css" rel="stylesheet" />
    <link href="../App/css/sss.css" rel="stylesheet" />
    <script src="js/jssayac.js"></script>
    <%-- Footer --%>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-menu">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand " href="#" style="margin: 0; padding: 0;">
                        <img src="img/logoSozluk.png" /></a>
                </div>
                <div class="collapse navbar-collapse" id="navigation-menu">
                    <ul class="nav navbar-nav">
                        <li><a href="#anasayfa" id="GoToHome">Ana Sayfa</a></li>
                        <li><a href="#nasilcalisir" id="GoToAbout">Nasıl Çalışır?</a></li>
                        <li><a href="#yazarlar" id="GoToFeatures">Yazarlarımız</a></li>
                        <li><a href="#paketler" id="GoToWorks">Paketlerİmİz</a></li>
                        <li><a href="#sss" id="GoToTeam">Sık Sorulan Sorular</a></li>
                        <li><a href="#iletisim" id="GoToPricing">İletİşİm</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../App/Sigup.aspx">
                            <img src="img/sign up.png" />&nbsp;&nbsp;Üye Ol</a></li>
                        <li><a href="../App/Login.aspx">
                            <img src="img/login.png" />&nbsp;&nbsp;GİrİŞ Yap</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <section id="anasayfa">
            <div class="container-fluid">
                <div class="row">
                    <div id="Carousel" data-ride="Carousel" class="carousel slide carousel-fade col-offset-2  animated fadeIn ">
                        <ol class="carousel-indicators">
                            <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#Carousel" data-slide-to="1"></li>
                            <li data-target="#Carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="img/resim1.jpg" class="img-responsive" width="100%" />
                                <div class="carousel-caption">
                                    <div class="carouselIcerik">
                                        <h2 class="carouselCaptionBaslik animated fadeInDown">Gündem</h2>
                                        <h4 class="carouselCaptionIcerik  animated fadeInLeft">Şaka maka bu sene kışın gelmemesi</h4>
                                        <a href="#" class="btn btn-primary carouselButton animated fadeInUp">Konuya Bakmak için Tıklayın</a>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="img/resim2.jpg" class="img-responsive" width="100%" />
                                <div class="carousel-caption">
                                    <div class="carouselIcerik">
                                        <h2 class="carouselCaptionBaslik animated fadeInDownBig">Gündem</h2>
                                        <h4 class="carouselCaptionIcerik animated fadeInRightBig">Bomboş yolda şerit değiştirirken sinyal vermek</h4>
                                        <a href="#" class="btn btn-primary carouselButton animated fadeInLeftBig">Konuya Bakmak için Tıklayın</a>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <img src="img/resim3.jpg" class="img-responsive" width="100%" />
                                <div class="carousel-caption">
                                    <div class="carouselIcerik">
                                        <h2 class="carouselCaptionBaslik carouselButton animated fadeInUp">Gündem</h2>
                                        <h4 class="carouselCaptionIcerik carouselButton animated fadeInDown">Hayatında hiç starbucks'a gitmemiş insan</h4>
                                        <a href="#" class="btn btn-primary carouselButton animated fadeInLeftBig">Konuya Bakmak için Tıklayın</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a class="left carousel-control" href="#Carousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#Carousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <section id="nasilcalisir" class="text-center">
            <h1 class="baslikAyar">NASIL ÇALIŞIR?</h1>
            <hr />
            <div class="container">
                <div class="row" style="margin-bottom: 50px;">
                    <div class="col-md-4">
                        <span class="glyphicon glyphicon-user iconlar"></span>
                        <h3>Üye Nasıl Olunur?</h3>
                        <br />
                        <p class="yaziAyar">"Üye Ol" butonuna tıkladıktan sonra ad,soyad ve e-Mail bilgilerinizi girip parola oluşturduktan sonra üye olabilirsiniz.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="glyphicon glyphicon-pencil iconlar"></span>
                        <h3>Yazar Nasıl Olunur?</h3>
                        <br />
                        <p class="yaziAyar">Üye olarak başladığınız sözlüğümüze, diğer üyelerin açtığıkları gündemlere beğeni kazanarak yaptığınız yorumlarınız sonrasında 100 puana ulaşmanız halinde yazar olabilirsiniz.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="glyphicon glyphicon-log-in iconlar"></span>
                        <h3>Giriş Nasıl Yapılır?</h3>
                        <br />
                        <p class="yaziAyar">"Giriş Yap" butonuna tıkladıktan sonra e-Mail ve parola bilgilerinizi girerek giriş yapabilirsiniz.</p>
                    </div>
                </div>
            </div>
        </section>
        <section id="yazarlar" class="text-center">
            <h1 class="baslikAyar">YAZARLARIMIZ</h1>
            <hr />
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="our-team">
                            <div class="team-pic">
                                <img src="img/01.jpg" />
                            </div>
                            <div class="team-profile">
                                <h3 class="team-title">
                                    <a href="#">Emircan Önel</a>
                                    <small>İstanbul</small>
                                </h3>
                                <p class="description">Aslen Malatyalı olan yazarımız günün büyük bölümünü yemek yiyerek geçirmektedir.</p>
                                <ul class="team-social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-google-plus"></a></li>
                                    <li><a href="#" class="fa fa-instagram"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="our-team">
                            <div class="team-pic">
                                <img src="img/02.jpg" />
                            </div>
                            <div class="team-profile">
                                <h3 class="team-title">
                                    <a href="#">Cemal Kerem</a>
                                    <small>Ordu</small>
                                </h3>
                                <p class="description">Biraz fazla gereksiz konuşması dışında iyi bir insandır.</p>
                                <ul class="team-social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-google-plus"></a></li>
                                    <li><a href="#" class="fa fa-instagram"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="our-team">
                            <div class="team-pic">
                                <img src="img/03.jpg" />
                            </div>
                            <div class="team-profile">
                                <h3 class="team-title">
                                    <a href="#">Yağmur Agsar</a>
                                    <small>Ankara</small>
                                </h3>
                                <p class="description">Kendisi uygulamamızın bu bölümünü yapmış olup desteklerinden dolayı teşekkür ederiz.</p>
                                <ul class="team-social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-google-plus"></a></li>
                                    <li><a href="#" class="fa fa-instagram"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="our-team">
                            <div class="team-pic">
                                <img src="img/04.jpg" />
                            </div>
                            <div class="team-profile">
                                <h3 class="team-title">
                                    <a href="#">Uğur Taşdemir</a>
                                    <small>Ardahan</small>
                                </h3>
                                <p class="description">Herşey bir ayakla başladı(48).</p>
                                <ul class="team-social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-google-plus"></a></li>
                                    <li><a href="#" class="fa fa-instagram"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="bg-grey" id="paketler">
            <div class="container">
                <h2 class="text-center">Paketlerimiz</h2>
                <hr />
                <div class="row no-padding">
                    <div class="col-md-4">
                        <!-- Price Table -->
                        <div class="price-table-1 animated" data-animation="fadeInRight" data-animation-delay="700">
                            <div class="head">
                                <h3 class="title">Haftalık</h3>
                                <span class="text-muted">Yazar olabalirsiniz.</span>
                            </div>
                            <div class="price">
                                <span class="currency">&#8378;</span>9.90<span class="type text-muted">/ haftalık</span>
                            </div>
                            <ul class="features">
                                <li>Gündem açabilirsiniz</li>
                                <li>Sınırsız yorum yapabilirsiniz</li>
                                <li>Üye ekleyebilirsiniz.</li>
                                <li>7/24 bize ulaşabilirsiniz</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 paketayar">
                        <!-- Price Table -->
                        <div class="price-table-1 featured animated" data-animation="fadeIn">
                            <div class="head">
                                <h3 class="title">Aylık</h3>
                                <span class="text-muted">Yazar olabilirsiniz.</span>
                            </div>
                            <div class="price">
                                <span class="currency">&#8378;</span>49.90<span class="type text-muted">/ aylık</span>
                            </div>
                            <ul class="features">
                                <li>Gündem açabilrsiniz</li>
                                <li>Sınırsız yorum yapabilirsiniz</li>
                                <li>Üye ekleyebilirsiniz.</li>
                                <li>7/24 bize ulaşabilirsiniz</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- Price Table -->
                        <div class="price-table-1 animated" data-animation="fadeInLeft" data-animation-delay="700">
                            <div class="head">
                                <h3 class="title">Yıllık</h3>
                                <span class="text-muted">Yazar Olabilirsiniz</span>
                            </div>
                            <div class="price">
                                <span class="currency">&#8378;</span>499.90<span class="type text-muted">/ yıllık</span>
                            </div>
                            <ul class="features">
                                <li>Gündem Açabilirsiniz.</li>
                                <li>Sınırsız yorum yapabilirsiniz</li>
                                <li>Üye ekleyebilirsiniz.</li>
                                <li>7/24 bize ulaşabilirsiniz</li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%-- SIK SORULAN SORULAR --%>
        <section id="sss">
            <div class="container text-center" style="margin-top: 33px">
                <div class="row">
                    <h1>Sık Sorulan Sorular</h1>
                    <hr />
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <img src="img/question.png" width="45%" />
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Yazar Nasıl Olunur ?
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        Öncelikle üye olarak başladığınız sözlüğümüzde diğer yazarların açtıkları gündem maddelerine
                                            yorum ekleyebilirsiniz. Yaptığınız yorumların diğer kullanıcılar tarafından beğenilmesi durumunda 1 puan
                                            alırsınız. Aldığınız puanlar 100 olduğunda yazar olabilir ve artık gündemi siz de
                                            belirleyebilirsiniz. Bunun haricinde <a href="#paketler">paketler</a> kısmındaki fiyatlar üzerinden de 
                                            yazar olabilirsiniz.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFive">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false"
                                            aria-controls="collapse">Giriş Nasıl Yapılır?
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                    <div class="panel-body">
                                        <a href="../App/Login.aspx">Giriş Yap</a>  menüsünü tıklayarak karşımızda gelen pencerede mail ve parolanızı 
                                            doğru girmeniz durumunda giriş yapabilirsiniz.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
                                            aria-controls="collapseTwo">Üye Nasıl Olunur?
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <a href="../App/SignUp.aspx">Üye Ol</a>  menüsüne tıklandığında sizden istenen Ad, Soyad, Mail ve Parola bilgilerinizi
                                            eksiksiz girmeniz durumunda sözlüğümüze hemen üye olabilirsiniz.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false"
                                            aria-controls="collapseThree">Gündem Ekleme
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        Bu özellikten yalnızca yazarlarımız faydalanmaktadır. Bu nedenle gündem oluşturabilmek için 
                                            öncelikle yazar olmanız gerekmektedir.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFour">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false"
                                            aria-controls="collapseFour">Kurallar vb.
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                    <div class="panel-body">
                                        Açılan her gündem maddesi ve yorumlar site yöneticileri tarafından
                                            takip edilmektedir. Bu kurala uymayan kullanıcılar sözlükten süresiz uzaklaştırılmaktadır.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <section id="iletisim">
            <div class="container text-center">
                <div class="row">
                    <h3>İLETİŞİM</h3>
                    <hr />
                </div>
                <div class="row">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-map-marker iconrenkayar"></span>
                            <address>
                                Batı Ataşehir/İstanbul
                            </address>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-phone iconrenkayar"></span>
                            <address>
                                +90 (535) 456-22-13
                            </address>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <span class="glyphicon glyphicon-envelope iconrenkayar"></span>
                            <address>
                                sonsuzsozluk@gmail.com
                            </address>
                        </div>
                    </div>
                </div>
                <div class="row text-center" style="margin-top: 50px;">
                    <div class="col-xs-12">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3011.4837815392916!2d29.108641015067526!3d40.9927832793023!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cac627210916db%3A0xa48c1cef388798d3!2sAta%C5%9Fehir+Rotary+%C3%87ok+Programl%C4%B1+Anadolu+Lisesi!5e0!3m2!1str!2str!4v1515282095067" width="100%" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </section>
        <%--Sayaç--%>
        <section id="sayac">
            <div class="container-fluid text-center" style="background-color: #333333">
                <div class="container" style="padding: 100px 0 !important">
                    <div class="row">
                        <div class="col-xs-12 col-md-3">
                            <%--<span class="sayac count">68</span><br />--%>
                            <asp:Label ID="lblUyeSayisi" runat="server" CssClass="sayac count" Text=""></asp:Label><br />
                            <span class="icerik">Üye Sayısı</span>
                        </div>
                        <div class="col-xs-12 col-md-3">
                            <asp:Label ID="lblYazarSayisi" runat="server" CssClass="sayac count" Text=""></asp:Label><br />
                            <span class="icerik">Yazar Sayısı</span>
                        </div>
                        <div class="col-xs-12 col-md-3">
                            <asp:Label ID="lblGundemSayisi" runat="server" CssClass="sayac count" Text=""></asp:Label><br />
                            <span class="icerik">Gündem Sayısı</span>
                        </div>
                        <div class="col-xs-12 col-md-3">
                            <asp:Label ID="lblYorumSayisi" runat="server" CssClass="sayac count" Text=""></asp:Label><br />
                            <span class="icerik">Yorum Sayısı</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%-- sayaç end--%>
        <section id="footer">
            <footer class="footer">
                <div class="container">
                    <div class="row sifirla">
                        <div class="col-sm-3">
                            <h4 class="title">Hakkımızda</h4>
                            <p>Biz 11-C Bilişim sınıfı olarak bu uygulamayı 2017-2018 Eğitim-Öğretim yılında yapmış bulunmaktayız.</p>
                            <ul class="social-icon">
                                <a href="#" class="social"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#" class="social"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#" class="social"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                <a href="#" class="social"><i class="fa fa-google" aria-hidden="true"></i></a>
                            </ul>
                        </div>
                        <div class="col-sm-3">
                            <h4 class="title">Emeği Geçenler</h4>
                            <span class="acount-icon">
                                <a href="#"><i class="fa fa-user" aria-hidden="true"></i>Adem Samet Eşsiz</a>
                                <a href="#"><i class="fa fa-users" aria-hidden="true"></i>Öznur Erdem</a>
                                <a href="#"><i class="fa fa-user" aria-hidden="true"></i>Can Bağcı</a>
                                <a href="#"><i class="fa fa-user" aria-hidden="true"></i>Furkan Yaşar</a>
                            </span>
                        </div>
                        <div class="col-sm-3">
                            <h4 class="title">Kategori</h4>
                            <div class="category">
                                <a href="#">anket</a>
                                <a href="#">haber</a>
                                <a href="#">spor</a>
                                <a href="#">teknoloji</a>
                                <a href="#">ekonomi</a>
                                <a href="#">dini</a>
                                <a href="#">bilim</a>
                                <a href="#">yaşam</a>
                                <a href="#">sağlık</a>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <h4 class="title">Ödeme Seçenekleri</h4>
                            <ul class="payment">
                                <li><a href="#"><i class="fa fa-cc-amex" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-paypal" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-visa" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row text-center"><a href="../App/Login.aspx" style="color: #fff;">Copyright ©sonsuzsözlük 2017 Tüm Hakları Saklıdır.</a></div>
                </div>
            </footer>
        </section>
    </form>
</body>
</html>
