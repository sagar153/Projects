using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Data;
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
            hdnCompanyId.Value = companyId.ToString();
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

            grdCompanyDetails.DataSource = companyDetails;          

            if (companyDetails.Rows.Count > 0)
            {
                lblCompanyName.InnerText = companyDetails.Rows[0]["CompanyName"].ToString();
                grdCompanyDetails.Columns[3].FooterText = companyDetails.AsEnumerable().Select(x => x.Field<decimal>("Weight")).Sum().ToString();
                grdCompanyDetails.Columns[8].FooterText = companyDetails.AsEnumerable().Select(x => x.Field<int>("Bags")).Sum().ToString();
            }
            grdCompanyDetails.DataBind();
        }

        protected void grdCompanyDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCompanyDetails.PageIndex = e.NewPageIndex;
            LoadData(Convert.ToInt32(hdnCompanyId));
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        public void ExportToExcel()
        {
            Response.Clear();

            Response.AddHeader("content-disposition", "attachment;filename = CompanyDetails.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            grdCompanyDetails.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }
    }
}