using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Production.User
{
    public partial class OrgDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var orgId = Convert.ToInt32(Request.Params["orgId"]);
                LoadData(orgId);
            }
        }

        private void LoadData(int orgId)  // To show the data in the DataGridView  
        {
            OrganiserDAL orgDAL = new OrganiserDAL();
            var data = orgDAL.GetOrganiserDetails(GetYear(), orgId);
            if (data.Rows.Count > 0)
            {
                lblOrganiserName.Text = data.Rows[0]["OrganiserName"].ToString();
                lblFatherName.Text = data.Rows[0]["FatherName"].ToString();
                lblMobile.Text = data.Rows[0]["Mobile"].ToString();
                lblVillage.Text = data.Rows[0]["Village"].ToString();
                lblArea.Text = data.Rows[0]["Area"].ToString();
                lblAcres.Text = data.Rows[0]["Acres"].ToString();
                lblFarmerCount.Text = data.Rows[0]["FarmerCount"].ToString();
                lblVarieties.Text = data.Rows[0]["Varieties"].ToString();
                lblAdvance.Text = data.Rows[0]["Advance"].ToString();
                lblTotalTonnage.Text = data.Rows[0]["TotalTonnage"].ToString();
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
    }
}