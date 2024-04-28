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
        public int Id_rol { get; set; }
        public string NombreUsuario { get; set; }
        public string Correo { get; set; }
        public string Pass { get; set; }
        public string Estado { get; set; }
        public string Foto { get; set; }

        public Usuario()
        {
        }


        // Constructor con parámetros
        public Usuario(int idUsuario, int id_rol, string nombreUsuario, string correo, string pass, string estado, string foto)
        {
            IdUsuario = idUsuario;
            Id_rol = id_rol;
            NombreUsuario = nombreUsuario;
            Correo = correo;
            Pass = pass;
            Estado = estado;
            Foto = foto;
        }
        public void SetFromDataRow(DataRow row)
        {
            IdUsuario = Convert.ToInt32(row["id_usuario"]);
            Id_rol = Convert.ToInt32(row["id_rol"]);
            NombreUsuario = row["nombre_usuario"].ToString();
            Correo = row["correo"].ToString();
            Pass = row["pass"].ToString();
            Estado = row["estado"].ToString();
        }

        public bool GuardarUsuario(Usuario usuario)
        {
            if (usuario == null)
            {
                return false;
            }
            NpgsqlParameter correo = new NpgsqlParameter("correo", usuario.Correo);
            NpgsqlParameter pass = new NpgsqlParameter("pass", usuario.Pass);
            NpgsqlParameter estado = new NpgsqlParameter("estado", usuario.Estado = "activo");
            NpgsqlParameter nombreUsuario = new NpgsqlParameter("nombreUsuario", usuario.NombreUsuario);
            NpgsqlParameter id_rol = new NpgsqlParameter("id_rol", usuario.Id_rol = 1);
            List<NpgsqlParameter> lts = new List<NpgsqlParameter>
            {
                correo,pass,estado,nombreUsuario,id_rol
            };
            const string sql = "INSERT INTO usuario (id_rol,nombre_usuario,correo,pass,estado) VALUES (@id_rol,@nombreUsuario,@correo,@pass,@estado)";
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
            NpgsqlParameter pass = new NpgsqlParameter("pass", usuario.Pass);
            List<NpgsqlParameter> lts = new List<NpgsqlParameter>
            {
                correo, pass
            };
            const string sql = "Select * From usuario where correo = @correo and pass = @pass and estado = 'activo'";
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






    


