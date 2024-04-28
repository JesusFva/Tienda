using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using MapaUttec.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Npgsql;
using NpgsqlTypes;
using static System.Runtime.InteropServices.JavaScript.JSType;
namespace tienda.Models
{

    public class Usuario : Conexion
    {
        public int IdUsuario { get; set; }
        public string Rol { get; set; }
        public string NombreUsuario { get; set; }
        public string Correo { get; set; }
        public string Contraseña { get; set; }
        public bool Estado { get; set; }
        public string Foto { get; set; }

        public Usuario()
        {
        }

        // Constructor con parámetros
        public Usuario(int idUsuario, string rol, string nombreUsuario, string correo, string contraseña, bool estado, string foto)
        {
            IdUsuario = idUsuario;
            Rol = rol;
            NombreUsuario = nombreUsuario;
            Correo = correo;
            Contraseña = contraseña;
            Estado = estado;
            Foto = foto;
        }
    }


}



    


