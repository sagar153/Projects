<%@ Page Title="" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="FactoryOutward.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.FactoryOutward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .controlWidth {
            width: 150px;
        }

        .controlWidth2 {
            width: 900px;
        }
    </style>
    <asp:HiddenField ID="hdnFactoryIntakeId" runat="server"/>

    <table style="width: 100%;">
        <tr>
            <td style="text-align: center" colspan="7">
                <strong>Factory Outward Mangement</strong>
            </td>

        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="lblDCNo" runat="server" Text='DC No'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDCNo" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <asp:Label ID="lblRemarks" runat="server" Text='Remarks'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRemarks" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <asp:Label ID="lblShowingDate" runat="server" Text='Showing Date'></asp:Label>
            </td>
            <td>
                <asp:Calendar ID="calShowingDate" runat="server" CssClass="controlWidth"></asp:Calendar>
            </td>
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="lblShowingMoist" runat="server" Text='Showing Moist'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtShowingMoist" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <asp:Label ID="lblHours" runat="server" Text='Hours'></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtHours" runat="server" CssClass="controlWidth"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <asp:Label ID="lblActive" runat="server" Text='isActive'></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="chkisActive" runat="server" CssClass="controlWidth"></asp:CheckBox>
            </td>
        </tr>
        <tr style="height: 30px;"></tr>
        <tr>
            <td style="text-align: center" colspan="7">
                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary btn-sm controlWidth" 
                    Text="Save" OnClick="btnSave_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
