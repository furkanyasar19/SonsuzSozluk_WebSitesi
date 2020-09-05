using SonsuzSozluk.App;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonsuzSozluk.Admin
{
    public partial class YazarUyeDetay : System.Web.UI.Page
    {

        Yorumlar yorum = new Yorumlar();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            kullanicilar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            var bilgiler = kullanicilar.KullaniciInceleBilgiGetir().FirstOrDefault();
            lblKullaniciID.Text = bilgiler.ad.ToString() + " " + bilgiler.soyad.ToString();
            lblPuan.Text = bilgiler.puan.ToString();
            lblMail.Text = bilgiler.mail.ToString();
            DateTime dtkayitlar = Convert.ToDateTime(bilgiler.tarih);
            lblKayitTarihi.Text = dtkayitlar.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            lblAltinMadalyaSayisi.Text = bilgiler.altinMadalyaSayisi.ToString();
            lblGumusMadalyaSayisi.Text = bilgiler.gumusMadalyaSayisi.ToString();
            lblYorumSayisi.Text = kullanicilar.KullaniciYorumSayisiDonder().ToString();
            lblGundemSayisi.Text = kullanicilar.KullaniciGundemSayisiDonder().ToString();
            if (!IsPostBack)
            {
                editor1.InnerText = bilgiler.not; 
            }
        }
        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Yazarlar.aspx");
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            
            kullanicilar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            if (kullanicilar.NotVarmi())
            {
                kullanicilar.not = editor1.InnerText;
                bool guncellendimi = kullanicilar.KullaniciNotGuncelle();
                if (guncellendimi)
                {
                    lblSonuc.Text = "Notunuz Güncellenmiştir";
                }
                else
                {
                    lblSonuc.Text = "Notunuz Güncellenememiştir";
                }
            }
            else
            {
                kullanicilar.not = editor1.InnerText;
                bool eklendimi = kullanicilar.KullaniciNotEkle();
                if (eklendimi)
                {
                    lblSonuc.Text = "Not Eklenmiştir";
                }
                else
                {
                    lblSonuc.Text = "Not Eklenememiştir";
                }
            }
        }
    }
}