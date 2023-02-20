using FactoryManagementSystem.DAL;
using System;
using System.Data;
using System.Linq;
using System.Web.UI;


namespace FactoryManagementSystem.Factory.User
{
    public partial class FactoryIntake : System.Web.UI.Page
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
            FactoryIntakeDAL intakeDAL = new FactoryIntakeDAL();
            var intakeDetails = intakeDAL.GetActiveFactoryIntake(GetYear());
            grdFactoryIntake.DataSource = intakeDetails;
            if (intakeDetails.Rows.Count > 0)
            {
                grdFactoryIntake.Columns[5].FooterText = intakeDetails.AsEnumerable().Select(x => x.Field<decimal>("Weight")).Sum().ToString();
            }
            grdFactoryIntake.DataBind();
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

        protected void grdFactoryIntake_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            grdFactoryIntake.PageIndex = e.NewPageIndex;
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

            Response.AddHeader("content-disposition", "attachment;filename = FactoryIntake.xls");
            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            grdFactoryIntake.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
        }

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            ExportToExcel();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            FactoryIntakeDAL intakeDAL = new FactoryIntakeDAL();
            var details = intakeDAL.GetActiveFactoryIntake(GetYear());

            var filter = details.AsEnumerable();
            if (!string.IsNullOrEmpty(calDate.Text.Trim()))
                filter = filter.Where(p => p.Field<DateTime>("Date").Date.ToString() == (Convert.ToDateTime(calDate.Text).Date.ToString()));
            if (!string.IsNullOrEmpty(txtCompany.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("CompanyName").ToLower().Contains(txtCompany.Text.Trim().ToLower()));
            if (!string.IsNullOrEmpty(txtVariety.Text.Trim()))
                filter = filter.Where(p => p.Field<string>("Variety").ToLower().Contains(txtVariety.Text.Trim().ToLower()));

            DataView view = filter.AsDataView();

            grdFactoryIntake.DataSource = view;
            if (view.Count > 0)
            {
                grdFactoryIntake.Columns[5].FooterText = filter.Select(x => x.Field<decimal>("Weight")).Sum().ToString();
            }
            grdFactoryIntake.DataBind();
        }
    }
}