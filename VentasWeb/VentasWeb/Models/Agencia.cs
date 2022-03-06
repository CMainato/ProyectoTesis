﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace VentasWeb.Models
{

    public class Agencia
    {
        public int IdAgencia { get; set; }
        public string Nombre { get; set; }
      
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public bool Activo { get; set; }
        public DateTime FechaRegistro { get; set; }
    }
}
