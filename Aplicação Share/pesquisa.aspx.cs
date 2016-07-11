using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Aplicação_Share
{
    public partial class pesquisa : System.Web.UI.Page
    {
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
            DataSourceSelectArguments sr = new DataSourceSelectArguments();
            DataView dv = (DataView)SqlDataSource1.Select(sr);
            if (dv.Count != 0)
                 dv[0][0].ToString();
            Double f , g;
            
                g = Convert.ToDouble(TextBox1.Text);
                f = Convert.ToDouble(dv[0][0].ToString());
            
            
            double resultado = f * g;
            TextBox2.Text = Convert.ToString(resultado);
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }
    }
}