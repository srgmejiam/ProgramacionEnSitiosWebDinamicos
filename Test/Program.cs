using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EL;
using BL;

namespace Test
{
    internal class Program
    {
        static void Main(string[] args)
        {
            EL_Cliente Cliente = new EL_Cliente();
            Cliente.IdCliente = 1;
            //Cliente.Nombre = "Francisco";
            //Cliente.Celular = "85740619";
            //Cliente.Correo = "marvin.mejia@univalle.edu.ni";
            Cliente.IdUsuarioActualiza = 1;

            int IdCliente = BL_Cliente.DeleteCliente(Cliente);

            Console.WriteLine(IdCliente.ToString());
            Console.ReadLine();

        }
    }
}
