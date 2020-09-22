<%@ Page Title="Novo Questionário" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NovoQuestionario.aspx.cs" Inherits="TemplateBootstrap.NovoQuestionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Novo Questionário</h3>
    <br />

    <div class="row">
        <div class="grid centro" style="margin-right: 10px;">
            <asp:Label ID="lblTitulo" runat="server" Text="Título"></asp:Label><br />
            <asp:Label ID="lblUsuario" runat="server" Text="Usuário"></asp:Label><br />
            <asp:Label ID="lblDataCadastro" runat="server" Text="Data de Cadastro"></asp:Label><br />
        </div>
        <div class="grid centro">
            <div style="display: inline;">
                <asp:TextBox ID="tbxTitulo" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rvfTitulo" runat="server" ErrorMessage="*" ControlToValidate="tbxTitulo" Style="color: red;"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div style="display: inline;">
                <asp:TextBox ID="tbxUsuario" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ErrorMessage="*" ControlToValidate="tbxUsuario" Style="color: red;"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div style="display: inline;">
            <asp:TextBox ID="tbxDataCadastro" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvDataCadastro" runat="server" ErrorMessage="*" ControlToValidate="tbxDataCadastro" Style="color: red;"></asp:RequiredFieldValidator>
            </div>
            <br />
        </div>
    </div>
    <div style="margin-bottom: 40px;">
        <asp:Button ID="btnSalvarQuestionario" runat="server" Text="Salvar" OnClick="btnSalvarQuestionario_Click" CssClass="btn btn-success" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" CausesValidation="false" />
    </div>
</asp:Content>
