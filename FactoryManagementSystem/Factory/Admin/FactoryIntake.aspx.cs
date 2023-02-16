using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
{
    public partial class FactoryIntake : System.Web.UI.Page
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
            FactoryIntakeDAL intakeDAL = new FactoryIntakeDAL();
            var intakeDetails = intakeDAL.GetAllFactoryIntake();

            if (intakeDetails.Rows.Count > 0)
            {

                grdFactoryIntake.DataSource = intakeDAL.GetAllFactoryIntake();
                grdFactoryIntake.DataBind();
                if (grdFactoryIntake.Rows.Count > 0)
                {
                    grdFactoryIntake.UseAccessibleHeader = true;
                    grdFactoryIntake.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                grdFactoryIntake.Columns[13].Visible = true;
            }
            else
            {
                intakeDetails.Rows.Add(intakeDetails.NewRow());
                grdFactoryIntake.DataSource = intakeDetails;
                grdFactoryIntake.DataBind();

                grdFactoryIntake.Columns[13].Visible = false;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Factory/Admin/AddEditFactoryIntake.aspx?IntakeId=0");
        }


        protected void grdFactoryIntake_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFactoryIntake.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void grdFactoryIntake_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditIntake")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                Label Id = (Label)row.FindControl("lblCompanyId");
                int id = Convert.ToInt16(grdFactoryIntake.DataKeys[row.RowIndex].Values["FactoryIntakeId"].ToString());
                Response.Redirect("/Factory/Admin/AddEditFactoryIntake.aspx?IntakeId="+id.ToString());
            }

            
        }
    }
}