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
    public partial class FactoryOutward : System.Web.UI.Page
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
            FactoryOutwardDAL outwardDAL = new FactoryOutwardDAL();
            var details = outwardDAL.GetActiveFactoryOutward(GetYear());
            grdOutward.DataSource = details;
            
            if (details.Rows.Count > 0)
            {
                grdOutward.Columns[5].FooterText = details.AsEnumerable().Select(x => x.Field<int?>("Bags")).Sum().ToString();
                grdOutward.Columns[4].FooterText = details.AsEnumerable().Select(x => x.Field<decimal?>("Weight")).Sum().ToString();
            }
            grdOutward.DataBind();
        }

        protected void grdOutward_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdOutward.PageIndex = e.NewPageIndex;
            LoadData();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        public void ExportToExcel()
        {
            Response.Clear();

            Response.AddHeader("content-disposition", "attachment;filename = FactoryOutward.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            grdOutward.AllowPaging = false;
            LoadData();

            grdOutward.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            FactoryOutwardDAL outwardDAL = new FactoryOutwardDAL();
            var details = outwardDAL.GetActiveFactoryOutward(GetYear());

            var filter = details.AsEnumerable();
            if (!string.IsNullOrEmpty(calDate.Text.Trim()))
                filter = filter.Where(p => p.Field<DateTime>("Date").Date.ToString() == (Convert.ToDateTime(calDate.Text).Date.ToString()));
            if (!string.IsNullOrEmpty(txtCompany.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("CompanyName").ToLower().Contains(txtCompany.Text.Trim().ToLower()));
            if (!string.IsNullOrEmpty(txtVariety.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("Variety").ToLower().Contains(txtVariety.Text.Trim().ToLower()));

            DataView view = filter.AsDataView();

            grdOutward.DataSource = view;
            if (view.Count > 0)
            {
                grdOutward.Columns[5].FooterText = filter.Select(x => x.Field<int>("Bags")).Sum().ToString();
                grdOutward.Columns[4].FooterText = filter.Select(x => x.Field<decimal>("Weight")).Sum().ToString();
            }
            grdOutward.DataBind();
        }
    }
}