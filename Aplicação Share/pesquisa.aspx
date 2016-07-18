<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pesquisa.aspx.cs" Inherits="Aplicação_Share.pesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
    <div><asp:Label ID="Label4" runat="server" Text="Selecione a Empresa: "></asp:Label>
        </div>
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Combobox1" DataTextField="Nvarchar1" DataValueField="Nvarchar1" Height="20px" Width="900px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Combobox1" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT UserData.Nvarchar1
FROM WSS_Content_Chacon_20000.dbo.UserData
where tp_ListID = '18DD5587-9C47-4159-8356-917A79EC81B1' and
(nvarchar18 = 'Ativo' OR 
nvarchar18 = 'Ativo Especial' OR
nvarchar18 = 'Inativo' )
order by Nvarchar1 asc"></asp:SqlDataSource>
        </div>
    <div>
        <asp:Label ID="Label3" runat="server" Text="Selecione o Setor:"></asp:Label>
        </div>
    <div>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="combobox2" DataTextField="nvarchar3" DataValueField="nvarchar3" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Height="20px" Width="900px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="combobox2" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT distinct nvarchar3
FROM WSS_Content_Chacon_20000.dbo.UserData
where tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5'
order by nvarchar3 asc
"></asp:SqlDataSource>
        </div>

    <div>
        <asp:Label ID="Label5" runat="server" Text="Selecione o Evento: "></asp:Label>
        </div>
    <div>

        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="Combobox3" DataTextField="nvarchar1" DataValueField="nvarchar1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Height="20px" Width="900px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Combobox3" runat="server" ConnectionString="<%$ ConnectionStrings:Sharepoint %>" SelectCommand="SELECT nvarchar1 FROM AllUserData WHERE (tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5') AND (nvarchar3 = @RoleID)">
            <SelectParameters>
                <asp:ControlParameter Name="RoleID" ControlID="DropDownList2"
                    PropertyName="SelectedValue" />
            </SelectParameters>
            </asp:SqlDataSource>
        <br />
            </div>
    <div>
        
        
        <asp:Label ID="Label1" runat="server" Text="Quantidade: "></asp:Label>
            </div>
    <div>
        
        <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="900px" ></asp:TextBox>
        </br>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="*Esse campo aceita apenas números." ValidationExpression="\d+"></asp:RegularExpressionValidator>
        
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
   
    <div>
    <asp:TextBox ID="TextBox2" runat="server" Width="425px" Visible="False"></asp:TextBox>
   
         <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Calcular" />
  </div>
        <div>
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
  <div>
     </br>
    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nvarchar1" DataValueField="Nvarchar1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Height="20px" Width="900px">
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
  </div>
    </br>

   
      <br />
</center>
</asp:Content>
