using System;

namespace myWebApplication
{
    public partial class Contact_us : System.Web.UI.Page
    {
        string user, pass;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["username"].ToString();
        }

        protected void SendButn_Click(object sender, EventArgs e)
        {
            try
            {
                //String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                //SqlConnection sqlcon = new SqlConnection(CS);

                //if (sqlcon.State == ConnectionState.Closed)
                //{
                //    sqlcon.Open();    //open connection 
                //}

                //string Query = "SELECT Password FROM Parent WHERE Email = '" + user + "';";
                //SqlDataAdapter adapter = new SqlDataAdapter(Query, sqlcon);
                //DataTable dt = new DataTable();
                //adapter.Fill(dt);


                //if (dt.Rows.Count != 0)
                //{
                //    pass = dt.Rows[0][0].ToString();
                //}
                //else
                //    lbl.Text = pass;

                //String ToEmailAddress = "";
                //String Username = user;
                //String EmailBody = msgContent.Text;
                //MailMessage PassRecMail = new MailMessage(Username, ToEmailAddress)
                //{
                //    Body = EmailBody,
                //    IsBodyHtml = true,
                //    Subject = subject.Text
                //};

                //SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                //SMTP.Credentials = new NetworkCredential()
                //{
                //    UserName = user,
                //    Password = pass
                //};
                //SMTP.EnableSsl = true;
                //SMTP.Send(PassRecMail);

                //ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('شكرا','شكرا لتواصلك معنا','success');</script>");

            }
            catch (Exception ex)
            {
                //lbl.Text = ex.Message;
                // ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('شكرا','"+ex.Message+"','error');</script>");
            }
        }

    }
}