using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
{
    public partial class AddEditFactoryIntake : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var intakeId = Convert.ToInt32(Request.Params["IntakeId"]);
                hdnFactoryIntakeId.Value = intakeId.ToString();

                if (intakeId != 0)
                {
                    LoadFactoryIntakeControls(intakeId);
                }
                else
                {
                    LoadDropDown();
                }
            }
        }

        private void LoadFactoryIntakeControls(int factoryIntakeId)
        {
            
            DAL.AddEditFactoryIntakeDAL addEditFactoryIntakeDAL = new DAL.AddEditFactoryIntakeDAL();

            var data = addEditFactoryIntakeDAL.GetFactoryIntake(factoryIntakeId);

            if (data.Rows.Count > 0)
            {
                txtYear.Text = data.Rows[0]["Year"].ToString();
                DateTime d = DateTime.Parse(data.Rows[0]["Date"].ToString());
                calDate.Text = d.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                txtLorryNo.Text = data.Rows[0]["LorryNo"].ToString();
                txtVariety.Text = data.Rows[0]["Variety"].ToString();
                txtWeight.Text = data.Rows[0]["Weight"].ToString();
                txtMoist.Text = data.Rows[0]["Moist"].ToString();
                txtBags.Text = data.Rows[0]["Bags"].ToString();
                txtLot.Text = data.Rows[0]["Lot"].ToString();
                txtExecutive.Text = data.Rows[0]["Executive"].ToString();
                txtRemarks.Text = data.Rows[0]["Remarks"].ToString();
                chkActive.Checked = Convert.ToBoolean(data.Rows[0]["isActive"].ToString());

                LoadDropDown();

                ddlCompany.SelectedItem.Value = data.Rows[0]["CompanyId"].ToString();

                ddlBin.SelectedItem.Value = data.Rows[0]["BinId"].ToString();
            }
        }

        private void LoadDropDown()
        {
            DAL.CompanieDAL companieDAL = new DAL.CompanieDAL();

            var companyData = companieDAL.GetActiveCompanies();

            ddlCompany.DataSource = companyData;
            ddlCompany.DataTextField = "CompanyName";
            ddlCompany.DataValueField = "CompanyId";
            ddlCompany.DataBind();

            DAL.BinDAL binDAL = new DAL.BinDAL();

            var binData = binDAL.GetActiveBins();

            ddlBin.DataSource = binData;
            ddlBin.DataTextField = "BinName";
            ddlBin.DataValueField = "BinId";
            ddlBin.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int factoryIntakeId = Convert.ToInt32(hdnFactoryIntakeId.Value);

            Models.FactoryIntake factoryIntake = new Models.FactoryIntake();

            factoryIntake.FactoryIntakeId = factoryIntakeId;
            factoryIntake.CompanyId = Convert.ToInt32(ddlCompany.SelectedItem.Value);
            factoryIntake.Year = txtYear.Text;
            factoryIntake.Date = Convert.ToDateTime(calDate.Text);
            factoryIntake.LorryNo = txtLorryNo.Text;
            factoryIntake.Variety = txtVariety.Text;
            factoryIntake.Weight = Convert.ToDecimal(txtWeight.Text);
            factoryIntake.Moist = Convert.ToDecimal(txtMoist.Text);
            factoryIntake.Bags = Convert.ToInt32(txtBags.Text);
            factoryIntake.Lot = Convert.ToInt32(txtLot.Text);
            factoryIntake.Executive = txtExecutive.Text;
            factoryIntake.BinId = Convert.ToInt32(ddlBin.SelectedItem.Value);
            factoryIntake.Remarks = txtRemarks.Text;
            factoryIntake.isActive = chkActive.Checked;


            DAL.FactoryIntakeDAL factoryIntakeDAL = new DAL.FactoryIntakeDAL();

            if(factoryIntakeId == 0)
            {
                factoryIntakeDAL.Save(factoryIntake);
            }
            else
            {
                factoryIntakeDAL.Update(factoryIntake);
            }

            Response.Redirect("/Factory/Admin/FactoryIntake.aspx");

        }
    }
}