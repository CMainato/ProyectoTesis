using VentasWeb.Controllers;
using VentasWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using VentasWeb.Utilidades;
using CapaDatos;

namespace VentasWeb.Controllers
{
    public class LoginController : Controller
    {
        string urlDomain = "http://localhost:64927/";

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult StartRecovery()
        {
            Models.ViewModel.RecoveryViewModel model = new Models.ViewModel.RecoveryViewModel();
            return View(model);
        }
        [HttpPost]
        public ActionResult StartRecovery(Models.ViewModel.RecoveryViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return View(model);
            }

            string token = GetSha256(Guid.NewGuid().ToString());

            using (Models.DBINVENTARIO1_WEBEntities db = new Models.DBINVENTARIO1_WEBEntities())
            {
                var oUser = db.USUARIOs.Where(d => d.Correo == model.Email).FirstOrDefault();
                if (oUser != null)
                {
                    oUser.token_recovery = token;
                    db.Entry(oUser).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    ViewBag.Message = "Si tu correo electronico ingresado es correcto te llegara un mensaje para recuperar tu contraseña. ";
                    //enviar mail
                    SendEmail(oUser.Correo, token);
                }
            }

            return View();

        }

        #region HELPERS
        private string GetSha256(string str)
        {
            SHA256 sha256 = SHA256Managed.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }

        [HttpGet]
        public ActionResult Recovery(string token)
        {
            Models.ViewModel.RecoveryPasswordViewModel model = new Models.ViewModel.RecoveryPasswordViewModel();
            model.token = token;
            using (Models.DBINVENTARIO1_WEBEntities db = new Models.DBINVENTARIO1_WEBEntities())
            {
                if (model.token == null || model.token.Trim().Equals(""))
                {
                    return View("Index");
                }
                var oUser = db.USUARIOs.Where(d => d.token_recovery == model.token).FirstOrDefault();
                if (oUser == null)
                {
                    ViewBag.Error = "Tu token ha expirado";
                    return View("Index");

                }
            }


            return View(model);
        }
        [HttpPost]
        public ActionResult Recovery(Models.ViewModel.RecoveryPasswordViewModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(model);
                }

                using (Models.DBINVENTARIO1_WEBEntities db = new Models.DBINVENTARIO1_WEBEntities())
                {
                    var oUser = db.USUARIOs.Where(d => d.token_recovery == model.token).FirstOrDefault();

                    if (oUser != null)
                    {

                        oUser.Clave = Encriptar.GetSHA256(model.Password);

                        oUser.token_recovery = null;
                        db.Entry(oUser).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            ViewBag.Message = "Contraseña modificada con éxito";
            return View("Index");
        }

        private void SendEmail(string EmailDestino, string token)
        {
            string EmailOrigen = "pepepecaspicapapasconunpico666@gmail.com";
            string Contraseña = "entra123";
            string url = urlDomain + "/Login/Recovery/?token=" + token;
            MailMessage oMailMessage = new MailMessage(EmailOrigen, EmailDestino, "Recuperación de contraseña Sistema Vallentos",
                "<p>Correo para recuperación de contraseña. Si tu no solisitaste este correo, porfavor comunicate con el administrador.</p><br>" +
                "<a href='" + url + "'>Click para recuperar</a>");

            oMailMessage.IsBodyHtml = true;

            SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
            oSmtpClient.EnableSsl = true;
            oSmtpClient.UseDefaultCredentials = true;
            oSmtpClient.Credentials = new System.Net.NetworkCredential(EmailOrigen, Contraseña);
            oSmtpClient.Port = 587;


            oSmtpClient.Send(oMailMessage);

            oSmtpClient.Dispose();
        }
        #endregion


        [HttpPost]
        public ActionResult Index(string correo, string clave)
        {

            Usuario ousuario = CD_Usuario.Instancia.ObtenerUsuarios().Where
                (u => u.Correo == correo && u.Clave == Encriptar.GetSHA256(clave)).FirstOrDefault();
            //  Encriptar.GetSHA256(clave)).FirstOrDefault();||



            if (ousuario == null)
            {
                ViewBag.Message = "Usuario o contraseña incorrecta";

                return View();
            }
            else if (ousuario.Activo == false)
            {
                ViewBag.Message = "Usuario o contraseña incorrecta";

                return View();
            }

            Session["Usuario"] = ousuario;

            return RedirectToAction("Index", "Home");
        }
    }

}