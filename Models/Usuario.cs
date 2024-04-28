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
        public int Estatus { get; set; }
        public string Foto { get; set; }

        public Usuario()
        {
        }


        // Constructor con parámetros
        public Usuario(int idUsuario, int rol, string nombreUsuario, string correo, string contraseña, int estatus, string foto)
        {
            IdUsuario = idUsuario;
            Rol = rol;
            NombreUsuario = nombreUsuario;
            Correo = correo;
            Contraseña = contraseña;
            Estatus = estatus;
            Foto = foto;
        }
        public void SetFromDataRow(DataRow row)
        {
            IdUsuario = Convert.ToInt32(row["id_usuario"]);
            Rol = Convert.ToInt32(row["rol"]);
            NombreUsuario = row["nombre_usuario"].ToString();
            Correo = row["correo"].ToString();
            Contraseña = row["contrasena"].ToString();
            Estatus = Convert.ToInt32(row["estatus"]);
        }

        public bool GuardarUsuario(Usuario usuario)
        {
            if (usuario == null)
            {
                return false;
            }
            NpgsqlParameter correo = new NpgsqlParameter("correo", usuario.Correo);
            NpgsqlParameter contraseña = new NpgsqlParameter("contrasena", usuario.Contraseña);
            NpgsqlParameter estatus = new NpgsqlParameter("estatus", usuario.Estatus = 1);
            NpgsqlParameter nombreUsuario = new NpgsqlParameter("nombreUsuario", usuario.NombreUsuario);
            NpgsqlParameter rol = new NpgsqlParameter("rol", usuario.Rol = 1);
            List<NpgsqlParameter> lts = new List<NpgsqlParameter>
            {
                correo,contraseña,estatus,nombreUsuario,rol
            };
            const string sql = "INSERT INTO usuario (rol,nombre_usuario,correo,contrasena,estatus) VALUES (@rol,@nombreUsuario,@correo,@contrasena,@estatus)";
            int filasAfectadas = ExecuteQuery(sql, lts);
            if (filasAfectadas > 0)
            {
                return true;
            }       
            return false;

        }
        public bool Login(Usuario usuario)
        {
            if(usuario == null)
            {
               return false;
            }
            NpgsqlParameter correo = new NpgsqlParameter("correo", usuario.Correo);
            NpgsqlParameter contrasena = new NpgsqlParameter("contrasena", usuario.Contraseña);
            List<NpgsqlParameter> lts = new List<NpgsqlParameter>
            {
                correo, contrasena
            };
            const string sql = "Select * From usuario where correo = @correo and contrasena = @contrasena and estatus = 1";
            DataTable dt = GetQuery(sql, lts);
            if (dt != null && dt.Rows.Count > 0)
            {
                SetFromDataRow(dt.Rows[0]);
                return true;
            }
   
            return false;
        }
          


}
    }






    


