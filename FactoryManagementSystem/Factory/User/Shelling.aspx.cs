﻿using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
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
            string strYear = Convert.ToString(Session["Year"]);
            BinMoistDAL binsDAL = new BinMoistDAL();
            grdShelling.DataSource = binsDAL.GetShellingDetails(strYear);
            grdShelling.DataBind();
        }
    }
}