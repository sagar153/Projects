using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.User
{
    public partial class OrgAdvanceDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                var orgName = Request.Params["orgName"];
                hdnOrgName.Value = orgName;
                LoadData(orgName);
            }
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

        private void LoadData(string orgName)  // To show the data in the DataGridView  
        {
            OrgAdvanceDAL orgAdvanceDAL = new OrgAdvanceDAL();

            var OrgAdvanceDetails = orgAdvanceDAL.GetAdvanceByOrganiser(GetYear(), orgName);

            grdAdvance.DataSource = OrgAdvanceDetails;
            grdAdvance.DataBind();
        }

        protected void grdAdvance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAdvance.PageIndex = e.NewPageIndex;
            LoadData(hdnOrgName.Value);
        }
    }
}