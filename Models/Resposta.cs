using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TemplateBootstrap.Models
{
    public class Resposta
    {
        public int Id { get; set; }
        public string resposta { get; set; }
        public string data_de_cadastro { get; set; }
        public string localizacao_lat_long { get; set; }
        public int id_questionario { get; set; }
        public void Inserir(Resposta resposta)
        {
            try
            {
                var respostaBD = new BancoDAO();
                respostaBD.InserirResposta(resposta);
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao inserir Resposta: Erro => {ex.Message}");
            }
        }
        public Resposta Carrega(int id)
        {
            try
            {
                var respostaBD = new BancoDAO();
                return respostaBD.CarregaResposta(id);
            }
            catch (Exception ex)
            {
                throw new Exception($"Erro ao carregar Resposta: Erro => {ex.Message}");
            }
        }
    }
}