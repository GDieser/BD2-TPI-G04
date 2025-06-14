using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public long Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string Pais { get; set; }
        public string FotoPerfil { get; set; }
        public int IdIdioma { get; set; }
        public int IdRol { get; set; }
        public UsuarioMembresia EstadoMembresia { get; set; }
        public bool Membresia {  get; set; }

    }
}


