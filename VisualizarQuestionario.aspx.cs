using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TemplateBootstrap.Models;

namespace TemplateBootstrap
{
    public partial class VisualizarQuestionario : System.Web.UI.Page
    {
        int id_questionario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id_questionario = int.Parse(Request.QueryString["id"]);
                hdfIdQuestionario.Value = id_questionario.ToString();
                Questionario quest = new Questionario();
                quest = quest.Carrega(id_questionario);
                tbxTitulo.Text = quest.titulo.ToString();
                tbxUsuario.Text = quest.usuario.ToString();
                tbxDataCadastro.Text = quest.data_de_cadastro.ToString();

                if (grvRespostas.Rows.Count == 0)
                {
                    lblRespostas.Text = "Questionário sem respostas";
                }
                else
                {
                    lblRespostas.CssClass = "h4";
                }
            }
        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResponderQuestionario?id=" + id_questionario);
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default");
        }
    }
}