using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace VentasWeb.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Correo { get; set; }
        public string NombreUsuario { get; set; }
        public string Clave { get; set; }
        public int IdAgencia { get; set; }
        public Agencia oAgencia { get; set; }
        public int IdRol { get; set; }
        public Rol oRol { get; set; }
        public List<Menu> oListaMenu { get; set; }
        public bool Activo { get; set; }

      
        public string newPass { get; set; }
        public string conPass { get; set; }
        public DateTime FechaRegistro { get; set; }

    }
}
