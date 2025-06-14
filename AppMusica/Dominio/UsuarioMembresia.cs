using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class UsuarioMembresia
    {
        public long IdUsuario {  get; set; }
        public int IdTipoMembresia { get; set; }

        public DateTime? FechaInicio { get; set; }

        public DateTime? FechaVencimiento { get; set; }

        public bool Activa { get; set; }
    }
}
