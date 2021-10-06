using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Schedule
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Code to display a random message if start page is reloaded
                string[] rndMessage = { "You can only add assignments to courses on your Course List.",
                    "View Schedule to view assignments for each course",
                    "Wash your hands for 20 seconds with soap and water", 
                    "Stay safe and keep a minimum of 6 feet away from others when out in public",
                    "Wear a face mask to help prevent the spread of COVID-19"};

                Random rnd = new Random();
                int tipNumber;
                tipNumber = rnd.Next(rndMessage.Length);
                lblTipMessage.Text = rndMessage[tipNumber];

            }

        }
    }
}