<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SonsuzSozluk.App.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş Yap</title>
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

    <link rel="short icon" href="Login.aspx" />
</head>
<body>
    <form runat="server">
        <section class="fullheight">
            <div class="bg-image">
                <img src="img/consumer_bg05.jpg" />
            </div>
            <div class="container v-center text-center">
                <div class="row">
                    <div class="col-md-6 col-md-push-3">
                        <div class="animated" data-animation="fadeInDown">
                            <h3>Giriş Yap!</h3>
                            <div class="form-group">
                                <asp:TextBox ID="txtMail" runat="server" CssClass="form-control input-2 input-lg" placeholder="E-Mail"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtParola" TextMode="Password" runat="server" CssClass="form-control input-2 input-lg" placeholder="Parola"></asp:TextBox>
                            </div>
                            <asp:Button ID="btnGiris" runat="server" CssClass="btn-submit btn-lg" Text="Giriş" OnClick="btnGiris_Click" />
                            <a href="#" class="btn btn-link btn-sm">Parolamı Unuttum</a>
                            <br />
                            <span style="color: #ff6a00">
                                <asp:LinkButton ID="anaSayfa" runat="server" PostBackUrl="~/Landing/index.aspx">Ana Sayfa</asp:LinkButton></span>
                            <span class="glyphicon glyphicon-play"></span>
                            <br />
                            <asp:Button ID="btnUyeOlmadanDevam" PostBackUrl="~/App/Default.aspx" runat="server" Text="Üye Olmadan Devam Et" CssClass="btn btn-link btn-sm"/><br />
                            <asp:Label ID="lblSonuc" runat="server" CssClass="label label-danger" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
