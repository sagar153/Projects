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
            BinDAL binDAL = new BinDAL();
            var binDetails = binDAL.GetAllBin();

            if (binDetails.Rows.Count > 0)
            {

                grdBins.DataSource = binDAL.GetAllBin();
                grdBins.DataBind();
                if (grdBins.Rows.Count > 0)
                {
                    grdBins.UseAccessibleHeader = true;
                    grdBins.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                grdBins.Columns[2].Visible = true;
            }
            else
            {
                binDetails.Rows.Add(binDetails.NewRow());
                grdBins.DataSource = binDetails;
                grdBins.DataBind();

                grdBins.Columns[2].Visible = false;

            }
        }


        protected void grdFactoryIntake_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grdFactoryIntake_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void grdFactoryIntake_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdFactoryIntake_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }
    }
}