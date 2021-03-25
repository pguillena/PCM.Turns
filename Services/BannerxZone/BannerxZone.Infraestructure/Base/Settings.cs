using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Security.Cryptography;
using System.Text;

namespace BannerxZone.Infraestructure
{
    public class Settings
    {
        private string sConnectionString;
        public string ConnectionString
        {
            get
            {
                return sConnectionString;
            }
            set
            {
                sConnectionString = value;
            }
        }

        public void Save()
        {
            Save("./Settings.avl");
            return;
        }

        public void Save(string Path)
        {
            byte[] bKey = { 4, 4, 7, 2, 0, 3, 6, 5 };
            byte[] bVector = { 0, 9, 6, 7, 0, 3, 8, 2 };
            DESCryptoServiceProvider desCryptoServiceProvider = new DESCryptoServiceProvider();
            try
            {
                using (FileStream fileStream = new FileStream(Path, FileMode.OpenOrCreate, FileAccess.Write))
                {
                    using (CryptoStream cryptoStream = new CryptoStream(fileStream, desCryptoServiceProvider.CreateEncryptor(bKey, bVector), CryptoStreamMode.Write))
                    {
                        BinaryFormatter binaryFormatter = new BinaryFormatter();
                        binaryFormatter.Serialize(cryptoStream, this);
                    }
                }
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo guardar el archivo de configuración: " + Path + "\r\nEl error devuelto fue: " + eXception.Message, eXception);
            }
        }

        public void Load()
        {
            //Load("./Settings.avl");
            //ConnectionString = @"Data Source=LENOVO-PC\MSSQLSERVER1; Initial Catalog=db_pcm_gob_pe_turn; User ID=sa; Password=123456";
            //ConnectionString = @"data source=DESKTOP-9FSTQB2\MSSERVER_FRANCIS; initial catalog = db_pcm_gob_pe_turn; persist security info = True; Integrated Security = SSPI";
            //ConnectionString = "Data Source=LENOVO; Initial Catalog=db_pcm_gob_pe_turn; User ID=sa; Password=15975325";
            ConnectionString = "Data Source=192.168.144.31; Initial Catalog=db_pcm_gob_pe_turn_v6; User ID=sa; Password=12desarrolloA";
            //ConnectionString = "Data Source=PINOSYSTEMS-PC; Initial Catalog=db_pcm_gob_pe_turn; User ID=sa; Password=123456";
            return;
        }

        public void Load(string Path)
        {
            byte[] bKey = { 4, 4, 7, 2, 0, 3, 6, 5 };
            byte[] bVector = { 0, 9, 6, 7, 0, 3, 8, 2 };
            DESCryptoServiceProvider desCryptoServiceProvider = new DESCryptoServiceProvider();
            try
            {
                using (FileStream fileStream = new FileStream(Path, FileMode.Open, FileAccess.Read))
                {
                    using (CryptoStream cryptoStream = new CryptoStream(fileStream, desCryptoServiceProvider.CreateDecryptor(bKey, bVector), CryptoStreamMode.Read))
                    {
                        BinaryFormatter binaryFormatter = new BinaryFormatter();
                        ConnectionString = ((Settings)binaryFormatter.Deserialize(cryptoStream)).ConnectionString;
                    }
                }
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo leer el archivo de configuración: " + Path + "\r\nEl error devuelto fue: " + eXception.Message, eXception);
            }
        }
    }
}
