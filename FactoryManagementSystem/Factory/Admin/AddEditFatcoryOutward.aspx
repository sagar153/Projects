<%@ Page Title="" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="AddEditFatcoryOutward.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.AddEditFatcoryOutward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .controlWidth {
            width: 150px;
        }

        .controlWidth2 {
            width: 900px;
        }
    </style>
    <asp:HiddenField ID="hdnFactoryOutwardId" runat="server"/>

    <table style="width: 100%;">
        <tr>
            <td style="text-align: center" colspan="9">
                <strong>Add Edit Factory Outward</strong>
            </td>

        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblCompany" runat="server" Text='Company'></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCompany" runat="server" CssClass="controlWidth"></asp:DropDownList>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblYear" runat="server" Text='Year'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtYear" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblDate" runat="server" Text='Date'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="calDate" TextMode="Date" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblLorryNo" runat="server" Text='Lorry No'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLorryNo" runat="server" CssClass="controlWidth"></asp:TextBox>
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
                <asp:Label ID="lblWeight" runat="server" Text='Weight'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWeight" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblDCNo" runat="server" Text='DC No'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDCNo" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblBags" runat="server" Text='Bags'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBags" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="Exective" runat="server" Text='Executive'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtExecutive" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblRemarks" runat="server" Text='Remarks'></asp:Label>
            </td>
            <td colspan="2">
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
