using CapaDatos;
using VentasWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentasWeb.Controllers
{
    public class ProductoController : Controller
    {
        // GET: Producto
        public ActionResult Crear()
        {
            return View();
        }

        // GET: Producto
        public ActionResult Asignar()
        {
            return View();
        }



        public JsonResult Obtener()
        {
            List<Producto> lista = CD_Producto.Instancia.ObtenerProducto();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ObtenerA()
        {
            List<Agencia> olista = CD_Agencia.Instancia.ObtenerAgencia();
            olista = olista.Where(x => x.Activo == true ).ToList();




            return Json(new { data = olista }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult ObtenerE()
        {
            List<Producto> alista = CD_Producto.Instancia.ObtenerProducto();

            alista = alista.Where(x => x.Activo == true ).ToList();
            //|| x.Iniciado==true
            return Json(new { data = alista }, JsonRequestBehavior.AllowGet);

        }
        public JsonResult ObtenerPorAgencia(int IdAgencia)
        {

            List<Producto> oListaProducto = CD_Producto.Instancia.ObtenerProducto();
            List<ProductoAgencia> oListaProductoAgencia = CD_ProductoAgencia.Instancia.ObtenerProductoAgencia();

            oListaProducto = oListaProducto.Where(x => x.Activo == true ).ToList();
            if (IdAgencia != 0)
            {
                oListaProductoAgencia = oListaProductoAgencia.Where(x => x.oAgencia.IdAgencia == IdAgencia ).ToList();
                oListaProducto = (from producto in oListaProducto
                                  join productoagencia in oListaProductoAgencia on producto.IdProducto equals productoagencia.oProducto.IdProducto
                                  where productoagencia.oAgencia.IdAgencia == IdAgencia
                                  select producto).ToList();
            }

            return Json(new { data = oListaProducto }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Guardar(Producto objeto)
        {
            bool respuesta = false;

            if (objeto.IdProducto == 0)
            {

                respuesta = CD_Producto.Instancia.RegistrarProducto(objeto);
            }
            else
            {
                respuesta = CD_Producto.Instancia.ModificarProducto(objeto);
            }


            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult Eliminar(int id = 0)
        {
            bool respuesta = CD_Producto.Instancia.EliminarProducto(id);

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegistrarProductoAgencia(ProductoAgencia objeto)
        {
            bool respuesta = CD_ProductoAgencia.Instancia.RegistrarProductoAgencia(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ModificarProductoAgencia(ProductoAgencia objeto)
        {
            bool respuesta = CD_ProductoAgencia.Instancia.ModificarProductoAgencia(objeto);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult EliminarProductoAgencia(int id)
        {
            bool respuesta = CD_ProductoAgencia.Instancia.EliminarProductoAgencia(id);
            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public JsonResult ObtenerAsignaciones()
        {
            List<ProductoAgencia> lista = CD_ProductoAgencia.Instancia.ObtenerProductoAgencia();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }
    }
}