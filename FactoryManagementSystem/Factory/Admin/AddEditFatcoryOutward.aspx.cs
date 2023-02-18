using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FactoryManagementSystem.Factory.Admin
{
    public partial class AddEditFatcoryOutward : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var outwardId = Convert.ToInt32(Request.Params["OutwardId"]);
                hdnFactoryOutwardId.Value = outwardId.ToString();

                if (outwardId != 0)
                {
                    LoadFactoryOutWardControls(outwardId);
                }
                else
                {
                    LoadDropDown();
                }
            }
        }

        private void LoadFactoryOutWardControls(int factoryOutwardId)
        {

            DAL.AddEditFactoryOutwardDAL addEditFactoryOutwardDAL = new DAL.AddEditFactoryOutwardDAL();

            var data = addEditFactoryOutwardDAL.GetFactoryOutwardDetails(factoryOutwardId);

            if (data != null && data.Rows.Count > 0)
            {
                txtDCNo.Text = data.Rows[0]["DCNo"].ToString();
                DateTime d = DateTime.Parse(data.Rows[0]["Date"].ToString());
                calDate.Text = d.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                txtRemarks.Text = data.Rows[0]["Remarks"].ToString();
                txtYear.Text = data.Rows[0]["Year"].ToString();
                txtVariety.Text = data.Rows[0]["Variety"].ToString();
                txtLorryNo.Text = data.Rows[0]["LorryNo"].ToString();
                txtWeight.Text = data.Rows[0]["Weight"].ToString();
                txtBags.Text = data.Rows[0]["Bags"].ToString();
                txtExecutive.Text = data.Rows[0]["CompanyExecutive"].ToString();
                chkActive.Checked = Convert.ToBoolean(data.Rows[0]["isActive"].ToString());

                LoadDropDown();

                ddlCompany.SelectedItem.Value = data.Rows[0]["CompanyId"].ToString();
            }
        }

        private void LoadDropDown()
        {
            DAL.CompanyDAL companieDAL = new DAL.CompanyDAL();

            var companyData = companieDAL.GetActiveCompanies();

            ddlCompany.DataSource = companyData;
            ddlCompany.DataTextField = "CompanyName";
            ddlCompany.DataValueField = "CompanyId";
            ddlCompany.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int factoryOutwardId = Convert.ToInt32(hdnFactoryOutwardId.Value);

            Models.FactoryOutward factoryOutward = new Models.FactoryOutward();

            factoryOutward.FactoryOutWardId = factoryOutwardId;
            factoryOutward.CompanyId = Convert.ToInt32(ddlCompany.SelectedItem.Value);
            factoryOutward.Year = txtYear.Text;
            factoryOutward.Date = Convert.ToDateTime(calDate.Text);
            factoryOutward.LorryNo = txtLorryNo.Text;
            factoryOutward.Variety = txtVariety.Text;
            factoryOutward.Weight = Convert.ToDecimal(txtWeight.Text);
            factoryOutward.Bags = Convert.ToInt32(txtBags.Text);
            factoryOutward.CompanyExecutive = txtExecutive.Text;
            factoryOutward.Remarks = txtRemarks.Text;
            factoryOutward.isActive = chkActive.Checked;

            DAL.FactoryOutwardDAL factoryOutwardDAL = new DAL.FactoryOutwardDAL();

            if (factoryOutwardId == 0)
            {
                factoryOutwardDAL.Save(factoryOutward);
            }
            else
            {
                factoryOutwardDAL.Update(factoryOutward);
            }

            Response.Redirect("/Factory/Admin/FactoryOutward.aspx");
        }
    }
}