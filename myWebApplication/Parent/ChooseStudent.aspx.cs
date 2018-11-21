using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApplication.Parent
{
    public partial class ChooseStudent1 : System.Web.UI.Page
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
               
                string Query = "SELECT * FROM Student WHERE Parent = '" + user + "';";
                adapter = new SqlDataAdapter(Query, sqlcon);
                dt = new DataTable();
                adapter.Fill(dt);
                
                
                if (dt.Rows.Count !=0)
                {
                    StudentsList.DataSource = dt;
                    StudentsList.DataBind();
                }
                else
                {
                    msgDiv.Visible = true;
                    msg.Text = "hello ADD msg jfrehgjbgrebfvvnjrhfbvjn bfbj" +"<br/>"+ " njvbfgbvdshj";
                    addBtn.CssClass = "center-page"; 
                    addBtn.Visible = true;
                }

                if (StudentsList.Items.Count < 4)
                {
                    addBtn.Visible = true;
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
                Response.Redirect("~/Student/StudentPage.aspx");
            }
        }
        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("~/Default.aspx");
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Parent/AddStudent.aspx");
        }

        //protected void ChooseStudBtn_Click(object sender, EventArgs e)
        //{
        //    LinkButton lb = (LinkButton)sender;
        //    ListViewItem item = (ListViewItem)lb.NamingContainer;
        //    Label NameLabel = (Label)item.FindControl("studID");
        //    //lblname.Text = NameLabel.Text;

        //    Session["SelectedStudent"] = NameLabel.Text;

        //    Response.Redirect("~/Parent/StudentPage.aspx");
        //}
    }
}