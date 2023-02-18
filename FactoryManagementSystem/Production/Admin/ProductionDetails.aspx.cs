using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.Admin
{
    public partial class ProductionDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var prodId = Convert.ToInt32(Request.Params["prodId"]);
                hdnProdId.Value = prodId.ToString();

                if (prodId != 0)
                {
                    LoadProductionControls(prodId);
                }
                else
                {
                    LoadDropDown();
                }
            }
        }

        private void LoadProductionControls(int intProdId)
        {

            DAL.ProductionDAL addEditProdDAL = new DAL.ProductionDAL();
            string strYear = Session["Year"].ToString();
            var data = addEditProdDAL.GetProductionByYear(strYear, false, intProdId);

            if (data.Rows.Count > 0)
            {
                txtYear.Text = data.Rows[0]["Year"].ToString();
                txtFarmerName.Text = data.Rows[0]["FarmerName"].ToString();
                txtFatherName.Text = data.Rows[0]["FatherName"].ToString();
                txtMobile.Text = data.Rows[0]["Mobile"].ToString();
                txtVariety.Text = data.Rows[0]["Variety"].ToString();
                txtACRES.Text = data.Rows[0]["ACRES"].ToString();
                txtSurveyNo.Text = data.Rows[0]["SurveyNo"].ToString();
                txtVillage.Text = data.Rows[0]["Village"].ToString();
                txtArea.Text = data.Rows[0]["Area"].ToString();
                txtTotalTonnage.Text = data.Rows[0]["TotalTonnage"].ToString();
                txtRemarks.Text = data.Rows[0]["Remarks"].ToString();

                DateTime showingDate = DateTime.Parse(data.Rows[0]["ShowingDate"].ToString());
                calShowingDate.Text = showingDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

                DateTime harvestDate = DateTime.Parse(data.Rows[0]["HarvestDate"].ToString());
                calHarvestDate.Text = harvestDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

                chkActive.Checked = Convert.ToBoolean(data.Rows[0]["isActive"].ToString());

                LoadDropDown();

                ddlOrganiser.SelectedItem.Value = data.Rows[0]["OrganiserId"].ToString();
            }
        }

        private void LoadDropDown()
        {
            DAL.OrganiserDAL orgDAL = new DAL.OrganiserDAL();

            var orgData = orgDAL.GetActiveOrganiser();

            ddlOrganiser.DataSource = orgData;
            ddlOrganiser.DataTextField = "OrganiserName";
            ddlOrganiser.DataValueField = "OrganiserId";
            ddlOrganiser.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int prodId = Convert.ToInt32(hdnProdId.Value);

            Models.Production prod = new Models.Production();

            prod.ProductionId = prodId;
            prod.OrganiserId = Convert.ToInt32(ddlOrganiser.SelectedItem.Value);
            prod.Year = txtYear.Text;
            prod.FarmerName = txtFarmerName.Text;
            prod.FatherName = txtFatherName.Text;
            prod.Mobile = txtMobile.Text;
            prod.ACRES = Convert.ToDecimal(txtACRES.Text);
            prod.Variety = txtVariety.Text.Trim();
            prod.SurveyNo = txtSurveyNo.Text.Trim();
            prod.Village = txtVillage.Text;
            prod.Area = txtArea.Text;
            prod.ShowingDate = Convert.ToDateTime(calShowingDate.Text);
            prod.HarvestDate = Convert.ToDateTime(calHarvestDate.Text);
            prod.TotalTonnage = Convert.ToDecimal(txtTotalTonnage.Text);
            prod.AddDate = DateTime.Now.Date;
            prod.Remarks = txtRemarks.Text;
            prod.isActive = chkActive.Checked;


            DAL.ProductionDAL prodDAL = new DAL.ProductionDAL();

            if (prodId == 0)
            {
                prodDAL.Save(prod);
            }
            else
            {
                prodDAL.Update(prod);
            }

            Response.Redirect("/Production/Admin/Production.aspx");

        }
    }
}