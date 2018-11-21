using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myWebApplication.Specialist
{
    public partial class spRegister : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //GetCenters(); 

            //if (!IsPostBack)
            //{
            //    GetCenters();
            //    CenterDDL.SelectedValue = center; 
            //}
        }

        //protected void GetCenters()
        //{
        //        try
        //        {
        //            String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        //            SqlConnection sqlcon = new SqlConnection(CS);

        //            string Query = "select distinct * from LD_center";
        //            SqlDataAdapter adapter = new SqlDataAdapter(Query, sqlcon);
        //            DataTable dt = new DataTable();
        //            adapter.Fill(dt);

        //            if (dt.Rows.Count != 0)
        //            {

        //                CenterDDL.DataSource = dt;
        //                CenterDDL.DataTextField = "Center_name";
        //                CenterDDL.DataValueField = "Center_name";
        //                CenterDDL.DataBind();
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //        RequiredFieldValidator7.Text = ex.Message.ToString();
        //        }
        //    }

        //protected void CenterDDL_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    center = CenterDDL.SelectedValue;
        //  //  GetCenters(); 
        //}


        protected void BtSignup_Click(object sender, EventArgs e)
        {

            if (!Regex.IsMatch(mail.Text, @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
            @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$"))
            {
                mail.BackColor = Color.LightPink;
            }
            else
                mail.BackColor = Color.White;

            if (pass.Text != pass2.Text)
            {
                pass.Text = pass2.Text = null;
                pass.BackColor = Color.LightPink;
                pass2.BackColor = Color.LightPink;
            }
            else
            {

                String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                SqlConnection sqlcon = new SqlConnection(CS);

                try
                {
                    if (sqlcon.State == ConnectionState.Closed)
                    {
                        sqlcon.Open();    //open connection 
                    }

                    SqlCommand sqlcmd = new SqlCommand("addSpecialist", sqlcon)
                    {
                        CommandType = CommandType.StoredProcedure  //specify command type
                    };  //new command -- access SQL  procedure


                    string spQuery = "SELECT * FROM Specialists WHERE Email = '" + mail.Text + "';";
                    //string pQuery = "SELECT * FROM Parent WHERE Email = '" + mail.Text + "';";

                    SqlDataAdapter adapter = new SqlDataAdapter(spQuery, sqlcon);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    if (dt.Rows.Count == 1 )  // specialist is already registered
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','اسم المستخدم مسجل مسبقا','error');</script>");
                    }
                    else
                    {
                        string checkQuery = "SELECT SpecialistID FROM SpecialistsCheck WHERE SpecialistID = '" + mail.Text + "';";
                        SqlDataAdapter checkAdapter = new SqlDataAdapter(checkQuery, sqlcon);
                        DataTable cdt = new DataTable();
                        checkAdapter.Fill(cdt);

                        if (cdt.Rows.Count == 1)
                        {
                            sqlcmd.Parameters.AddWithValue("@first_name", fname.Text);
                            sqlcmd.Parameters.AddWithValue("@last_name", lname.Text);
                            sqlcmd.Parameters.AddWithValue("@email", mail.Text);
                            sqlcmd.Parameters.AddWithValue("@pass", pass.Text);
                            sqlcmd.Parameters.AddWithValue("@phone", ph.Text);

                            sqlcmd.ExecuteNonQuery();
                            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('تم','تم التسجيل بنجاح','success');</script>");
                        }
                        else  //specialist is not confirmed
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','تسجيل المستخدم غير مؤكد','error');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                     msg.Text = ex.Message;
                }
            }
        }
    }
}