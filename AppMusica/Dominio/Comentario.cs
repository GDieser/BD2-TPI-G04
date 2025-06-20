using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Comentario
    {

        public int Id {  get; set; } 
        public long IdUsuario { get; set; }
        public long IdContenido { get; set; }
        
        public string comentario { get; set; }

        public string NombreUsuario { get; set; }
        public DateTime FechaComentario { get; set; }

    }
}
