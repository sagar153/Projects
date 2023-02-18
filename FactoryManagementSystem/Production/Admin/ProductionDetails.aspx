<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductionDetails.aspx.cs" Inherits="FactoryManagementSystem.Production.Admin.ProductionDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .controlWidth {
            width: 150px;
        }

        .controlWidth2 {
            width: 100%;
        }
    </style>
    <asp:HiddenField ID="hdnProdId" runat="server"/>

    <table style="width: 100%;">
        <tr>
            <td style="text-align: center" colspan="9">
                <strong>PRODUCTION</strong>
            </td>

        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblYear" runat="server" Text='Year'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtYear" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblOrganiser" runat="server" Text='Organiser'></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlOrganiser" runat="server" CssClass="controlWidth"></asp:DropDownList>
            </td>           
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblFarmerName" runat="server" Text='FarmerName'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFarmerName" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblFatherName" runat="server" Text='FatherName'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFatherName" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>            
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>   
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblMobile" runat="server" Text='Mobile'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblACRES" runat="server" Text='ACRES'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtACRES" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblVariety" runat="server" Text='Variety'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtVariety" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblSurveyNo" runat="server" Text='SurveyNo'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSurveyNo" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>                       
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>       
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblVillage" runat="server" Text='Village'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtVillage" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td> 
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblArea" runat="server" Text='Area'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtArea" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="ShowingDate" runat="server" Text='ShowingDate'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="calShowingDate" TextMode="Date" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblHarvestDate" runat="server" Text='HarvestDate'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="calHarvestDate" TextMode="Date" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>                       
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>       
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblTotalTonnage" runat="server" Text='TotalTonnage'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTotalTonnage" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblRemarks" runat="server" Text='Remarks'></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtRemarks" runat="server" CssClass="controlWidth2"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblActive" runat="server" Text='Active'></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chkActive" runat="server" CssClass="controlWidth"></asp:CheckBox>
            </td>
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>
            <td style="text-align: center" colspan="9">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary btn-sm controlWidth" 
                    Text="Save" OnClick="btnSave_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
