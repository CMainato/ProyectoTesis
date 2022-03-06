using VentasWeb.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;


namespace VentasWeb.Controllers
{
    public class CambioClaveController : Controller
    {
        // GET: CambioClave
        [HttpGet]
        public ActionResult CambioClave( )
        {
            return View();
        }

   
    }

  
}
     //   [HttpPost]
     //   public async Task<ActionResult> CambioClave (ChangePasswordViewModel model)
      //  {
         //   if (ModelState.IsValid)
       //     {
                // var user = await Usuario.GetUserAsync(User);
                 //  if (user == null)
              //  {
               //     return RedirectToAction("Login");
                //}

                // ChangePasswordAsync changes the user password
               //   var result = await userManager.ChangePasswordAsync(user,
               //      model.CurrentPassword, model.NewPassword);

                // The new password did not meet the complexity rules or
                // the current password is incorrect. Add these errors to
                // the ModelState and rerender ChangePassword view
              //   if (!result.Succeeded)
             //   {
                  //      foreach (var error in result.Errors)
                 //   {
                 //             ModelState.AddModelError(string.Empty, error.Description);
                 //   }
               //         return View();
               // }
//
                // Upon successfully changing the password refresh sign-in cookie
              //   await SignInManager.RefreshSignInAsync(user);
              //   return View("ChangePasswordConfirmation");
           // }

        //   return View(model);
     //   }
  //  }
//}