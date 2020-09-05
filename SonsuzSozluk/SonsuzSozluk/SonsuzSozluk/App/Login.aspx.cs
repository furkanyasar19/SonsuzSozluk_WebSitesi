using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonsuzSozluk.App
{
    public partial class Login : System.Web.UI.Page
    {
        enum Rolu
        {
            Uye = 1,
            Yazar = 2,
            Admin = 3
        }
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            kullanicilar.mail = txtMail.Text;
            kullanicilar.parola = txtParola.Text;
            if (txtMail.Text==""|| txtParola.Text=="")
            {
                lblSonuc.Text = "Lütfen tüm alanları doldurunuz";
            }
            else
            {
                if (!kullanicilar.UyeKontrol())
                {
                    lblSonuc.Text = "Mail veya parolanız hatalı";
                }
                else
                {
                    HttpCookie cerezim = new HttpCookie("cerezdosyam");
                    cerezim["mail"] = txtMail.Text;
                    kullanicilar.mail = cerezim["mail"];
                    int k_puan = kullanicilar.KullaniciPuanDonder();
                    if (k_puan==250)
                    {
                         kullanicilar.KullaniciYetkiDegistir(0);
                    }
                    else if (k_puan<250)
                    {
                        kullanicilar.KullaniciYetkiDegistir(1);
                    }
                    int rolid = kullanicilar.RolidDonder();
                    if (rolid == (int)Rolu.Yazar || rolid == (int)Rolu.Uye)
                    {
                        lblSonuc.Text = "Giriş başarılı";
                        cerezim.Expires = DateTime.Now.AddDays(1);
                        Response.Cookies.Add(cerezim);
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        cerezim.Expires = DateTime.Now.AddDays(1);
                        Response.Cookies.Add(cerezim);
                        Response.Redirect("~/Admin/Yazarlar.aspx");
                    }
                }
            }
        }
    }
}