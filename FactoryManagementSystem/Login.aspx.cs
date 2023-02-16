using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.User
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {            
            UserDAL userDAL = new UserDAL();
            Models.User user = new Models.User();

            var userDetails = userDAL.VerifyUserAuthentication(txtUserName.Text.Trim().ToString(), txtPassword.Text.Trim().ToString());
            if (userDetails.Rows.Count > 0)
            {
                lblStatus.Text = string.Empty;
                Session["UserName"] = userDetails.Rows[0]["UserName"].ToString();
                Session["Year"] = userDetails.Rows[0]["Year"].ToString();
                Session["FullAccess"] = Convert.ToBoolean(userDetails.Rows[0]["Full"]);
                Session["AdminOnly"] = Convert.ToBoolean(userDetails.Rows[0]["Admin"]);
                Session["UsersOnly"] = Convert.ToBoolean(userDetails.Rows[0]["User"]);
                Session["FactoryOnly"] = Convert.ToBoolean(userDetails.Rows[0]["Factory"]);
            }
            else {
                lblStatus.Text = "Invalid UserName/Password.";
            }

        }
    }
}