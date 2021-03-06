﻿using System;
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
    public partial class YorumDuzenle : System.Web.UI.Page
    {
        Yorumlar yorumlar = new Yorumlar();
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullaniciler = new Kullanicilar();
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
            yorumlar.yorumid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["yorumid"])));
            gundemler.gundemid = yorumlar.YorumGundemId();
            if (!IsPostBack)
            {
                lblGundemBaslik.Text = gundemler.GundemBaslik();
                txtYorum.InnerText = yorumlar.YorumGetir();
            }
        }
        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            txtYorum.InnerText = "";
            lblSonuc.Text = "";
        }

        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("KullaniciProfil.aspx");
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            yorumlar.yorumid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["yorumid"])));
            yorumlar.yorum = txtYorum.InnerText;
            if (txtYorum.InnerText == "")
            {
                lblSonuc.Text = "İçerik doldurulmalıdır";
            }
            else
            {
                bool eklendimi = yorumlar.YorumGuncelle();
                if (eklendimi)
                {
                    lblSonuc.Text = "Yorum guncellendi, geri dön butonu ile eklenen gündem maddesini görebilirsiniz.";
                }
                else
                {
                    lblSonuc.Text = "Yorum guncellenirken bir sorun meydana geldi.";
                }
            }
        }
    }
}