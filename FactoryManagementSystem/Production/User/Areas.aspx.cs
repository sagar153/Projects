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
    public partial class Areas : System.Web.UI.Page
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
            CommonDAL commonDAL = new CommonDAL();           
            var details = commonDAL.GetAcres(GetYear());
            gvAreas.DataSource = commonDAL.GetAcres(GetYear());
            if(details.Rows.Count>0)
            gvAreas.Columns[1].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
            gvAreas.DataBind();
        }
        
        protected void gvAreas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                Label Id = (Label)row.FindControl("lblArea");
                Response.Redirect("/Production/User/FarmerDetails.aspx?type=acres&area=" + Id.Text);
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

        protected void gvAreas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAreas.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}