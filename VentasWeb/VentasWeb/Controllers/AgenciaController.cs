using CapaDatos;
using VentasWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class AgenciaController : Controller
    {
        // GET: Tienda
        public ActionResult Crear()
        {
            return View();
        }

        public JsonResult Obtener()
        {
            List<Agencia> lista = CD_Agencia.Instancia.ObtenerAgencia();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }
    
        [HttpPost]
        public JsonResult Guardar(Agencia objeto)
        {
            bool respuesta = false;

            if (objeto.IdAgencia == 0)
            {

                respuesta = CD_Agencia.Instancia.RegistrarAgencia(objeto);
            }
            else
            {
                respuesta = CD_Agencia.Instancia.ModificarAgencia(objeto);
            }


            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Agencia.Instancia.EliminarAgencia(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }
    }
}