using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text.RegularExpressions;

namespace myWebApplication.Parent
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HomeButn_onClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (!Regex.IsMatch(mail.Text, @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
             @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$"))
            {
                mail.BackColor = Color.LightPink;
            }
            else
                mail.BackColor = Color.White;

            if (pass.Text != pass2.Text)
            {
                pass.Text = pass2.Text = null;
                pass.BackColor = Color.LightPink;
                pass2.BackColor = Color.LightPink;
            }
            else
            {
                String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                SqlConnection sqlcon = new SqlConnection(CS);

                try
                {
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();    //open connection 
                    }

                    SqlCommand sqlcmd = new SqlCommand("addParent", sqlcon)
                    {
                        CommandType = CommandType.StoredProcedure  //specify command type
                    };  //new command -- access SQL  procedure


                    string spQuery = "SELECT * FROM Specialists WHERE Email = '" + mail.Text + "';";
                    string pQuery = "SELECT * FROM Parent WHERE Email = '" + mail.Text + "';";

                    SqlDataAdapter adapter = new SqlDataAdapter(spQuery, sqlcon);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    SqlDataAdapter adapterp = new SqlDataAdapter(pQuery, sqlcon);
                    DataTable dtp = new DataTable();
                    adapter.Fill(dtp);


                    if (dt.Rows.Count == 1 || dtp.Rows.Count == 1)  // parent is already registered
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','اسم المستخدم مسجل مسبقا','error');</script>");
                    }
                    else
                    {   //parent registration
                        sqlcmd.Parameters.AddWithValue("@first_name", fname.Text);
                        sqlcmd.Parameters.AddWithValue("@last_name", lname.Text);
                        sqlcmd.Parameters.AddWithValue("@email", mail.Text);
                        sqlcmd.Parameters.AddWithValue("@pass", pass.Text);
                        sqlcmd.Parameters.AddWithValue("@phone", ph.Text);

                        sqlcmd.ExecuteNonQuery();

                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم التسجيل بنجاح','success');</script>");
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','اسم المستخدم مسجل مسبقاً','error');</script>");
                }
            }
        }
    }
}