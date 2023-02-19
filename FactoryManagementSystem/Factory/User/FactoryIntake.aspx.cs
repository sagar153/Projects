using FactoryManagementSystem.DAL;
using System;
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
            var intakeDetails = intakeDAL.GetAllFactoryIntake();

            if (intakeDetails.Rows.Count > 0)
            {
                grdFactoryIntake.DataSource = intakeDAL.GetActiveFactoryIntake(GetYear());
                grdFactoryIntake.DataBind();
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

        protected void grdFactoryIntake_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            grdFactoryIntake.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}