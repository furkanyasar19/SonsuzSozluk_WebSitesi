using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SonsuzSozluk.App
{
    public class Yorumlar
    {
        List<Veriler> list;
        SqlCommand cmd;
        SqlDataAdapter adp;
        DataTable dtKategoriler;
        string sorgu;
        public string yorum;
        public int gundemid, kisiid, yorumuyazankisiid, gundemeyorumyapankisiid, yorumid;
        Veriler veriler = new Veriler();
        public List<Veriler> GundemYorumBilgiGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblYorumlar.Yorumid,tblYorumlar.Yorum,tblYorumlar.Tarih,tblKisiler.Kisiid,tblKisiler.Ad,tblKisiler.Soyad,tblKisiler.Puan,tblKisiler.AltınMadalyasayisi,tblKisiler.GumusMadalyaSayisi from tblYorumlar inner join tblKisiler on tblKisiler.Kisiid=tblYorumlar.Kisiid where Gundemid={0} order by Tarih desc", gundemid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.yorumid = (int)okunan["Yorumid"];
                veriler.yorum = okunan["Yorum"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.puan = (int)okunan["Puan"];
                veriler.altinMadalyaSayisi = (int)okunan["AltınMadalyaSayisi"];
                veriler.gumusMadalyaSayisi = (int)okunan["GumusMadalyaSayisi"];
                list.Add(veriler);
            }
            return list;
        }
        public bool YorumEkle()
        {
            bool etkilendimi = false;
            sorgu = string.Format("insert into tblYorumlar (Yorum,Kisiid,Gundemid) values (@yorum,@kisiid,@gundemid)");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            cmd.Parameters.AddWithValue("@yorum", yorum);
            cmd.Parameters.AddWithValue("@kisiid", kisiid);
            cmd.Parameters.AddWithValue("@gundemid", gundemid);
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
        public int YorumidDonder()
        {
            sorgu = string.Format("select tblYorumlar.Yorumid from tblYorumlar inner join tblKisiler on tblKisiler.Kisiid=tblYorumlar.Kisiid where tblYorumlar.Kisiid={0}", yorumuyazankisiid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int yorumid = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return yorumid;
        }
        public int YorumSayisiGetir()
        {
            sorgu = string.Format("Select count(*) from tblYorumlar where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int yorumid = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return yorumid;
        }
        public int YorumSayisiDonder()
        {
            sorgu = string.Format("select count(*) from tblYorumlar");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int yorumsayisi = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return yorumsayisi;
        }
        public List<Veriler> AcilanGundemeYapilanYorumlar()
        {
            list = new List<Veriler>();
            sorgu = string.Format("Select tblYorumlar.Yorumid,tblYorumlar.Yorum,tblYorumlar.Tarih,tblGundemler.GundemBaslik from tblYorumlar inner join tblGundemler on tblYorumlar.Gundemid=tblGundemler.Gundemid where Kisiid={0}", kisiid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.yorumid = (int)okunan["Yorumid"];
                veriler.yorum = okunan["Yorum"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.gundemBaslik = okunan["GundemBaslik"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> AdminYorumGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblYorumlar.Yorumid,tblYorumlar.Yorum,tblYorumlar.Tarih,tblKisiler.Ad,tblKisiler.Soyad from tblYorumlar inner join tblKisiler on tblKisiler.Kisiid=tblYorumlar.Kisiid order by tblYorumlar.Yorumid desc");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.yorumid = (int)okunan["Yorumid"];
                veriler.yorum = okunan["Yorum"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> GundemInceleYorum()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Yorumid,Yorum from tblYorumlar where Gundemid={0}", gundemid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.yorum = okunan["Yorum"].ToString();
                veriler.yorumid = (int)okunan["Yorumid"];
                list.Add(veriler);
            }
            return list;
        }
        public bool GundemInceleYorumSil()
        {
            bool etkilendimi = false;
            sorgu = string.Format("delete from tblYorumlar where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
        public List<Veriler> GundemInceleYorumGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Yorum,Yorumid from tblYorumlar where Yorumid={0}", yorumid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.yorum = okunan["Yorum"].ToString();
                veriler.yorumid = (int)okunan["Yorumid"];
                list.Add(veriler);
            }
            return list;
        }
        public int YorumGundemId()
        {
            sorgu = string.Format("select tblYorumlar.Gundemid from tblYorumlar inner join tblGundemler on tblGundemler.Gundemid=tblYorumlar.Gundemid where tblYorumlar.Yorumid={0}", yorumid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int gundemid = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return gundemid;
        }
        public string YorumGetir()
        {
            sorgu = string.Format("select Yorum from tblYorumlar where tblYorumlar.Yorumid={0}", yorumid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            string yorum = cmd.ExecuteScalar().ToString();
            Kullanicilar.Baglan().Close();
            return yorum;
        }
        public bool YorumGuncelle()
        {
            bool durum = false;
            sorgu = string.Format("Update tblYorumlar set Yorum='{0}' where Yorumid={1}", yorum, yorumid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Kullanicilar.Baglan().Close();
            return durum;
        }

        public void GundemIdyeGoreYorumSil()
        {
            bool silindimi = false;
            sorgu = string.Format("Delete from tblYorumlar where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                silindimi = true;
            }
            Kullanicilar.Baglan().Close();
        }
        public DataTable YorumIdListeDonder()
        {
            sorgu = string.Format("select Yorumid from tblYorumlar where Kisiid={0}", kisiid);
            adp = new SqlDataAdapter(sorgu, Kullanicilar.Baglan());
            DataTable dtYorumIdListe = new DataTable();
            adp.Fill(dtYorumIdListe);
            Kullanicilar.Baglan().Close();
            return dtYorumIdListe;
        }
        public DataTable GundemeYapilanYorumIdListeDonder()
        {
            sorgu = string.Format("select Yorumid from tblYorumlar where Gundemid={0}", gundemid);
            adp = new SqlDataAdapter(sorgu, Kullanicilar.Baglan());
            DataTable dtgundemeyapilanYorumIdListe = new DataTable();
            adp.Fill(dtgundemeyapilanYorumIdListe);
            Kullanicilar.Baglan().Close();
            return dtgundemeyapilanYorumIdListe;
        }
        public void YorumIdyeGoreBegenenlerTablosunuSil()
        {
            bool silindimi = false;
            sorgu = string.Format("Delete from tblYorumBegendimi where Yorumid={0}", yorumid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                silindimi = true;
            }
            Kullanicilar.Baglan().Close();
        }
        public void YorumIdyeGoreBegenmemeTablosunuSil()
        {
            bool silindimi = false;
            sorgu = string.Format("Delete from tblYorumBegenmedimi where Yorumid={0}", yorumid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                silindimi = true;
            }
            Kullanicilar.Baglan().Close();
        }
    }
}