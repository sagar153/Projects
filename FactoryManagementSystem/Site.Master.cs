using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["FullAccess"]))
                {

                }
                else if (Convert.ToBoolean(Session["AdminOnly"]))
                {

                }
                else if (Convert.ToBoolean(Session["UsersOnly"]))
                {

                }
                else if (Convert.ToBoolean(Session["FactoryOnly"]))
                {

                }
            }
        }
    }
}