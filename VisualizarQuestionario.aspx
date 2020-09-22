<%@ Page Title="Visualizar Questionário" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisualizarQuestionario.aspx.cs" Inherits="TemplateBootstrap.VisualizarQuestionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Visualizar Questionário</h3>
    <br />
    <div class="row">
        <div class="grid centro" style="margin-right: 10px;">
            <asp:Label ID="lblTitulo" runat="server" Text="Título"></asp:Label><br />
            <asp:Label ID="lblUsuario" runat="server" Text="Usuário"> </asp:Label><br />
            <asp:Label ID="lblDataCadastro" runat="server" Text="Data de Cadastro"></asp:Label><br />
        </div>
        <div class="grid centro">
            <asp:TextBox ID="tbxTitulo" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:TextBox ID="tbxUsuario" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox><br />
            <asp:TextBox ID="tbxDataCadastro" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox><br />
        </div>
    </div>

    <asp:Button ID="btnResponder" runat="server" Text="Responder" OnClick="btnResponder_Click" CssClass="btn btn-primary" />
    <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="btn btn-secondary" OnClick="btnVoltar_Click" CausesValidation="false" />

    <br />
    <br />
    <div style="margin-bottom: 40px;">
        <asp:Label ID="lblRespostas" Text="Respostas" runat="server" />
        <br />
        <br />
        <asp:GridView ID="grvRespostas" runat="server" DataSourceID="sdsRespostas" AutoGenerateColumns="False" DataKeyNames="Id" AlternatingRowStyle-CssClass="myAltRowClass" CssClass="myGridClass" PagerStyle-CssClass="myPagerClass ">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="resposta" HeaderText="Resposta" SortExpression="resposta"></asp:BoundField>
                <asp:BoundField DataField="data_de_cadastro" HeaderText="Data de Cadastro" SortExpression="data_de_cadastro"></asp:BoundField>
                <asp:BoundField DataField="localizacao_lat_long" HeaderText="Localização [Lat,Long]" SortExpression="localizacao_lat_long"></asp:BoundField>
                <asp:BoundField DataField="id_questionario" HeaderText="id_questionario" SortExpression="id_questionario" Visible="False"></asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource runat="server" ID="sdsRespostas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Resposta] WHERE ([id_questionario] = @id_questionario)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hdfIdQuestionario" PropertyName="Value" Name="id_questionario" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hdfIdQuestionario" runat="server" />
</asp:Content>
