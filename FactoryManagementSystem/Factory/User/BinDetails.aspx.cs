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

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        public void ExportToExcel()
        {
            Response.Clear();

            Response.AddHeader("content-disposition", "attachment;filename = BinDetails.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            gvBinMoist.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }
    }
}