using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace SonsuzSozluk.App
{
    public partial class GundemEkle : System.Web.UI.Page
    {
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullaniciler = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dtkategoriler = gundemler.KategoriGetir();
                foreach (var kategoriDoldur in dtkategoriler)
                {
                    DrpDownGundemKategori.Items.Add(kategoriDoldur.kategori);
                }
            }
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
            gundemler.gundemBaslik = txtGundem.Text;
            gundemler.gundemIcerik = txtYorum.InnerText;
            HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
            kullaniciler.mail = cerezOku["mail"];
            gundemler.yazarid = kullaniciler.KullaniciidDonder();
            gundemler.kategoriid = gundemler.Kategoriidgetir(DrpDownGundemKategori.SelectedValue);
            if (txtGundem.Text == "" || txtYorum.InnerText == "")
            {
                lblSonuc.Text = "Tüm alanlar doldurulmalıdır";
            }
            else
            {
                int rolid = kullaniciler.RolidDonder();
                bool eklendimi = gundemler.GundemEkle();
                if (eklendimi)
                {
                    lblSonuc.Text = "Gündem eklendi, geri dön butonu ile eklenen gündem maddesini görebilirsiniz.";
                }
                else
                {
                    lblSonuc.Text = "Gündem eklenirken bir sorun meydana geldi.";
                }
            }
        }
        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            txtGundem.Text = "";
            txtYorum.InnerText = "";
            lblSonuc.Text = "";
        }
    }
}