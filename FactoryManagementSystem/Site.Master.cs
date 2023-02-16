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
                if (Session["UserName"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

                if (Convert.ToBoolean(Session["FactoryOnly"]))
                {
                    UserFactory.Visible = true;
                    if (!Convert.ToBoolean(Session["AdminOnly"]))
                    {
                        AdminFactory.Visible = true;
                    }
                }

                if (Convert.ToBoolean(Session["AdminOnly"]))
                {
                    AdminFactory.Visible = true;
                    Admin.Visible = true;
                    if (!Convert.ToBoolean(Session["FactoryOnly"]))
                        AdminProduction.Visible = true;
                }

                if (Convert.ToBoolean(Session["UsersOnly"]))
                {
                    UserFactory.Visible = true;
                    if (!Convert.ToBoolean(Session["FactoryOnly"]))
                        UserProduction.Visible = true;
                }

                if (Convert.ToBoolean(Session["FullAccess"]))
                {
                    AdminFactory.Visible = true;
                    Admin.Visible = true;
                    AdminProduction.Visible = true;
                    UserFactory.Visible = true;
                    UserProduction.Visible = true;
                    users.Visible = true;
                }

                lblUserName.InnerText = Session["UserName"].ToString();
                lblYear.InnerText = Session["Year"].ToString();
            }
        }

        protected void btnLogOut_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}