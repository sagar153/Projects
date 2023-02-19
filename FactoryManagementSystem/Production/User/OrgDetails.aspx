<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrgDetails.aspx.cs" Inherits="FactoryManagementSystem.Production.User.OrgDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .controlWidth {
            width: 150px;
        }

        .bold {
           font-weight:bold;
        }
    </style>
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center" colspan="9">
                <strong>ORGANISER DETAILS</strong>
            </td>

        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">NAME:
            </td>
            <td>
                <asp:Label ID="lblOrganiserName" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">FATHER NAME:
            </td>
            <td>
                <asp:Label ID="lblFatherName" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">PHONE NUMBER:
            </td>
            <td>
                <asp:Label ID="lblMobile" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">VILLAGE:
            </td>
            <td>
                <asp:Label ID="lblVillage" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">AREA:
            </td>
            <td>
                <asp:Label ID="lblArea" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">NO OF ACRES:
            </td>
            <td>
                <asp:Label ID="lblAcres" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">NO OF FRAMERS:
            </td>
            <td>
                <asp:Label ID="lblFarmerCount" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">VARIETIES:
            </td>
            <td>
                <asp:Label ID="lblVarieties" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">ADVANCE TILL DATE:
            </td>
            <td>
                <asp:Label ID="lblAdvance" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; text-align: right; padding-right: 5px;font-weight:bold;">TOTAL HARVESTED:
            </td>
            <td>
                <asp:Label ID="lblTotalTonnage" runat="server" CssClass="controlWidth"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
