using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Schedule
{
    public partial class EntryForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ddlCourseSelection.AppendDataBoundItems = false;
                txtCourseName.Text = ddlCourseSelection.SelectedValue.ToString();
                ddlCourseSelection.SelectedValue = ddlCourseSelection.SelectedValue;
            }

        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtAssignment.Text = "";
            txtDueDate.Text = "";
            txtTimeToComp.Text = "0";
            txtPointValue.Text = "0";
            txtNotes.Text = "";
            lblError.Text = "";
        }
        protected void btnViewSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Schedule.aspx");
        }
        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Start page.aspx");
        }
        protected void ddlCourseSelection_SelectedIndexChanged(object sender, EventArgs e)
        {

            //autopostback must be true in ddl for this to work
            txtCourseName.Text = ddlCourseSelection.SelectedValue;
        }

        protected void btnAddAssignment_Click(object sender, EventArgs e)
        {


            if (IsValid)
            {
                var parameters = NewAssignmentDataSource.InsertParameters;
                parameters["CourseName"].DefaultValue = txtCourseName.Text;
                parameters["Assignments"].DefaultValue = txtAssignment.Text;
                parameters["Notes"].DefaultValue = txtNotes.Text;
                parameters["DueDate"].DefaultValue = txtDueDate.Text;
                parameters["TimeToComp"].DefaultValue = txtTimeToComp.Text;
                parameters["PointValue"].DefaultValue = txtPointValue.Text;
                try
                {
                    NewAssignmentDataSource.Insert();
                    
                }
                catch (Exception)
                {
                    lblError.Text = "Invaild Entry. Make sure you have chosen a Course. MM/DD/YYYY " +
                        "Due Date format and only numeric values in Time to Complete and Point Value";
                }
                
                txtAssignment.Text = "";
                txtNotes.Text = "";
                txtDueDate.Text = "";
                txtTimeToComp.Text = "0";
                txtPointValue.Text = "0";
            }
        }
    }
}

//if (!IsPostBack)
//{
//    ddlCourseSelection.AppendDataBoundItems = false;
//}

//else if (IsValid && ddlCourseSelection.SelectedIndex == 1) 
//{

//    var assignment = List2DataSource.InsertParameters;
//    assignment["CourseName"].DefaultValue = txtCourseName.Text;
//    assignment["Assignments"].DefaultValue = txtAssignment.Text;
//    assignment["Notes"].DefaultValue = txtAssignment.Text;
//    assignment["DueDate"].DefaultValue = txtDueDate.Text;
//    assignment["TimeToComp"].DefaultValue = txtTimeToComp.Text;
//    assignment["PointValue"].DefaultValue = txtPointValue.Text;
//    try
//    {
//        List2DataSource.Insert();
//        txtCourseName.Text = "";
//    }
//    catch (Exception eadd)
//    {

//    }

//}
//else if (ddlCourseSelection.SelectedIndex == 2)
//{

//    var assignment = List3DataSource.InsertParameters;
//    assignment["CourseName"].DefaultValue = txtCourseName.Text;
//    assignment["Assignments"].DefaultValue = txtAssignment.Text;
//    assignment["Notes"].DefaultValue = txtAssignment.Text;
//    assignment["DueDate"].DefaultValue = txtDueDate.Text;
//    assignment["TimeToComp"].DefaultValue = txtTimeToComp.Text;
//    assignment["PointValue"].DefaultValue = txtPointValue.Text;
//    try
//    {
//        List3DataSource.Insert();
//        txtCourseName.Text = "";
//    }
//    catch (Exception eadd)
//    {

//    }

//}
//else if (ddlCourseSelection.SelectedIndex == 3)
//{

//    var assignment = List4DataSource.InsertParameters;
//    assignment["CourseName"].DefaultValue = txtCourseName.Text;
//    assignment["Assignments"].DefaultValue = txtAssignment.Text;
//    assignment["Notes"].DefaultValue = txtAssignment.Text;
//    assignment["DueDate"].DefaultValue = txtDueDate.Text;
//    assignment["TimeToComp"].DefaultValue = txtTimeToComp.Text;
//    assignment["PointValue"].DefaultValue = txtPointValue.Text;
//    try
//    {
//        List4DataSource.Insert();
//        txtCourseName.Text = "";
//    }
//    catch (Exception eadd)
//    {

//    }

//}
//else if (ddlCourseSelection.SelectedIndex == 4)
//{

//    var assignment = List5DataSource.InsertParameters;
//    assignment["CourseName"].DefaultValue = txtCourseName.Text;
//    assignment["Assignments"].DefaultValue = txtAssignment.Text;
//    assignment["Notes"].DefaultValue = txtAssignment.Text;
//    assignment["DueDate"].DefaultValue = txtDueDate.Text;
//    assignment["TimeToComp"].DefaultValue = txtTimeToComp.Text;
//    assignment["PointValue"].DefaultValue = txtPointValue.Text;
//    try
//    {
//        List5DataSource.Insert();
//        txtCourseName.Text = "";
//    }
//    catch (Exception eadd)
//    {

//    }

//}
//else if (ddlCourseSelection.SelectedIndex == 5)
//{

//    var assignment = List6DataSource.InsertParameters;
//    assignment["CourseName"].DefaultValue = txtCourseName.Text;
//    assignment["Assignments"].DefaultValue = txtAssignment.Text;
//    assignment["Notes"].DefaultValue = txtAssignment.Text;
//    assignment["DueDate"].DefaultValue = txtDueDate.Text;
//    assignment["TimeToComp"].DefaultValue = txtTimeToComp.Text;
//    assignment["PointValue"].DefaultValue = txtPointValue.Text;
//    try
//    {
//        List6DataSource.Insert();
//        txtCourseName.Text = "";
//    }
//    catch (Exception eadd)
//    {

//    }

//}





//private void AddAssignment()
//{
//    Assignment assignment1 = (Assignment)Session["Assignment"];

//    txtAssignment.Text = assignment1.assignment;
//    txtDueDate.Text = assignment1.dueDate.ToShortDateString();
//    txtEstimateTime.Text = assignment1.timeToComp.ToString();
//    txtPointValue.Text = assignment1.pointValue.ToString();
//    txtNotes.Text = assignment1.notes;
//}

//protected void btnAddNew_Click(object sender, EventArgs e)
//{
//    Assignment assignment1 = new Assignment();

//    txtAssignment.Text = assignment1.assignment;
//    txtDueDate.Text = assignment1.dueDate.ToShortDateString();
//    txtEstimateTime.Text = assignment1.timeToComp.ToString();
//    txtPointValue.Text = assignment1.pointValue.ToString();
//    txtNotes.Text = assignment1.notes;

//    Session["Assignment1"] = assignment1;

//}

//protected void btnReturn_Click(object sender, EventArgs e)
//{
//    Response.Redirect("~/Start page.aspx");
//}

//protected void ddlAssignmentNum_SelectedIndexChanged(object sender, EventArgs e)
//{
//    Session["assignment1"] = ddlAssignmentNum.SelectedItem.Value[0];
//    Session["assignment2"] = ddlAssignmentNum.SelectedItem.Value[1];
//    Session["assignment3"] = ddlAssignmentNum.SelectedItem.Value[2];
//    Session["assignment4"] = ddlAssignmentNum.SelectedItem.Value[3];
//    Session["assignment5"] = ddlAssignmentNum.SelectedItem.Value[4];
//    Session["assignment6"] = ddlAssignmentNum.SelectedItem.Value[5];
//    Session["assignment7"] = ddlAssignmentNum.SelectedItem.Value[6];
//    Session["assignment8"] = ddlAssignmentNum.SelectedItem.Value[7];
//    Session["assignment9"] = ddlAssignmentNum.SelectedItem.Value[8];
//    Session["assignment10"] = ddlAssignmentNum.SelectedItem.Value[9];
//}