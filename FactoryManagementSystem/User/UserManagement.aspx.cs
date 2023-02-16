using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.User
{
    public partial class UserManagement : System.Web.UI.Page
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
            UserDAL userDAL = new UserDAL();
            var userDetails = userDAL.GetAllUsers();

            if (userDetails.Rows.Count > 0)
            {

                grdUsers.DataSource = userDAL.GetAllUsers();
                grdUsers.DataBind();
                if (grdUsers.Rows.Count > 0)
                {
                    grdUsers.UseAccessibleHeader = true;
                    grdUsers.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                grdUsers.Columns[7].Visible = true;
            }
            else
            {
                userDetails.Rows.Add(userDetails.NewRow());
                grdUsers.DataSource = userDetails;
                grdUsers.DataBind();

                grdUsers.Columns[7].Visible = false;

            }
        }

        protected void grdUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdUsers.EditIndex = -1;
            LoadData();
        }

        protected void grdUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdUsers.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grdUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt16(grdUsers.DataKeys[e.RowIndex].Values["UserId"].ToString());
            TextBox txtUserName = grdUsers.Rows[e.RowIndex].FindControl("txtUserName") as TextBox;
            TextBox txtPassword = grdUsers.Rows[e.RowIndex].FindControl("txtPassword") as TextBox;
            CheckBox chIsAdminAccess = grdUsers.Rows[e.RowIndex].FindControl("chIsAdminAccess") as CheckBox;
            CheckBox chIsUserAccess = grdUsers.Rows[e.RowIndex].FindControl("chIsUserAccess") as CheckBox;
            CheckBox chIsFullAccess = grdUsers.Rows[e.RowIndex].FindControl("chIsFullAccess") as CheckBox;
            CheckBox chIsFactoryOnly = grdUsers.Rows[e.RowIndex].FindControl("chIsFactoryOnly") as CheckBox;
            CheckBox chIsActive = grdUsers.Rows[e.RowIndex].FindControl("chIsActive") as CheckBox;

            UserDAL userDAL = new UserDAL();
            Models.User user = new Models.User();
            user.UserId = id;
            user.UserName = txtUserName.Text.Trim().ToString();
            user.Password = txtPassword.Text.Trim().ToString();
            user.AdminModule = chIsAdminAccess.Checked;
            user.UserModule = chIsUserAccess.Checked;
            user.FullAccess = chIsFullAccess.Checked;
            user.FactoryOnly = chIsFactoryOnly.Checked;
            user.isActive = chIsActive.Checked;

            userDAL.Update(user);
            grdUsers.EditIndex = -1;
            LoadData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            TextBox txtUserName = grdUsers.FooterRow.FindControl("txtUserNames") as TextBox;
            TextBox txtPassword = grdUsers.FooterRow.FindControl("txtPasswords") as TextBox;
            CheckBox chkIsAdminAccess = grdUsers.FooterRow.FindControl("chkIsAdminAccess") as CheckBox;
            CheckBox chkIsUserAccess = grdUsers.FooterRow.FindControl("chkIsUserAccess") as CheckBox;
            CheckBox chkIsFullAccess = grdUsers.FooterRow.FindControl("chkIsFullAccess") as CheckBox;
            CheckBox chkIsFactoryOnly = grdUsers.FooterRow.FindControl("chkIsFactoryOnly") as CheckBox;

            UserDAL userDAL = new UserDAL();
            Models.User user = new Models.User();
            
            user.UserName = txtUserName.Text.Trim().ToString();
            user.Password = txtPassword.Text.Trim().ToString();
            user.isActive = true;
            user.AdminModule = chkIsAdminAccess.Checked;
            user.UserModule = chkIsUserAccess.Checked;
            user.FullAccess = chkIsFullAccess.Checked;
            user.FactoryOnly = chkIsFactoryOnly.Checked;

            userDAL.Save(user);
            grdUsers.EditIndex = -1;
            LoadData();
        }
    }
}