using VentasWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Agencia
    {
        public static CD_Agencia _instancia = null;

        private CD_Agencia()
        {

        }

        public static CD_Agencia Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Agencia();
                }
                return _instancia;
            }
        }

        public List<Agencia> ObtenerAgencia()
        {
            List<Agencia> rptListaUsuario = new List<Agencia>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerAgencia", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaUsuario.Add(new Agencia()
                        {
                            IdAgencia = Convert.ToInt32(dr["IdAgencia"].ToString()),
                            Nombre = dr["Nombre"].ToString(),
                            
                            Direccion = dr["Direccion"].ToString(),
                            Telefono = dr["Telefono"].ToString(),
                            Activo = Convert.ToBoolean(dr["Activo"].ToString())

                        });
                    }
                    dr.Close();

                    return rptListaUsuario;

                }
                catch (Exception )
                {
                    rptListaUsuario = null;
                    return rptListaUsuario;
                }
            }
        }

        public bool RegistrarAgencia(Agencia oAgencia)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarAgencia", oConexion);
                    cmd.Parameters.AddWithValue("Nombre", oAgencia.Nombre);
                    
                    cmd.Parameters.AddWithValue("Direccion", oAgencia.Direccion);
                    cmd.Parameters.AddWithValue("Telefono", oAgencia.Telefono);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception )
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }


        public bool ModificarAgencia(Agencia oAgencia)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarAgencia", oConexion);
                    cmd.Parameters.AddWithValue("IdAgencia", oAgencia.IdAgencia);
                    cmd.Parameters.AddWithValue("Nombre", oAgencia.Nombre);
                    cmd.Parameters.AddWithValue("Direccion", oAgencia.Direccion);
                    cmd.Parameters.AddWithValue("Telefono", oAgencia.Telefono);
                    cmd.Parameters.AddWithValue("Activo", oAgencia.Activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception )
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public bool EliminarAgencia(int IdAgencia)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarAgencia", oConexion);
                    cmd.Parameters.AddWithValue("IdAgencia", IdAgencia);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception )
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }
    }
}
