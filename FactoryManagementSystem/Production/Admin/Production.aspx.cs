using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.Admin
{
    public partial class Production : System.Web.UI.Page
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
            ProductionDAL prodDAL = new ProductionDAL();
            string strYear = Session["Year"].ToString();
            var intakeDetails = prodDAL.GetProductionByYear(strYear, false);

            if (intakeDetails.Rows.Count > 0)
            {
                grdProduction.DataSource = prodDAL.GetProductionByYear(strYear, false);
                grdProduction.DataBind();
                if (grdProduction.Rows.Count > 0)
                {
                    grdProduction.UseAccessibleHeader = true;
                    grdProduction.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            else
            {
                grdProduction.DataSource = intakeDetails;
                grdProduction.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Production/Admin/ProductionDetails.aspx?prodId=0");
        }

        protected void grdProduction_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int id = Convert.ToInt16(grdProduction.DataKeys[row.RowIndex].Values["ProductionId"].ToString());

            if (e.CommandName == "EditProd")
            {
                Response.Redirect("/Production/Admin/ProductionDetails.aspx?prodId=" + id.ToString());
            }
        }

        protected void grdProduction_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdProduction.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}