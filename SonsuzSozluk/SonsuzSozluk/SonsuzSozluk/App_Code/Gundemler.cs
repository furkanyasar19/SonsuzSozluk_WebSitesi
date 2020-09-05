using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SonsuzSozluk.App
{
    public class Gundemler
    {
        SqlDataAdapter adp;
        DataTable dtGundemler;
        DataTable dtGundemBilgi;
        DataTable dtKategoriler;
        SqlCommand cmd;
        List<Veriler> list;
        string sorgu;
        public int gundemid, yazarid, kategoriid, kisiid;
        public string aranan, mail, gundemBaslik, gundemIcerik;
        Veriler veriler = new Veriler();
        public List<Veriler> GundemBaslikMenu()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Gundemid,GundemBaslik from tblGundemler where Onaylandimi='True' order by Tarih desc");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.gundemid = Convert.ToInt32(okunan["Gundemid"]);
                veriler.gundemBaslik = okunan["GundemBaslik"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public int Kategoriidgetir(string kategori)
        {
            sorgu = string.Format("Select kategoriid from tblKategoriler where kategori='{0}'", kategori);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int kategoriid = Convert.ToInt32(cmd.ExecuteScalar());
            return kategoriid;
        }
        public DataTable GundemGetir(int kategoriid, string aranan)
        {
            if (kategoriid == 0 || kategoriid == 1)
            {
                if (aranan == "" || aranan == null)
                {
                    sorgu = string.Format("select tblKisiler.Kisiid,tblKisiler.Ad,tblKisiler.Soyad,tblKisiler.AltınMadalyasayisi,tblKisiler.GumusMadalyaSayisi,tblKisiler.Puan,tblGundemler.Gundemid,tblGundemler.GundemBaslik,tblGundemler.GundemIcerik,tblGundemler.Tarih from tblGundemler inner join tblKisiler on tblGundemler.Yazarid=tblKisiler.Kisiid where Onaylandimi='True'  order by Tarih desc ");
                }
                else
                {
                    sorgu = string.Format("select tblKisiler.Kisiid,tblKisiler.Ad,tblKisiler.Soyad,tblKisiler.AltınMadalyasayisi,tblKisiler.GumusMadalyaSayisi,tblKisiler.Puan,tblGundemler.Gundemid,tblGundemler.GundemBaslik,tblGundemler.GundemIcerik,tblGundemler.Tarih from tblGundemler inner join tblKisiler on tblGundemler.Yazarid=tblKisiler.Kisiid where Onaylandimi='True' and tblGundemler.GundemBaslik like '%{0}%' or tblGundemler.GundemIcerik like '%{1}%' order by Tarih desc ", aranan, aranan);
                }
            }
            else
            {
                if (aranan == "" || aranan == null)
                {
                    sorgu = string.Format("select tblKisiler.Kisiid,tblKisiler.Ad,tblKisiler.Soyad,tblKisiler.AltınMadalyasayisi,tblKisiler.GumusMadalyaSayisi,tblKisiler.Puan,tblGundemler.Gundemid,tblGundemler.GundemBaslik,tblGundemler.GundemIcerik,tblGundemler.Tarih from tblGundemler inner join tblKisiler on tblGundemler.Yazarid=tblKisiler.Kisiid where Onaylandimi='True' and tblGundemler.Kategoriid={0}  order by Tarih desc", kategoriid);
                }
                else
                {
                    sorgu = string.Format("select tblKisiler.Kisiid,tblKisiler.Ad,tblKisiler.Soyad,tblKisiler.AltınMadalyasayisi,tblKisiler.GumusMadalyaSayisi,tblKisiler.Puan,tblGundemler.Gundemid,tblGundemler.GundemBaslik,tblGundemler.GundemIcerik,tblGundemler.Tarih from tblGundemler inner join tblKisiler on tblGundemler.Yazarid=tblKisiler.Kisiid where Onaylandimi='True' and tblGundemler.Kategoriid={0} and (tblGundemler.GundemBaslik like '%{0}%' or tblGundemler.GundemIcerik like '%{2}%') order by Tarih desc", kategoriid, aranan, aranan);
                }

            }
            adp = new SqlDataAdapter(sorgu, Kullanicilar.Baglan());
            dtGundemBilgi = new DataTable();
            adp.Fill(dtGundemBilgi);
            Kullanicilar.Baglan().Close();
            return dtGundemBilgi;
        }
        public List<Veriler> KategoriGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Kategori from tblKategoriler");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.kategori = okunan["Kategori"].ToString();
                list.Add(veriler);
            }
            return list;

        }
        public List<Veriler> GundemFiltreleGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblKisiler.Kisiid,tblKisiler.AltınMadalyasayisi,tblKisiler.GumusMadalyasayisi,tblGundemler.GoruntulenmeSayisi,tblKisiler.Ad,tblKisiler.Soyad,tblKisiler.Puan,tblGundemler.Tarih,tblGundemler.GundemBaslik,tblGundemler.Gundemid,tblGundemler.GundemIcerik from tblKisiler inner join tblGundemler on tblGundemler.Yazarid=tblKisiler.Kisiid where Gundemid={0}", gundemid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.gundemid = Convert.ToInt32(okunan["Gundemid"]);
                veriler.gundemBaslik = okunan["GundemBaslik"].ToString();
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.altinMadalyaSayisi = (int)okunan["AltınMadalyasayisi"];
                veriler.gumusMadalyaSayisi = (int)okunan["GumusMadalyasayisi"];
                veriler.goruntulenmeSayisi = (int)okunan["GoruntulenmeSayisi"];
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.puan = (int)okunan["Puan"];
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.gundemIcerik = okunan["GundemIcerik"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public bool GundemEkle()
        {
            bool etkilendimi = false;
            sorgu = string.Format("insert into tblGundemler (GundemBaslik,GundemIcerik,Yazarid,Kategoriid) values (@gundemBaslik,@gundemIcerik,@yazarid,@kategoriid)");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            cmd.Parameters.AddWithValue("@gundemBaslik", gundemBaslik);
            cmd.Parameters.AddWithValue("@gundemIcerik", gundemIcerik);
            cmd.Parameters.AddWithValue("@yazarid", yazarid);
            cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
        public string GundemBaslik()
        {
            sorgu = string.Format("select GundemBaslik from tblGundemler where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            string gundembaslik = cmd.ExecuteScalar().ToString();
            Kullanicilar.Baglan().Close();
            return gundembaslik;
        }
        public string GundemIcerik()
        {
            sorgu = string.Format("select GundemIcerik from tblGundemler where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            string gundembaslik = cmd.ExecuteScalar().ToString();
            Kullanicilar.Baglan().Close();
            return gundembaslik;
        }
        public bool GoruntulenmeyiArttir()
        {
            bool durum = false;
            sorgu = string.Format("update tblGundemler set GoruntulenmeSayisi+=1 where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Kullanicilar.Baglan().Close();
            return durum;
        }
        public int GundemGoruntulenmeSayisi()
        {
            sorgu = string.Format("select GoruntulenmeSayisi from tblGundemler where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int gorsayisi = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return gorsayisi;
        }
        public int GundemSayisiDonder()
        {
            sorgu = string.Format("select count(*) from tblGundemler");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int gundemsayisidonder = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return gundemsayisidonder;
        }
        public List<Veriler> KullaniciProfilGundemGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblGundemler.Gundemid,tblGundemler.GundemBaslik,tblGundemler.Tarih,tblKisiler.Kisiid from tblGundemler inner join tblKisiler on tblGundemler.Yazarid=tblKisiler.Kisiid where tblKisiler.Kisiid={0}", kisiid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.gundemid = Convert.ToInt32(okunan["Gundemid"]);
                veriler.gundemBaslik = okunan["GundemBaslik"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> AdminGundemGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblGundemler.Gundemid,tblGundemler.GundemBaslik,tblKisiler.Kisiid,tblKisiler.Ad,tblKisiler.Soyad,tblGundemler.Tarih from tblKisiler inner join tblGundemler on tblKisiler.Kisiid=tblGundemler.Yazarid");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.ad = okunan["Ad"].ToString();
                veriler.soyad = okunan["Soyad"].ToString();
                veriler.gundemBaslik = okunan["GundemBaslik"].ToString();
                veriler.gundemid = (int)okunan["Gundemid"];
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                list.Add(veriler);
            }
            return list;
        }

        public string GundemIcerikGetir()
        {
            sorgu = string.Format("Select GundemIcerik from tblGundemler where Gundemid='{0}'", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            string gundemIcerik = cmd.ExecuteScalar().ToString();
            return gundemIcerik;
        }
        public bool GundemIcerikGuncelle()
        {
            bool durum = false;
            sorgu = string.Format("Update tblGundemler set GundemIcerik='{0}' where Gundemid={1}", gundemIcerik, gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Kullanicilar.Baglan().Close();
            return durum;
        }

        public bool GundemOncedenOnaylandimi()
        {
            bool onaylandimi = false;
            sorgu = string.Format("Select * from tblGundemler where Onaylandimi='True' and Gundemid={0}",gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            SqlDataReader oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                onaylandimi = true;
            }
            Kullanicilar.Baglan().Close();
            return onaylandimi;
        }
        public bool GundemOnayla()
        {
            bool oldumu = false;
            sorgu = string.Format("update tblGundemler set Onaylandimi='True' where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                oldumu = true;
            }
            Kullanicilar.Baglan().Close();
            return oldumu;
        }
        public bool GundemInceleGundemSil()
        {
            bool etkilendimi = false;
            sorgu = string.Format("delete from tblGundemler where Gundemid={0}", gundemid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
        public int GundemIdGetir()
        {
            sorgu = string.Format("Select Gundemid from tblGundemler where Yazarid={0}", kisiid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int kategoriid = Convert.ToInt32(cmd.ExecuteScalar());
            return kategoriid;
        }



        public int GundemIdDonder()
        {
            sorgu = string.Format("select Gundemid from tblGundemler where Yazarid={0}", kisiid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int gundemiddonder = Convert.ToInt32(cmd.ExecuteScalar());
            Kullanicilar.Baglan().Close();
            return gundemiddonder;
        }
        public DataTable GundemIdListeDonder()
        {
            sorgu = string.Format("select Gundemid from tblGundemler where Yazarid={0}", kisiid);
            adp = new SqlDataAdapter(sorgu, Kullanicilar.Baglan());
            DataTable dtGundemIdListe = new DataTable();
            adp.Fill(dtGundemIdListe);
            Kullanicilar.Baglan().Close();
            return dtGundemIdListe;
        }
    }
}