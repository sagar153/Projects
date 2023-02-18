using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.Admin
{
    public partial class OrgAdvanceDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var advanceId = Convert.ToInt32(Request.Params["advanceId"]);
                hdnadvanceId.Value = advanceId.ToString();

                if (advanceId != 0)
                {
                    LoadAdvanceControls(advanceId);
                }
                else
                {
                    LoadDropDown();
                }
            }
        }

        private void LoadAdvanceControls(int intadvanceId)
        {

            DAL.OrgAdvanceDAL addEditAdvanceDAL = new DAL.OrgAdvanceDAL();
            string strYear = Session["Year"].ToString();
            var data = addEditAdvanceDAL.GetOrAdvanceByYear(strYear, false, intadvanceId);

            if (data.Rows.Count > 0)
            {
                txtYear.Text = data.Rows[0]["Year"].ToString();
                txtAdvance.Text = data.Rows[0]["Advance"].ToString();
                txtMode.Text = data.Rows[0]["Mode"].ToString();
                txtRemarks.Text = data.Rows[0]["Remarks"].ToString();

                DateTime advanceDate = DateTime.Parse(data.Rows[0]["AdvanceDate"].ToString());
                calAdvanceDate.Text = advanceDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

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
            int advId = Convert.ToInt32(hdnadvanceId.Value);

            Models.OrgAdvance adv = new Models.OrgAdvance();

            adv.OrganiserAdvanceId = advId;
            adv.OrganiserId = Convert.ToInt32(ddlOrganiser.SelectedItem.Value);
            adv.Year = txtYear.Text;
            adv.Mode = txtMode.Text;
            adv.AdvanceDate = Convert.ToDateTime(calAdvanceDate.Text);
            adv.Advance = Convert.ToDecimal(txtAdvance.Text);
            adv.Remarks = txtRemarks.Text;
            adv.isActive = chkActive.Checked;


            DAL.OrgAdvanceDAL orgDAL = new DAL.OrgAdvanceDAL();

            if (advId == 0)
            {
                orgDAL.Save(adv);
            }
            else
            {
                orgDAL.Update(adv);
            }

            Response.Redirect("/Production/Admin/OrgAdvance.aspx");

        }
    }
}