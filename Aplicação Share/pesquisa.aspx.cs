using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Collections;

namespace Aplicação_Share
{
    
    public partial class pesquisa : System.Web.UI.Page
    {

        double f, g;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Text = "1";
            }

            DropDownList4_SelectedIndexChanged(null, null);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        public void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string conexao = "Data Source=CHACON\\CHACON;Integrated Security=False;User ID=razao;Password=da7Bb%10;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection conecta = new SqlConnection(conexao);
            conecta.Open();
            string pesquisa = "SELECT Nvarchar1 FROM WSS_Content_Chacon_20000.dbo.UserData" +
                " where tp_ListId = '18DD5587-9C47-4159-8356-917A79EC81B1' and" +
                " tp_ID in ( SELECT tp_ID FROM WSS_Content_Chacon_20000.dbo.AllUserDataJunctions" +
                " where tp_DocID = ( SELECT tp_DocId FROM WSS_Content_Chacon_20000.dbo.AllUserData" +
                " where tp_ListId = 'A974794E-7DD7-4321-9BC5-AFAC16588FF5' and" +
                " Nvarchar1 = " + "'" + DropDownList3.SelectedValue + "')) order by Nvarchar1 ";


            SqlCommand cmd = new SqlCommand(pesquisa, conecta);
            ArrayList lista = new ArrayList();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(String.Format("{0}", dr[0]));
            }
            conecta.Close();
            try
            {
                DataSourceSelectArguments sr = new DataSourceSelectArguments();
                DataView dv = (DataView)SqlDataSource1.Select(sr);
                if (dv.Count != 0)
                    dv[0][0].ToString();

                g = Convert.ToDouble(TextBox1.Text);
                f = Convert.ToDouble(dv[0][0].ToString());

            }
            catch (Exception)
            {

                throw;
            }
           

            double resultado = f * g;
            TextBox2.Text = Convert.ToString(resultado);

            string empresaEscolhida = DropDownList1.SelectedValue;
            

            if (lista.Contains(empresaEscolhida)){
                Label2.Text = "Para este evento, a empresa selecionada é isenta de cobrança";
            }
            else
            {
                Label2.Text = "Para este evento, a empresa selecionada pagará o valor de R$" + resultado;
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            using (var printDocument = new System.Drawing.Printing.PrintDocument())
            {
                printDocument.PrintPage += printDocument_PrintPage;
                printDocument.Print();
            }

        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        void printDocument_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            var printDocument = sender as System.Drawing.Printing.PrintDocument;

           // if (printDocument != null)
          //  {
           //    e.Graphics.DrawImage(System.Net.Mime.MediaTypeNames.Image.FromFile("logo.png"), new Point(5, 5));
          //  }

        }
        }




    }
