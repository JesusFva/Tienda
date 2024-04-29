using Microsoft.AspNetCore.Mvc;
using tienda.Models;

namespace tienda.Controllers
{
    public class MenuController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    


    }
}
