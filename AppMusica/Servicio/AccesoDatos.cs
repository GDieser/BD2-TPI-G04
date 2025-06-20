using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=BD2_TPI_G04; integrated security=true");
            comando = new SqlCommand();

        }
        public object ejecutarEscalar()
        {
            try
            {
                comando.Connection = conexion;
                conexion.Open();
                return comando.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public object ObtenerValor(string consulta, List<SqlParameter> parametros)
        {
            try
            {
                comando.Parameters.Clear();
                comando.CommandText = consulta;
                comando.CommandType = CommandType.Text;

                if (parametros != null)
                    comando.Parameters.AddRange(parametros.ToArray());

                return ejecutarEscalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conexion.State == ConnectionState.Open)
                    conexion.Close();
            }
        }

        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public void setConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void setParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexion;

            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                abrirConexion();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void cerrarConexion()
        {
            if (lector != null)
            {
                lector.Close();
            }

            conexion.Close();
        }

        public void limpiarParametros()
        {
            comando.Parameters.Clear();
        }

        public void abrirConexion()
        {
            if (conexion.State != ConnectionState.Open)
                conexion.Open();
        }

        public DataTable ObtenerTabla(string query, List<SqlParameter> parametros = null)
        {
            DataTable tabla = new DataTable();

            try
            {
                if (conexion.State != ConnectionState.Open)
                    conexion.Open();

                using (SqlCommand comando = new SqlCommand(query, conexion))
                {
                    if (parametros != null)
                    {
                        comando.Parameters.AddRange(parametros.ToArray());
                    }

                    using (SqlDataAdapter adaptador = new SqlDataAdapter(comando))
                    {
                        adaptador.Fill(tabla);
                    }
                }

            }
            catch (SqlException ex)
            {
                throw new Exception("Error al obtener datos desde la base de datos: " + ex.Message, ex);
            }
            return tabla;
        }

        public bool EjecutarConsulta(string query, List<SqlParameter> parametros = null)
        {
            try
            {
                if (conexion.State != ConnectionState.Open)
                    conexion.Open();

                using (SqlCommand comando = new SqlCommand(query, conexion))
                {
                    if (parametros != null)
                    {
                        comando.Parameters.AddRange(parametros.ToArray());
                    }

                    int filasAfectadas = comando.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
            catch (SqlException ex)
            {
                throw new Exception("Error al ejecutar la consulta en la base de datos: " + ex.Message, ex);
            }
            finally
            {
                if (conexion.State == ConnectionState.Open)
                    conexion.Close();
            }
        }

        public string EjecutarSPConMensaje(string nombreSP, List<SqlParameter> parametros = null)
        {
            try
            {
                if (conexion.State != ConnectionState.Open)
                    conexion.Open();

                using (SqlCommand comando = new SqlCommand(nombreSP, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                    if (parametros != null)
                    {
                        comando.Parameters.AddRange(parametros.ToArray());
                    }


                    string mensajeSalida = "";


                    conexion.InfoMessage += (sender, e) =>
                    {
                        foreach (SqlError info in e.Errors)
                        {
                            mensajeSalida += info.Message + "\n";
                        }
                    };

                    comando.ExecuteNonQuery();

                    return mensajeSalida.Trim();
                }
            }
            catch (SqlException ex)
            {
                throw new Exception($"Error al ejecutar el stored procedure '{nombreSP}': {ex.Message}", ex);
            }
            finally
            {
                if (conexion.State == ConnectionState.Open)
                    conexion.Close();
            }
        }

        public object EjecutarConsultaEscalar(string query, List<SqlParameter> parametros = null)
        {
            try
            {
                if (conexion.State != ConnectionState.Open)
                    conexion.Open();

                using (SqlCommand comando = new SqlCommand(query, conexion))
                {
                    if (parametros != null)
                    {
                        comando.Parameters.AddRange(parametros.ToArray());
                    }
                    return comando.ExecuteScalar();
                }
            }
            catch (SqlException ex)
            {
                throw new Exception("Error en la consulta SQL: " + ex.Message, ex);
            }
            finally
            {
                if (conexion.State == ConnectionState.Open)
                    conexion.Close();
            }
        }

    }
}

