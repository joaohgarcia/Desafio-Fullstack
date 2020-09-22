using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TemplateBootstrap.Models;

namespace TemplateBootstrap
{
    public partial class NovoQuestionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvarQuestionario_Click(object sender, EventArgs e)
        {
            Questionario questionario = new Questionario
            {
                titulo = tbxTitulo.Text,
                usuario = tbxUsuario.Text,
                data_de_cadastro = tbxDataCadastro.Text,
            };
            questionario.Inserir(questionario);
            Response.Redirect("Default.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default");
        }
    }
}