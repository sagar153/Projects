using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.User
{
    public partial class BinDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var binId = Convert.ToInt32(Request.Params["binId"]);
            hdnBinId.Value = binId.ToString();
            if (!Page.IsPostBack)
            {

                LoadData(binId);
            }
        }

        private void LoadData(int binId)  // To show the data in the DataGridView  
        {
            BinMoistDAL binsDAL = new BinMoistDAL();
            gvBinMoist.DataSource = binsDAL.GetActiveBinMoist(GetYear(), binId);
            gvBinMoist.DataBind();
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

        protected void gvBinMoist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBinMoist.PageIndex = e.NewPageIndex;
            LoadData(Convert.ToInt32(hdnBinId));
        }
    }
}