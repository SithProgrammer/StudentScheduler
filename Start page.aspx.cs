using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Linq;
using System.Threading;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Console;

namespace Student_Schedule
{
    
    public partial class Start_page : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
        }
        protected void btnNewTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EntryForm.aspx");
        }

        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Schedule.aspx");
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            //DataBase link with exception test
            if (IsValid)
            {
                var parameters = ddlNewestDataSource.InsertParameters;
                parameters["CourseName"].DefaultValue = txtNewCourseEntry.Text;
                try
                {
                    ddlNewestDataSource.Insert();
                    txtNewCourseEntry.Text = "";
                    lblError.Text = "";
                }
                catch (Exception)
                {
                    lblError.Text = "Invalid Entry, No Blank Entry and 50 Character Max!";                                      
                }
                txtNewCourseEntry.Text = "";            
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            //Data Base Link with exception test
            if (IsValid)
            {
                ddlCourseSelector.Items.Remove(ddlCourseSelector.Items.FindByText(txtRemoveEntry.Text));
                var parameters = ddlNewestDataSource.DeleteParameters;
                parameters["CourseName"].DefaultValue = txtRemoveEntry.Text;
                try
                {
                    ddlNewestDataSource.Delete();
                    txtRemoveEntry.Text = "";
                    lblError.Text = "";
                }
                catch (Exception)
                {
                    lblError.Text = "Invaild Entry";
                }
                txtRemoveEntry.Text = "";
            }
        }

    }
}
