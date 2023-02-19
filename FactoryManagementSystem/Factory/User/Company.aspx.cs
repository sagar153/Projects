using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.User
{
    public partial class Companies : System.Web.UI.Page
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
            CompanyDAL companiesDAL = new CompanyDAL();
            gvCompanies.DataSource = companiesDAL.GetActiveCompanies();
            gvCompanies.DataBind();
        }

        protected void gvCompanies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                Label Id = (Label)row.FindControl("lblCompanyId");
                Response.Redirect("/Factory/User/CompanyDetails.aspx?Id=" + Id.Text);
            }
        }

        protected void gvCompanies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompanies.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}