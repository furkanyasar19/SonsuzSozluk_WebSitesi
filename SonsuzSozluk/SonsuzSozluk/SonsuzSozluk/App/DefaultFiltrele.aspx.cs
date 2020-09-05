using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace SonsuzSozluk.App
{
    public partial class DefaultFiltrele : System.Web.UI.Page
    {
        Gundemler gundemler = new Gundemler();
        Yorumlar yorumlar = new Yorumlar();
        Kullanicilar kullanicilar = new Kullanicilar();
        DataTable dtBilgi = new DataTable();
        DataTable dtGundemYorumBilgi;
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
        private void Mesajver(string mesaj)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Baslik", "<script>" + mesaj + "</script>");
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
        }
        private void YorumlariGetir()
        {
            datalistYorumlar.DataSource = yorumlar.GundemYorumBilgiGetir();
            datalistYorumlar.DataBind();
        }
        private void GundemFiltreleDoldur()
        {
            var bilgiler = gundemler.GundemFiltreleGetir().FirstOrDefault();
            kullanicilar.gundemiyazankisiid = Convert.ToInt32(bilgiler.kisiid);
            DateTime dtGundemTarihi = Convert.ToDateTime(bilgiler.tarih);
            lblGundemBaslik.Text = bilgiler.gundemBaslik.ToString();
            lblAd.Text = bilgiler.ad.ToString() + " " + bilgiler.soyad.ToString() + " " + dtGundemTarihi.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            lblIcerik.Text = bilgiler.gundemIcerik.ToString();
            lblPuan.Text = bilgiler.puan.ToString();
            if (Convert.ToInt32(lblPuan.Text) > 249)
            {
                DefalutFiltrelelblMadalyaSayisi.Text = bilgiler.altinMadalyaSayisi.ToString();
                DefalutFiltreleimgmadalya.ImageUrl = "img/AltınMadalya.png";
                DefalutFiltreleimgmadalya.ToolTip = "Altın Madalya";
            }
            else
            {
                DefalutFiltrelelblMadalyaSayisi.Text = bilgiler.gumusMadalyaSayisi.ToString();
                DefalutFiltreleimgmadalya.ImageUrl = "img/GumusMadalya.png";
                DefalutFiltreleimgmadalya.ToolTip = "Gümüş Madalya";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            lnkYorumEkleFiltrele.Visible = true;
            if (Request.Cookies["cerezDosyam"] == null)
            {
                lnkYorumEkleFiltrele.Visible = false;
            }
            int gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
            gundemler.gundemid = gundemid;
            yorumlar.gundemid = gundemid;
            if (!IsPostBack)
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                if (gundemler.GoruntulenmeyiArttir())
                {
                    lblGoruntulenmeSayisi.Text = gundemler.GundemGoruntulenmeSayisi().ToString();
                }
            }
            GundemFiltreleDoldur();
            datalistYorumlar.DataSource = yorumlar.GundemYorumBilgiGetir();
            datalistYorumlar.DataBind();
            lblYorumSayisi.Text = yorumlar.YorumSayisiGetir().ToString();
        }

        protected void imgbtnLikeFiltrele_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                if (Request.Cookies["cerezDosyam"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"];
                    int girisyapankisiid = kullanicilar.KullaniciidDonder();
                    kullanicilar.girisyapankisiid = girisyapankisiid;
                    kullanicilar.gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
                    if (kullanicilar.girisyapankisiid == kullanicilar.gundemiyazankisiid)
                    {
                        Mesajver("swal('Hata','Kendi gündeminizi beğenemezsiniz.','error')");
                    }
                    else
                    {
                        bool oncedenbaktimi = kullanicilar.OncedenLikeladimi();
                        if (oncedenbaktimi == true)
                        {
                            Mesajver("swal('Hata','Aynı gündemi birden fazla beğenemezsiniz.','error')");
                        }
                        else
                        {
                            bool arttimi = kullanicilar.PuanArttir();
                            if (arttimi)
                            {
                                Mesajver("swal('Başarılı','Puan arttırılmıştır.','success')");
                                kullanicilar.KullaniciyiLikelaraEkle();
                                GundemFiltreleDoldur();
                            }
                            else
                            {
                                Mesajver("swal('Hata','Malesef puan arttırılamadı.','error')");
                            }
                        }
                    }
                }
            }
        }
        protected void imgbtnDisLikeFiltrele_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                if (Request.Cookies["cerezDosyam"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"];
                    int girisyapankisiid = kullanicilar.KullaniciidDonder();
                    kullanicilar.girisyapankisiid = girisyapankisiid;
                    kullanicilar.gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
                    if (kullanicilar.girisyapankisiid == kullanicilar.gundemiyazankisiid)
                    {
                        Mesajver("swal('Hata','Kendi gündeminizi beğenmemezlik edemezsiniz.','error')");
                    }
                    else
                    {
                        bool oncedenbaktimi = kullanicilar.OncedenDislikeladimi();
                        if (oncedenbaktimi == true)
                        {
                            Mesajver("swal('Hata','Aynı gündemi birden fazla beğenmemezlik edemezsiniz.','error')");
                        }
                        else
                        {
                            bool azaldimi = kullanicilar.PuanAzaltma();
                            if (azaldimi)
                            {
                                Mesajver("swal('Başarılı','Puan azaltılmıştır.','success')");
                                kullanicilar.KullaniciyiDislikelaraEkle();
                                GundemFiltreleDoldur();
                            }
                            else
                            {
                                Mesajver("swal('Hata','Malesef puan azaltılamamıştır.','error')");
                            }
                        }
                    }
                }
            }
        }
        protected void imgbtnYorumlike_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                if (Request.Cookies["cerezDosyam"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"];
                    int girisyapankisiid = kullanicilar.KullaniciidDonder();
                    kullanicilar.girisyapankisiid = girisyapankisiid;
                    ImageButton myButton = (ImageButton)sender;
                    int gundemid= Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
                    string metin = myButton.ToolTip.Trim();
                    int bosluk = metin.IndexOf(" ");
                    int kisiid = Convert.ToInt32(metin.Substring(0, bosluk));
                    int yorumid = Convert.ToInt32(metin.Substring(bosluk + 1).TrimStart());
                    kullanicilar.gundemid = gundemid;
                    kullanicilar.yorumid = yorumid;
                    kullanicilar.yorumuyazankisiid = kisiid;
                    yorumlar.yorumuyazankisiid = kisiid;
                  
                    kullanicilar.yorumid = yorumlar.YorumidDonder();

                    if (kullanicilar.girisyapankisiid == kullanicilar.yorumuyazankisiid)
                    {
                        Mesajver("swal('Hata','Kendi yorumunuzu beğenemezsiniz.','error')");
                    }
                    else
                    {
                        bool oncedenbaktimi = kullanicilar.KullaniciYorumuOncedenLikeladimi();
                        if (oncedenbaktimi == true)
                        {
                            Mesajver("swal('Hata','Aynı yorumu birden fazla beğenemezsiniz.','error')");
                        }
                        else
                        {
                            bool arttimi = kullanicilar.YorumYapanKullaniciPuanArttir();
                            if (arttimi)
                            {
                                Mesajver("swal('Başarılı','Puan arttırılmıştır.','success')");
                                kullanicilar.KullaniciyiYorumLikelaraEkle();
                                YorumlariGetir();
                            }
                            else
                            {
                                Mesajver("swal('Hata','Malesef puan arttırılamadı.','error')");
                            }
                        }
                    }
                }
            }   
        }
        protected void imgbtnYorumDislike_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                if (Request.Cookies["cerezDosyam"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"];
                    int girisyapankisiid = kullanicilar.KullaniciidDonder();
                    kullanicilar.girisyapankisiid = girisyapankisiid;
                    ImageButton myButton = (ImageButton)sender;
                    int gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
                    string metin = myButton.ToolTip.Trim();
                    int bosluk = metin.IndexOf(" ");
                    int kisiid = Convert.ToInt32(metin.Substring(0, bosluk));
                    int yorumid = Convert.ToInt32(metin.Substring(bosluk + 1).TrimStart());
                    kullanicilar.gundemid = gundemid;
                    kullanicilar.yorumid = yorumid;
                    kullanicilar.yorumuyazankisiid = kisiid;
                    yorumlar.yorumuyazankisiid = kisiid;
                    kullanicilar.yorumid = yorumlar.YorumidDonder();
                    if (kullanicilar.girisyapankisiid == kullanicilar.yorumuyazankisiid)
                    {
                        Mesajver("swal('Hata','Kendi yorumunuzu beğenmemezlik edemezsiniz.','error')");
                    }
                    else
                    {
                        bool oncedenbaktimi = kullanicilar.KullaniciYorumuOncedenDislikeladimi();
                        if (oncedenbaktimi == true)
                        {
                            Mesajver("swal('Hata','Aynı yorumu birden fazla beğenmemezlik edemezsiniz.','error')");
                        }
                        else
                        {
                            bool azaldimi = kullanicilar.YorumYapanKullaniciPuanAzaltma();
                            if (azaldimi)
                            {
                                Mesajver("swal('Başarılı','Puan azaltılmıştır.','success')");
                                kullanicilar.KullaniciyiYorumDislikelaraEkle();
                                YorumlariGetir();
                            }
                            else
                            {
                                Mesajver("swal('Hata','Malesef puan azaltılamamıştır.','error')");
                            }
                        }
                    }
                }
            }
        }
        protected void lnkYorumEkleFiltrele_Click(object sender, EventArgs e)
        {
             Response.Redirect(string.Format("GundemeYorumEkle.aspx?Gundemid={0}", HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"]))));   
        }
    }
}