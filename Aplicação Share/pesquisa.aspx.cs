using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

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
            

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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


            bool empresaExiste = DropDownList1.Items.Cast<ListItem>().Any(r => DropDownList4.Items.Contains(r));
            if (empresaExiste == true)
            { Label2.Text = "Para este evento, a empresa selecionada é isenta de cobrança"; }
            else
            { Label2.Text = "Para este evento, a empresa selecionada pagará o valor de R$" + resultado;
               
            }
            empresaExiste = false;

            
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
