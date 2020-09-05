using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace SonsuzSozluk.App
{
    public partial class GundemeYorumEkle : System.Web.UI.Page
    {
        Gundemler gundemler = new Gundemler();
        Yorumlar yorumlar = new Yorumlar();
        Kullanicilar kullanicilar = new Kullanicilar();
        public class Sifreleme
        {
            public static string Decrypt(string cipherText)
            {
                string EncryptionKey = "MAKV2SPBNI99212";
                cipherText = cipherText.Replace(" ", "+");
                byte[] cipherBytes = Convert.FromBase64String(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(cipherBytes, 0, cipherBytes.Length);
                            cs.Close();
                        }
                        cipherText = Encoding.Unicode.GetString(ms.ToArray());
                    }
                }
                return cipherText;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            gundemler.gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
            lblGundemBaslik.Text=gundemler.GundemBaslik();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void btnGeriDon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            yorumlar.gundemid = gundemler.gundemid;
            HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
            kullanicilar.mail = cerezOku["mail"];
            yorumlar.kisiid = kullanicilar.KullaniciidDonder();
            yorumlar.yorum = txtYorum.InnerText;
            if (txtYorum.InnerText=="")
            {
                lblSonuc.Text = "Tüm alanlar doldurulmalıdır";
            }
            else
            {
                bool eklendimi = yorumlar.YorumEkle();
                if (eklendimi)
                {
                    lblSonuc.Text = "Yorum Eklenmiştir, geri dön butonu ile eklenen yorumu görebilirsiniz.";
                }
                else
                {
                    lblSonuc.Text = "Yorum Eklenememiştir";
                }
            }
        }

        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            txtYorum.InnerText = "";
            lblSonuc.Text = "";
        }
    }
}