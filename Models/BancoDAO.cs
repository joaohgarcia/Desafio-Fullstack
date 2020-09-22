using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TemplateBootstrap.Models
{
    public class BancoDAO
    {
        private string stringConexao = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private IDbConnection conexao;
        public Questionario CarregaQuestionario(int id)
        {
            using (SqlConnection conexao = new SqlConnection(stringConexao))
            {
                conexao.Open();
                IDbCommand selectCmd = conexao.CreateCommand();
                Questionario quest = new Questionario();
                try
                {
                    selectCmd.CommandText = $@"SELECT * FROM Questionario
                    WHERE Id = {id}";
                    IDataReader resultado = selectCmd.ExecuteReader();

                    while (resultado.Read())
                    {
                        quest.titulo = Convert.ToString(resultado["titulo"]);
                        quest.usuario = Convert.ToString(resultado["usuario"]);
                        quest.data_de_cadastro = Convert.ToString(resultado["data_de_cadastro"]);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Commit Exception Type: {0}", ex.GetType());
                    Console.WriteLine("  Message: {0}", ex.Message);
                }
                return quest;
            }
        }
        public Resposta CarregaResposta(int id)
        {
            using (SqlConnection conexao = new SqlConnection(stringConexao))
            {
                conexao.Open();
                IDbCommand selectCmd = conexao.CreateCommand();
                Resposta resp = new Resposta();
                try
                {
                    selectCmd.CommandText = $@"SELECT * FROM Resposta
                    WHERE id_questionario = {id}";
                    IDataReader resultado = selectCmd.ExecuteReader();

                    while (resultado.Read())
                    {
                        resp.resposta = Convert.ToString(resultado["resposta"]);
                        resp.data_de_cadastro = Convert.ToString(resultado["data_de_cadastro"]);
                        resp.localizacao_lat_long = Convert.ToString(resultado["localizacao_lat_long"]);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Commit Exception Type: {0}", ex.GetType());
                    Console.WriteLine("  Message: {0}", ex.Message);
                }
                return resp;
            }
        }
        public BancoDAO()
        {
            conexao = new SqlConnection(stringConexao);
            conexao.Open();
        }
        public void InserirQuestionario(Questionario questionario)
        {
            IDbCommand insertCmd = conexao.CreateCommand();
            insertCmd.CommandText = "insert into Questionario (titulo, usuario, data_de_cadastro) values (@titulo, @usuario, @data_de_cadastro)";

            IDbDataParameter paramTitulo = new SqlParameter("titulo", questionario.titulo);
            insertCmd.Parameters.Add(paramTitulo);

            IDbDataParameter paramUsuario = new SqlParameter("usuario", questionario.usuario);
            insertCmd.Parameters.Add(paramUsuario);

            IDbDataParameter paramDataCadastro = new SqlParameter("data_de_cadastro", questionario.data_de_cadastro);
            insertCmd.Parameters.Add(paramDataCadastro);

            insertCmd.ExecuteNonQuery();

            conexao.Close();
        }

        public void InserirResposta(Resposta resposta)
        {
            IDbCommand insertCmd = conexao.CreateCommand();
            insertCmd.CommandText = "insert into Resposta (resposta, data_de_cadastro, localizacao_lat_long, id_questionario) values (@resposta, @data_de_cadastro, @localizacao_lat_long, @id_questionario)";

            IDbDataParameter paramResposta = new SqlParameter("resposta", resposta.resposta);
            insertCmd.Parameters.Add(paramResposta);

            IDbDataParameter paramDataCadastro = new SqlParameter("data_de_cadastro", resposta.data_de_cadastro);
            insertCmd.Parameters.Add(paramDataCadastro);

            IDbDataParameter paramLocalizacaoLL = new SqlParameter("localizacao_lat_long", resposta.localizacao_lat_long);
            insertCmd.Parameters.Add(paramLocalizacaoLL);

            IDbDataParameter paramIdQuestionario = new SqlParameter("id_questionario", resposta.id_questionario);
            insertCmd.Parameters.Add(paramIdQuestionario);

            insertCmd.ExecuteNonQuery();

            conexao.Close();
        }
    }
}