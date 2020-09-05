<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciProfil.aspx.cs" Inherits="SonsuzSozluk.App.KulluaniciProfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SONSUZ SOZLUK</title>
    <link rel="short icon" href="../Langing/img/favicon.ico" />
    <link href="css/KullaniciProfil.css" rel="stylesheet" />
    <link href="css/KullaniciProfil1.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <script src="js/kullaniciprofilduzenle.js"></script>
    <!--BOOSTRAP-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--açılır yorum-->
    <script>
        $(function () {
            $('.yorumkısmısı2').click(function () {
                $(this).next('.acilan').slideToggle(500);
            });
        });
    </script>
    <!--açılır yotum bitiş-->

    <!--tooltip-->
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <!--tooltipbitis-->
    <%--ARAMA--%>
    <script>
        $(document).ready(function () {
            $("#txtAranan").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myList li").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <%--END ARAMA--%>
    <script>
        $(document).ready(function () {
            $("#txtAranan2").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myList2 li").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <%--END ARAMA--%>
</head>
<body>
    <form id="form1" runat="server">
        <!--yukarısı banner ve pp-->
        <div class="container-fluid">
            <div class="row rowbanner">
                <div class="bannerbir">
                    <a href="#" style="text-decoration: none; color: #333">
                        <div class="tablocikis">&nbsp;&nbsp;<a class="tooltipayar" href="Default.aspx" data-toggle="tooltip" data-placement="right" title="GERİ DÖN !"><span class="glyphicon glyphicon-log-out"></span></a></div>
                    </a>
                </div>
            </div>
        </div>
        <!--icerik kımı-->
        <div class="container-fluid">
            <div class="row">
                <div class="tabsKapsayıcı">
                    <div class="w3-row">
                        <a href="javascript:void(0)" onclick="openCity(event, 'kullanıcıbilgileri');">
                            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabsanabaslıkayar">Bilgilerim</div>
                        </a>
                        <a href="javascript:void(0)" onclick="openCity(event, 'sifremidegistir');">
                            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabsanabaslıkayar">Şifremi Değiştir</div>
                        </a>
                        <a href="javascript:void(0)" onclick="openCity(event, 'acılanhaberler');">
                            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabsanabaslıkayar">Açtıgım Gundem Maddeleri</div>
                        </a>
                        <a href="javascript:void(0)" onclick="openCity(event, 'atılanyorumlar');">
                            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabsanabaslıkayar">Attığım Yorumlar</div>
                        </a>
                    </div>
                    <div id="kullanıcıbilgileri" class="w3-container city animated bounceInLeft " style="display: block; border-bottom: solid 2px #dedede; background-color: #F5F5F5">
                        <h2 class="tabsbaslık">Bilgilerim</h2>
                        <hr class="hrayarprofil" />
                        <div id="kullanıcıbilgileriayar">
                            <div class="fieldsetgibi">
                                <span>Ad:</span>
                                <asp:TextBox ID="txtKullaniciAd" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                                <span>Soyad:</span>
                                <asp:TextBox ID="txtKullaniciSoyad" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                                <span>Mail:</span>
                                <asp:TextBox ID="txtKullaniciMail" Enabled="false" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                                <span>Üyelik Tarihi:</span>
                                <asp:TextBox ID="txtUyelikTarihi" Enabled="false" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                                <span>Puan:</span>
                                <asp:TextBox ID="txtPuan" runat="server" Enabled="false" CssClass="textboxayar form-control"></asp:TextBox>
                                <span>Madalya Sayısı:</span>
                                <asp:TextBox ID="txtMadalyaSayisi" runat="server" Enabled="false" CssClass="textboxayar form-control"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnguncellekulanıcıbilgi" runat="server" CssClass="buttonguncelle" Text="Güncelle" OnClick="btnguncellekulanıcıbilgi_Click" />
                            <asp:Label ID="lblKullaniciBilgi" runat="server" CssClass="label label-danger" Text=""></asp:Label>
                        </div>
                    </div>

                    <div id="sifremidegistir" class="w3-container city animated bounceInLeft" style="display: none; border-bottom: solid 2px #dedede; background-color: #F5F5F5">
                        <h2 class="tabsbaslık">Şifremi Değiştir</h2>
                        <hr class="hrayarprofil" />
                        <div class="fieldsetgibi">
                            <span>Eski Şifreniz:</span>
                            <asp:TextBox ID="txtEskiSifre" TextMode="Password" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                            <span>Yeni Şifreniz:</span>
                            <asp:TextBox ID="txtYeniSifre" TextMode="Password" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                            <span>Yeni Şifreniz Tekrar:</span>
                            <asp:TextBox ID="txtYeniSifreTekrar" TextMode="Password" runat="server" CssClass="textboxayar form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnguncellesifre" OnClick="btnguncellesifre_Click" runat="server" CssClass="buttonguncelle" Text="Güncelle" />
                        <asp:Label ID="lblSonuc" runat="server" CssClass="label label-danger" Text=""></asp:Label>
                    </div>

                    <div id="acılanhaberler" class="w3-container city animated bounceInLeft" style="display: none; border-bottom: solid 2px #dedede; background-color: #F5F5F5">
                        <h2 class="tabsbaslık">Açtıgım Gundem Maddeleri</h2>
                        <div class="input-group" style="width: 100%">
                            <input type="text" class="form-control" id="txtAranan" placeholder="Ara" name="search" />
                        </div>
                        <hr class="hrayarprofil" />
                        <div class="fieldsetgibi">
                            <div class="anabaslıkgundem">AÇTIĞINIZ GUNDEM MADDELERİ</div>
                            <asp:DataList ID="dtGundemBaslikTarihGetir" runat="server" Width="100%">
                                <ItemTemplate>
                                    <ul class="list-group boslukSil" id="myList">
                                        <li class="list-group-item boslukSil">
                                            <div>
                                                <asp:Label ID="lblAcılanHaberBaslık" runat="server" Text='<%# Eval("GundemBaslik") %>'></asp:Label><br />
                                                <asp:Label ID="lblAcılanHaberTarih" runat="server" CssClass="yorumTarih" Text='<%# Eval("Tarih","{0:d}") %>'></asp:Label>
                                            </div>
                                            <asp:LinkButton ID="SearchButton" PostBackUrl='<%#string.Format("~/App/GundemDuzenle.aspx?gundemid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Gundemid").ToString()))) %>' runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <div id="atılanyorumlar" class="w3-container city animated bounceInLeft" style="display: none; border-bottom: solid 2px #dedede; background-color: #F5F5F5">
                        <h2 class="tabsbaslık">Attığım Yorumlar</h2>
                        <div class="input-group" style="width: 100% !important">
                            <input type="text" class="form-control" id="txtAranan2" placeholder="Ara" name="search" />
                        </div>
                        <hr class="hrayarprofil" />
                        <div class="fieldsetgibi">
                            <div class="anabaslıkyorumlar">AÇTIĞINIZ GÜNDEM MADDELERİNİN ALTINA ATILAN YORUMLAR</div>
                            <asp:DataList ID="dtAtilanYorumlar" runat="server" Width="100%">
                                <ItemTemplate>
                                    <ul class="list-group boslukSil" id="myList2">
                                        <li class="list-group-item boslukSil">
                                            <div class="yorumkısmısı2">
                                                <asp:Label ID="lblYorum" runat="server" Text='<%# Eval("Yorum") %>'></asp:Label><br />
                                                <asp:Label ID="AtılanYorumlarTarih" runat="server" CssClass="yorumTarih" Text='<%# Eval("Tarih","{0:d}") %>'></asp:Label>
                                                <asp:LinkButton ID="EditButton" PostBackUrl='<%#string.Format("~/App/YorumDuzenle.aspx?yorumid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Yorumid").ToString()))) %>' runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-edit"></span></asp:LinkButton>
                                            </div>
                                        </li>
                                    </ul>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
