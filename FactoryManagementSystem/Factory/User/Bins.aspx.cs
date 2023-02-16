using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.User
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
            BinDAL binsDAL = new BinDAL();
            gvBins.DataSource = binsDAL.GetActiveBins();
            gvBins.DataBind();
        }

        protected void gvBins_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                Label Id = (Label)row.FindControl("lblBinId");
                Response.Redirect("/Factory/Admin/Bins.aspx");
            }
        }
    }
}