<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditBinMoist.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.AddEditBinMoist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        .controlWidth {
            width: 150px;
        }

        .controlWidth2 {
            width: 900px;
        }
    </style>
    <asp:HiddenField ID="hdnBinMoistId" runat="server"/>

    <table style="width: 100%;">
        <tr>
            <td style="text-align: center" colspan="9">
                <strong>Add Edit Bin Moist</strong>
            </td>
        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblDate" runat="server" Text='Date'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="calDate" TextMode="DateTimeLocal" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblYear" runat="server" Text='Year'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtYear" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblBin" runat="server" Text='Bin'></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlBin" runat="server" CssClass="controlWidth"></asp:DropDownList>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblCompany" runat="server" Text='Company'></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCompany" runat="server" CssClass="controlWidth"></asp:DropDownList>
            </td>
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblVariety" runat="server" Text='Variety'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtVariety" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblMornigUp" runat="server" Text='Morn. UpMoist'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMornUp" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblMornDown" runat="server" Text='Morn. DownMoist'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMornDown" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblEvnUp" runat="server" Text='Evn. UpMoist'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEvnUp" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblEvnDown" runat="server" Text='Evn. DownMoist'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEvnDown" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblShelling" runat="server" Text='Shelling'></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chkShelling" runat="server" CssClass="controlWidth"></asp:CheckBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblShellingDate" runat="server" Text='Shelling Date'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="calShellingDate" TextMode="DateTimeLocal" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblLot" runat="server" Text='Lot'></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtLot" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td> 
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>            
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
