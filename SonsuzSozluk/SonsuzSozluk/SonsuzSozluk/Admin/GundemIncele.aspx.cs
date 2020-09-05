using SonsuzSozluk.App;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonsuzSozluk.Admin
{
    public partial class GundemIncele : System.Web.UI.Page
    {
        Gundemler gundemler = new Gundemler();
        Yorumlar yorumlar = new Yorumlar();
        Kullanicilar kullanicilar = new Kullanicilar();
        private void Mesajver(string mesaj)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Baslik", "<script>" + mesaj + "</script>");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int gundemid = Convert.ToInt32(Request.QueryString["Gundemid"]);
                gundemler.gundemid = gundemid;
                yorumlar.gundemid = gundemid;
                lblGundemBaslik.Text = gundemler.GundemBaslik();
                lblGundemIcerik.Text = gundemler.GundemIcerik();
                dtlYorumlar.DataSource = yorumlar.GundemInceleYorum();
                dtlYorumlar.DataBind();
            }
        }

        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Gundem.aspx");
        }

        protected void DeletleButton_Click(object sender, EventArgs e)
        {
            kullanicilar.yorumid = Convert.ToInt32(Request.QueryString["yorumid"]);
            kullanicilar.YorumSil("YorumBegenme");
            kullanicilar.YorumSil("YorumBegenmeme");
            if (kullanicilar.YorumSil("Yorum"))
            {
                Mesajver("swal('Başarılı','Yorum Silinmiştir.','success')");
                dtlYorumlar.DataSource = yorumlar.GundemInceleYorum();
                dtlYorumlar.DataBind();
            }
            else
            {
                Mesajver("swal('Hata','Bir Hata Oluştu.','error')");
            }
        }
    }
}