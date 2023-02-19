using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.User
{
    public partial class Varieties : System.Web.UI.Page
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
            CommonDAL commonDAL = new CommonDAL();
            string strYear = Session["Year"].ToString();
            gvVarieties.DataSource = commonDAL.GetVarietiesByYear(strYear);
            gvVarieties.DataBind();
        }

        protected void gvVarieties_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                Label Id = (Label)row.FindControl("lblVariety");
                Response.Redirect("/Production/User/VarietyDetails.aspx?name=" + Id.Text);
            }
        }

        protected void gvVarieties_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVarieties.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}