<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Gundem.aspx.cs" Inherits="SonsuzSozluk.Admin.Gundem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/gundemStyle.css" rel="stylesheet" />
    <link rel="short icon" href="../Langing/img/favicon.ico" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid container-fluidSettings ">
        <div class="row gundemTableSettings">
            <div class="gundemHeading text-center">Gündemler</div>
            <div class="gundemSubtitle text-center">
                <div class="gundemSubtitleContent" style="float: left;">ID</div>
                <div class="gundemSubtitleContent" style="float: left;">Gündem</div>
                <div class="gundemSubtitleContent" style="float: left;">Oluşturan</div>
                <div class="gundemSubtitleContent" style="float: left;">Tarih</div>
                <div class="gundemSubtitleContent" style="float: left;">Onayla | Sil | İncele</div>
            </div>
            <asp:DataList ID="DataListAdminGundem" runat="server" Width="100%">
                <ItemTemplate>
                    <ul class="list-group boslukSil" id="myList">
                        <li class="list-group-item boslukSil">
                            <div class="gundemContent text-center">
                                <div class="gundemSub-Content" style="float: left;">
                                    <asp:Label ID="lblGundemId" runat="server" ToolTip='<%#Eval("Gundemid")%>' Text='<%#Eval("Gundemid")%>'></asp:Label>
                                </div>
                                <div class="gundemSub-Content" style="float: left;">
                                    <asp:Label ID="gundemBaslik" runat="server" Text='<%#Eval("gundemBaslik").ToString().Length<30?Eval("gundemBaslik"):Eval("gundemBaslik").ToString().Substring(0,30)+" ..." %>'></asp:Label>
                                </div>
                                <div class="gundemSub-Content" style="float: left;">
                                    <asp:Label ID="olusturanKisi" runat="server" Text='<%# Eval("Ad")+" "+Eval("Soyad") %>'></asp:Label>
                                </div>
                                <div class="gundemSub-Content" style="float: left;">
                                    <asp:Label ID="olusturmaTarihi" runat="server" Text='<%#Eval("Tarih","{0:d}") %>'></asp:Label>
                                </div>
                                <div class="gundemSub-Content" style="float: left;">
                                    <asp:LinkButton ID="ConfirmationButton" PostBackUrl='<%# string.Format("Gundem.aspx?gundemid={0}", Eval("Gundemid")) %>' OnClick="ConfirmationButton_Click" runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-ok"></span></asp:LinkButton>
                                    <asp:LinkButton ID="DeletleButton" PostBackUrl='<%# string.Format("Gundem.aspx?kisiid={0}&gundemid={1}",Eval("Kisiid"), Eval("Gundemid")) %>' OnClick="DeletleButton_Click" runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>   
                                    <asp:LinkButton ID="SearchButton" PostBackUrl='<%# string.Format("GundemIncele.aspx?gundemid={0}", Eval("Gundemid")) %>' runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                                </div>
                            </div>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
