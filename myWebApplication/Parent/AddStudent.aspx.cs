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
    public partial class AddStudent : System.Web.UI.Page
    {
        string parent,gender, specialist, dobVal, icn, sid, first, last;
        ListItem item, item2;

        protected void Page_Load(object sender, EventArgs e)
        {
            parent = Session["username"].ToString();
            String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(CS);

            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                item = new ListItem("<img src='https://s3.amazonaws.com/cloudgamingmulitmediabucket/kid3.png' height='50' width='50' alt='male'/>");
                item2 = new ListItem("<img src='https://s3.amazonaws.com/cloudgamingmulitmediabucket/kid1.png'  height='50' width='50' alt='female'/>");

                if (genderList.Items.Count == 0)
                {
                    AddItems();
                }

                item.Value = "ذكر";
                item2.Value = "انثى";
            }
            catch (Exception ex)
            {
                msg.InnerText=ex.Message;
                //ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>excep(x);</script>");
            }            
        }

        protected void Lname_TextChanged(object sender, EventArgs e)
        {
            last = lname.Text; 
        }

        protected void AddItems()
        {
            genderList.Items.Add(item);
            genderList.Items.Add(item2);
        }

        protected void Fname_TextChanged(object sender, EventArgs e)
        {
            first = fname.Text;
        }

        protected void StudID_TextChanged(object sender, EventArgs e)
        {
            sid = studID.Text;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (genderList.SelectedItem.Value == "ذكر")
            {
                gender = "ذكر";
                icn = "https://s3.amazonaws.com/cloudgamingmulitmediabucket/kid3.png";
            }
            else
            {
                gender = "انثى";
                icn = "https://s3.amazonaws.com/cloudgamingmulitmediabucket/kid1.png";
            }
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

                SqlCommand sqlcmd = new SqlCommand("addStudent", sqlcon)
                {
                    CommandType = CommandType.StoredProcedure  //specify command type
                };  //new command -- access SQL  procedure


                string Query = "SELECT * FROM Student WHERE ID = '" +studID.Text+ "';";
                SqlDataAdapter adapter = new SqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count == 1)  // student is already registered
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','الطالب مسجل مسبقا','error');</script>");
                }
                else
                {
                    string checkQuery = "SELECT StudentID FROM StudentsCheck WHERE StudentID = '" + studID.Text + "';";
                    SqlDataAdapter checkAdapter = new SqlDataAdapter(checkQuery, sqlcon);
                    DataTable cdt = new DataTable();
                    checkAdapter.Fill(cdt);

                    if (cdt.Rows.Count == 1)
                    {
                        sqlcmd.Parameters.AddWithValue("@id", studID.Text);
                        sqlcmd.Parameters.AddWithValue("@first_name", fname.Text);
                        sqlcmd.Parameters.AddWithValue("@last_name", lname.Text);
                        sqlcmd.Parameters.AddWithValue("@parent", parent);
                        sqlcmd.Parameters.AddWithValue("@dob", dob.Text);
                        sqlcmd.Parameters.AddWithValue("@gender", "دكر");
                        sqlcmd.Parameters.AddWithValue("@icon", "https://s3.amazonaws.com/cloudgamingmulitmediabucket/kid3.png");

                        sqlcmd.ExecuteNonQuery();
                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تسجيل الطالب بنجاح','success');</script>");
                    }
                    else  //student is not confirmed
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','تسجيل الطالب غير مؤكد','error');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.Message;
            }
        }

        protected void Dob_TextChanged(object sender, EventArgs e)
        {
            dobVal = dob.Text;
        }
    }
}