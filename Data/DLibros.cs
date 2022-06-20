using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kranon.webApp_LibreriaKranon.Data
{
    public class DLibros
    {
        private LKEntities ObjtLibro { get; set; }

        public DLibros()
        {
            ObjtLibro = new LKEntities();
        }


        /// <summary>
        /// Obtiene el registro de un libro por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Libros ObtenerPId(int Id_Libro)
        {
            return ObjtLibro.Libros.Find(Id_Libro);
        }

        /// <summary>
        /// Obtiene todos los registros de libros en la Base de Dados de LibreriaKranon.
        /// </summary>
        /// <returns></returns>
        public List<SP_AllR_Result> Obtener()
        {
            return ObjtLibro.SP_AllR().ToList();
        }

        /// <summary>
        /// Obtiene los registros de libros por autor.
        /// </summary>
        /// <param name="Autor"></param>
        /// <returns></returns>
        public List<SP_Gby_Autor_Result> Obtener(string Autor)
        {
            return ObjtLibro.SP_Gby_Autor(Autor).ToList();
        }

        /// <summary>
        /// Obtiene los registros de libros por año
        /// </summary>
        /// <param name="Anio"></param>
        /// <returns></returns>
        public List<SP_Gby_Anio_Result> Obtener(int Anio)
        {
            return ObjtLibro.SP_Gby_Anio(Anio).ToList();
        }

        /// <summary>
        /// Obtiene los registros de libros por Autor y Año
        /// </summary>
        /// <param name="Autor"></param>
        /// <param name="Anio"></param>
        /// <returns></returns>
        public List<SP_Gby_AutoryAnio_Result> Obtener(string Autor, int Anio)
        {
            return ObjtLibro.SP_Gby_AutoryAnio(Autor, Anio).ToList();
        }

        /// <summary>
        /// Obtiene los registros de libros por titulo.
        /// </summary>
        /// <param name="Titulo"></param>
        /// <returns></returns>
        public List<SP_Gby_Titulo_Result> ObtenerPT(string Titulo)
        {
            return ObjtLibro.SP_Gby_Titulo(Titulo).ToList();
        }

        /// <summary>
        /// Reealiza una consulta a base de datos LibrosKranon para saber si el libro esta registrado.
        /// </summary>
        /// <param name="Titulo"></param>
        /// <returns></returns>
        public bool ExisteLibro(string Titulo)
        {
            bool Existe = false;
            try
            {
                int cfe = ObjtLibro.SP_Gby_Titulo(Titulo).Count();

                Existe = Convert.ToBoolean(cfe);
                return Existe;
            }
            catch (Exception)
            {

                return Existe;
            }
            finally
            {
                ObjtLibro.SaveChanges();
            }
        }

        /// <summary>
        /// Obtiene los registros de libros por Editorial
        /// </summary>
        /// <param name="Editorial"></param>
        /// <returns></returns>
        public List<SP_Gby_Editorial_Result> ObtenerPE(string Editorial)
        {
            return ObjtLibro.SP_Gby_Editorial(Editorial).ToList();
        }

        /// <summary>
        /// Agrega un nuevo registro de libros a la base de datos LibreriaKranon.
        /// </summary>
        /// <param name="li"></param>
        public int Agregar(Libros li)
        {
            int CFA = ObjtLibro.SP_Libro_Ins(li.Autor, li.Titulo, li.anio_publicacion, li.Editorial);
            if (CFA != 1)
            {
                throw new ApplicationException("No se agrego con exito");
            }

            return CFA;
        }

        /// <summary>
        /// Eliminar los registros de libros por autor
        /// </summary>
        /// <param name="Autor"></param>
        public int Eliminar(string Autor)
        {
            int CFA = ObjtLibro.SP_Autor_Eliminar(Autor);
            if (CFA != 1)
            {
                throw new ApplicationException("No se eliminaron los libros por autor");
            }

            return CFA;
        }

        /// <summary>
        /// Eliminar los registros de libros por editorial
        /// </summary>
        /// <param name="Editorial"></param>
        public int EliminarE(string Editorial)
        {
            int CFA = ObjtLibro.SP_Editorial_Eliminar(Editorial);
            if (CFA != 1)
            {
                throw new ApplicationException("No se eliminaron los libros por editorial");
            }

            return CFA;
        }





    }
}
