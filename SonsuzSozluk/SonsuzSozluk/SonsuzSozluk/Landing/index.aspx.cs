using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SonsuzSozluk.App;

namespace SonsuzSozluk.Landing
{
    enum Rolu
    {
        Uye = 1,
        Yazar = 2,
        Admin = 3
    }
    public partial class index : System.Web.UI.Page
    {
        Kullanicilar kullanicilar = new Kullanicilar();
        Gundemler gundemler = new Gundemler();
        Yorumlar yorumlar = new Yorumlar();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUyeSayisi.Text = kullanicilar.UyeAdetDonder().ToString();
            lblYazarSayisi.Text = kullanicilar.YazarAdetDonder().ToString();
            lblGundemSayisi.Text = gundemler.GundemSayisiDonder().ToString();
            lblYorumSayisi.Text = yorumlar.YorumSayisiDonder().ToString();
            if (Request.Cookies["cerezDosyam"] != null)
            {
                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                kullanicilar.mail = cerezOku["mail"].ToString();
                int rolid = kullanicilar.RolidDonder();
                if (rolid == (int)Rolu.Yazar || rolid==(int)Rolu.Uye)
                {
                    Response.Redirect("~/App/Default.aspx");
                }
                else
                {
                    Response.Redirect("~/Admin/Yazarlar.aspx");
                }
                
            }
        }
    }
}