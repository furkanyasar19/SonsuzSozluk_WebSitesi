using SonsuzSozluk.App;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonsuzSozluk.Admin
{
    public partial class Yorum : System.Web.UI.Page
    {
        Yorumlar yorumlar = new Yorumlar();
        Gundemler gundemler = new Gundemler();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            dtAdminYorumGetir.DataSource = yorumlar.AdminYorumGetir();
            dtAdminYorumGetir.DataBind();
        }
        private void Mesajver(string mesaj)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Baslik", "<script>" + mesaj + "</script>");
        }

        protected void DeletleButton_Click(object sender, EventArgs e)
        {
            kullanicilar.yorumid = Convert.ToInt32(Request.QueryString["yorumid"]);
            kullanicilar.YorumSil("YorumBegenme");
            kullanicilar.YorumSil("YorumBegenmeme");
            if (kullanicilar.YorumSil("Yorum"))
            {
                Mesajver("swal('Başarılı','Yorum Silinmiştir.','success')");
                dtAdminYorumGetir.DataSource = yorumlar.AdminYorumGetir();
                dtAdminYorumGetir.DataBind();
            }
            else
            {
                Mesajver("swal('Hata','Bir Hata Oluştu.','error')");
            }
        }
    }
}