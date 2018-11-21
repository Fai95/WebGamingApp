using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApplication.Student
{
    public partial class StudentPage : System.Web.UI.Page
    {
        string id, parent;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                id = Session["SelectedStudent"].ToString();
                parent = Session["username"].ToString();

                String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                SqlConnection sqlcon = new SqlConnection(CS);

                try
                {
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();    //open connection 
                    }

                    string Query = "SELECT * FROM Student WHERE ID = '" + id + "';";
                    adapter = new SqlDataAdapter(Query, sqlcon);
                    dt = new DataTable();
                    adapter.Fill(dt);

                    icn.ImageUrl = dt.Rows[0][9].ToString();


                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>falert();</script>");
                }
            }
        }


        protected void StudentProf (object sender, EventArgs e)
        {
            Response.Redirect("~/Parent/StudentProfile.aspx"); 
        }
    }
}