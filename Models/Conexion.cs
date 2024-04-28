using Npgsql;
using System.Collections.Generic;
using System.Data;
using MapaUttec.Models;
using System.Configuration;

namespace MapaUttec.Models
{
    public abstract class Conexion
    {
        public static string StrConnection = "Host=localhost;Port=5432;Username=postgres;Password=12345;Database=Tienda;";


        private NpgsqlConnection _connection = new NpgsqlConnection();

        protected Conexion()
        {
            _connection.ConnectionString = StrConnection;
        }



        /// <summary>
        /// Ejecuta una consulta en la base de datos.
        /// </summary>
        /// <param name="sql">Texto de la consulta SQL.</param>
        /// <returns>DataTable con el resultado de la consulta.</returns>
        protected DataTable GetQuery(string sql)
        {
            DataTable table = new DataTable();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter();

            using (_connection = new NpgsqlConnection())
            {
                _connection.ConnectionString = StrConnection;
                using (NpgsqlCommand command = new NpgsqlCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = sql;
                    adapter.SelectCommand = command;
                    adapter.Fill(table);
                }
            }

            return table;
        }

        /// <summary>
        /// Ejecuta una consulta en la base de datos.
        /// </summary>
        /// <param name="sql">Texto de la consulta SQL.</param>
        /// <param name="table">DataTable con la definición de las columnas.</param>
        /// <returns>DataTable con el resultado de la consulta.</returns>
        protected DataTable GetQuery(string sql, DataTable table)
        {
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter();

            using (_connection = new NpgsqlConnection())
            {
                _connection.ConnectionString = StrConnection;
                using (NpgsqlCommand command = new NpgsqlCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = sql;
                    adapter.SelectCommand = command;
                    adapter.Fill(table);
                }
            }

            return table;
        }

        /// <summary>
        /// Ejecuta una consulta en la base de datos.
        /// </summary>
        /// <param name="sql">Texto de la consulta SQL.</param>
        /// <param name="parameters">Lista de parámetros de la consulta.</param>
        /// <returns>DataTable con el resultado de la consulta.</returns>
        protected DataTable GetQuery(string sql, List<NpgsqlParameter> parameters)
        {
            DataTable table = new DataTable();
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter();

            using (_connection = new NpgsqlConnection())
            {
                _connection.ConnectionString = StrConnection;
                using (NpgsqlCommand command = new NpgsqlCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = sql;
                    command.Parameters.Clear();
                    foreach (NpgsqlParameter param in parameters)
                    {
                        command.Parameters.Add(param);
                    }
                    adapter.SelectCommand = command;
                    adapter.Fill(table);
                }
            }
            return table;
        }

        /// <summary>
        /// Ejecuta una consulta en la base de datos.
        /// </summary>
        /// <param name="sql">Texto de la consulta SQL.</param>
        /// <param name="table">DataTable con la definición de las columnas.</param>
        /// <param name="parameters">Lista de parámetros de la consulta.</param>
        /// <returns>DataTable con el resultado de la consulta.</returns>
        protected DataTable GetQuery(string sql, DataTable table, List<NpgsqlParameter> parameters)
        {
            NpgsqlDataAdapter adapter = new NpgsqlDataAdapter();

            using (_connection = new NpgsqlConnection())
            {
                _connection.ConnectionString = StrConnection;
                using (NpgsqlCommand command = new NpgsqlCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = sql;
                    command.Parameters.Clear();
                    foreach (NpgsqlParameter param in parameters)
                    {
                        command.Parameters.Add(param);
                    }
                    adapter.SelectCommand = command;
                    adapter.Fill(table);
                }
            }

            return table;
        }

        /// <summary>
        /// Ejecuta una consulta en la base de datos de inserción, actualización o eliminación.
        /// </summary>
        /// <param name="sql">Texto de la consulta SQL.</param>
        /// <param name="parameters">Lista de parámetros de la consulta.</param>
        /// <returns>Número de filas afectadas.</returns>
        protected int ExecuteQuery(string sql, List<NpgsqlParameter> parameters)
        {
            int rowsAffected;

            using (_connection = new NpgsqlConnection())
            {
                _connection.ConnectionString = StrConnection;
                using (NpgsqlCommand command = new NpgsqlCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = sql;
                    command.Connection.Open();
                    command.Parameters.Clear();
                    foreach (NpgsqlParameter param in parameters)
                    {
                        command.Parameters.Add(param);
                    }
                    rowsAffected = command.ExecuteNonQuery();
                    command.Connection.Close();
                }
            }

            return rowsAffected;
        }

        protected int ExecuteQuery(string sql)
        {
            int rowsAffected;

            using (_connection = new NpgsqlConnection())
            {
                _connection.ConnectionString = StrConnection;
                using (NpgsqlCommand command = new NpgsqlCommand())
                {
                    command.Connection = _connection;
                    command.CommandText = sql;
                    command.Connection.Open();
                    rowsAffected = command.ExecuteNonQuery();
                    command.Connection.Close();
                }
            }
            return rowsAffected;
        }
    }
}