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
            if (!Page.IsPostBack)
            {

                LoadData(binId);
            }
        }

        private void LoadData(int binId)  // To show the data in the DataGridView  
        {
            string strYear = "2022-23";
            BinMoistDAL binsDAL = new BinMoistDAL();
            gvBinMoist.DataSource = binsDAL.GetActiveBinMoist(strYear, binId);
            gvBinMoist.DataBind();
        }
    }
}