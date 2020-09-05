<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sigup.aspx.cs" Inherits="SonsuzSozluk.App.Sigup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Üye Ol</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/theme-classic.css" rel="stylesheet" />
    <script src="js/jquery-1.12.3.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/core.js"></script>
    <script>
        $('#animations-list .feature').css('cursor', 'pointer').on('click', function () {
            var $target = $(this),
                animationClass = $(this).data("animation");

            $target.removeClass(animationClass);
            setTimeout(function () {
                $target.addClass(animationClass);
            }, 100);

            return false;
        });
    </script>
    <link rel="short icon" href="../Langing/img/favicon.ico" />
</head>
<body>
    <form runat="server">
        <section class="bg-black fullheight dark">
            <div class="bg-image">
                <img src="img/consumer_bg08.jpg" />
            </div>
            <div class="container v-center">
                <div class="row">
                    <div class="col-md-6 col-md-push-3">
                        <div style="text-align: center;">
                            <span style="color: #ff6a00">
                                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Landing/index.aspx">Ana Sayfa</asp:LinkButton></span>
                            <span class="glyphicon glyphicon-play"></span>
                            Üye Ol
                        </div>
                        <h3 class="text-center">Bir Hesap Oluştur...</h3>
                        <div class="form-group">
                            <label for="name">Ad &amp; Soyad:</label>
                            <asp:TextBox ID="txtname"  runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail:</label>
                            <asp:TextBox ID="txtEmail" type="email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="password">Parola:</label>
                            <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="password-repeat">Parola Tekrar:</label>
                            <asp:TextBox ID="txtpasswordrepeat" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnKayitOl" runat="server" Text="Kayıt Ol" CssClass="btn-submit btn-lg" OnClick="btnKayitOl_Click" />
                        </div>
                    </div>
                </div>
                <br />
                <center> 
                    <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label><br />
                    <asp:LinkButton ID="lnkGiris" runat="server" href="Login.aspx" CssClass="btn btn-link btn-sm" >Giriş Yap</asp:LinkButton>
                </center>
            </div>
        </section>
    </form>
</body>
</html>
