<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Uyeler.aspx.cs" Inherits="SonsuzSozluk.Admin.Uyeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/uyelerStyle.css" rel="stylesheet" />
    <link rel="short icon" href="../Landing/img/favicon.ico" />
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid container-fluidSettings ">
        <div class="row uyeTableSettings">
            <div class="uyeHeading text-center">Üyeler</div>
            <div class="uyeSubtitle text-center">
                <div class="uyeSubtitleContent" style="float: left;">Ad Soyad</div>
                <div class="uyeSubtitleContent" style="float: left;">E-Mail</div>
                <div class="uyeSubtitleContent" style="float: left;">Tarih</div>
                <div class="uyeSubtitleContent" style="float: left;">Sil | İncele</div>
            </div>
            <asp:DataList ID="dtUyeler" runat="server" Width="100%">
                <ItemTemplate>
                    <ul class="list-group boslukSil" id="myList">
                        <li class="list-group-item boslukSil">
                            <div class="uyeContent text-center">
                                <div class="uyeSub-Content" style="float: left;">
                                    <asp:Label ID="uyeAdSoyad" runat="server" Text='<%# Eval("Ad") + " " + Eval("Soyad") %>'></asp:Label>
                                </div>
                                <div class="uyeSub-Content" style="float: left;">
                                    <asp:Label ID="uyeMail" runat="server" Text='<%# Eval("Mail") %>'></asp:Label>
                                </div>
                                <div class="uyeSub-Content" style="float: left;">
                                    <asp:Label ID="uyeOlunmaTarihi" runat="server" Text='<%# Eval("Tarih" , "{0:d}") %>'></asp:Label>
                                </div>
                                <div class="uyeSub-Content" style="float: left;">
                                     <asp:LinkButton ID="DeletleButton" PostBackUrl='<%#string.Format("Uyeler.aspx?Kisiid={0}",Eval("Kisiid")) %>' OnClick="DeletleButton_Click" runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                    <%--<button type="button" id="DeletleButton" class="btn LinkButtonSettings"><span class="glyphicon glyphicon-trash"></span></button>--%>
                                    <asp:LinkButton ID="SearchButton" runat="server" PostBackUrl='<%#string.Format("~/Admin/YazarUyeDetay.aspx?Kisiid={0}",Eval("Kisiid")) %>' CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                                </div>
                            </div>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
