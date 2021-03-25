using Service.Infraestructure;
using Service.Infraestructure.Implementation;
using System;

namespace Turn.Tester
{
    class Program
    {
        static void Main(string[] args)
        {
            Settings settings = new Settings();
            //settings.ConnectionString = "Data Source=192.168.144.31; Initial Catalog=db_pcm_gob_pe_macexpress; User ID=usr_pcm_gob_pe_macexpress; Password=usr_pcm_gob_pe_macexpress";
            settings.Save();
            settings.Load();
            Console.WriteLine(settings.ConnectionString);
            //SQLServer sqlServer = new SQLServer("Data Source=192.168.144.31; Initial Catalog=db_pcm_gob_pe_macexpress; User ID=usr_pcm_gob_pe_macexpress; Password=usr_pcm_gob_pe_macexpress");
            //SQLServer sqlServer = new SQLServer();
            //Console.WriteLine(sqlServer.ReadOneValue("SELECT TOP 1 nvName FROM MasService"));
        }
    }
}
