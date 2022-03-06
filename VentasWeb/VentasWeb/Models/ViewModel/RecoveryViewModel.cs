using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VentasWeb.Models.ViewModel
{
    public class RecoveryViewModel
    {
        [EmailAddress(ErrorMessage = "No es un correo valido")]
        [Required (ErrorMessage ="El campo del correo es necesario")]
        public string Email { get; set; }
    }
}