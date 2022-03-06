
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VentasWeb.Models.ViewModel
{
    public class RecoveryPasswordViewModel
    {
        public string token { get; set; }
        [Display(Name = "Nueva contraseña")]
        [Required(ErrorMessage = "Debes ingresar una nueva contraseña")]
        [StringLength(6, ErrorMessage = "La contraseña debe tener minimo 6 caracteres")]
        [RegularExpression("(?=.*[a - z])(?=.{8,}))", ErrorMessage = "La contraseña debe contener caracteres especiles")]
        public string Password { get; set; }
        [Display(Name = "Repetir contraseña")]
        [Compare("Password", ErrorMessage = "Las contraseñas no son iguales")]
        [StringLength(6, ErrorMessage = "La contraseña debe tener minimo 6 caracteres")]
        [Required(ErrorMessage = "Debes ingresar una nueva contraseña")]
        [RegularExpression("(?=.*[a - z])(?=.{8,}))", ErrorMessage = "La contraseña debe contener caracteres especiles")]
        public string Password2 { get; set; }
    }
}