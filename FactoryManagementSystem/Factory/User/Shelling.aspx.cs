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
    public partial class Shelling : System.Web.UI.Page
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
            BinMoistDAL binsDAL = new BinMoistDAL();
            var details = binsDAL.GetShellingDetails(GetYear());
            grdShelling.DataSource = details;
            
            if (details.Rows.Count > 0)
            {
                grdShelling.Columns[7].FooterText = details.AsEnumerable().Select(x => x.Field<int>("Bags")).Sum().ToString();
            }
            grdShelling.DataBind();
        }

        protected void grdShelling_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdShelling.PageIndex = e.NewPageIndex;
            LoadData();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
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

        public void ExportToExcel()
        {
            Response.Clear();

            Response.AddHeader("content-disposition", "attachment;filename = Shelling.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            grdShelling.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            BinMoistDAL binsDAL = new BinMoistDAL();
            var details = binsDAL.GetShellingDetails(GetYear());

            var filter = details.AsEnumerable();
            if (!string.IsNullOrEmpty(calDate.Text.Trim()))
                filter = filter.Where(p => p.Field<DateTime>("Date").Date.ToString() == (Convert.ToDateTime(calDate.Text).Date.ToString()));
            if (!string.IsNullOrEmpty(txtCompany.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("CompanyName").ToLower().Contains(txtCompany.Text.Trim().ToLower()));
            if (!string.IsNullOrEmpty(txtBin.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("BinName").ToLower().Contains(txtBin.Text.Trim().ToLower()));

            DataView view = filter.AsDataView();

            grdShelling.DataSource = view;

            if (details.Rows.Count > 0)
            {
                grdShelling.Columns[7].FooterText = details.AsEnumerable().Select(x => x.Field<int>("Bags")).Sum().ToString();
            }
            grdShelling.DataBind();
        }
    }
}