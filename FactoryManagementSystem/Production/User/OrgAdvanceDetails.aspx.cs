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
    public partial class OrgAdvanceDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                var orgName = Request.Params["orgName"];
                hdnOrgName.Value = orgName;
                LoadData(orgName);
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

        private void LoadData(string orgName)  // To show the data in the DataGridView  
        {
            OrgAdvanceDAL orgAdvanceDAL = new OrgAdvanceDAL();

            var OrgAdvanceDetails = orgAdvanceDAL.GetAdvanceByOrganiser(GetYear(), orgName);
            grdAdvance.DataSource = OrgAdvanceDetails;            

            if (OrgAdvanceDetails.Rows.Count > 0)
            {
                grdAdvance.Columns[1].FooterText = OrgAdvanceDetails.AsEnumerable().Select(x => x.Field<decimal>("Advance")).Sum().ToString();
            }
            grdAdvance.DataBind();
        }

        protected void grdAdvance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAdvance.PageIndex = e.NewPageIndex;
            LoadData(hdnOrgName.Value);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        public void ExportToExcel()
        {
            Response.Clear();

            Response.AddHeader("content-disposition", "attachment;filename = Advance.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            grdAdvance.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }
    }
}