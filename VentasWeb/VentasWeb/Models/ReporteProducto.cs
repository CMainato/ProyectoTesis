using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace VentasWeb.Models
{
    public class ReporteProducto
    {
    //    public string RucTienda { get; set; }
        public string NombreAgencia { get; set; }
        public string DireccionAgencia { get; set; }
        public string CodigoProducto { get; set; }
        public string NombreProducto { get; set; }
        public string DescripcionProducto { get; set; }
        public string StockenAgencia { get; set; }
        public string PrecioCompra { get; set; }
        public string PrecioVenta { get; set; }
    }
}
