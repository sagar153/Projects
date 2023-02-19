using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.User
{
    public partial class VarietyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var variety = Convert.ToString(Request.Params["name"]);
                lblVariety.InnerText = variety;
                LoadData(variety);
            }
        }

        private void LoadData(string strvariety)  // To show the data in the DataGridView  
        {
            CommonDAL commonDAL = new CommonDAL();
            string strYear = Session["Year"].ToString();
            var details = commonDAL.GetVarietiesByVariety(strYear, strvariety);
            gvVarieties.DataSource = details;
            if (details.Rows.Count > 0)
            {
                gvVarieties.Columns[2].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
            }
            gvVarieties.DataBind();
        }

        protected void gvVarieties_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                var variety = Convert.ToString(Request.Params["name"]);
                LinkButton lnkArea = (LinkButton)row.FindControl("lnkArea");
                Response.Redirect("/Production/User/FarmerDetails.aspx?type=variety&variety=" + variety + "&area=" + lnkArea.Text);
            }
        }
    }
}