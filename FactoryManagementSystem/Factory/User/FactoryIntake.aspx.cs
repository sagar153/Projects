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
                string strYear = "2022-23";
                grdFactoryIntake.DataSource = intakeDAL.GetActiveFactoryIntake(strYear);
                grdFactoryIntake.DataBind();
            }
        }
    }
}