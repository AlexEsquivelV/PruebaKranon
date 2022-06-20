using Kranon.webApp_LibreriaKranon.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kranon.webApp_LibreriaKranon.Business
{
    public class BLibros
    {
        private DLibros ObjtLibro { get; set; }

        public BLibros()
        {
            ObjtLibro = new DLibros();
        }

        public Libros ObtPId(int Id_Libro)
        {
            return ObjtLibro.ObtenerPId(Id_Libro);
        }

        public List<SP_AllR_Result> Obtener()
        {
            try
            {
                List<SP_AllR_Result> Lts = ObjtLibro.Obtener();
                return Lts;
            }
            catch (Exception)
            {

                List<SP_AllR_Result> Lts = new List<SP_AllR_Result>();
                return Lts;
            }
        }

        public List<SP_Gby_Anio_Result> Obtener(int Anio)
        {
            try
            {
                List<SP_Gby_Anio_Result> Lts = ObjtLibro.Obtener(Anio);
                return Lts;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<SP_Gby_AutoryAnio_Result> Obtener(string Autor, int Anio)
        {
            try
            {
                List<SP_Gby_AutoryAnio_Result> Lts = ObjtLibro.Obtener(Autor, Anio);
                return Lts;
            }
            catch (Exception)
            {

                List<SP_Gby_AutoryAnio_Result> Lts = new List<SP_Gby_AutoryAnio_Result>();

                return Lts;
            }
        }

        public List<SP_Gby_Autor_Result> Obtener(string Autor)
        {
            try
            {
                List<SP_Gby_Autor_Result> Lst = ObjtLibro.Obtener(Autor);
                return Lst;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<SP_Gby_Editorial_Result> ObtenerPE(string Editorial)
        {
            try
            {
                List<SP_Gby_Editorial_Result> Lts = ObjtLibro.ObtenerPE(Editorial);
                return Lts;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SP_Gby_Titulo_Result> ObtenerPT(string Titulo)
        {
            try
            {
                List<SP_Gby_Titulo_Result> Lst = ObjtLibro.ObtenerPT(Titulo);
                return Lst;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void ExisteLibro(string Titulo)
        {
            bool Existe = ObjtLibro.ExisteLibro(Titulo);

            if (Existe == true)
                throw new ApplicationException(string.Format("Ya hay registro de un libro con el ttulo: {0}", Titulo));
        }

        public int Agregar(Libros Li)
        {
            ExisteLibro(Li.Titulo);

            try
            {
                int CFA = ObjtLibro.Agregar(Li);
                return CFA;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        public int Eliminar(string Autor)
        {
            int CFA = ObjtLibro.Eliminar(Autor);
            return CFA;
        }

        public int EliminarEdi(string Editorial)
        {
            int CFA = ObjtLibro.EliminarE(Editorial);
            return CFA;
        }
    }
}
