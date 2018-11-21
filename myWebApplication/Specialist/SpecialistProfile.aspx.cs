using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApplication.Specialist
{
    public partial class SpecialistProfile : System.Web.UI.Page
    {
        string user, newPass, newPass2, newFname, newLname, newPh;
        SqlDataAdapter adapter;
        DataTable dt;
        String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["username"].ToString();
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

                string Query = "SELECT * FROM specialists WHERE Email = '" + user + "';";
                adapter = new SqlDataAdapter(Query, sqlcon);
                dt = new DataTable();
                adapter.Fill(dt);


                if (dt.Rows.Count != 0)
                {
                    fnameLB.Text = dt.Rows[0][0].ToString();
                    lnameLB.Text = dt.Rows[0][1].ToString();
                    phLB.Text = dt.Rows[0][4].ToString();
                    mail.Text = dt.Rows[0][2].ToString();

                    string cQuery = "select center_name from LD_center where center_ID ='"+dt.Rows[0][5]+"'";
                    adapter = new SqlDataAdapter(cQuery, sqlcon);
                    DataTable cdt = new DataTable();
                    adapter.Fill(cdt);

                    center.Text = cdt.Rows[0][0].ToString();
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

        protected void CancelPass_Click(object sender, EventArgs e)
        {
            passwordChangeDiv.Visible = false;
        }

        protected void ChangePassBtn_Click(object sender, EventArgs e)
        {
            if (passwordChangeDiv.Visible)
            {
                passwordChangeDiv.Visible = false;
            }
            else
            {
                passwordChangeDiv.Visible = true;
            }
        }

        protected void Pass_TextChanged(object sender, EventArgs e)
        {
            if (pass.Text != null)
            {
                newPass = pass.Text;
            }
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
                    SqlCommand cmd = new SqlCommand("update specialists set First_name='" + newFname.Trim() + "' where Email='" + user + "';", con);
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
                hdr.InnerText = ex.Message;
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
                    SqlCommand cmd = new SqlCommand("update specialists set Last_name='" + newLname.Trim() + "' where Email='" + user + "';", con);
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
                hdr.InnerText = ex.Message;
            }
        }

        protected void PhLB_Click(object sender, EventArgs e)
        {
            phLB.Visible = false;
            phTB.Visible = true;
            phTB.Text = phLB.Text;
            savePh.Visible = true;
            cancelPh.Visible = true;
            RequiredFieldValidatorPH.Visible = true;
        }

        protected void SavePh_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("update specialists set Phone_number='" + newPh.Trim() + "' where Email='" + user + "';", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تحديث رقم الهاتف الجوال','success');</script>");

                phTB.Visible = false;
                savePh.Visible = false;
                cancelPh.Visible = false;
                RequiredFieldValidatorPH.Visible = false;
                phLB.Visible = true;

                RefreshData();
            }
            catch (Exception ex)
            {
                hdr.InnerText = ex.Message;
            }
        }

        protected void CancelPh_Click(object sender, EventArgs e)
        {
            phTB.Visible = false;
            savePh.Visible = false;
            cancelPh.Visible = false;
            RequiredFieldValidatorPH.Visible = false;
            phLB.Visible = true;
        }

        protected void PhTB_TextChanged(object sender, EventArgs e)
        {
            if (phTB != null)
            {
                newPh = phTB.Text;
            }
            else
            {
                newPh = phLB.Text;
            }
        }

        protected void CancelLname_Click(object sender, EventArgs e)
        {
            lnameTB.Visible = false;
            saveLname.Visible = false;
            cancelLname.Visible = false;
            RequiredFieldValidatorLname.Visible = false;
            lnameLB.Visible = true;
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

        protected void PassChangeButn_Click(object sender, EventArgs e)
        {
            try
            {
                if (newPass != newPass2)
                {
                    pass.Text = pass2.Text = null;
                    pass.BackColor = pass2.BackColor = Color.LightPink;
                }
                else
                {
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("update specialists set Password='" + newPass.Trim() + "' where Email='" + user + "'", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم تغيير كلمة المرور','success');</script>");

                    passwordChangeDiv.Visible = false;
                }
            }
            catch (Exception ex)
            {
                hdr.InnerText = ex.Message;
            }
        }


        protected void Pass2_TextChanged(object sender, EventArgs e)
        {
            if (pass2.Text != null)
            {
                newPass2 = pass2.Text;
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}