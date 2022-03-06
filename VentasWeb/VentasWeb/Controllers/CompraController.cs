using CapaDatos;
using VentasWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class CompraController : Controller
    {
        private static Usuario SesionUsuario;
        // GET: Compra
        public ActionResult Crear()
        {
            SesionUsuario = (Usuario)Session["Usuario"];
            return View();
        }
        // GET: Compra
        public ActionResult Consultar()
        {
            return View();
        }

        public JsonResult ObtenerA()
        {
            List<Agencia> olista = CD_Agencia.Instancia.ObtenerAgencia();
            olista = olista.Where(x => x.Activo == true).ToList();




            return Json(new { data = olista }, JsonRequestBehavior.AllowGet);

        }
        public JsonResult ObtenerP()
        {
            List<Proveedor> olista = CD_Proveedor.Instancia.ObtenerProveedor();
            olista = olista.Where(x => x.Activo == true).ToList();




            return Json(new { data = olista }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult Documento(int idcompra = 0)
        {

            Compra oCompra = CD_Compra.Instancia.ObtenerDetalleCompra(idcompra);

            if (oCompra == null)
            {
                oCompra = new Compra();
            }


            return View(oCompra);
        }


        public JsonResult Obtener(string fechainicio, string fechafin, int idproveedor, int idagencia)
        {
            List<Compra> lista = CD_Compra.Instancia.ObtenerListaCompra(Convert.ToDateTime(fechainicio), Convert.ToDateTime(fechafin), idproveedor, idagencia);
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Guardar(string xml)
        {
            xml = xml.Replace("!idusuario¡", SesionUsuario.IdUsuario.ToString());

            bool respuesta = CD_Compra.Instancia.RegistrarCompra(xml);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }



    }
}