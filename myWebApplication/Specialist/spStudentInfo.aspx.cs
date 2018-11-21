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
    public partial class spStudentInfo : System.Web.UI.Page
    {
        string user, id, parent;
        SqlDataAdapter adapter;
        DataTable dt;
        String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                user = Session["username"].ToString();
                id = Session["SelectedStudent"].ToString();

                GetInfo();
            } 
        }

        protected void BarIcon_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Specialist/ResultsChart.aspx"); 
        }

        private void GetInfo()
        {
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

                if (dt.Rows.Count != 0)
                {
                    studID.Text = dt.Rows[0][0].ToString();
                    StudentName.Text = dt.Rows[0][1].ToString() + " " +  dt.Rows[0][2].ToString();
                    // PEmail.InnerText = dt.Rows[0][3].ToString();
                    ParentEmail.Text = dt.Rows[0][3].ToString(); 
                    age.Text = dt.Rows[0][6].ToString();
                    studImg.Src = dt.Rows[0][9].ToString();
                    BarIcon.ImageUrl = studImg.Src;
                    // parent = PEmail.InnerText;
                    parent = ParentEmail.Text;
                    PEmail.HRef = "mailto:" + parent + "?Subject=  " + "&Body= ";


                    string cntrQuery = "SELECT Center_name FROM LD_Center WHERE Center_ID = '" + dt.Rows[0][8].ToString() + "';";
                    adapter = new SqlDataAdapter(cntrQuery, sqlcon);
                    DataTable cntr_dt = new DataTable();
                    adapter.Fill(cntr_dt);

                    StudCenter.Text = cntr_dt.Rows[0][0].ToString();

                    string spQuery = "SELECT First_name, Last_name FROM Specialists WHERE Email = '" + dt.Rows[0][4].ToString() + "';";
                    adapter = new SqlDataAdapter(spQuery, sqlcon);
                    DataTable spdt = new DataTable();
                    adapter.Fill(spdt);

                    specName.Text = spdt.Rows[0][0].ToString() + " " + spdt.Rows[0][1].ToString();
                    GetParentinfo(parent);
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void GetParentinfo(string p)
        {
            SqlConnection sqlcon = new SqlConnection(CS);

            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                string Query = "SELECT * FROM Parent WHERE Email = '" + p + "';";
                adapter = new SqlDataAdapter(Query, sqlcon);
                dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ParentName.Text = dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString();

                    if (dt.Rows[0][4].ToString() != null)
                    {
                        ParentPhone.Text = dt.Rows[0][4].ToString();
                    }
                    else
                    {
                        ParentPhone.Text = "لا يوجد"; 
                    }

                    Session["Parent"] = p;
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}