<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Yorum.aspx.cs" Inherits="SonsuzSozluk.Admin.Yorum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/yorumlar.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid container-fluidSettings ">
        <div class="row yorumlarTableSettings">
            <div class="yorumlarHeading text-center">Yorumlar</div>
            <div class="yorumlarSubtitle text-center">
                <div class="yorumlarSubtitleContent" style="float: left;">Ad Soyad</div>
                <div class="yorumlarSubtitleContent" style="float: left;">Yorum</div>
                <div class="yorumlarSubtitleContent" style="float: left;">Tarih</div>
                <div class="yorumlarSubtitleContent" style="float: left;">Sil</div>
            </div>
            <asp:DataList ID="dtAdminYorumGetir" runat="server" Width="100%">
                <ItemTemplate>
                    <ul class="list-group boslukSil" id="myList">
                        <li class="list-group-item boslukSil">
                            <div class="yorumlarContent text-center">
                                <div class="yorumlarSub-Content" style="float: left;">
                                    <asp:Label ID="yorumlarAdSoyad" runat="server" Text='<%# Eval ("Ad")+ " " + Eval ("Soyad")  %>'></asp:Label>
                                </div>
                                <div class="yorumlarSub-Content" style="float: left;">
                                    <asp:Label ID="yorumIcerik" runat="server" ToolTip='<%# Eval ("yorum")%>' Text='<%# Eval ("yorum").ToString().Length<30?Eval("yorum"):Eval("yorum").ToString().Substring(0,30)+" ..."  %>'></asp:Label>
                                </div>
                                <div class="yorumlarSub-Content" style="float: left;">
                                    <asp:Label ID="yorumTarihi" runat="server" Text='<%# Eval ("Tarih","{0:d}")  %>'></asp:Label>
                                </div>
                                <div class="yorumlarSub-Content" style="float: left;">
                                    <asp:LinkButton ID="DeletleButton" PostBackUrl='<%#string.Format("Yorum.aspx?yorumid={0}",Eval("Yorumid")) %>' OnClick="DeletleButton_Click" runat="server" CssClass="btn LinkButtonSettings"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton> 
                                </div>
                            </div>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
