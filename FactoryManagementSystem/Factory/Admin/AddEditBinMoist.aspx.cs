using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
{
    public partial class AddEditBinMoist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var binMoistId = Convert.ToInt32(Request.Params["Id"]);
                hdnBinMoistId.Value = binMoistId.ToString();

                if (binMoistId != 0)
                {
                    LoadBinMoistControls(binMoistId);
                }
                else
                {
                    LoadDropDown();
                }
            }
        }

        private void LoadBinMoistControls(int binMoistId)
        {

            DAL.BinMoistDAL binMoistDAL = new DAL.BinMoistDAL();

            var data = binMoistDAL.GetActiveBinMoistByBinMoistId(binMoistId);

            if (data.Rows.Count > 0)
            {
                txtYear.Text = data.Rows[0]["Year"].ToString();
                DateTime d = DateTime.Parse(data.Rows[0]["Date"].ToString());
                calDate.Text = d.ToString("yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture);
                txtVariety.Text = data.Rows[0]["Variety"].ToString();

                txtMornUp.Text = data.Rows[0]["MorningUpMoist"].ToString();
                txtMornDown.Text = data.Rows[0]["MorningDownMoist"].ToString();
                txtEvnUp.Text = data.Rows[0]["EvnUpmoist"].ToString();
                txtEvnDown.Text = data.Rows[0]["EvnDownMoist"].ToString();
                txtLot.Text = data.Rows[0]["Lot"].ToString();
                if (!string.IsNullOrEmpty(Convert.ToString(data.Rows[0]["ShellingDate"])))
                {
                    DateTime dshelling = DateTime.Parse(data.Rows[0]["ShellingDate"].ToString());
                    calShellingDate.Text = dshelling.ToString("yyyy-MM-ddTHH:mm", CultureInfo.InvariantCulture);
                }
                txtRemarks.Text = data.Rows[0]["Remarks"].ToString();
                chkShelling.Checked = Convert.ToBoolean(data.Rows[0]["Shelling"].ToString());
                chkActive.Checked = Convert.ToBoolean(data.Rows[0]["isActive"].ToString());

                LoadDropDown();

                ddlCompany.SelectedValue = data.Rows[0]["CompanyId"].ToString();

                ddlBin.SelectedValue = data.Rows[0]["BinId"].ToString();
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

            DAL.BinDAL binDAL = new DAL.BinDAL();

            var binData = binDAL.GetActiveBins();

            ddlBin.DataSource = binData;
            ddlBin.DataTextField = "BinName";
            ddlBin.DataValueField = "BinId";
            ddlBin.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int binMoistId = Convert.ToInt32(hdnBinMoistId.Value);

            Models.BinMoist binMoist = new Models.BinMoist();

            binMoist.BinMoistId = binMoistId;
            binMoist.CompanyId = Convert.ToInt32(ddlCompany.SelectedItem.Value);
            binMoist.BinId = Convert.ToInt32(ddlBin.SelectedItem.Value);
            binMoist.Year = txtYear.Text;
            binMoist.Date = Convert.ToDateTime(calDate.Text);
            if (!string.IsNullOrEmpty(Convert.ToString(calShellingDate.Text)))
            {
                binMoist.ShellingDate = Convert.ToDateTime(calShellingDate.Text);
            }
            binMoist.Variety = txtVariety.Text;
            if (!string.IsNullOrEmpty(txtMornUp.Text))
                binMoist.MorningUpMoist = Convert.ToDecimal(txtMornUp.Text);
            if (!string.IsNullOrEmpty(txtMornDown.Text))
                binMoist.MorningDownMoist = Convert.ToDecimal(txtMornDown.Text);
            if (!string.IsNullOrEmpty(txtEvnUp.Text))
                binMoist.EvnUpmoist = Convert.ToDecimal(txtEvnUp.Text);
            if (!string.IsNullOrEmpty(txtEvnDown.Text))
                binMoist.EvnDownMoist = Convert.ToDecimal(txtEvnDown.Text);
            if (!string.IsNullOrEmpty(txtLot.Text))
                binMoist.Lot = Convert.ToInt32(txtLot.Text);
            binMoist.Shelling = chkShelling.Checked;
            
            binMoist.Remarks = txtRemarks.Text;
            binMoist.isActive = chkActive.Checked;


            DAL.BinMoistDAL binMoistDAL = new DAL.BinMoistDAL();

            if (binMoistId == 0)
            {
                binMoistDAL.Save(binMoist);
            }
            else
            {
                binMoistDAL.Update(binMoist);
            }

            Response.Redirect("/Factory/Admin/BinMoist.aspx");

        }
    }
}