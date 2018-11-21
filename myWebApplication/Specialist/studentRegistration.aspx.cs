using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApplication.Specialist
{
    public partial class studentRegistration : System.Web.UI.Page
    {
        string user, sid, first, last;
        SqlDataAdapter adapter;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["username"].ToString();
        }

        protected void Lname_TextChanged(object sender, EventArgs e)
        {
            last = lname.Text;
        }

        protected void Fname_TextChanged(object sender, EventArgs e)
        {
            first = fname.Text;
        }

        protected void StudID_TextChanged(object sender, EventArgs e)
        {
            sid = studID.Text;
        }

        protected void AddStudBtn_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            SqlConnection sqlcon = new SqlConnection(CS);

            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                string query = "insert into StudentsCheck (StudentID, SpecialistID, First_name, Last_name, icon) values ('" + sid + "', '" + user + "', '" + first + "', '" + last + "', 'https://s3.amazonaws.com/cloudgamingmulitmediabucket/logo.png')";
                SqlCommand sqlcmd = new SqlCommand(query, sqlcon); 

                sqlcmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تسجيل الطالب بنجاح','success');</script>");
            }
            catch (Exception ex)
            {

            }
        }
    }
}
