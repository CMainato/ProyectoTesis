using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VentasWeb.Models
{
    public class ProductoAgencia
    {
        public int IdProductoAgencia { get; set; }
        public Producto oProducto { get; set; }
        public Agencia oAgencia { get; set; }
        public int Stock { get; set; }
        public decimal PrecioUnidadCompra { get; set; }
        public decimal PrecioUnidadVenta { get; set; }
        public bool Iniciado { get; set; }
    }
}
