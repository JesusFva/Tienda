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
        public int Rol { get; set; }
        public string NombreUsuario { get; set; }
        public string Correo { get; set; }
        public string Contraseña { get; set; }
        public bool Estatus { get; set; }
        public string Foto { get; set; }

        public Usuario()
        {
        }

        // Constructor con parámetros
        public Usuario(int idUsuario, int rol, string nombreUsuario, string correo, string contraseña, bool estatus, string foto)
        {
            IdUsuario = idUsuario;
            Rol = rol;
            NombreUsuario = nombreUsuario;
            Correo = correo;
            Contraseña = contraseña;
            Estatus = estatus;
            Foto = foto;
        }

        public bool GuardarUsuario(Usuario usuario)
        {
            if (usuario == null)
            {
                return false;
            }
            NpgsqlParameter correo = new NpgsqlParameter("correo", usuario.Correo);
            NpgsqlParameter contraseña = new NpgsqlParameter("contrasena", usuario.Contraseña);
            NpgsqlParameter estatus = new NpgsqlParameter("estatus", usuario.Estatus = true);
            NpgsqlParameter nombreUsuario = new NpgsqlParameter("nombreUsuario", usuario.NombreUsuario);
            NpgsqlParameter rol = new NpgsqlParameter("rol", usuario.Rol = 1);
            List<NpgsqlParameter> lts = new List<NpgsqlParameter>
            {
                correo,contraseña,estatus,nombreUsuario,rol, nombreUsuario
            };
            const string sql = "INSERT INTO usuario (rol,nombre_usuario,correo,contrasena,estatus) VALUES (@rol, @nombreUsuario, @correo,@contrasena,@estatus)";
            int filasAfectadas = ExecuteQuery(sql, lts);
            if (filasAfectadas > 0)
                return true;
            return false;

        }
        public bool login(Usuario usuario)
        {
            if(usuario == null)
            {
               return false;
            }

            return true;
        }


        }
    }






    


