using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using tienda.Models;
using System.Diagnostics;

namespace tienda.Controllers
{
    public class UsuarioController : Controller {


        // Acción para mostrar todos los usuarios
        public IActionResult Index()
        {
        
            return View();
        }
        [HttpPost]
        public ActionResult Index(Usuario usuario)
        {
            if (usuario.Login(usuario))
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewData["Mensaje"] = "Verifique su correo o su contraseña";
                return View(usuario);
            }
          
        }


        // Acción para mostrar detalles de un usuario específico

    }
}
