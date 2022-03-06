using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_ProductoAgencia
    {
        public static CD_ProductoAgencia _instancia = null;

        private CD_ProductoAgencia()
        {

        }

        public static CD_ProductoAgencia Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_ProductoAgencia();
                }
                return _instancia;
            }
        }

        public List<ProductoAgencia> ObtenerProductoAgencia()
        {
            List<ProductoAgencia> rptListaProductoAgencia = new List<ProductoAgencia>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("usp_ObtenerProductoAgencia", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        rptListaProductoAgencia.Add(new ProductoAgencia()
                        {
                            IdProductoAgencia = Convert.ToInt32(dr["IdProductoAgencia"].ToString()),
                            oProducto = new Producto()
                            {
                                IdProducto = Convert.ToInt32(dr["IdProducto"].ToString()),
                                Codigo = dr["CodigoProducto"].ToString(),
                                Nombre = dr["NombreProducto"].ToString(),
                                Descripcion = dr["DescripcionProducto"].ToString(),
                               
                            },
                            oAgencia = new Agencia()
                            {
                                IdAgencia = Convert.ToInt32(dr["IdAgencia"].ToString()),
                               
                                Nombre = dr["NombreAgencia"].ToString(),
                                Direccion = dr["DireccionAgencia"].ToString(),

                            },
                            PrecioUnidadCompra = Convert.ToDecimal(dr["PrecioUnidadCompra"].ToString(), new CultureInfo("es-PE")),
                            PrecioUnidadVenta = Convert.ToDecimal(dr["PrecioUnidadVenta"].ToString(), new CultureInfo("es-PE")),
                            Stock = Convert.ToInt32(dr["Stock"].ToString()),
                            Iniciado = Convert.ToBoolean(dr["Iniciado"].ToString())
                        });
                    }
                    dr.Close();

                    return rptListaProductoAgencia;

                }
                catch (Exception ex)
                {
                    rptListaProductoAgencia = null;
                    return rptListaProductoAgencia;
                }
            }
        }

        public bool RegistrarProductoAgencia(ProductoAgencia oProductoAgencia)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_RegistrarProductoAgencia", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", oProductoAgencia.oProducto.IdProducto);
                    cmd.Parameters.AddWithValue("IdAgencia", oProductoAgencia.oAgencia.IdAgencia);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }

        public bool ModificarProductoAgencia(ProductoAgencia oProductoAgencia)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ModificarProductoAgencia", oConexion);
                    cmd.Parameters.AddWithValue("IdProductoAgencia", oProductoAgencia.IdProductoAgencia);
                    cmd.Parameters.AddWithValue("IdProducto", oProductoAgencia.oProducto.IdProducto);
                    cmd.Parameters.AddWithValue("IdAgencia", oProductoAgencia.oAgencia.IdAgencia);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;

                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public bool EliminarProductoAgencia(int IdProductoAgencia)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_EliminarProductoAgencia", oConexion);
                    cmd.Parameters.AddWithValue("IdProductoAgencia", IdProductoAgencia);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public bool ControlarStock(int IdProducto, int IdAgencia, int Cantidad, bool Restar)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("usp_ControlarStock", oConexion);
                    cmd.Parameters.AddWithValue("IdProducto", IdProducto);
                    cmd.Parameters.AddWithValue("IdAgencia", IdAgencia);
                    cmd.Parameters.AddWithValue("Cantidad", Cantidad);
                    cmd.Parameters.AddWithValue("Restar", Restar);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                }
            }
            return respuesta;
        }
    }
}
