using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.User
{
    public partial class Advance : System.Web.UI.Page
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
            OrgAdvanceDAL orgDAL = new OrgAdvanceDAL();
            gvAdv.DataSource = orgDAL.GetDistinctOrgAdvance(GetYear());
            gvAdv.DataBind();
        }

        private string GetYear()
        {
            string strYear = string.Empty;
            try
            {
                strYear = Session["Year"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("/Login.aspx");
            }
            return strYear;
        }

        protected void gvAdv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                string orgName = gvAdv.DataKeys[row.RowIndex].Values["OrganiserName"].ToString();
                Response.Redirect("/Production/User/OrgAdvanceDetails.aspx?orgName=" + orgName);
            }
        }

        protected void gvAdv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAdv.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}