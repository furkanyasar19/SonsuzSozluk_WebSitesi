<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/App/Site1.Master" AutoEventWireup="true" CodeBehind="DefaultFiltrele.aspx.cs" Inherits="SonsuzSozluk.App.DefaultFiltrele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gündemler</title>
    <link href="css/AppGundem.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <%--Mesaj kutusu scripti--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="css/GundemFiltrele.css" rel="stylesheet" />
    <link href="css/app.css" rel="stylesheet" />
    <link rel="short icon" href="../Langing/img/favicon.ico" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <hr style="background-color: #e60000 !important; height: 1px !important;" />

    <div class="col-xs-12 col-sm-8 col-md-12 col-lg-12 divkapsa">
        <h4 class="gundemBaslikFiltrele">Gündem Maddesi
            <span style="color: #808080; font-size: 15px !important; padding: 4px 6px 0px 6px;" class="glyphicon glyphicon-eye-open"></span>
            <asp:Label ID="lblGoruntulenmeSayisi" CssClass="badge" ToolTip="Görüntülenme Sayısı" runat="server" Text=""></asp:Label>
            <asp:LinkButton ID="lnkYorumEkleFiltrele" CssClass="LinkbuttonyorumayarFiltrele" runat="server" OnClick="lnkYorumEkleFiltrele_Click">Yorum Ekle</asp:LinkButton>
        </h4>
        <div class="dısdiv ayar">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="lblGundemBaslik" runat="server" Text="" CssClass="gundemBaslik"></asp:Label>
                </div>
            </div>
            <div class="row" style="margin-right: 44px; margin-left: 3px;">
                <div class="col-xs-12">
                    <asp:Label ID="lblIcerik" runat="server" CssClass="gundemIcerik" Text=""></asp:Label>
                    <asp:ImageButton runat="server" ID="imgbtnLikeFiltrele" OnClick="imgbtnLikeFiltrele_Click" ImageUrl="~/App/img/like.png" ToolTip='<%#Eval("Kisiid") %>' />
                    <asp:ImageButton CssClass="dislikeButton" ImageAlign="TextTop" ID="imgbtnDisLikeFiltrele" OnClick="imgbtnDisLikeFiltrele_Click" runat="server" ImageUrl="~/App/img/dislike.png" ToolTip='<%#Eval("Kisiid") %>' />
                    <div class="dropdown" style="display: inline-block;">
                        <button class="buton dropdown-toggle" type="button" data-toggle="dropdown">
                            <img src="img/share.png" />&nbsp;<span class="butonSpan">Paylaş</span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="https://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.yourpage.com"><i class="fa fa-facebook"></i>&nbsp;Facebook</a></li>
                            <li><a href="https://plus.google.com/share?url=http://www.yourpage.com"><i class="fa fa-google"></i>&nbsp;Google</a></li>
                            <li><a href="https://twitter.com/share?url=www.yourpage.com"><i class="fa fa-twitter"></i>&nbsp;Twitter</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12" style="text-align: right; margin-bottom: 40px !important;">
                    <asp:Label ID="DefalutFiltrelelblMadalyaSayisi" CssClass="Madalya" ToolTip="Madalya Sayısı" runat="server" Text=""></asp:Label>
                    <asp:Image ID="DefalutFiltreleimgmadalya" runat="server" ToolTip="" />
                    <span class="badge" style="font-size: smaller !important; background-color: #c1b2b2 !important">
                        <asp:Label ID="lblPuan" runat="server" ToolTip="Puan" Text=""></asp:Label></span>
                    <asp:Label ID="lblAd" runat="server" CssClass="gundemTarih" Text=""></asp:Label>
                    <asp:Label ID="lblTarih" runat="server" CssClass="gundemTarih" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <h4 class="gundemBaslikFiltrele">Gündeme Ait Yorumlar &nbsp;<asp:Label ID="lblYorumSayisi" CssClass="badge" ToolTip="Yorum Sayısı" runat="server" Text="Label"></asp:Label></h4>
        <asp:DataList ID="datalistYorumlar" runat="server" Width="100%">
            <ItemTemplate>
                <div class="dısdiv">
                    <div class="row" style="margin-right: 44px; margin-left: 3px">
                        <asp:Label ID="lblYorumIcerik" runat="server" CssClass="gundemIcerik" Text='<%#Eval("Yorum") %>'></asp:Label>
                        <div class="col-xs-6">
                            <asp:ImageButton runat="server" ID="imgbtnYorumlike" OnClick="imgbtnYorumlike_Click" ImageUrl="~/App/img/like.png" ToolTip='<%#Eval("Kisiid")+" "+Eval("Yorumid")%>' />
                            <asp:ImageButton CssClass="dislikeButton" ImageAlign="TextTop" runat="server" ID="imgbtnYorumDislike" OnClick="imgbtnYorumDislike_Click" ImageUrl="~/App/img/dislike.png" ToolTip='<%#Eval("Kisiid")+" "+Eval("Yorumid")%>' />
                            <div class="dropdown" style="display: inline-block;">
                                <button class="buton dropdown-toggle" type="button" data-toggle="dropdown">
                                    <img src="img/share.png" />&nbsp;<span class="butonSpan">Paylaş</span> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="https://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.yourpage.com"><i class="fa fa-facebook"></i>&nbsp;Facebook</a></li>
                                    <li><a href="https://plus.google.com/share?url=http://www.yourpage.com"><i class="fa fa-google"></i>&nbsp;Google</a></li>
                                    <li><a href="https://twitter.com/share?url=www.yourpage.com"><i class="fa fa-twitter"></i>&nbsp;Twitter</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xs-12" style="text-align: right; margin-bottom: 40px !important;">
                            <asp:Label ID="DefalutFiltrelelblMadalyaSayisi" CssClass="Madalya" ToolTip="Madalya Sayısı" runat="server" Text='<%#(Int32)Eval("Puan")>249? Eval("AltinMadalyasayisi"):Eval("GumusMadalyaSayisi") %>'></asp:Label>
                            <asp:Image ID="DefalutFiltreleimgAltinmadalya" runat="server" ToolTip='<%#(Int32)Eval("Puan")>249?"Altın Madalya":"Gümüş Madalya" %>' ImageUrl='<%#(Int32)Eval("Puan")>249?"img/AltınMadalya.png":"img/GumusMadalya.png" %>' />
                            <span class="badge" style="font-size: smaller !important; background-color: #c1b2b2 !important">
                                <asp:Label ID="lblYorumPuan" runat="server" ToolTip="Puan" Text='<%#Eval("Puan") %>'></asp:Label></span>
                            <asp:Label ID="lblYorumadsoyad" runat="server" CssClass="gundemTarih" Text='<%#Eval("Ad") + " " + Eval("Soyad") + " "+Eval("Tarih","{0:d}")%>'></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
