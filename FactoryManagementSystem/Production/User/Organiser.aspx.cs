using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.User
{
    public partial class Organiser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()  // To show the data in the DataGridView  
        {
            OrganiserDAL orgDAL = new OrganiserDAL();
            gvOrg.DataSource = orgDAL.GetDistinctOrganiser();
            gvOrg.DataBind();
        }

        protected void gvOrg_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                int id = Convert.ToInt32(gvOrg.DataKeys[row.RowIndex].Values["OrganiserId"].ToString());
                Response.Redirect("/Production/User/OrgDetails.aspx?orgId=" + id);
            }
        }
    }
}