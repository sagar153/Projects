using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.User
{
    public partial class CompanyDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var companyId = Convert.ToInt32(Request.Params["Id"]);
            if (!Page.IsPostBack)
            {
                LoadData(companyId);
            }
        }

        private void LoadData(int companyId)  // To show the data in the DataGridView  
        {
            CompanyDAL companyDAL = new CompanyDAL();
            string strYear = Convert.ToString(Session["Year"]);
            var companyDetails = companyDAL.GetCompaniesDetailsById(strYear, companyId);

            if(companyDetails.Rows.Count>0)
            {
                lblCompanyName.InnerText = companyDetails.Rows[0]["CompanyName"].ToString();
            }

            grdCompanyDetails.DataSource = companyDetails;
            grdCompanyDetails.DataBind();
        }
    }
}