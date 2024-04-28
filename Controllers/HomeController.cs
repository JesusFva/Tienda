using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using tienda.Models;

namespace tienda.Controllers
{
    public class HomeController : Controller
    {


        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Usuario usuario) {

            


            return View();
        
        }

       

    }
}
