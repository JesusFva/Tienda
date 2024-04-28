using Microsoft.AspNetCore.Mvc;
using tienda.Models;

namespace tienda.Controllers
{
    public class CrearUsuarioController : Controller
    {
        public IActionResult Index()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Index(Usuario usuario)
        {
            if (usuario.GuardarUsuario(usuario))
            {
                ViewData["Mensaje"] = "1";
                return View();
            }
            ViewData["Mensaje"] = "2";
            return View(usuario);
        }
    }
}
