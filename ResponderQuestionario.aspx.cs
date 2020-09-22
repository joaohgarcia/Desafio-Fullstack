using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TemplateBootstrap.Models;

namespace TemplateBootstrap
{
    public partial class ResponderQuestionario : System.Web.UI.Page
    {
        int id_questionario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id_questionario = int.Parse(Request.QueryString["id"]);
                Questionario quest = new Questionario();
                quest = quest.Carrega(id_questionario);
                tbxTitulo.Text = quest.titulo.ToString();
                tbxUsuario.Text = quest.usuario.ToString();
                tbxDataCadastro.Text = quest.data_de_cadastro.ToString();
            }
        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Resposta resposta = new Resposta
            {
                resposta = tbxResposta.Text,
                data_de_cadastro = tbxRespDataCadastro.Text,
                localizacao_lat_long = tbxLocalizacaoLL.Text,
                id_questionario = id_questionario
            };
            resposta.Inserir(resposta);
            Response.Redirect("VisualizarQuestionario?id=" + id_questionario);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (id_questionario != 0)
            {
            Response.Redirect("VisualizarQuestionario?id=" + id_questionario);
            }
            else
            {
                Response.Redirect("Default");
            }
        }
    }
}