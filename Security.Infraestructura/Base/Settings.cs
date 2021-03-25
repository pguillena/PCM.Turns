using System;
using System.Collections.Generic;
using System.Text;

namespace Security.Infraestructure.Base
{
    [Serializable]
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
        public void Load()
        {
            //Load("./Settings.avl");
            //ConnectionString = @"Data Source=LENOVO-PC\MSSQLSERVER1; Initial Catalog=db_pcm_gob_pe_turn; User ID=sa; Password=123456";
            //ConnectionString = @"data source=DESKTOP-9FSTQB2\MSSERVER_FRANCIS; initial catalog = db_pcm_gob_pe_turn; persist security info = True; Integrated Security = SSPI";
            //ConnectionString = "Data Source=LENOVO; Initial Catalog=db_pcm_gob_pe_turn; User ID=sa; Password=15975325";
            //ConnectionString = "Data Source=192.168.144.31; Initial Catalog=db_pcm_gob_pe_turn_v6; User ID=sa; Password=12desarrolloA";
            //ConnectionString = "Data Source=PINOSYSTEMS-PC; Initial Catalog=db_pcm_gob_pe_turn; User ID=sa; Password=123456";
            ConnectionString = "Data Source=localhost; Initial Catalog=db_cyper_sale; User ID=sa; Password=A12345$";

            return;
        }
    }
}
