using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
namespace myWebApplication
{
    public partial class Default : System.Web.UI.Page
    {
        // SqlConnection con = new SqlConnection();

        static string CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        SqlConnection sqlcon = new SqlConnection(CS);

        static int i = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Email.HRef = "mailto:" + "cloudgamingapp@gmail.com" + "?Subject=  " + "&Body= ";
        }

        protected void HomeButn_onClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void Butn_Click(object sender, EventArgs e)

        {
            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                SqlCommand sqlcmd = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure  //specify command type
                };  //new command -- access SQL  procedure


                if (uname.Text != null)
                {
                    if (!Regex.IsMatch(uname.Text, @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
            @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$"))
                    {
                        uname.BackColor = Color.LightPink;
                    }
                    else
                    {
                        string query = "SELECT Email, Password FROM Parent WHERE Email = '" + uname.Text + "' and Password = '" + pass.Text + "';";
                        string query2 = "SELECT Email, Password FROM Specialists WHERE Email = '" + uname.Text + "' and Password = '" + pass.Text + "' and Confirmation = 1;";

                        SqlDataAdapter adapter = new SqlDataAdapter(query, sqlcon);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        SqlDataAdapter adapter2 = new SqlDataAdapter(query2, sqlcon);
                        DataTable dt2 = new DataTable();
                        adapter2.Fill(dt2);

                        if (dt.Rows.Count == 1)
                        {
                            //if (dt.Rows[0][1].ToString() != pass.Text)
                            //{
                            //    i++; 

                            //    if (i == 3)
                            //    {
                            //       if ( SetRandom(uname.Text))
                            //        {
                            //            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','انتهت المحاولات','error');</script>");
                            //        }
                            //        else
                            //        {
                            //            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','اسم المستخدم أو كلمة المرور غير صحيحة','error');</script>");
                            //        }
                            //    }
                            //}
                            //else
                            {
                                Session["username"] = uname.Text;
                                Response.Redirect("~/Parent/ChooseStudent.aspx");
                            }
                        }
                        else if (dt2.Rows.Count == 1)
                        {

                            //if (dt.Rows[0][1].ToString() != pass.Text)
                            //{
                            //    i++;

                            //    if (i == 3)
                            //    {
                            //        if (SetRandom(uname.Text))
                            //        {
                            //            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','انتهت المحاولات','error');</script>");
                            //        }
                            //        else
                            //        {
                            //            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','اسم المستخدم أو كلمة المرور غير صحيحة','error');</script>");
                            //        }
                            //    }
                            //}
                            //else
                            {
                                Session["username"] = uname.Text;
                                Response.Redirect("~/Specialist/spChooseAstudent.aspx");
                            }
                        }

                        else
                        {   //not registered
                            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script language=javascript>alert('خطأ','اسم المستخدم أو كلمة المرور غير صحيحة','error');</script>");
                        }
                    }//endIF
                }
            }
            catch (Exception ex)
            {
               msg.Text = ex.Message.ToString();
            }
            finally
            {
              //  sqlcon.Close();
            }
        }

        private bool SetRandom (string user, string role = "Parent")
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            string newPass = new string(Enumerable.Repeat(chars, 5)
              .Select(s => s[random.Next(s.Length)]).ToArray());

            String CS = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(CS);

            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();    //open connection 
                }

                string Query = "UPDATE '"+role+"' SET Password = '" + newPass.Trim() + "' WHERE Email = '" + user + "'; ";

                //new command -- access SQL  procedure
                SqlCommand sqlcmd = new SqlCommand(Query, sqlcon);

                sqlcmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception e)
            {
                e.Message.ToString();
                return false;
            }
        }
    }
    }