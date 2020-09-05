<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GundemDuzenle.aspx.cs" ValidateRequest="false" Inherits="SonsuzSozluk.App.GundemDuzenle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gündem Düzenle</title>
    <link href="css/GundemDuzenle.css" rel="stylesheet" />
     <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="short icon" href="../Langing/img/favicon.ico" />
</head>
<body>
      <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <form id="form1" runat="server">
    <div>
    <div class="container">
            <div class="row">
                <div class="beyazyer">
                    <div class="col-sm-12">
                        <label style="padding-top: 20px;">Gündem Başlığı: </label>
                        <br />
                         <asp:Label ID="lblGundemBaslik" runat="server" CssClass="gundembaslik" Text=""></asp:Label>
                        <hr />                       
                    </div>
                     <div class="col-sm-12">
                             <label  style="padding-top: 5px;">Gündem Kategori: </label>
                        <br />
                            <asp:DropDownList ID="DrpDownGundemKategori" CssClass="form-control" runat="server" Enabled="False"></asp:DropDownList>
                         <hr />
                        </div>  
                    <div class="col-sm-12">
                        <label>Gündem İçeriği: </label>
                        <textarea name="txtYorum" id="txtYorum" runat="server"></textarea>
                        <script>
                            CKEDITOR.replace('txtYorum');
                        </script>
                        <hr />
                    </div>
                    <div class="col-sm-12">
                        <button id="btnGeriDon" runat="server" onserverclick="btnGeriDon_ServerClick" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label>
                        <div class="pull-right">
                            <asp:Button ID="btnTemizle" CssClass="btn btn-default" runat="server" Text="Temizle" OnClick="btnTemizle_Click" />
                            <asp:Button ID="btnGuncelle" runat="server" Text="Guncelle" CssClass="btn btn-default" OnClick="btnGuncelle_Click" />
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
