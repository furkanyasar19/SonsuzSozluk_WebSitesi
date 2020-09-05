<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Yazarlar.aspx.cs" Inherits="SonsuzSozluk.Admin.Yazarlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/yazarlarStyle.css" rel="stylesheet" />
    <link rel="short icon" href="../Langing/img/favicon.ico" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center !important;">
        <asp:Label ID="lblSonuc" CssClass="label label-danger" runat="server" Text=""></asp:Label>
    </div>
    <div class="container-fluid container-fluidSettings ">
        <div class="row yazarTableSettings">
            <div class="yazarlarHeading text-center">Yazarlar</div>
            <div class="yazarlarSubtitle text-center">
                <div class="yazarlarSubtitleContent" style="float: left;">Ad Soyad</div>
                <div class="yazarlarSubtitleContent" style="float: left;">E-Mail</div>
                <div class="yazarlarSubtitleContent" style="float: left;">Tarih</div>
                <div class="yazarlarSubtitleContent" style="float: left;">Sil | İncele</div>
            </div>
            <asp:DataList ID="dtListYazarlar" runat="server" Width="100%">
                <ItemTemplate>
                    <ul class="list-group boslukSil" id="myList">
                        <li class="list-group-item boslukSil">
                            <div class="yazarlarContent text-center">
                                <div class="yazarlarSub-Content" style="float: left;">
                                    <asp:Label ID="yazarAdSoyad" runat="server" Text='<%# Eval ("Ad")+ " " + Eval ("Soyad")  %>'></asp:Label>
                                </div>
                                <div class="yazarlarSub-Content" style="float: left;">
                                    <asp:Label ID="yazarMail" runat="server" Text='<%# Eval ("Mail")  %>'></asp:Label>
                                </div>
                                <div class="yazarlarSub-Content" style="float: left;">
                                    <asp:Label ID="yazarOlmaTarihi" runat="server" Text='<%# Eval ("Tarih","{0:d}")  %>'></asp:Label>
                                </div>
                                <div class="yazarlarSub-Content" style="float: left;">
                                    <asp:LinkButton ID="DeletleButton" PostBackUrl='<%#string.Format("Yazarlar.aspx?Kisiid={0}",Eval("Kisiid")) %>' OnClick="DeletleButton_Click" runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                    <asp:LinkButton ID="SearchButton" PostBackUrl='<%#string.Format("~/Admin/YazarUyeDetay.aspx?Kisiid={0}",Eval("Kisiid")) %>' runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                                </div>
                            </div>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
