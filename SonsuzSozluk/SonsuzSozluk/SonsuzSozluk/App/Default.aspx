<%@ Page Title="" Language="C#" MasterPageFile="~/App/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SonsuzSozluk.App.Default" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gündemler</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <%--Mesaj kutusu scripti--%>
    <link href="css/AppGundem.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="css/app.css" rel="stylesheet" />
    <link rel="short icon" href="../Langing/img/favicon.ico" />
    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="kategoridiv">
        <asp:DropDownList CssClass="form-control form-controlayar" ID="Dropdownkategori" runat="server" AutoPostBack="true">
        </asp:DropDownList>
    </div>
    <hr style="background-color: #e60000 !important; height: 1px !important; margin-top: 65px" />
    <div class="col-xs-12 col-sm-3 menuscrool" style="border-right: 1px solid #c1b2b2">
        <asp:Label ID="lblGundem" runat="server" Text="Gündem" Style="color: #686161; font-weight: bolder; font-size: 17px"></asp:Label><br />
        <br />
        <asp:DataList ID="datalistGundemMenu" runat="server">
            <ItemTemplate>
                <div>
                    <asp:LinkButton ID="lnkMenuGundem" CssClass="aspbuton" runat="server" PostBackUrl='<%#string.Format("~/App/DefaultFiltrele.aspx?gundemid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Gundemid").ToString()))) %>'><%#Eval("GundemBaslik").ToString().Length<37?Eval("GundemBaslik"):Eval("GundemBaslik").ToString().Substring(0,37)+" ..." %></asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div class="col-xs-12 col-sm-8 divkapsa">
        <asp:DataList ID="datalistGundemBilgi" runat="server" Width="100%">
            <ItemTemplate>
                        <div class="dısdiv">
                            <asp:LinkButton ID="lnkGundemBaslik" runat="server" CssClass="gundemBaslik" PostBackUrl='<%#string.Format("~/App/DefaultFiltrele.aspx?gundemid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Gundemid").ToString()))) %>'><%#Eval("GundemBaslik").ToString().Length<95?Eval("GundemBaslik"):Eval("GundemBaslik").ToString().Substring(0,95)+" ..." %></asp:LinkButton>
                            <asp:Label ID="lblMadalyaSayisi" CssClass="Madalya" ToolTip="Madalya Sayısı" runat="server" Text='<%#(Int32)Eval("Puan")>249? Eval("AltınMadalyasayisi"):Eval("GumusMadalyaSayisi") %>'></asp:Label>
                            <asp:Image ID="imgAltinmadalya" runat="server" ToolTip='<%#(Int32)Eval("Puan")>249?"Altın Madalya":"Gümüş Madalya" %>' ImageUrl='<%#(Int32)Eval("Puan")>249?"~/App/img/AltınMadalya.png":"~/App/img/GumusMadalya.png" %>' />
                            <span class="badge" style="font-size: smaller !important; background-color: #c1b2b2 !important">
                            <asp:Label ID="lblPuan" runat="server" ToolTip="Üye Puan" Text='<%#Eval("Puan") %>'></asp:Label></span>
                            <asp:Label ID="lblGundemYazar" runat="server" CssClass="gundemTarih" Text='<%#Eval("Ad")+" "+Eval("Soyad")%>'></asp:Label>
                            <asp:Label ID="lblGundemTarih" runat="server" CssClass="gundemTarih" Text='<%#Eval("Tarih","{0:d}") %>'></asp:Label>
                            <asp:Label ID="lblIcerik" runat="server" CssClass="gundemIcerik" Text='<%#Eval("GundemIcerik") %>'></asp:Label>
                            <asp:ImageButton PostBackUrl='<%#string.Format("~/App/Default.aspx?gundemid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Gundemid").ToString()))) %>' runat="server" ID="imgbtnLike" OnClick="imgbtnLike_Click" ImageUrl="~/App/img/like.png" ToolTip='<%#Eval("Kisiid") %>' />
                            <asp:ImageButton CssClass="dislikeButton" ImageAlign="TextTop" runat="server" ID="imgbtnDislike" OnClick="imgbtnDislike_Click" PostBackUrl='<%#string.Format("~/App/Default.aspx?gundemid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Gundemid").ToString()))) %>' ImageUrl="~/App/img/dislike.png" ToolTip='<%#Eval("Kisiid") %>' />
                            <div class="dropdown" style="display: inline-block;">
                                <button class="buton dropdown-toggle" type="button" data-toggle="dropdown">
                                    <img src="img/share.png" />&nbsp;<span>Paylaş</span> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="https://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.yourpage.com"><i class="fa fa-facebook"></i>&nbsp;Facebook</a></li>
                                    <li><a href="https://plus.google.com/share?url=http://www.yourpage.com"><i class="fa fa-google"></i>&nbsp;Google</a></li>
                                    <li><a href="https://twitter.com/share?url=www.yourpage.com"><i class="fa fa-twitter"></i>&nbsp;Twitter</a></li>
                                </ul>
                            </div>
                            <asp:LinkButton ID="lnkYorumEkle" CssClass="Linkbuttonyorumayar" runat="server" PostBackUrl='<%#string.Format("~/App/GundemeYorumEkle.aspx?gundemid={0}",HttpUtility.UrlEncode(Sifreleme.Encrypt(Eval("Gundemid").ToString()))) %>'>Yorum Ekle</asp:LinkButton>
                        </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div class="row" id="divsayfalama" runat="server">
        <%-- ileri geri --%>
        <div class="ileriGeri btnilerigerihome">
            <asp:Button ID="btnIlk" CssClass="btnEnileriAcilan" title="Sayfanın en başına git" runat="server" Text="<<" OnClick="btnIlk_Click" />
            <asp:Button ID="btnOnceki" CssClass="btnileriAcilan" title="Geri git" runat="server" Text="<" OnClick="btnOnceki_Click" />
            <asp:Label ID="lblSayfaNo" runat="server" Text="" ForeColor="Black" BorderStyle="Solid" Width="26px" Height="26px"></asp:Label>
            <asp:Button ID="btnSonraki" CssClass="btnengeriAcilan" title="İleri git" runat="server" Text=">" OnClick="btnSonraki_Click" />
            <asp:Button ID="btnSon" CssClass="btngeriAcilan" title="Sayfanın en sonuna git" runat="server" Text=">>" OnClick="btnSon_Click" />
            <asp:Label ID="lblSayfaSayisi" runat="server" Text="" ForeColor="Black" BorderStyle="Solid" Width="26px" Height="26px"></asp:Label>
        </div>
        <%-- ileri geri ! --%>
    </div>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</asp:Content>
