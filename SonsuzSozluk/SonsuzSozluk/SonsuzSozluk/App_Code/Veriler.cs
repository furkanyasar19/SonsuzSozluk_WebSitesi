using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace SonsuzSozluk.App
{
    public class Veriler
    {
        public int gundemid { get; set; }
        public string gundemBaslik { get; set; }
        public string kategori { get; set; }
        public int kisiid { get; set; }
        public int altinMadalyaSayisi { get; set; }
        public int gumusMadalyaSayisi { get; set; }
        public int goruntulenmeSayisi { get; set; }
        public string ad { get; set; }
        public string soyad { get; set; }
        public int puan { get; set; }
        public DateTime tarih { get; set; }
        public string gundemIcerik { get; set; }
        public string yorum { get; set; }
        public string mail { get; set; }
        public string not { get; set; }
        public int yorumid { get; set; }

        public SqlDataReader VeriOku(string sorgu)
        {
            SqlCommand cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            return cmd.ExecuteReader();
        }
    }
}