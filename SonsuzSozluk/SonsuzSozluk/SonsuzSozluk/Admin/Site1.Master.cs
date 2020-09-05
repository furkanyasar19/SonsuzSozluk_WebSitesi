using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SonsuzSozluk.App;
namespace SonsuzSozluk.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        Yorumlar yorumlar = new Yorumlar();
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblyazarSayisi.Text = kullanicilar.YazarAdetDonder().ToString();
            lbluyeSayisi.Text = kullanicilar.UyeAdetDonder().ToString();
            lblyorumSayisi.Text = yorumlar.YorumSayisiDonder().ToString();
            lblGundemSayisi.Text = gundemler.GundemSayisiDonder().ToString();
            if (Request.Cookies["cerezDosyam"] != null)
            {
                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                kullanicilar.mail = cerezOku["mail"].ToString();
                AdministratorName.Text = kullanicilar.KullaniciAdGonder();
            }
        }
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            HttpCookie cerezim = new HttpCookie("cerezdosyam");
            cerezim.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cerezim);
            Response.Redirect("~/Landing/index.aspx");
        }
    }
}