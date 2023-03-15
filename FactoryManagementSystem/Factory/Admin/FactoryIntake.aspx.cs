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

        private void LoadData()  // To show the data in the DataGridView  
        {
            FactoryIntakeDAL intakeDAL = new FactoryIntakeDAL();
            var intakeDetails = intakeDAL.GetAllFactoryIntake(GetYear());

            if (intakeDetails.Rows.Count > 0)
            {
                grdFactoryIntake.DataSource = intakeDAL.GetAllFactoryIntake(GetYear());
                grdFactoryIntake.DataBind();
                if (grdFactoryIntake.Rows.Count > 0)
                {
                    grdFactoryIntake.UseAccessibleHeader = true;
                    grdFactoryIntake.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            else
            {
                grdFactoryIntake.DataSource = intakeDetails;
                grdFactoryIntake.DataBind();
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

                int id = Convert.ToInt32(grdFactoryIntake.DataKeys[row.RowIndex].Values["FactoryIntakeId"].ToString());
                Response.Redirect("/Factory/Admin/AddEditFactoryIntake.aspx?IntakeId="+id.ToString());
            }
        }
    }
}