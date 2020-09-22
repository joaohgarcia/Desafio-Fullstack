<%@ Page Title="Responder Questionário" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResponderQuestionario.aspx.cs" Inherits="TemplateBootstrap.ResponderQuestionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Reponder Questionário</h3>
    <br />

    <div class="row">
        <div class="grid centro" style="margin-right: 10px;">
            <asp:Label ID="lblTitulo" runat="server" Text="Título"></asp:Label><br />
            <asp:Label ID="lblUsuario" runat="server" Text="Usuário" Enabled="False"></asp:Label><br />
            <asp:Label ID="lblDataCadastro" runat="server" Text="Data de Cadastro" Enabled="False"></asp:Label><br />
        </div>
        <div class="grid centro">
            <asp:TextBox ID="tbxTitulo" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox><br />
            <asp:TextBox ID="tbxUsuario" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox><br />
            <asp:TextBox ID="tbxDataCadastro" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox><br />
        </div>
    </div>

    <br />
    <div style="margin-bottom: 10px;">
        <asp:Label Text="Resposta" runat="server" CssClass="h5" />
    </div>
    <br />
    <div class="row">
        <div class="grid centro" style="margin-right: 10px;">
            <asp:Label ID="lblResposta" runat="server" Text="Resposta"></asp:Label><br />
            <asp:Label ID="lblRespDataCadastro" runat="server" Text="Data de Cadastro"></asp:Label><br />
            <asp:Label ID="lblLocalizacaoLL" runat="server" Text="Localização [Lat/Long]"></asp:Label><br />
        </div>
        <div class="grid centro">
            <div style="display: inline;">
                <asp:TextBox ID="tbxResposta" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvResposta" runat="server" ErrorMessage="*" ControlToValidate="tbxResposta" Style="color: red;"></asp:RequiredFieldValidator>
            </div>
            <div style="display: inline;">
                <asp:TextBox ID="tbxRespDataCadastro" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rvfRespDataCadastro" runat="server" ErrorMessage="*" ControlToValidate="tbxRespDataCadastro" Style="color: red;"></asp:RequiredFieldValidator>
            </div>
            <div style="display: inline;">
                <asp:TextBox ID="tbxLocalizacaoLL" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfvLocalizacaoLL" runat="server" ErrorMessage="*" ControlToValidate="tbxLocalizacaoLL" Style="color: red;"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>

    <br />
    <div style="margin-bottom: 40px;">
        <asp:Button ID="btnResponder" runat="server" Text="Responder" OnClick="btnResponder_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" CausesValidation="false" />
    </div>
</asp:Content>
