using EL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BL
{
    public static class BL_Cliente
    {
        public static int InsertCliente(EL_Cliente Entidad)
        {
            return DAL_Cliente.InsertCliente(Entidad);
        }
        public static int UpdateCliente(EL_Cliente Entidad)
        {
            return DAL_Cliente.UpdateCliente(Entidad);
        }
        public static int DeleteCliente(EL_Cliente Entidad)
        {
            return DAL_Cliente.DeleteCliente(Entidad);
        }
        public static DataTable SelectCliente(int IdCliente = 0)
        {
            return DAL_Cliente.SelectCliente(IdCliente);
        }
    }
}
