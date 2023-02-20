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
    public partial class FarmerDetails : System.Web.UI.Page
    {
        string variety;
        string area;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {               
                var type = Convert.ToString(Request.Params["type"]);
                if (type == "variety")
                {
                    variety = Convert.ToString(Request.Params["variety"]);
                    area = Convert.ToString(Request.Params["area"]);
                    lblheader.InnerText = "VARIETIES - "+ variety + " - " + area;
                    LoadData(variety, area);
                }
                if (type == "acres")
                {
                    area = Convert.ToString(Request.Params["area"]);                    
                    LoadDataByArea(area);
                }                
            }
        }

        private void LoadDataByArea(string strArea)  // To show the data in the DataGridView  
        {
            CommonDAL commonDAL = new CommonDAL();
            var details = commonDAL.GetFarmersByArea(GetYear(), strArea);
            gvFarmerDetails.DataSource = details;
            if (details.Rows.Count > 0)
            {
                lblOrg.InnerHtml = "ORGANISER: "+ details.Rows[0]["OrganiserName"].ToString();
                lblheader.InnerText = "ACRES - "+ area;
                gvFarmerDetails.Columns[2].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
            }
            gvFarmerDetails.DataBind();            
        }

        private void LoadData(string strvariety, string strArea)  // To show the data in the DataGridView  
        {
            CommonDAL commonDAL = new CommonDAL();            
            var details = commonDAL.GetFarmersByVarietyAndArea(GetYear(), strvariety, strArea);
            gvFarmerDetails.DataSource = details;
            if (details.Rows.Count > 0)
            {
                var sum = details.AsEnumerable().Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
                lblOrg.InnerHtml = "AREA: " + area + "(" + sum + ")<br/>" + "ORGANISER: " + details.Rows[0]["OrganiserName"].ToString();
                gvFarmerDetails.Columns[2].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("ACRES")).Sum().ToString();
                gvFarmerDetails.Columns[7].FooterText = details.AsEnumerable().Select(x => x.Field<decimal>("TotalTonnage")).Sum().ToString();
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
            var type = Convert.ToString(Request.Params["type"]);
            if (type == "variety")
            {
                variety = Convert.ToString(Request.Params["variety"]);
                area = Convert.ToString(Request.Params["area"]);
                lblheader.InnerText = "VARIETIES - " + variety + " - " + area;
                LoadData(variety, area);
            }
            if (type == "acres")
            {
                area = Convert.ToString(Request.Params["area"]);
                LoadDataByArea(area);
            }
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
    }
}