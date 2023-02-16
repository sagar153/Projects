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
                var intakeId = Convert.ToInt32(Request.Params["IntakeId"]);
                hdnFactoryIntakeId.Value = intakeId.ToString();

                if (intakeId != 0)
                {
                    LoadFactoryOutWardControls(intakeId);
                }
            }
        }

        private void LoadFactoryOutWardControls(int factoryIntakeId)
        {

            DAL.FactoryOutwardDAL factoryOutwardDAL = new DAL.FactoryOutwardDAL();

            var data = factoryOutwardDAL.GetFactoryOutward(factoryIntakeId);

            if (data != null && data.Rows.Count > 0)
            {
                txtDCNo.Text = data.Rows[0]["DCNo"].ToString();
                calShowingDate.SelectedDate = Convert.ToDateTime(data.Rows[0]["ShowingDate"].ToString());
                txtRemarks.Text = data.Rows[0]["Remarks"].ToString();
                txtShowingMoist.Text = data.Rows[0]["ShowingMoist"].ToString();
                txtHours.Text = data.Rows[0]["Hours"].ToString();
                chkisActive.Checked = Convert.ToBoolean(data.Rows[0]["isActive"].ToString());
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int factoryIntakeId = Convert.ToInt32(hdnFactoryIntakeId.Value);

            Models.FactoryOutward factoryOutward = new Models.FactoryOutward();

          


        }
    }
}