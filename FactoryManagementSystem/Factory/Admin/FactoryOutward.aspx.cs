using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
{
    public partial class FactoryOutward : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()  // To show the data in the DataGridView  
        {
            DAL.FactoryOutwardDAL outwardDAL = new DAL.FactoryOutwardDAL();
            var outTakeDetails = outwardDAL.GetAllFactoryOutward();

            if (outTakeDetails.Rows.Count > 0)
            {

                grdFactoryOutward.DataSource = outTakeDetails;
                grdFactoryOutward.DataBind();
                if (grdFactoryOutward.Rows.Count > 0)
                {
                    grdFactoryOutward.UseAccessibleHeader = true;
                    grdFactoryOutward.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            else
            {
                grdFactoryOutward.DataSource = outTakeDetails;
                grdFactoryOutward.DataBind();
            }
        }

        protected void grdFactoryOutward_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFactoryOutward.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Factory/Admin/AddEditFatcoryOutward.aspx?OutwardId=0");
        }

        protected void grdFactoryOutward_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

            int id = Convert.ToInt16(grdFactoryOutward.DataKeys[row.RowIndex].Values["FactoryOutWardId"].ToString());

            if (e.CommandName == "EditIntake")
            {
                Response.Redirect("/Factory/Admin/AddEditFatcoryOutward.aspx?OutwardId=" + id.ToString());
            }
        }
    }
}