using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace myWebApplication.Specialist
{
    public partial class ResultsChart : System.Web.UI.Page
    {

        string  Date, user, sID;
        static string selectedLvl; 

        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["username"].ToString();
            sID = Session["SelectedStudent"].ToString();

            if (!IsPostBack)
            {
                user = Session["username"].ToString();
                sID = Session["SelectedStudent"].ToString();

                // Call Get ChartData() method in the PageLoad event
                GetStudInfo();
                GetAll();
                GetChartData();
            }
        }

        private void GetAll()
        {
            string query;
            string cs = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {

                    query = "select Distinct * from GameState where Stud_ID = '" + sID + "' ;";


                    // Command to retrieve Students data from Students table
                    SqlCommand cmd = new
                    SqlCommand(query, con);
                    con.Open();

                    SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if (dt.Rows.Count != 0)
                    {
                        Chart1.DataSource = dt;
                        Chart1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message.ToString();
            }
        }

        private void GetChartData()
        {
            string query;
            string cs = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    Date = DatesDDL.SelectedValue;

                    query = "select Distinct * from GameState where Stud_ID = '" + sID + "' ;";


                    if (Date != null)
                    {
                        query = "select Distinct * from GameState where Stud_ID = '" + sID + "' AND Date = '" + Date + "' ;";
                    }
                    else if (selectedLvl != null)
                    {
                        query = "select Distinct * from GameState where Stud_ID = '" + sID + "' and Lvl_ID = '" + selectedLvl + "'";
                    }

                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if (dt.Rows.Count != 0)
                    {
                        Chart1.DataSource = dt;
                        Chart1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message.ToString();
            }
        }

        private void GetDetailsChart()
        {
            string query;
            string cs = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    Date = DatesDDL.SelectedValue;

                    query = "select Distinct * from GameState where Stud_ID = '" + sID + "' and Lvl_ID = '" + selectedLvl + "'";

                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if (dt.Rows.Count != 0)
                    {
                        Chart1.Series["الدرجة"].XValueMember = "Date";
                        Chart1.Series["الدرجة"].YValueMembers = "Score";
                        Chart1.Series["الزمن"].XValueMember = "Date";
                        Chart1.Series["الزمن"].YValueMembers = "Time";

                        Chart1.DataSource = dt;
                        Chart1.DataBind();
                    }
                }

                GetDates(selectedLvl);
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message.ToString();
            }
        }

        private void GetStudInfo()
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                SqlConnection sqlcon = new SqlConnection(CS);

                string Query = "select * from student where ID = '" + sID + "'";

                SqlDataAdapter adapter = new SqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    icn.ImageUrl = dt.Rows[0][9].ToString();
                    studID.Text = dt.Rows[0][0].ToString();
                    studName.Text = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2].ToString();
                    studAge.Text = dt.Rows[0][6].ToString();
                    Sicon.ImageUrl = icn.ImageUrl.ToString();
                }
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message.ToString();
            }
        }

        protected void AllDataLB_Click(object sender, EventArgs e)
        {
            GetAll();
            ShowDetHL.Visible = false;
            DateDDL_div.Visible = false;
            Details.Visible = false; 
        }

        protected void Chart1_Click(object sender, ImageMapEventArgs e)
        {
            selectedLvl = e.PostBackValue;
            GetDetailsChart(); 
        }


        private void GetDates(string lvl)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                SqlConnection sqlcon = new SqlConnection(CS);
                selectedLvl = lvl;
                string Query = "select distinct Date from GameState where Stud_ID = '" + sID + "' AND Lvl_ID = '" + lvl + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count != 0)
                {

                    DatesDDL.DataSource = dt;
                    DatesDDL.DataTextField = "Date";
                    DatesDDL.DataValueField = "Date";
                    DatesDDL.DataBind();
                    Date = DatesDDL.SelectedValue;

                    if (selectedLvl != null && Date != null)
                    {
                        ShowDetHL.Visible = true;
                        DateDDL_div.Visible = true;
                        Details.Visible = true; 
                        GetGameDetails(selectedLvl, Date); 
                    }
                }
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message.ToString();
            }
        }

        private void GetGameDetails(string slvl, string d)
        {
            try
            {
                String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                SqlConnection sqlcon = new SqlConnection(CS);
                string s = sID;

                slvl = selectedLvl; 
                Date = DatesDDL.SelectedValue;
                d = Date;

                string Query = "select distinct * from gamestate WHERE Stud_ID = '" + s + "' AND Lvl_ID ='" + selectedLvl + "' AND Date = '" + d + "'";

                SqlDataAdapter adapter = new SqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                DateTime date = new DateTime();
                adapter.Fill(dt);

                if (dt.Rows.Count == 1)
                {
                    StateImg.Src = dt.Rows[0][6].ToString();
                    studentID.Text = dt.Rows[0][0].ToString();
                    Sname.Text = studName.Text;
                    lvl_name.Text = dt.Rows[0][1].ToString();
                    score.Text = dt.Rows[0][2].ToString();
                    time.Text = dt.Rows[0][3].ToString();
                    date = Convert.ToDateTime(dt.Rows[0][4].ToString()).Date;
                    playDate.Text = date.ToString();
                    TriesNum.Text = dt.Rows[0][7].ToString();
                    questionReplay.Text = dt.Rows[0][8].ToString();
                }
            }
            catch (Exception ex)
            {
             //  msg1.InnerText = ex.Message.ToString();
            }
        }

        protected void Sicon_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Session["username"] = user;
            Session["SelectedStudent"] = sID;
            Response.Redirect("~/Specialist/spStudentInfo.aspx");
        }

        protected void DatesDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            string d;
            msg.Text = DatesDDL.SelectedValue;
            Date = DatesDDL.SelectedValue;
            d = Date;
            GetChartData();
            GetGameDetails(selectedLvl, d); 
            ShowDetHL.Visible = true;
            DateDDL_div.Visible = true;
            Details.Visible = true;
        }
    }
}
