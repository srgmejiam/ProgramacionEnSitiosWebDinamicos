using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Conexion
    {
        private static string NombreApplicacion = "AdministracionClientes";
        private static string Servidor = @"SRG\SQL2019";
        private static string Usuario = "srg";
        private static string Password = "#Mejia#";
        private static string BaseDatos = "Clientes";

        public static string ConexionString(bool SqlAutentication = true)
        {
            SqlConnectionStringBuilder Constructor = new SqlConnectionStringBuilder();
            Constructor.ApplicationName = NombreApplicacion;
            Constructor.DataSource = Servidor;
            Constructor.InitialCatalog= BaseDatos;
            Constructor.IntegratedSecurity = SqlAutentication;
            if (SqlAutentication)
            {
                Constructor.UserID = Usuario;
                Constructor.Password = Password;
            }
            return Constructor.ConnectionString;
        }
    }
}
