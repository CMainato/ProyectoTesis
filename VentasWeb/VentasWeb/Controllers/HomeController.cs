using CapaDatos;
using VentasWeb.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentasWeb;
using VentasWeb.Utilidades;
using System.Configuration;

namespace VentasWeb.Controllers
{
    public class HomeController : Controller

    {
        private static Usuario SesionUsuario;

        DBINVENTARIO1_WEBEntities db = new DBINVENTARIO1_WEBEntities();
        public static string CN = ConfigurationManager.ConnectionStrings["DBINVENTARIO1_WEBEntities"].ConnectionString;

        public ActionResult Index()
        {
            if (Session["Usuario"] != null)
                SesionUsuario = (Usuario)Session["Usuario"];
            else {
                SesionUsuario = new Usuario();
            }
            try
            {
                ViewBag.NombreUsuario = SesionUsuario.Nombres + " " + SesionUsuario.Apellidos;
                ViewBag.RolUsuario = SesionUsuario.oRol.Descripcion;
                ViewBag.Clave = SesionUsuario.Clave;

            }
            catch {

            }

            return View();
        }

      
        public ActionResult Salir()
        {
            Session["Usuario"] = null;
            return RedirectToAction("Index", "Login");
        }
        public ActionResult CambioClave1()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult CambioClave1(USUARIO obj)
        {

            if (obj.newPass == obj.conPass)
            {
                obj.Clave = Encriptar.GetSHA256(obj.Clave);
                var data = db.USUARIOs.Where(obj1 => obj1.Clave == obj.Clave).FirstOrDefault();

                try
                {
                    data.Clave = Encriptar.GetSHA256(obj.conPass);
                }
                catch (Exception )
                {
                    ViewBag.data = "cualquiercosa";
                }
                int mess = db.SaveChanges();

                if (mess == 1)
                {

                    ViewBag.data = "Contraseña actualizada";
                }
                else
                {
                    ViewBag.data = "Contraseña no actualizada";
                }
            }
            else
            {
                ViewBag.data = "Contraseña no son las mismas";
            }

            return View();
        }

    }

}