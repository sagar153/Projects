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
            Models.FactoryIntake factoryIntake = GetFilledFactoryInstakeModel();
            factoryIntake.isActive = true;

            FactoryIntakeDAL factoryIntakeDAL = new FactoryIntakeDAL();
            factoryIntakeDAL.Save(factoryIntake);
            grdFactoryIntake.EditIndex = -1;
            LoadData();
        }


        protected void grdFactoryIntake_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if ((e.Row.RowType == DataControlRowType.Footer) )
            {
                DropDownList ddlCompanyFooterList = (DropDownList)e.Row.FindControl("ddlCompanies");
                DropDownList ddlBinFooterList = (DropDownList)e.Row.FindControl("ddlBins");

                CompanieDAL companieDAL = new CompanieDAL();
                var dt = companieDAL.GetActiveCompanies();

                ddlCompanyFooterList.DataSource = dt;
                ddlCompanyFooterList.DataTextField = "CompanyName";
                ddlCompanyFooterList.DataValueField = "CompanyId";
                ddlCompanyFooterList.DataBind();

                BinDAL binDAL = new BinDAL();
                var binDt = binDAL.GetActiveBins();

                ddlBinFooterList.DataSource = binDt;
                ddlBinFooterList.DataTextField = "BinName";
                ddlBinFooterList.DataValueField = "BinId";
                ddlBinFooterList.DataBind();


            }

            if((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddlCompanyEditList = (DropDownList)e.Row.FindControl("ddlCompany");
                DropDownList ddlBinEditList = (DropDownList)e.Row.FindControl("ddlBin");

                CompanieDAL companieDAL = new CompanieDAL();
                var dt = companieDAL.GetActiveCompanies();

                ddlCompanyEditList.DataSource = dt;
                ddlCompanyEditList.DataTextField = "CompanyName";
                ddlCompanyEditList.DataValueField = "CompanyId";
                ddlCompanyEditList.DataBind();

                BinDAL binDAL = new BinDAL();
                var binDt = binDAL.GetActiveBins();

                ddlBinEditList.DataSource = binDt;
                ddlBinEditList.DataTextField = "BinName";
                ddlBinEditList.DataValueField = "BinId";
                ddlBinEditList.DataBind();
            }

        }

        protected void grdFactoryIntake_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CheckBox chkIsActive = grdFactoryIntake.Rows[e.RowIndex].FindControl("chIsActive") as CheckBox;

            Models.FactoryIntake factoryIntake = GetFilledFactoryInstakeModel();
            factoryIntake.isActive = chkIsActive.Checked; ;

            FactoryIntakeDAL factoryIntakeDAL = new FactoryIntakeDAL();
            factoryIntakeDAL.Update(factoryIntake);
            grdFactoryIntake.EditIndex = -1;
            LoadData();

        }

        protected void grdFactoryIntake_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdFactoryIntake.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grdFactoryIntake_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdFactoryIntake.EditIndex = -1;
            LoadData();
        }

        private Models.FactoryIntake GetFilledFactoryInstakeModel()
        {
            DropDownList ddlCompanyList = grdFactoryIntake.FooterRow.FindControl("ddlCompanies") as DropDownList;
            TextBox txtYear = grdFactoryIntake.FooterRow.FindControl("txtYears") as TextBox;
            Calendar calDate = grdFactoryIntake.FooterRow.FindControl("calDates") as Calendar;
            TextBox txtLorryNo = grdFactoryIntake.FooterRow.FindControl("txtLorryNos") as TextBox;
            TextBox txtVariety = grdFactoryIntake.FooterRow.FindControl("txtVarietys") as TextBox;
            TextBox txtWeight = grdFactoryIntake.FooterRow.FindControl("txtWeights") as TextBox;
            TextBox txtMoist = grdFactoryIntake.FooterRow.FindControl("txtMoists") as TextBox;
            TextBox txtBags = grdFactoryIntake.FooterRow.FindControl("txtBagss") as TextBox;
            TextBox txtLot = grdFactoryIntake.FooterRow.FindControl("txtLots") as TextBox;
            TextBox txtExecutive = grdFactoryIntake.FooterRow.FindControl("txtExecutives") as TextBox;
            DropDownList ddlBinList = grdFactoryIntake.FooterRow.FindControl("ddlBins") as DropDownList;
            TextBox txtRemark = grdFactoryIntake.FooterRow.FindControl("txtRemarks") as TextBox;



            Models.FactoryIntake factoryIntake = new Models.FactoryIntake();
            factoryIntake.FactoryIntakeId = 0;
            factoryIntake.CompanyId = Convert.ToInt32(ddlCompanyList.SelectedItem.Value);
            factoryIntake.Year = txtYear.Text.ToString();
            factoryIntake.Date = calDate.SelectedDate;
            factoryIntake.LorryNo = txtLorryNo.Text;
            factoryIntake.Variety = txtVariety.Text;
            factoryIntake.Weight = Convert.ToDecimal(txtWeight.Text);
            factoryIntake.Moist = Convert.ToDecimal(txtMoist.Text);
            factoryIntake.Bags = Convert.ToInt32(txtBags.Text);
            factoryIntake.Lot = Convert.ToInt32(txtLot.Text);
            factoryIntake.Executive = txtExecutive.Text;
            factoryIntake.BinId = Convert.ToInt32(ddlBinList.SelectedItem.Value);
            factoryIntake.Remarks = txtRemark.Text;

            return factoryIntake;
        }
    }
}