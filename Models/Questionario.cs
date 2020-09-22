using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TemplateBootstrap.Models
{
    public class Questionario
    {
        public int Id { get; set; }
        public string titulo { get; set; }
        public string usuario { get; set; }
        public string data_de_cadastro { get; set; }

        public void Inserir(Questionario questionario)
        {
            try
            {
                var questionarioBD = new BancoDAO();
                questionarioBD.InserirQuestionario(questionario);
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao inserir Questionario: Erro => {ex.Message}");
            }
        }
        public Questionario Carrega(int id)
        {
            try
            {
                var questionarioBD = new BancoDAO();
                return questionarioBD.CarregaQuestionario(id);
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao carregar Questionario: Erro => {ex.Message}");
            }
        }

    }

}