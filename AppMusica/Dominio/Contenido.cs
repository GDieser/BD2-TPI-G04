using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Contenido
    {
        public long Id {  get; set; }
        public string Titulo {  get; set; }
        public int IdTipoContenido {  get; set; }
        public long IdAlbum {  get; set; }
        public int IdGenero {  get; set; }
        public long IdProductora {  get; set; }
        public DateTime FechaLanzamiento {  get; set; }
        public int Duracion {  get; set; }
        public string Portada {  get; set; }
        public DateTime FechaSubida {  get; set; }
        public long IdUsuarioDueño {  get; set; }
        public string FormatoArchivo {  get; set; }
        public string Descripcion {  get; set; }
        public bool Activo {  get; set; }
        public int ContadorReproducciones {  get; set; }
    }
}
