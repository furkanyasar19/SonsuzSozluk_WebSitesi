using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace SonsuzSozluk.App
{
    public partial class KulluaniciProfil : System.Web.UI.Page
    {
        Kullanicilar kullanicilar = new Kullanicilar();
        Veriler veriler = new Veriler();
        Gundemler gundemler = new Gundemler();
        Yorumlar yorumlar = new Yorumlar();
        Regex reg = new Regex(@"^[a-zA-ZıİçÇşŞöÖüÜğĞ]*$");
        int kisiid;
        public class Sifreleme
        {
            public static string Encrypt(string clearText)
            {
                string EncryptionKey = "MAKV2SPBNI99212";
                byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(clearBytes, 0, clearBytes.Length);
                            cs.Close();
                        }
                        clearText = Convert.ToBase64String(ms.ToArray());
                    }
                }
                return clearText;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["cerezDosyam"] != null)
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"].ToString();
                    kisiid = kullanicilar.KullaniciidDonder();
                    kullanicilar.kisiid = kisiid;
                    var kullanicibilgi = kullanicilar.KullaniciBilgiGetir().FirstOrDefault();
                    txtKullaniciAd.Text = kullanicibilgi.ad.ToString();
                    txtKullaniciSoyad.Text = kullanicibilgi.soyad.ToString();
                    txtKullaniciMail.Text = kullanicibilgi.mail.ToString();
                    DateTime dtUyelikTarih = Convert.ToDateTime(kullanicibilgi.tarih);
                    txtUyelikTarihi.Text = dtUyelikTarih.ToString("dd/M/yyyy", CultureInfo.InvariantCulture);
                    txtPuan.Text = kullanicibilgi.puan.ToString();
                    int altinmadalyasayisi = Convert.ToInt32(kullanicibilgi.altinMadalyaSayisi);
                    int gumusmadalyasayisi = Convert.ToInt32(kullanicibilgi.gumusMadalyaSayisi);
                    txtMadalyaSayisi.Text = (altinmadalyasayisi + gumusmadalyasayisi).ToString();
                    gundemler.kisiid = kisiid;
                    dtGundemBaslikTarihGetir.DataSource = gundemler.KullaniciProfilGundemGetir();
                    dtGundemBaslikTarihGetir.DataBind();
                    yorumlar.kisiid = kisiid;
                    dtAtilanYorumlar.DataSource = yorumlar.AcilanGundemeYapilanYorumlar();
                    dtAtilanYorumlar.DataBind();
                }
            }
        }
        protected void btnguncellesifre_Click(object sender, EventArgs e)
        {
            string eskiparola = txtEskiSifre.Text;
            if (Request.Cookies["cerezDosyam"] != null)
            {

                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                kullanicilar.mail = cerezOku["mail"].ToString();
                int kisiid = kullanicilar.KullaniciidDonder();
                kullanicilar.kisiid = kisiid;
            }
            string geleneskiparola = kullanicilar.EskiSifre();
            if (eskiparola != geleneskiparola)
            {
                lblSonuc.Text = "Eski şifreniz hatalıdır";
            }
            else
            {
                if (txtYeniSifre.Text == txtYeniSifreTekrar.Text)
                {
                    kullanicilar.yeniSifre = txtYeniSifreTekrar.Text;
                    if (txtYeniSifre.Text.Length < 3 || txtYeniSifreTekrar.Text.Length < 3)
                    {
                        lblSonuc.Text = "Şifreniz en az 3 karakter olmalıdır";
                    }
                    else
                    {

                        bool guncellendimi = kullanicilar.SifreGuncellestir();
                        if (guncellendimi)
                        {
                            lblSonuc.Text = "Şifreniz güncellenmiştir";
                        }
                        else
                        {
                            lblSonuc.Text = "Şifreniz güncellenemedi";
                        }
                    }
                }
                else
                {
                    lblSonuc.Text = "Şifreler uyuşmuyor.";
                }
            }
        }
        protected void btnguncellekulanıcıbilgi_Click(object sender, EventArgs e)
        {
            HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
            kullanicilar.mail = cerezOku["mail"].ToString();
            kullanicilar.ad = txtKullaniciAd.Text;
            kullanicilar.soyad = txtKullaniciSoyad.Text;
            if (reg.IsMatch(kullanicilar.ad) && reg.IsMatch(kullanicilar.soyad))
            {
                bool bilgilerGuncellendimi = kullanicilar.KullaniciBilgileriGuncelle();
                if (bilgilerGuncellendimi)
                {
                    lblKullaniciBilgi.Text = "Güncelleme başarılı";
                }
                else
                {
                    lblKullaniciBilgi.Text = "Güncelleme başarısız";
                }
            }
            else
            {
                lblKullaniciBilgi.Text = "Rakam Girilmez";
            }

        }
    }
}
