using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;

namespace myWebApplication
{
    public partial class ResetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HomeButn_onClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void ReseetBtn_Click(object sender, EventArgs e)
        {

            if (uname.Text == null)
                uname.BackColor = Color.LightPink;
            else
            {
                if (!Regex.IsMatch(uname.Text, @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
             @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$"))
                {
                    uname.BackColor = Color.LightPink;
                }
                else
                {
                    String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
              
                    SqlConnection con = new SqlConnection(CS);
                    try
                    {

                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();    //open connection 
                        }
                         else
                        {

                            SqlCommand cmd = new SqlCommand("select * from Parent where Email='" + uname.Text + "'", con);
                            //con.Open();
                            SqlDataAdapter sda = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            SqlCommand cmd2 = new SqlCommand("select * from Specialists where Email='" + uname.Text + "'", con);
                            con.Open();
                            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                            DataTable dt2 = new DataTable();
                            sda2.Fill(dt2);

                            if (dt.Rows.Count != 0 || dt.Rows.Count != 0)
                            {
                                String myGUID = Guid.NewGuid().ToString();
                                string Uid = Convert.ToString(dt.Rows[0][2]);
                                SqlCommand cmd1 = new SqlCommand("insert into ForgotPassRequests values('" + myGUID + "','" + Uid + "',getdate())", con);
                                cmd1.ExecuteNonQuery();
                                con.Close();

                                ////send email
                                String ToEmailAddress = dt.Rows[0][2].ToString();
                                String Username = dt.Rows[0][0].ToString();
                                String EmailBody = "مرحبا " + Username + ",<br/><br/> الرجاء زيارة الرابط لتغيير كلمة المرور <br/><br/> http://localhost:53114/RecoverPassword.aspx?Uid=" + myGUID;
                                MailMessage PassRecMail = new MailMessage("fai.algannas1@gmail.com", ToEmailAddress);
                                PassRecMail.Body = EmailBody;
                                PassRecMail.IsBodyHtml = true;
                                PassRecMail.Subject = "طلب تغيير كلمة المرور";

                                //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                                SMTP.Credentials = new NetworkCredential()
                                {
                                    UserName = "cloudgamingapp@gmail.com",
                                    Password = "Pnu@1234512345"
                                };
                                SMTP.EnableSsl = true;
                                SMTP.Send(PassRecMail);
                                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert();</script>");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>falert();</script>");
                            }
                        }
                    } 
                    catch (Exception ex)
                    {
                        msg.Text = ex.Message;
                       // ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert();</script>");
                    }
                    finally
                    {
                        if (con.State == ConnectionState.Open)
                        {
                            con.Close();
                        }
                    }
                }
            }      
        }
    }
}