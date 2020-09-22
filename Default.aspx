<%@ Page Title="Sistema de Questionários" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TemplateBootstrap._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="grid" style="margin-right:10%;">
            <h3>Questionários</h3>
        </div>
        <div class="grid" style="margin-right:10%;">
            <asp:Button ID="btnNovoQuestionario" runat="server" Text="Novo Questionário" OnClick="btnNovoQuestionario_Click" CssClass="btn btn-primary" />
        </div>
    </div>
    <br />
    <br />
    <asp:Label ID="lblInicio" runat="server" Text="" Visible="false"></asp:Label>
    <asp:GridView ID="grvListagem" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsListagemQuestionarios" OnRowCommand="grvListagem_RowCommand" CssClass="myGridClass" AlternatingRowStyle-CssClass="myAltRowClass" PagerStyle-CssClass="myPagerClass ">
        <Columns>
            <asp:TemplateField HeaderText="Id" SortExpression="Id" Visible="False">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Id") %>' ID="lblID"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Id") %>' ID="lblID"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="titulo" HeaderText="Título" SortExpression="titulo"></asp:BoundField>
            <asp:BoundField DataField="usuario" HeaderText="Usuário" SortExpression="usuario"></asp:BoundField>
            <asp:BoundField DataField="data_de_cadastro" HeaderText="Data de Cadastro" SortExpression="data_de_cadastro"></asp:BoundField>

            <asp:TemplateField HeaderText="Visualizar">
                <ItemTemplate>
                    <asp:Button runat="server" Text="Visualizar" CommandName="visualizar" CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-info" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="sdsListagemQuestionarios" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Questionario]"></asp:SqlDataSource>

</asp:Content>
