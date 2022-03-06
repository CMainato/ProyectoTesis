using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace VentasWeb.Models
{
    public class Producto
    {
        public int IdProducto { get; set; }
        public string Codigo { get; set; }
        public int ValorCodigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

        public string CodigoValle { get; set; }
        public string Serie { get; set; }
        public string EstadoEquipo { get; set; }
         
        public int IdCategoria { get; set; }
        public Categoria oCategoria { get; set; }
        public bool Activo { get; set; }

    }
}
