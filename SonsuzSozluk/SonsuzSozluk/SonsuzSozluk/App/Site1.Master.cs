using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.ComponentModel;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace SonsuzSozluk.App
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        enum Rolu
        {
            Uye = 1,
            Yazar = 2,
            Admin = 3
        }
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        
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
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtGundemler = new DataTable();
            if (Request.Cookies["cerezDosyam"] != null)
            {
                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                kullanicilar.mail = cerezOku["mail"].ToString();
                gundemler.mail = cerezOku["mail"].ToString();
                int k_paun = kullanicilar.KullaniciPuanDonder();
                if (k_paun > 249)
                {
                    imgYetkiDurum.ImageUrl = "img/YazarIcon.png";
                }
                else
                {
                    imgYetkiDurum.ImageUrl = "img/UyeIcon.png";
                }
                imgYetkiDurum.ToolTip = "Yetki Durumunuz";
                lnkkullaniciadi.Text = "Hoşgeldiniz " + kullanicilar.KullaniciAdGonder();
                lnkkullaniciadi.PostBackUrl = "KullaniciProfil.aspx";
                lnkGiris.Visible = false;
                lnkKaydol.Visible = false;
                int rolid = kullanicilar.RolidDonder();
                if (rolid == (int)Rolu.Yazar)
                {
                    lnkGundemEkle.Visible = true;
                }
                else if (rolid == (int)Rolu.Admin)
                {
                    HttpCookie cerezim = new HttpCookie("cerezdosyam");
                    cerezim.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cerezim);
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lnkGundemEkle.Visible = false;
                }
            }
            else
            {
                imgYetkiDurum.Visible = false;
                lnkCikis.Visible = false;
                lnkGundemEkle.Visible = false;
            }
        }
        protected void lnkCikis_Click(object sender, EventArgs e)
        {
            HttpCookie cerezim = new HttpCookie("cerezdosyam");
            cerezim.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cerezim);
            Response.Redirect("../Landing/index.aspx");
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx?aranan=" + txtArama.Text.Trim());
        }
    }
    
}