using SonsuzSozluk.App;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonsuzSozluk.Admin
{
    public partial class Uyeler : System.Web.UI.Page
    {
      
        Yorumlar yorumlar = new Yorumlar();
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            dtUyeler.DataSource = kullanicilar.AdminUyeBilgiGetir();
            dtUyeler.DataBind();
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
            kullanicilar.YazarVeyaUyeSil("GundemBegenme");
            kullanicilar.YazarVeyaUyeSil("GundemBegenmeme");
            DataTable dtgundemeyapilanyorumidler = yorumlar.GundemeYapilanYorumIdListeDonder();
            for (int j = 0; j < dtgundemeyapilanyorumidler.Rows.Count; j++)
            {
                yorumlar.yorumid = Convert.ToInt32(dtgundemeyapilanyorumidler.Rows[j][0]);
                yorumlar.YorumIdyeGoreBegenenlerTablosunuSil();
                yorumlar.YorumIdyeGoreBegenmemeTablosunuSil();
            }
            if (kullanicilar.YazarVeyaUyeSil("Kisi"))
            {
                Mesajver("swal('Başarılı','Kullanıcı Silinmiştir.','success')");
                dtUyeler.DataSource = kullanicilar.AdminUyeBilgiGetir();
                dtUyeler.DataBind();
            }
            else
            {
                Mesajver("swal('Hata','Bir Hata Oluştu','error')");
            }
        }
    }
}