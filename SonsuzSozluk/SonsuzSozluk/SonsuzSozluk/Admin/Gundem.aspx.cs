using SonsuzSozluk.App;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonsuzSozluk.Admin
{
    public partial class Gundem : System.Web.UI.Page
    {
        Yorumlar yorumlar = new Yorumlar();
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            DataListAdminGundem.DataSource = gundemler.AdminGundemGetir();
            DataListAdminGundem.DataBind();
        }
        private void Mesajver(string mesaj)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Baslik", "<script>" + mesaj + "</script>");
        }

        protected void DeletleButton_Click(object sender, EventArgs e)
        {
            kullanicilar.gundemid = Convert.ToInt32(Request.QueryString["Gundemid"]);
            kullanicilar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            kullanicilar.GundemSil("YorumBegenme");
            kullanicilar.GundemSil("YorumBegenmeme");
            kullanicilar.GundemSil("Yorum");
            kullanicilar.GundemSil("GundemBegenme");
            kullanicilar.GundemSil("GundemBegenmeme");
            if (kullanicilar.GundemSil("Gundem"))
            {
                Mesajver("swal('Başarılı','Gundem Silindi.','success')");
                //DataListAdminGundem.DataSource = yorumlar.AdminYorumGetir();
                //DataListAdminGundem.DataBind();
            }
            else
            {
                Mesajver("swal('Hata','Bir Hata Oluştu.','error')");
            }
        }

        protected void ConfirmationButton_Click(object sender, EventArgs e)
        {
            gundemler.gundemid = Convert.ToInt32(Request.QueryString["gundemid"]);
            if (gundemler.GundemOncedenOnaylandimi())
            {
                Mesajver("swal('Hata','Gundem Zaten Onaylandı.','error')");
            }
            else
            {
                bool onaylandimi = gundemler.GundemOnayla();
                if (onaylandimi)
                {
                    Mesajver("swal('Başarılı','Gundem Onaylandı.','success')");
                }
                else
                {
                    Mesajver("swal('Hata','Gundem Onaylanamadı','error')");
                }
            }
        }
    }
}