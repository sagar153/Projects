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
            var companyDetails = companyDAL.GetCompaniesDetailsById(GetYear(), companyId);

            grdCompanyDetails.DataSource = companyDetails;          

            if (companyDetails.Rows.Count > 0)
            {
                lblCompanyName.InnerText = companyDetails.Rows[0]["CompanyName"].ToString();
                grdCompanyDetails.Columns[3].FooterText = companyDetails.AsEnumerable().Select(x => x.Field<decimal?>("Weight")).Sum().ToString();
                grdCompanyDetails.Columns[8].FooterText = companyDetails.AsEnumerable().Select(x => x.Field<int?>("Bags")).Sum().ToString();
            }
            grdCompanyDetails.DataBind();
        }

        protected void grdCompanyDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCompanyDetails.PageIndex = e.NewPageIndex;
            var companyId = Convert.ToInt32(Request.Params["Id"]);
            LoadData(companyId);
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

            grdCompanyDetails.AllowPaging = false;
            var companyId = Convert.ToInt32(Request.Params["Id"]);
            LoadData(companyId);

            grdCompanyDetails.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            CompanyDAL companyDAL = new CompanyDAL();
            
            var details = companyDAL.GetCompaniesDetailsById(GetYear(), Convert.ToInt32(Request.Params["Id"]));

            var filter = details.AsEnumerable();
            if (!string.IsNullOrEmpty(calDate.Text.Trim()))
                filter = filter.Where(p => p.Field<DateTime>("Date").Date.ToString() == (Convert.ToDateTime(calDate.Text).Date.ToString()));
            if (!string.IsNullOrEmpty(txtLorry.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("LorryNo").ToLower().Contains(txtLorry.Text.Trim().ToLower()));
            if (!string.IsNullOrEmpty(txtVariety.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("Variety").ToLower().Contains(txtVariety.Text.Trim().ToLower()));

            DataView view = filter.AsDataView();
            grdCompanyDetails.DataSource = view;

            if (view.Count > 0)
            {
                grdCompanyDetails.Columns[3].FooterText = filter.Select(x => x.Field<decimal>("Weight")).Sum().ToString();
                grdCompanyDetails.Columns[8].FooterText = filter.Select(x => x.Field<int>("Bags")).Sum().ToString();
            }
            grdCompanyDetails.DataBind();
            
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