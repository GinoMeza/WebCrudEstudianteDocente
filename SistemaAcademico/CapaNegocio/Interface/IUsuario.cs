using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;

namespace CapaNegocio.Interface
{
    internal interface IUsuario
    {
        bool Login(Usuario usuario);
    }
}
