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
                    LoadData(intakeId);
                }
            }
        }

        private void LoadData(int factoryIntakeId)  // To show the data in the DataGridView  
        {
            DAL.FactoryOutwardDAL outwardDAL = new DAL.FactoryOutwardDAL();
            var outTakeDetails = outwardDAL.GetFactoryOutwardByIntake(factoryIntakeId);

            if (outTakeDetails.Rows.Count > 0)
            {

                grdFactoryOutward.DataSource = outTakeDetails;
                grdFactoryOutward.DataBind();
                if (grdFactoryOutward.Rows.Count > 0)
                {
                    grdFactoryOutward.UseAccessibleHeader = true;
                    grdFactoryOutward.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                grdFactoryOutward.Columns[1].Visible = true;
            }
            else
            {
                outTakeDetails.Rows.Add(outTakeDetails.NewRow());
                grdFactoryOutward.DataSource = outTakeDetails;
                grdFactoryOutward.DataBind();

                grdFactoryOutward.Columns[1].Visible = false;

            }
        }

        protected void grdFactoryOutward_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFactoryOutward.PageIndex = e.NewPageIndex;
            LoadData(Convert.ToInt32(hdnFactoryIntakeId.Value));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Factory/Admin/AddEditFatcoryOutward.aspx?OutwardId=0");
        }

        protected void grdFactoryOutward_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}