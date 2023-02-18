<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrgAdvanceDetails.aspx.cs" Inherits="FactoryManagementSystem.Production.Admin.OrgAdvanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
        .controlWidth {
            width: 150px;
        }

        .controlWidth2 {
            width: 100%;
        }
    </style>
    <asp:HiddenField ID="hdnadvanceId" runat="server"/>

    <table style="width: 100%;">
        <tr>
            <td style="text-align: center" colspan="9">
                <strong>ADVANCE</strong>
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
                <asp:Label ID="lblAdvance" runat="server" Text='Advance'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAdvance" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblAdvanceDate" runat="server" Text='AdvanceDate'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="calAdvanceDate" TextMode="Date" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>            
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>       
            <td style="width: 100px;text-align:right;padding-right:5px;">
                <asp:Label ID="lblMode" runat="server" Text='Mode'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMode" runat="server" CssClass="controlWidth"></asp:TextBox>
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
