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
    public partial class Bins : System.Web.UI.Page
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

        protected void grdBins_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdBins.EditIndex = -1;
            LoadData();
        }

        protected void grdBins_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdBins.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grdBins_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(grdBins.DataKeys[e.RowIndex].Values["BinId"].ToString());
            BinDAL binDAL = new BinDAL();
            Models.Bin bin = new Models.Bin();
            bin.BinId = id;
            bin.BinName = "";
            bin.isActive = false;
            binDAL.Delete(bin);
            LoadData();
        }

        protected void grdBins_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt16(grdBins.DataKeys[e.RowIndex].Values["BinId"].ToString());
            TextBox txtbinName = grdBins.Rows[e.RowIndex].FindControl("txtBinName") as TextBox;
            CheckBox chkIsActive = grdBins.Rows[e.RowIndex].FindControl("chIsActive") as CheckBox;

            BinDAL binDAL = new BinDAL();
            Models.Bin bin = new Models.Bin();
            bin.BinId = id;
            bin.BinName = txtbinName.Text.ToString();
            bin.isActive = chkIsActive.Checked;
            binDAL.Update(bin);
            grdBins.EditIndex = -1;
            LoadData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            TextBox txtbinName = grdBins.FooterRow.FindControl("txtBinNames") as TextBox;
            //CheckBox chkIsActive = grdBins.FooterRow.FindControl("chkIsActive") as CheckBox;

            BinDAL binDAL = new BinDAL();
            Models.Bin bin = new Models.Bin();
            bin.BinId = 0;
            bin.BinName = txtbinName.Text.ToString();
            bin.isActive = true;
            binDAL.Save(bin);
            grdBins.EditIndex = -1;
            LoadData();
        }
    }
}