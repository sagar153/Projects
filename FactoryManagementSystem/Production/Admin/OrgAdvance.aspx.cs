using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.Admin
{
    public partial class OrgAdvance : System.Web.UI.Page
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
            OrgAdvanceDAL orgAdvanceDAL = new OrgAdvanceDAL();
            string strYear = Session["Year"].ToString();
            var OrgAdvanceDetails = orgAdvanceDAL.GetOrAdvanceByYear(strYear, false);

            if (OrgAdvanceDetails.Rows.Count > 0)
            {
                grdAdvance.DataSource = orgAdvanceDAL.GetOrAdvanceByYear(strYear, false);
                grdAdvance.DataBind();
                if (grdAdvance.Rows.Count > 0)
                {
                    grdAdvance.UseAccessibleHeader = true;
                    grdAdvance.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            else
            {
                grdAdvance.DataSource = OrgAdvanceDetails;
                grdAdvance.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Production/Admin/OrgAdvanceDetails.aspx?advanceId=0");
        }

        protected void grdAdvance_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int id = Convert.ToInt16(grdAdvance.DataKeys[row.RowIndex].Values["OrganiserAdvanceId"].ToString());

            if (e.CommandName == "EditAdvance")
            {
                Response.Redirect("/Production/Admin/OrgAdvanceDetails.aspx?advanceId=" + id.ToString());
            }
        }

        protected void grdAdvance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAdvance.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}