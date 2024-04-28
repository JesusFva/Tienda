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
        Usuario usuario = new Usuario();
        usuario.NombreUsuario = "Cristian";
        usuario.Correo = "admin@example.com";
        
            ViewData["lista"] = usuario;
            return View(usuario);
        }

        // Acción para mostrar detalles de un usuario específico

    }
}
