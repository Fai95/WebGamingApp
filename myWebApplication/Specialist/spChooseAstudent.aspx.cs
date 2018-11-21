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
    public partial class spChooseAstudent1 : System.Web.UI.Page
    {
        string user, id;
        SqlDataAdapter adapter;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["username"].ToString();

            String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            SqlConnection sqlcon = new SqlConnection(CS);

            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                string Query = "SELECT * FROM StudentsCheck WHERE SpecialistID = '" + user + "';";
                adapter = new SqlDataAdapter(Query, sqlcon);
                dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    StudentsList.DataSource = dt;
                    StudentsList.DataBind();
                }
                else
                {
                    msg.Text = "hello there"; 
                    msg.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>falert();</script>");
            }
        }

        protected void LstView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            // save button Clicked
            if (e.CommandName == "View")
            {
                Label lbl = (Label)e.Item.FindControl("studID");
               
                id = lbl.Text;

                Session["SelectedStudent"] = id;
                Response.Redirect("~/Specialist/ResultsChart.aspx");
               // Response.Redirect("~/Specialist/spStudentOptions.aspx"); 
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}
