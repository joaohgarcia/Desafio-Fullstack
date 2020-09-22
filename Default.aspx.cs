using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TemplateBootstrap
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (grvListagem.Rows.Count == 0)
            {
                grvListagem.Visible = false;
                lblInicio.Text = "Não existem questionários cadastrados";
                lblInicio.Visible = true;
            }
        }

        protected void btnNovoQuestionario_Click(object sender, EventArgs e)
        {
            Response.Redirect("NovoQuestionario.aspx");
        }

        protected void grvListagem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "visualizar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string id_questionario = ((Label)grvListagem.Rows[index].FindControl("lblID")).Text;
                Response.Redirect("VisualizarQuestionario?id=" + id_questionario);
            }
        }
    }
}