using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApplication
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        String GUIDvalue, Uid;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                GUIDvalue = Request.QueryString["Uid"];
                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from ForgotPassRequests where id='" + GUIDvalue + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        Uid = Convert.ToString(dt.Rows[0][1]);
                    }
                    else
                    {
                        lblMsg.Text = "Your Password Reset Link is Expired or Invalid !";
                        lblMsg.ForeColor = Color.Red;
                    }

                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    newPassTB.Visible = true;
                    newPass1TB.Visible = true;
                    newPass.Visible = true;
                    newPass1.Visible = true;
                    ResetBtn.Visible = true;
                }
                else
                {
                    lblMsg.Text = "Your Password Reset Link is Expired or Invalid !";
                    lblMsg.ForeColor = Color.Red;
                }
            }
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            if (newPassTB.Text != "" && newPass1TB.Text != "" && newPassTB.Text == newPass1TB.Text)
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("update Parent set Password='" + newPassTB.Text + "' where Email='" + Uid + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd2 = new SqlCommand("delete from ForgotPassRequests where Uid='" + Uid + "'", con);
                    cmd2.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert();</script>");

                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                newPassTB.Text = newPass1TB.Text = null;
                newPassTB.BackColor = newPass1TB.BackColor = Color.LightPink;
            }
        }
    }
}