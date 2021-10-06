using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Schedule
{
    public partial class Schedule : System.Web.UI.Page
    {
        Decimal grdTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddNew2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EntryForm.aspx");
        }
        protected void btnMainMenu2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Start page.aspx");
        }
        protected void gvAssignments_PreRender(object sender, EventArgs e)
        {
            //gvAssignments.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void ddlCourseSelection_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvAssignments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Code to add the total values in the time to comp column
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal ttcRowTotal = Convert.ToDecimal
                            (DataBinder.Eval(e.Row.DataItem, "TimeToComp"));
                grdTotal = grdTotal + ttcRowTotal;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label ttcTotal = (Label)e.Row.FindControl("lblTimeToCompTotal");
                ttcTotal.Text = grdTotal.ToString();
            }
        }
    }
}
