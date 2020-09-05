using SonsuzSozluk.App;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SonsuzSozluk.Admin
{
    public partial class Yazarlar : System.Web.UI.Page
    {
        Yorumlar yorumlar = new Yorumlar();
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            dtListYazarlar.DataSource = kullanicilar.AdminYazarBilgiGetir();
            dtListYazarlar.DataBind();
        }
        private void Mesajver(string mesaj)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Baslik", "<script>" + mesaj + "</script>");
        }

        protected void DeletleButton_Click(object sender, EventArgs e)
        {
            kullanicilar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            gundemler.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            yorumlar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            kullanicilar.YazarVeyaUyeSil("Not");
            DataTable dtyorumidlistesi = yorumlar.YorumIdListeDonder();
            for (int i = 0; i < dtyorumidlistesi.Rows.Count; i++)
            {
                yorumlar.yorumid = Convert.ToInt32(dtyorumidlistesi.Rows[i][0]);
                yorumlar.YorumIdyeGoreBegenenlerTablosunuSil();
            }
            kullanicilar.YazarVeyaUyeSil("YorumBegenme");
            for (int i = 0; i < dtyorumidlistesi.Rows.Count; i++)
            {
                yorumlar.yorumid = Convert.ToInt32(dtyorumidlistesi.Rows[i][0]);
                yorumlar.YorumIdyeGoreBegenmemeTablosunuSil();
            }
            kullanicilar.YazarVeyaUyeSil("YorumBegenmeme");
            kullanicilar.YazarVeyaUyeSil("Yorum");
            DataTable dtgundemidlistesi = gundemler.GundemIdListeDonder();
            for (int i = 0; i < dtgundemidlistesi.Rows.Count; i++)
            {
                yorumlar.gundemid = Convert.ToInt32(dtgundemidlistesi.Rows[i][0]);
                kullanicilar.gundemid = Convert.ToInt32(dtgundemidlistesi.Rows[i][0]);
                kullanicilar.YazarVeyaUyeSil("GundemBegenme");
                kullanicilar.YazarVeyaUyeSil("GundemBegenmeme");
                DataTable dtgundemeyapilanyorumidler = yorumlar.GundemeYapilanYorumIdListeDonder();
                for (int j = 0; j < dtgundemeyapilanyorumidler.Rows.Count; j++)
                {
                    yorumlar.yorumid = Convert.ToInt32(dtgundemeyapilanyorumidler.Rows[j][0]);
                    yorumlar.YorumIdyeGoreBegenenlerTablosunuSil();
                    yorumlar.YorumIdyeGoreBegenmemeTablosunuSil();
                }
                yorumlar.GundemIdyeGoreYorumSil();
            }
            kullanicilar.YazarVeyaUyeSil("Gundem");
            if (kullanicilar.YazarVeyaUyeSil("Kisi"))
            {
                Mesajver("swal('Başarılı','Kullanıcı Silinmiştir.','success')");
                dtListYazarlar.DataSource = kullanicilar.AdminYazarBilgiGetir();
                dtListYazarlar.DataBind();
            }
            else
            {
                Mesajver("swal('Hata','Bir Hata Oluştu','error')");
            }
            //kullanicilar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            //gundemler.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            //yorumlar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            //yorumlar.yorumuyazankisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            //kullanicilar.yorumid = yorumlar.YorumidDonder();
            ////kullanicilar.gundemid = gundemler.GundemIdGetir();
            //kullanicilar.YazarSil("Not");
            //DataTable dtyorumidlistesi = yorumlar.YorumIdListeDonder();
            //for (int i = 0; i < dtyorumidlistesi.Rows.Count; i++)
            //{
            //    yorumlar.gundemid = Convert.ToInt32(dtyorumidlistesi.Rows[i][0]);
            //    yorumlar.YorumIdListeDonder();
            //}
            //kullanicilar.YazarSil("YorumBegenme");
            //kullanicilar.YazarSil("YorumBegenmeme");
            //kullanicilar.YazarSil("Yorum");
            //kullanicilar.YazarSil("GundemBegenme");
            //kullanicilar.YazarSil("GundemBegenmeme");
            //DataTable dtgundemidlistesi = gundemler.GundemIdListeDonder();
            //for (int i = 0; i < dtgundemidlistesi.Rows.Count; i++)
            //{
            //    yorumlar.gundemid = Convert.ToInt32(dtgundemidlistesi.Rows[i][0]);
            //    yorumlar.YorumIdyeGoreBegenenlerTablosunuSil();
            //    yorumlar.GundemIdyeGoreBegenemeyenlerTablosunuSil();
            //}
            //kullanicilar.YazarSil("Gundem");
            //if (kullanicilar.YazarSil("Kisi"))
            //{
            //    Mesajver("swal('Başarılı','Kullanıcı Silinmiştir.','success')");
            //    dtListYazarlar.DataSource = kullanicilar.AdminYazarBilgiGetir();
            //    dtListYazarlar.DataBind();
            //}
            //else
            //{
            //    Mesajver("swal('Hata','Bir Hata Oluştu','error')");
            //}


            //kullanicilar.kisiid = Convert.ToInt32(Request.QueryString["Kisiid"]);
            //gundemler.kisiid= Convert.ToInt32(Request.QueryString["Kisiid"]);
            //yorumlar.yorumuyazankisiid= Convert.ToInt32(Request.QueryString["Kisiid"]);
            //kullanicilar.yorumid = yorumlar.YorumidDonder();
            //kullanicilar.gundemid = gundemler.GundemIdGetir();
            //kullanicilar.YazarUyeSil("Not");
            //kullanicilar.YazarUyeSil("YorumBegenme");
            //kullanicilar.YazarUyeSil("YorumBegenmeme");
            //kullanicilar.YazarUyeSil("Yorum");
            //kullanicilar.YazarUyeSil("GundemBegenme");
            //kullanicilar.YazarUyeSil("GundemBegenmeme");
            //kullanicilar.YazarUyeSil("Gundem");
            //if (kullanicilar.YazarUyeSil("Kisi"))
            //{
            //    Mesajver("swal('Başarılı','Kullanıcı Silindi.','success')");
            //    dtListYazarlar.DataSource = kullanicilar.AdminYazarBilgiGetir();
            //    dtListYazarlar.DataBind();
            //}
            //else
            //{
            //    Mesajver("swal('Hata','Bir Hata Oluştu.','error')");
            //}
        }
    }
}