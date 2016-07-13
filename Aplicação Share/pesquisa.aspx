<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pesquisa.aspx.cs" Inherits="Aplicação_Share.pesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Combobox1" DataTextField="Nvarchar1" DataValueField="Nvarchar1">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Combobox1" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT UserData.Nvarchar1
FROM WSS_Content_Chacon_20000.dbo.UserData
where tp_ListID = '18DD5587-9C47-4159-8356-917A79EC81B1' and
(nvarchar18 = 'Ativo' OR 
nvarchar18 = 'Ativo Especial' OR
nvarchar18 = 'Inativo' )
order by Nvarchar1 asc"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="combobox2" DataTextField="nvarchar3" DataValueField="nvarchar3" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="combobox2" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT distinct nvarchar3
FROM WSS_Content_Chacon_20000.dbo.UserData
where tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5'
order by nvarchar3 asc
"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Combobox3" DataTextField="nvarchar1" DataValueField="nvarchar1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Combobox3" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT nvarchar1 FROM AllUserData WHERE (tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5') AND (nvarchar3 = @RoleID)">
            <SelectParameters>
                <asp:ControlParameter Name="RoleID" ControlID="DropDownList2"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Quantidade"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="Somente Números" ValidationExpression="\d+"></asp:RegularExpressionValidator>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT float2
FROM WSS_Content_Chacon_20000.dbo.AllUserData
where (tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5') and
(nvarchar1 = @valor)">
        <SelectParameters>
            <asp:ControlParameter Name="valor" ControlID="DropDownList3"
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="TextBox2" runat="server" Width="425px" Visible="False"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calcular" />
  
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT Nvarchar1
FROM WSS_Content_Chacon_20000.dbo.UserData

where tp_ListId = '18DD5587-9C47-4159-8356-917A79EC81B1' and
tp_ID in ( SELECT tp_ID
                FROM WSS_Content_Chacon_20000.dbo.AllUserDataJunctions
                where tp_DocID = ( SELECT tp_DocId
                                   FROM WSS_Content_Chacon_20000.dbo.AllUserData
                                   where tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5' and
                                   Nvarchar1 = @evento))
order by Nvarchar1" OnSelecting="SqlDataSource2_Selecting">
        <SelectParameters>
            <asp:ControlParameter Name="evento" ControlID="DropDownList3"
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
  
    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nvarchar1" DataValueField="Nvarchar1" Visible="False">
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
  
    <br />
    
  
    </asp:Content>