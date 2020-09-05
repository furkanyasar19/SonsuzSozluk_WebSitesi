<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YazarUyeDetay.aspx.cs" ValidateRequest="false" Inherits="SonsuzSozluk.Admin.YazarUyeDetay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yazar Üye Detay</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/YazarUyeDetay.css" rel="stylesheet" />
    <link rel="short icon" href="../Langing/img/favicon.ico" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid text-center kullaniciID">
            <div class="row">
                <button id="btnGeriDon" runat="server" onserverclick="btnGeriDon_ServerClick" class="btn btn-default" style="float:left;margin-top:0px !important;margin-left:20px;" data-toggle="tooltip" data-placement="top" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                <asp:Label ID="lblKullaniciID" CssClass="text-center lblKullaniciID" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="container-fluid text-center kullaniciBilgiPanel">
            <div class="row" style="margin: auto; width: 100%;">
                <div class="container">
                    <div class="col-xs-12 col-lg-4" style="padding: 15px;">
                        <div class="countIn" style="background-color: #b92630; text-shadow: 1px 1px 1px #f5f5f5;">
                            <p>Puan</p>
                            <p>
                                <asp:Label ID="lblPuan" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-4" style="padding: 15px;">
                        <div class="countIn" style="background-color: #c5501a; text-shadow: 1px 1px 1px #f5f5f5;">
                            <p>Yorum Sayısı</p>
                            <p>
                                <asp:Label ID="lblYorumSayisi" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-4" style="padding: 15px;">
                        <div class="countIn" style="background-color: #d3811e; text-shadow: 1px 1px 1px #f5f5f5;">
                            <p>Gundem Sayısı</p>
                            <p>
                                <asp:Label ID="lblGundemSayisi" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid kullaniciAyrintiBilgi">
            <div class="row">
                <div class="container">
                    <div class="col-xs-12 col-sm-7 detayliBilgi">
                        <h2 class="text-center" style="margin-bottom: 25px;">Kullanıcı Hakkında Detaylı Bilgi</h2>
                        <div>
                            <div class="ustBilgiler">
                                <p>Kayıt Tarihi</p>
                                <asp:Label ID="lblKayitTarihi" runat="server" Text="" CssClass="lblBilgiler"></asp:Label>
                            </div>

                            <div class="ustBilgiler">
                                <p>Email</p>
                                <asp:Label ID="lblMail" runat="server" Text="" CssClass="lblBilgiler"></asp:Label>
                            </div>
                            <div class="ustBilgiler">
                                <p>Altın Madalya Sayısı</p>
                                <asp:Label ID="lblAltinMadalyaSayisi" runat="server" Text="" CssClass="lblBilgiler"></asp:Label>
                            </div>
                            <div class="ustBilgiler">
                                <p>Gümüş Madalya Sayısı</p>
                                <asp:Label ID="lblGumusMadalyaSayisi" runat="server" Text="" CssClass="lblBilgiler"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-5">
                        <textarea name="editor1" id="editor1" runat="server" style="width: 100% !important; height: 700px !important"></textarea>
                        <script>
                            CKEDITOR.replace('editor1',
                                {
                                    height: 238
                                }
                            );
                        </script>
                        <asp:Button ID="btnGonder" runat="server" Text="Not Ekle" OnClick="btnGonder_Click" CssClass="btn btn-default btn-lg" />
                        <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
