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

    }
}