using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace SonsuzSozluk.App
{
    public partial class Default : System.Web.UI.Page
    {
        
        Kullanicilar kullanicilar = new Kullanicilar();
        Gundemler gundemler = new Gundemler();
        PagedDataSource sayfala = new PagedDataSource();
        DataTable dtGundemBilgi = new DataTable();
        int poz;
        private void Mesajver(string mesaj)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Baslik", "<script>" + mesaj + "</script>");
            
        }
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
        private void GundemDoldur()
        {
            gundemler.kategoriid = gundemler.Kategoriidgetir(Dropdownkategori.SelectedValue);
            gundemler.aranan = Request.QueryString["aranan"];
            dtGundemBilgi = gundemler.GundemGetir(gundemler.kategoriid, gundemler.aranan);
            datalistGundemBilgi.DataSource = dtGundemBilgi;
            datalistGundemBilgi.DataBind();
            sayfala.DataSource = dtGundemBilgi.DefaultView;
            sayfala.PageSize = 5;
            if (sayfala.Count < 5)
            {
                divsayfalama.Attributes["class"] = "gizle";
            }
            else
            {
                divsayfalama.Attributes["class"] = "goster";
            }
            sayfala.AllowPaging = true;
            sayfala.CurrentPageIndex = poz;
            btnIlk.Enabled = !sayfala.IsFirstPage;
            btnOnceki.Enabled = !sayfala.IsFirstPage;
            btnSon.Enabled = !sayfala.IsLastPage;
            btnSonraki.Enabled = !sayfala.IsLastPage;
            datalistGundemBilgi.DataSource = sayfala;
            datalistGundemBilgi.DataBind();
            if (Request.Cookies["cerezDosyam"] == null)
            {
                foreach (DataListItem dli in datalistGundemBilgi.Items)
                {
                    LinkButton lbLinkButton = (LinkButton)dli.FindControl("lnkYorumEkle");
                    if (lbLinkButton != null)
                    {
                        lbLinkButton.Visible = false;
                    }
                }
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            }
            GundemDoldur();
            datalistGundemMenu.DataSource = gundemler.GundemBaslikMenu();
            datalistGundemMenu.DataBind();
            if (!IsPostBack)
            {
                var dtkategoriler = gundemler.KategoriGetir();
                foreach (var kategoriDoldur in dtkategoriler)
                {
                    Dropdownkategori.Items.Add(kategoriDoldur.kategori);
                }
            }
            poz = (int)this.ViewState["vs"];
            lblSayfaNo.Text = (poz + 1).ToString();
            lblSayfaSayisi.Text = sayfala.PageCount.ToString();
        }
        protected void btnIlk_Click(object sender, EventArgs e)
        {
            poz = (int)this.ViewState["vs"];
            poz = 0;
            this.ViewState["vs"] = poz;
            GundemDoldur();
            lblSayfaNo.Text = (poz + 1).ToString();
        }
        protected void btnOnceki_Click(object sender, EventArgs e)
        {
            poz = (int)this.ViewState["vs"];
            poz -= 1;
            this.ViewState["vs"] = poz;
            GundemDoldur();
            lblSayfaNo.Text = (poz + 1).ToString();
        }
        protected void btnSonraki_Click(object sender, EventArgs e)
        {
            poz = (int)this.ViewState["vs"];
            poz += 1;
            this.ViewState["vs"] = poz;
            GundemDoldur();
            lblSayfaNo.Text = (poz + 1).ToString();
        }
        protected void btnSon_Click(object sender, EventArgs e)
        {
            poz = sayfala.PageCount - 1;
            this.ViewState["vs"] = poz;
            GundemDoldur();
            lblSayfaNo.Text = (poz + 1).ToString();
        }
        protected void imgbtnLike_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                this.ViewState["vs"] = poz;
                if (Request.Cookies["cerezDosyam"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"].ToString();
                    int girisyapankisiid = kullanicilar.KullaniciidDonder();
                    ImageButton myButton = (ImageButton)sender;
                    int gundemyazankisiid = Convert.ToInt32(myButton.ToolTip);
                    kullanicilar.gundemiyazankisiid = gundemyazankisiid;
                    kullanicilar.girisyapankisiid = girisyapankisiid;
                    kullanicilar.gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
                    if (girisyapankisiid == gundemyazankisiid)
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
                                GundemDoldur();
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
        protected void imgbtnDislike_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
            {
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());//img buton ile puan arttırıldıktan sonra sayfa yenilendiğinde tekrar puan arttır img buton içindeki kodlar çalışıyor ona karşı yazılan kod.
                this.ViewState["vs"] = poz;
                if (Request.Cookies["cerezDosyam"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                    kullanicilar.mail = cerezOku["mail"];
                    int girisyapankisiid = kullanicilar.KullaniciidDonder();
                    ImageButton myButton = (ImageButton)sender;
                    int gundemyazankisiid = Convert.ToInt32(myButton.ToolTip);
                    kullanicilar.gundemiyazankisiid = gundemyazankisiid;
                    kullanicilar.girisyapankisiid = girisyapankisiid;
                    kullanicilar.gundemid = Convert.ToInt32(HttpUtility.UrlDecode(Sifreleme.Decrypt(Request.QueryString["gundemid"])));
                    if (girisyapankisiid == gundemyazankisiid)
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
                                GundemDoldur();
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
    }
}