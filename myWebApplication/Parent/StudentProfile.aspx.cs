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
    public partial class StudentProfile : System.Web.UI.Page
    {
        string id, parent, newFname, newLname, specialist;
        DateTime Studob, newDob;
        SqlDataAdapter adapter;
        DataTable dt;
        String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Session["SelectedStudent"].ToString();
            parent = Session["username"].ToString();

            RefreshData();
        }

        protected void RefreshData()
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
                    fnameLB.Text = dt.Rows[0][1].ToString();
                    lnameLB.Text = dt.Rows[0][2].ToString();
                    Studob = Convert.ToDateTime(dt.Rows[0][5].ToString()).Date;
                    dobLB.Text = Studob.ToString();
                    age.Text = dt.Rows[0][6].ToString();
                    studImg.Src = dt.Rows[0][9].ToString();
                    icon.Src = studImg.Src;

                    string cntrQuery = "SELECT Center_name FROM LD_Center WHERE Center_ID = '" + dt.Rows[0][8].ToString() + "';";
                    adapter = new SqlDataAdapter(cntrQuery, sqlcon);
                    DataTable cntr_dt = new DataTable();
                    adapter.Fill(cntr_dt);

                    StudCenter.Text = cntr_dt.Rows[0][0].ToString();

                    string spQuery = "SELECT First_name, Last_name, Phone_number, Email FROM Specialists WHERE Email = '" + dt.Rows[0][4].ToString() + "';";
                    adapter = new SqlDataAdapter(spQuery, sqlcon);
                    DataTable spdt = new DataTable();
                    adapter.Fill(spdt);

                    specName.Text = spdt.Rows[0][0].ToString() + " " + spdt.Rows[0][1].ToString();
                    specPhone.Text = spdt.Rows[0][2].ToString();
                    SpEmailTxt.Text = spdt.Rows[0][3].ToString();
                    specialist = SpEmailTxt.Text;
                    spEmail.HRef = "mailto:" + specialist + "?Subject=  " + "&Body= ";
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void FnameEditLbl_Click(object sender, EventArgs e)
        {
            fnameTB.Visible = true;
            fnameTB.Text = fnameLB.Text;
            EditFnamebtn.Visible = true;
            cancelFname.Visible = true;
            RequiredFieldValidatorFname.Visible = true;
            fnameLB.Visible = false;
        }
        protected void LnameEditLbl_Click(object sender, EventArgs e)
        {
            lnameTB.Visible = true;
            lnameTB.Text = lnameLB.Text;
            saveLname.Visible = true;
            cancelLname.Visible = true;
            RequiredFieldValidatorLname.Visible = true;
            lnameLB.Visible = false;
        }

        protected void Fname_TextChanged(object sender, EventArgs e)
        {
            if (fnameTB != null)
            {
                newFname = fnameTB.Text;
            }
            else
            {
                newFname = fnameLB.Text;
            }
        }

        protected void EditFname_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("update Student set First_name='" + newFname.Trim() + "' where ID='" + id + "';", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تحديث الإسم الأول','success');</script>");

                fnameTB.Visible = false;
                EditFnamebtn.Visible = false;
                cancelFname.Visible = false;
                RequiredFieldValidatorFname.Visible = false;
                fnameLB.Visible = true;

                RefreshData();
            }
            catch (Exception ex)
            {
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            fnameTB.Visible = false;
            EditFnamebtn.Visible = false;
            cancelFname.Visible = false;
            RequiredFieldValidatorFname.Visible = false;
            fnameLB.Visible = true;
        }

        protected void SaveLname_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("update Student set Last_name='" + newLname.Trim() + "' where ID='" + id + "';", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تحديث الإسم الأخير','success');</script>");

                lnameTB.Visible = false;
                saveLname.Visible = false;
                cancelLname.Visible = false;
                RequiredFieldValidatorLname.Visible = false;
                lnameLB.Visible = true;

                RefreshData();
            }
            catch (Exception ex)
            {
            }
        }

        protected void SaveSp_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    using (SqlConnection con = new SqlConnection(CS))
            //    {
            //        SqlCommand cmd = new SqlCommand("update Student set Specialist_ID='" + specialist.Trim() + "' where ID='" + id + "';", con);
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //    }

            //    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تحديث الأخصائي','success');</script>");

            //    specList.Visible = false;
            //    SaveSp.Visible = false;
            //    CancelSp.Visible = false;
            //    //RequiredFieldValidatorLname.Visible = false;
            //    specName.Visible = true;

            //    RefreshData();
            //}
            //catch (Exception ex)
            //{
            //    hdr.InnerText = ex.Message;
            //}
        }

        protected void CancelLname_Click(object sender, EventArgs e)
        {
            lnameTB.Visible = false;
            saveLname.Visible = false;
            cancelLname.Visible = false;
            RequiredFieldValidatorLname.Visible = false;
            lnameLB.Visible = true;
        }

        protected void DeleteStudent_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("delete from student where id = '"+id+"';", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم حذف الطالب بنجاح','success');</script>");

                Response.Redirect("~/Parent/ChooseStudent.aspx");
            }
            catch (Exception ex)
            {
            }
        }

        protected void SaveDob_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection sqlcon = new SqlConnection(CS);

                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                SqlCommand sqlcmd = new SqlCommand("UpdateDate", sqlcon)
                {
                    CommandType = CommandType.StoredProcedure  //specify command type
                };  //new command -- access SQL  procedure

                //using (SqlConnection con = new SqlConnection(CS))
                //{
                //    SqlCommand cmd = new SqlCommand("update Student set Dob='" +newDob+ "' where ID='" + id + "';", con);
                //    con.Open();
                //    cmd.ExecuteNonQuery();
                //}

                sqlcmd.Parameters.AddWithValue("@id", id);
                sqlcmd.Parameters.AddWithValue("@dob", newDob);

                sqlcmd.ExecuteNonQuery(); 

                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تحديث تاريخ الميلاد','success');</script>");

                dobLB.Visible = true;
                DobTB.Visible = false;
                saveDob.Visible = false;
                cancelDob.Visible = false;

                RefreshData();
            }
            catch (Exception ex)
            {
                hdr.InnerText = ex.Message; 
            }
        }

        protected void DobTB_TextChanged(object sender, EventArgs e)
        {
            newDob = Convert.ToDateTime( DobTB.Text).Date;
        }

        protected void CancelDob_Click(object sender, EventArgs e)
        {
            dobLB.Visible = true;
            DobTB.Visible = false;
            saveDob.Visible = false;
            cancelDob.Visible = false;
        }

        protected void LnameTB_TextChanged(object sender, EventArgs e)
        {
            if (lnameTB != null)
            {
                newLname = lnameTB.Text;
            }
            else
            {
                newLname = lnameLB.Text;
            }
        }

        protected void DobLB_Click(object sende, EventArgs e)
        {
            dobLB.Visible = false;
            DobTB.Visible = true;
            saveDob.Visible = true;
            cancelDob.Visible = true;
            DobTB.Text = dobLB.Text; 
        }
    }
}