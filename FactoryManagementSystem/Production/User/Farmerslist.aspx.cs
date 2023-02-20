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
    public partial class Farmerslist : System.Web.UI.Page
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
            ProductionDAL prodDAL = new ProductionDAL();
            var details = prodDAL.GetProductionByYear(GetYear(), true);
            gvFarmerDetails.DataSource = details;
            if (details.Rows.Count > 0)
            {               
                gvFarmerDetails.Columns[5].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
                gvFarmerDetails.Columns[11].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("TotalTonnage")).Sum().ToString();
            }
            gvFarmerDetails.DataBind();
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

        protected void gvFarmerDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFarmerDetails.PageIndex = e.NewPageIndex;
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

            Response.AddHeader("content-disposition", "attachment;filename = FarmerDetails.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            gvFarmerDetails.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            ProductionDAL prodDAL = new ProductionDAL();
            var details = prodDAL.GetProductionByYear(GetYear(), true);

            var filter = details.AsEnumerable();
            if (!string.IsNullOrEmpty(txtFarmer.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("FarmerName").ToLower().Contains(txtFarmer.Text.Trim().ToLower()));
            if (!string.IsNullOrEmpty(txtFatherName.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("FatherName").ToLower().Contains(txtFatherName.Text.Trim().ToLower()));
            if (!string.IsNullOrEmpty(txtmobile.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("Mobile").Contains(txtmobile.Text.Trim()));
            
            DataView view = filter.AsDataView();

            gvFarmerDetails.DataSource = view;

            if (view.Count > 0)
            {
                gvFarmerDetails.Columns[5].FooterText = filter.Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
                gvFarmerDetails.Columns[11].FooterText = filter.Select(x => x.Field<decimal>("TotalTonnage")).Sum().ToString();
            }
            gvFarmerDetails.DataBind();
        }
    }
}