﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDato;
using CapaEntidad;

namespace CapaNegocio
{
    public class DocenteBL
    {
        private Datos datos = new DatosSQL();

        public string Mensaje { get; set; }

        public DataTable Listar()
        {
            return datos.TraerDataTable("spListarDocente");
        }

        public bool Agregar(Docente docente)
        {
            DataRow fila = datos.TraerDataRow("spAgregarDocente", docente.CodDocente, docente.APaterno, docente.AMaterno, docente.Nombres, docente.CodUsuario, docente.Contrasena);
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Eliminar(string codDocente)
        {
            DataRow fila = datos.TraerDataRow("spEliminarDocente", codDocente);
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Actualizar(Docente docente)
        {
            DataRow fila = datos.TraerDataRow("spActualizarDocente", docente.CodDocente, docente.APaterno, docente.AMaterno, docente.Nombres);
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            return codError == 0;
        }

        public DataTable Buscar(string codDocente)
        {
            return datos.TraerDataTable("spBuscarDocente", codDocente);
        }
    }
}
