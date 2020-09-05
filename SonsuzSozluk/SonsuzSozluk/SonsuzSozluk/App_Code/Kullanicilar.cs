using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using SonsuzSozluk.App;

namespace SonsuzSozluk
{
    public class Kullanicilar
    {

        Veriler veriler = new Veriler();
        List<Veriler> list;
        public string sorgu, mail, ad, soyad, parola, yeniSifre, not;
        int etkilenen;
        public int kisiid;
        public int gundemiyazankisiid, girisyapankisiid, yorumuyazankisiid, gundemid, yorumid;
        SqlCommand cmd;
        SqlDataReader oku;
        public static SqlConnection Baglan()
        {
            string kaynak = System.Configuration.ConfigurationManager.ConnectionStrings["baglantim"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(kaynak);
            SqlConnection.ClearAllPools();
            SqlConnection.ClearPool(baglanti);
            baglanti.Open();
            return baglanti;
        }
        public bool MailVarmi()
        {
            bool varmi = false;
            sorgu = string.Format("Select * from tblKisiler where Mail='{0}'", mail);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool KullaniciEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblKisiler (Ad,Soyad,Mail,Parola) values (@ad,@soyad,@mail,@parola)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@ad", ad);
            cmd.Parameters.AddWithValue("@soyad", soyad);
            cmd.Parameters.AddWithValue("@mail", mail);
            cmd.Parameters.AddWithValue("@parola", parola);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool UyeKontrol()
        {
            bool varmi = false;
            sorgu = string.Format("select * from tblKisiler where Mail='{0}' and Parola='{1}'", mail, parola);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public string KullaniciAdGonder()
        {
            sorgu = string.Format("Select Ad from tblKisiler where Mail ='{0}' ", mail);
            cmd = new SqlCommand(sorgu, Baglan());
            string ad = Convert.ToString(cmd.ExecuteScalar());
            Baglan().Close();
            return ad;
        }
        public int KullaniciidDonder()
        {
            sorgu = string.Format("Select Kisiid from tblKisiler where Mail ='{0}' ", mail);
            cmd = new SqlCommand(sorgu, Baglan());
            int kisiid = Convert.ToInt32(cmd.ExecuteScalar());
            Baglan().Close();
            return kisiid;
        }
        public bool PuanArttir()
        {
            bool durum = false;
            sorgu = string.Format("update tblKisiler set Puan+=1 where Kisiid={0}", gundemiyazankisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public bool KullaniciyiLikelaraEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblOncedenBegendimi (Kisiid,Gundemid) values (@kisiid,@gundemid)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@kisiid", girisyapankisiid);
            cmd.Parameters.AddWithValue("@gundemid", gundemid);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool OncedenLikeladimi()
        {
            bool varmi = false;
            sorgu = string.Format("select * from tblOncedenBegendimi where Kisiid={0} and Gundemid={1}", girisyapankisiid, gundemid);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool PuanAzaltma()
        {
            bool durum = false;
            sorgu = string.Format("update tblKisiler set Puan-=1 where Kisiid={0}", gundemiyazankisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public bool OncedenDislikeladimi()
        {
            bool varmi = false;
            sorgu = string.Format("select * from tblOncedenBegenmedimi where Kisiid={0} and Gundemid={1}", girisyapankisiid, gundemid);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool KullaniciyiDislikelaraEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblOncedenBegenmedimi (Kisiid,Gundemid) values (@kisiid,@gundemid)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@kisiid", girisyapankisiid);
            cmd.Parameters.AddWithValue("@gundemid", gundemid);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool KullaniciyiYorumLikelaraEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblYorumBegendimi (Kisiid,Yorumid) values (@kisiid,@yorumid)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@kisiid", girisyapankisiid);
            cmd.Parameters.AddWithValue("@yorumid", yorumid);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool KullaniciyiYorumDislikelaraEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblYorumBegenmedimi (Kisiid,Yorumid) values (@kisiid,@yorumid)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@kisiid", girisyapankisiid);
            cmd.Parameters.AddWithValue("@Yorumid", yorumid);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool YorumYapanKullaniciPuanArttir()
        {
            bool durum = false;
            sorgu = string.Format("update tblKisiler set Puan+=1 where Kisiid={0}", yorumuyazankisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public bool YorumYapanKullaniciPuanAzaltma()
        {
            bool durum = false;
            sorgu = string.Format("update tblKisiler set Puan-=1 where Kisiid={0}", yorumuyazankisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public bool KullaniciYorumuOncedenLikeladimi()
        {
            bool varmi = false;
            sorgu = string.Format("select * from tblYorumBegendimi where Kisiid={0} and Yorumid={1}", girisyapankisiid, yorumid);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool KullaniciYorumuOncedenDislikeladimi()
        {
            bool varmi = false;
            sorgu = string.Format("select * from tblYorumBegenmedimi where Kisiid={0} and Yorumid={1}", girisyapankisiid, yorumid);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public int RolidDonder()
        {
            sorgu = string.Format("select Rolid from tblKisiler where Mail='{0}'", mail);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int rolid = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return rolid;
        }
        public int KullaniciPuanDonder()
        {
            sorgu = string.Format("select Puan from tblKisiler where Mail='{0}'", mail);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int puan = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return puan;
        }
        public bool KullaniciYetkiDegistir(int a)
        {
            bool durum = false;
            if (a == 0)
            {
                sorgu = string.Format("update tblKisiler set Rolid=2 where Mail='{0}' and Rolid=1", mail);
            }
            else
            {
                sorgu = string.Format("update tblKisiler set Rolid=1 where Mail='{0}' and Rolid=2", mail);
            }
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public int UyeAdetDonder()
        {
            sorgu = string.Format("select count(*) from tblKisiler where Rolid=1");
            cmd = new SqlCommand(sorgu, Baglan());
            int uyesayisi = Convert.ToInt32(cmd.ExecuteScalar());
            Baglan().Close();
            return uyesayisi;
        }
        public int YazarAdetDonder()
        {
            sorgu = string.Format("select count(*) from tblKisiler where Rolid=2");
            cmd = new SqlCommand(sorgu, Baglan());
            int yazarsayisi = Convert.ToInt32(cmd.ExecuteScalar());
            Baglan().Close();
            return yazarsayisi;
        }
        public List<Veriler> KullaniciBilgiGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select * from tblKisiler where Kisiid={0}", kisiid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.mail = okunan["Mail"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.puan = Convert.ToInt32(okunan["Puan"]);
                veriler.altinMadalyaSayisi = Convert.ToInt32(okunan["AltınMadalyasayisi"]);
                veriler.gumusMadalyaSayisi = Convert.ToInt32(okunan["GumusMadalyaSayisi"]);
                list.Add(veriler);
            }
            return list;
        }
        public string EskiSifre()
        {
            sorgu = string.Format("select Parola from tblKisiler where Kisiid={0}", kisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            string eskiParola = cmd.ExecuteScalar().ToString();
            Baglan().Close();
            return eskiParola;
        }
        public bool SifreGuncellestir()
        {
            bool durum = false;
            sorgu = string.Format("update tblKisiler set Parola='{0}' where Mail='{1}'", yeniSifre, mail);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public bool KullaniciBilgileriGuncelle()
        {
            bool durum = false;
            sorgu = string.Format("update tblKisiler set Ad='{0}',Soyad='{1}' where Mail='{2}'", ad, soyad, mail);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Baglan().Close();
            return durum;
        }
        public List<Veriler> AdminYazarBilgiGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select * from tblKisiler where Rolid=2");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.mail = okunan["Mail"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> AdminUyeBilgiGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select * from tblKisiler where Rolid=1");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.mail = okunan["Mail"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> KullaniciInceleBilgiGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("Select * from tblKisiler as k full join tblNotlar as n on k.Kisiid=n.Kisiid where k.Kisiid={0}", kisiid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.mail = okunan["Mail"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.puan = Convert.ToInt32(okunan["Puan"]);
                veriler.altinMadalyaSayisi = Convert.ToInt32(okunan["AltınMadalyaSayisi"]);
                veriler.gumusMadalyaSayisi = Convert.ToInt32(okunan["GumusMadalyaSayisi"]);
                veriler.not = okunan["Notu"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public int KullaniciYorumSayisiDonder()
        {
            sorgu = string.Format("select count(*) from tblYorumlar where Kisiid={0}", kisiid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int yorumsayisi = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return yorumsayisi;
        }
        public int KullaniciGundemSayisiDonder()
        {
            sorgu = string.Format("select count(*) from tblGundemler where Yazarid={0}", kisiid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int gundemsayisi = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return gundemsayisi;
        }
        public bool KullaniciNotEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblNotlar (Notu,Kisiid) values (@not,@kisiid)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@kisiid", kisiid);
            cmd.Parameters.AddWithValue("@not", not);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }

        public bool NotVarmi()
        {
            bool varmi = false;
            sorgu = string.Format("Select * from tblNotlar where Kisiid={0}", kisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool KullaniciNotGuncelle()
        {
            bool eklendimi = false;
            sorgu = string.Format("update tblNotlar set Notu='{0}' where Kisiid={1}", not, kisiid);
            cmd = new SqlCommand(sorgu, Baglan());
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool YazarVeyaUyeSil(string sil)
        {
            bool silindimi = false;
            if (sil == "GundemBegenme")
            {
                sorgu = string.Format("Delete from tblOncedenBegendimi where Kisiid={0} or Gundemid={1}", kisiid, gundemid);
            }
            else if (sil == "GundemBegenmeme")
            {
                sorgu = string.Format("Delete from tblOncedenBegenmedimi where Kisiid={0} or Gundemid={1}", kisiid, gundemid);
            }
            else if (sil == "YorumBegenme")
            {
                sorgu = string.Format("Delete from tblYorumBegendimi where Kisiid={0}", kisiid);
            }
            else if (sil == "YorumBegenmeme")
            {
                sorgu = string.Format("Delete from tblYorumBegenmedimi where Kisiid={0}", kisiid);
            }
            else if (sil == "Yorum")
            {
                sorgu = string.Format("Delete from tblYorumlar where Kisiid={0}", kisiid);
            }
            else if (sil == "Gundem")
            {
                sorgu = string.Format("Delete from tblGundemler where Yazarid={0}", kisiid);
            }
            else if (sil == "Not")
            {
                sorgu = string.Format("Delete from tblNotlar where Kisiid={0}", kisiid);
            }
            else if (sil == "Kisi")
            {
                sorgu = string.Format("Delete from tblKisiler where Kisiid={0}", kisiid);
            }
            cmd = new SqlCommand(sorgu, Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                silindimi = true;
            }
            Baglan().Close();
            return silindimi;
        }
       
        public bool YorumSil(string sil)
        {
            bool silindimi = false;

            if (sil == "YorumBegenme")
            {
                sorgu = string.Format("Delete from tblYorumBegendimi where Kisiid={0} or Yorumid={1}", kisiid, yorumid);
            }
            else if (sil == "YorumBegenmeme")
            {
                sorgu = string.Format("Delete from tblYorumBegenmedimi where Kisiid={0} or Yorumid={1}", kisiid, yorumid);
            }
            else if (sil == "Yorum")
            {
                sorgu = string.Format("Delete from tblYorumlar where Yorumid={0}", yorumid);
            }
            SqlCommand cmd = new SqlCommand(sorgu, Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                silindimi = true;
            }
            else
            {
                silindimi = false;
            }
            Baglan().Close();
            return silindimi;
        }
        public bool GundemSil(string sil)
        {
            bool silindimi = false;
            if (sil == "GundemBegenme")
            {
                sorgu = string.Format("Delete from tblOncedenBegendimi where Kisiid={0} or Gundemid={1}", kisiid, gundemid);
            }
            else if (sil == "GundemBegenmeme")
            {
                sorgu = string.Format("Delete from tblOncedenBegenmedimi where Kisiid={0} or Gundemid={1}", kisiid, gundemid);
            }
            else if (sil == "YorumBegenme")
            {
                sorgu = string.Format("Delete from tblYorumBegendimi where Kisiid={0} or Gundemid={1}", kisiid, gundemid);
            }
            else if (sil == "YorumBegenmeme")
            {
                sorgu = string.Format("Delete from tblYorumBegenmedimi where Kisiid={0} or Gundemid={1}", kisiid, gundemid);
            }
            else if (sil == "Yorum")
            {
                sorgu = string.Format("Delete from tblYorumlar where Gundemid={0}", gundemid);
            }
            else if (sil == "Gundem")
            {
                sorgu = string.Format("Delete from tblGundemler where Gundemid={0}", gundemid);
            }
            SqlCommand cmd = new SqlCommand(sorgu, Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                silindimi = true;
            }
            else
            {
                silindimi = false;
            }
            Baglan().Close();
            return silindimi;
        }
    }
}
