using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
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
            CompanyDAL companyDAL = new CompanyDAL();
            var companyDetails = companyDAL.GetAllCompanies();

            if (companyDetails.Rows.Count > 0)
            {

                grdCompany.DataSource = companyDAL.GetAllCompanies();
                grdCompany.DataBind();
                if (grdCompany.Rows.Count > 0)
                {
                    grdCompany.UseAccessibleHeader = true;
                    grdCompany.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                grdCompany.Columns[2].Visible = true;
            }
            else
            {
                companyDetails.Rows.Add(companyDetails.NewRow());
                grdCompany.DataSource = companyDetails;
                grdCompany.DataBind();

                grdCompany.Columns[2].Visible = false;

            }
        }

        protected void grdBins_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdCompany.EditIndex = -1;
            LoadData();
        }

        protected void grdBins_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdCompany.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grdBins_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(grdCompany.DataKeys[e.RowIndex].Values["CompanyId"].ToString());
            CompanyDAL companyDAL = new CompanyDAL();
            Models.Company company = new Models.Company();
            company.CompanyId = id;
            company.CompanyName = "";
            company.isActive = false;
            companyDAL.Delete(company);
            LoadData();
        }

        protected void grdBins_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt16(grdCompany.DataKeys[e.RowIndex].Values["CompanyId"].ToString());
            TextBox txtCompanyName = grdCompany.Rows[e.RowIndex].FindControl("txtCompanyName") as TextBox;
            CheckBox chkIsActive = grdCompany.Rows[e.RowIndex].FindControl("chIsActive") as CheckBox;

            CompanyDAL companyDAL = new CompanyDAL();
            Models.Company company = new Models.Company();
            company.CompanyId = id;
            company.CompanyName = txtCompanyName.Text.ToString();
            company.isActive = chkIsActive.Checked;
            companyDAL.Update(company);
            grdCompany.EditIndex = -1;
            LoadData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            TextBox txtCompanyName = grdCompany.FooterRow.FindControl("txtCompanyNames") as TextBox;

            CompanyDAL companyDAL = new CompanyDAL();
            Models.Company company = new Models.Company();
            company.CompanyId = 0;
            company.CompanyName = txtCompanyName.Text.ToString();
            company.isActive = true;
            companyDAL.Save(company);
            grdCompany.EditIndex = -1;
            LoadData();
        }

        protected void grdCompany_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCompany.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}