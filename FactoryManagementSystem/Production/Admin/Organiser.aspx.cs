using FactoryManagementSystem.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactoryManagementSystem.Factory.Admin
{
    public partial class Organiser : System.Web.UI.Page
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
            OrganiserDAL orgDAL = new OrganiserDAL();
            var orgDetails = orgDAL.GetAllOrganiser();

            if (orgDetails.Rows.Count > 0)
            {

                grdOrganiser.DataSource = orgDAL.GetAllOrganiser();
                grdOrganiser.DataBind();
                if (grdOrganiser.Rows.Count > 0)
                {
                    grdOrganiser.UseAccessibleHeader = true;
                    grdOrganiser.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                grdOrganiser.Columns[6].Visible = true;
            }
            else
            {
                orgDetails.Rows.Add(orgDetails.NewRow());
                grdOrganiser.DataSource = orgDetails;
                grdOrganiser.DataBind();

                grdOrganiser.Columns[6].Visible = false;

            }
        }

        protected void grdOrganiser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdOrganiser.EditIndex = -1;
            LoadData();
        }

        protected void grdOrganiser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdOrganiser.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grdOrganiser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt16(grdOrganiser.DataKeys[e.RowIndex].Values["OrganiserId"].ToString());
            TextBox txtOrganiserName = grdOrganiser.Rows[e.RowIndex].FindControl("txtOrganiserName") as TextBox;
            TextBox txtFatherName = grdOrganiser.Rows[e.RowIndex].FindControl("txtFatherName") as TextBox;
            TextBox txtMobile = grdOrganiser.Rows[e.RowIndex].FindControl("txtMobile") as TextBox;
            TextBox txtArea = grdOrganiser.Rows[e.RowIndex].FindControl("txtArea") as TextBox;
            TextBox txtVillage = grdOrganiser.Rows[e.RowIndex].FindControl("txtVillage") as TextBox;
            CheckBox chkIsActive = grdOrganiser.Rows[e.RowIndex].FindControl("chIsActive") as CheckBox;

            OrganiserDAL orgDAL = new OrganiserDAL();
            Models.Organiser org = new Models.Organiser();
            org.OrganiserId = id;
            org.OrganiserName = txtOrganiserName.Text.ToString();
            org.FatherName = txtFatherName.Text.ToString();
            org.Mobile = txtMobile.Text.ToString();
            org.Area = txtArea.Text.ToString();
            org.Village = txtVillage.Text.ToString();
            org.isActive = chkIsActive.Checked;
            orgDAL.Update(org);
            grdOrganiser.EditIndex = -1;
            LoadData();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            TextBox txtOrganiserName = grdOrganiser.FooterRow.FindControl("txtOrganiserNames") as TextBox;
            TextBox txtFatherName = grdOrganiser.FooterRow.FindControl("txtFatherNames") as TextBox;
            TextBox txtMobile = grdOrganiser.FooterRow.FindControl("txtMobiles") as TextBox;
            TextBox txtArea = grdOrganiser.FooterRow.FindControl("txtAreas") as TextBox;
            TextBox txtVillage = grdOrganiser.FooterRow.FindControl("txtVillages") as TextBox;

            OrganiserDAL orgDAL = new OrganiserDAL();
            Models.Organiser org = new Models.Organiser();
            org.OrganiserId = 0;
            org.OrganiserName = txtOrganiserName.Text.ToString();
            org.FatherName = txtFatherName.Text.ToString();
            org.Mobile = txtMobile.Text.ToString();
            org.Area = txtArea.Text.ToString();
            org.Village = txtVillage.Text.ToString();
            org.isActive = true;
            orgDAL.Save(org);
            grdOrganiser.EditIndex = -1;
            LoadData();
        }

        protected void grdOrganiser_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdOrganiser.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}