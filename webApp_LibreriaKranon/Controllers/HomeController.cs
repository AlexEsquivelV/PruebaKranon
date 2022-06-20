using Kranon.webApp_LibreriaKranon.Business;
using Kranon.webApp_LibreriaKranon.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Kranon.webApp_LibreriaKranon.UI.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RegistrosLibros()
        {
            return View();
        }


        public JsonResult Agregar(Libros Li)
        {
            try
            {
                int CFA = new BLibros().Agregar(Li);

                return Json(new { agre = CFA, esError = false }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {

                return Json(new { esError = true, mensaje = ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }

        public JsonResult Obtener()
        {
            List<SP_AllR_Result> Lst = new BLibros().Obtener();
            return Json(Lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPId(int id)
        {
            Libros LibroD = new BLibros().ObtPId(id);
            return Json(LibroD, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPA(string Autor)
        {
            List<SP_Gby_Autor_Result> Lst = new BLibros().Obtener(Autor);
            return Json(Lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObteberPT(string Titulo)
        {
            List<SP_Gby_Titulo_Result> Lts = new BLibros().ObtenerPT(Titulo);
            return Json(Lts, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPAnio(int Anio)
        {
            List<SP_Gby_Anio_Result> Lst = new BLibros().Obtener(Anio);
            return Json(Lst, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ObtenerPE(string Editorial)
        {
            List<SP_Gby_Editorial_Result> Lts = new BLibros().ObtenerPE(Editorial);
            return Json(Lts, JsonRequestBehavior.AllowGet);

        }

        public JsonResult ObtenerPAutorYAnio(string Autor, int Anio)
        {
            List<SP_Gby_AutoryAnio_Result> Lts = new BLibros().Obtener(Autor, Anio);
            return Json(Lts, JsonRequestBehavior.AllowGet);

        }

        public JsonResult EliminarLibro(string Autor)
        {
            int CFA = new BLibros().Eliminar(Autor);
            return Json(CFA, JsonRequestBehavior.AllowGet);
        }

        public JsonResult EliminarEditorial(string Editorial)
        {
            int CFA = new BLibros().EliminarEdi(Editorial);
            return Json(CFA, JsonRequestBehavior.AllowGet);
        }
    }
}