using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace SonsuzSozluk.App
{
    public partial class Sigup : System.Web.UI.Page
    {
        Kullanicilar kullanicilar = new Kullanicilar();
        Regex reg = new Regex(@"^[a-zA-ZıİçÇşŞöÖüÜğĞ]*$");

        protected void Page_Load(object sender, EventArgs e)
        {
            txtname.Focus();
            if (!IsPostBack)
            {
                lnkGiris.Visible = false;
            }
        }

        protected void btnKayitOl_Click(object sender, EventArgs e)
        {
            kullanicilar.mail = txtEmail.Text;
            if (txtname.Text == "" || txtEmail.Text == "" || txtpassword.Text == "" || txtpasswordrepeat.Text == "")
            {
                lblSonuc.Text = "Lütfen tüm alanları doldurunuz.";
            }
            else if (txtpassword.Text.Length < 3)
            {
                lblSonuc.Text = "Parolanız en az 3 karekter olmalıdır.";
            }
            else if (txtpassword.Text != txtpasswordrepeat.Text)
            {
                lblSonuc.Text = "Parolanız eşleşmiyor.";
            }
            else
            {
                lblSonuc.Text = "";
                string metin = txtname.Text.Trim();
                int bosluk = metin.IndexOf(" ");
                if (bosluk < 0)
                {
                    lblSonuc.Text = "Lütfen soyadınızı giriniz.";
                }
                else
                {
                    string ad = metin.Substring(0, bosluk);
                    string soyad = metin.Substring(bosluk + 1).TrimStart();
                    if (reg.IsMatch(ad) && reg.IsMatch(soyad))
                    {
                        kullanicilar.mail = txtEmail.Text;
                        bool varmi = kullanicilar.MailVarmi();
                        if (varmi == true)
                        {
                            lblSonuc.Text = string.Format("{0} Bu mail daha önce kullanılmıştır. Başka bir mail ile deneyiniz.", kullanicilar.mail);
                        }
                        else
                        {
                            kullanicilar.ad = ad;
                            kullanicilar.soyad = soyad;
                            kullanicilar.mail = txtEmail.Text;
                            kullanicilar.parola = txtpassword.Text;

                            bool eklendimi = kullanicilar.KullaniciEkle();
                            if (eklendimi)
                            {
                                lblSonuc.Text = "Kayıt eklenmiştir";
                                lnkGiris.Visible = true;
                            }
                            else
                            {
                                lblSonuc.Text = "Kayıt eklenememiştir";
                            }
                        }
                    }
                    else
                    {
                        lblSonuc.Text = "İsim alanına rakam girilmez";
                    }
                }
            }
        }
    }
}