<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GundemIncele.aspx.cs" Inherits="SonsuzSozluk.Admin.GundemIncele" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SONSUZ SOZLUK</title>
    <link href="css/GundemYorum.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="short icon" href="../Langing/img/favicon.ico" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">


                <%--Gümdem Başlık  --%>
                <%--<div class="container-fluid text-center GundemBaslik">
                    <div class="row">
                        <button id="btnGeriDons" runat="server" onserverclick="btnGeriDon_ServerClick" class="btn btn-default" style="float: left; margin-top: 0px !important; margin-left: 20px;" data-toggle="tooltip" data-placement="top" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        <asp:Label ID="lblGundemBaslik" CssClass="ayar2" runat="server" Text=""></asp:Label>
                    </div>
                </div>--%>
                <%--End Gündem Başlık--%>


                <%--Gümdem Başlık  --%>
                <div class="container-fluid">
                    <div class="row">
                        <button id="btnGeriDon" runat="server" onserverclick="btnGeriDon_ServerClick" class="btn btn-default" style="float: left; margin-top: 0px !important; margin-left: 20px;" data-toggle="tooltip" data-placement="top" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        <asp:Label ID="lblGundemBaslik" CssClass="GundemBaslik ayar2" runat="server" Text="Kış ne zaman gelecek?"></asp:Label>
                    </div>
                </div>
                <%--End Gündem Başlık--%>

                <%--GÜNDEM İÇERİK--%>
                <div class="container-fluid text-center">
                    <div class="row">
                        <asp:Label ID="lblGundemIcerik" CssClass="IcerikAyar" runat="server" Text=""></asp:Label>
                        <hr class="hrAyar"/>
                    </div>
                </div>
                <%--End GÜNDEM İÇERİK--%>

                <%-- GÜNDEM YORUM  --%>
                <asp:DataList ID="dtlYorumlar" runat="server" Width="100%">
                    <ItemTemplate>
                        <div class="yorum">
                            <asp:Label ID="lblYorum" CssClass="labelAyar" runat="server" Text='<%# Eval("yorum") %>'></asp:Label>
                        </div>
                        <div class="silme">
                            <asp:LinkButton ID="lnkSil" CssClass="SilmeButonu" runat="server"><span class="glyphicon glyphicon-trash" title="Bu Yorumu Sil"></span></asp:LinkButton>
                        </div>
                        <hr class="hrAyar"/>
                    </ItemTemplate>
                </asp:DataList>
                <%-- END GÜNDEM YORUM  --%>
            </div>
        </div>
    </form>
</body>
</html>
