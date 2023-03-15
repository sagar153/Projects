using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
{
    public partial class BinMoist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
            }
        }

        private string GetYear()
        {
            string strYear = string.Empty;
            try
            {
                strYear = Session["Year"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("/Login.aspx");
            }
            return strYear;
        }

        private void LoadData()  // To show the data in the DataGridView  
        {
            BinMoistDAL moistDAL = new BinMoistDAL();
            var details = moistDAL.GetActiveBinMoist(GetYear());

            if (details.Rows.Count > 0)
            {
                grdBinMoist.DataSource = moistDAL.GetActiveBinMoist(GetYear());
                grdBinMoist.DataBind();
                if (grdBinMoist.Rows.Count > 0)
                {
                    grdBinMoist.UseAccessibleHeader = true;
                    grdBinMoist.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            else
            {
                grdBinMoist.DataSource = details;
                grdBinMoist.DataBind();
            }
        }

        protected void grdBinMoist_RowCommand(object sender, GridViewCommandEventArgs e)
        {            
            if (e.CommandName == "EditBinMoist")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                int id = Convert.ToInt32(grdBinMoist.DataKeys[row.RowIndex].Values["BinDailyMoistId"].ToString());
                Response.Redirect("/Factory/Admin/AddEditBinMoist.aspx?Id=" + id.ToString());
            }
        }

        protected void grdBinMoist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdBinMoist.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Factory/Admin/AddEditBinMoist.aspx?Id=0");
        }
    }
}