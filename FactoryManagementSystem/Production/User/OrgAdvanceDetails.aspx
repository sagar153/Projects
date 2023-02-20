<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrgAdvanceDetails.aspx.cs" Inherits="FactoryManagementSystem.Production.User.OrgAdvanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdnOrgName" runat="server"/>
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center">
                <strong>ADVANCES</strong></td>
        </tr>
        <tr style="height: 20px; text-align: right">
            <td>
                <button id="btnAdd" runat="server" cssclass="btn btn-primary btn-sm"
                    onserverclick="btnAdd_ServerClick">
                    <i class="fas fa-file-excel"></i>
                </button>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdAdvance"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"                            
                            EmptyDataText="No Records Found"
                            DataKeyNames=""         
                            PageSize="10"
                            OnPageIndexChanging="grdAdvance_PageIndexChanging"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            Width="90%">
                            <Columns>
                                <%--OrganiserName--%>
                                <asp:TemplateField HeaderText="OrganiserName" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganiserName" runat="server" Text='<%# Bind("OrganiserName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" Text="Total:" runat="server"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--Advance--%>
                                <asp:TemplateField HeaderText="Advance" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdvance" runat="server" Text='<%# Bind("Advance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--AdvanceDate--%>
                                <asp:TemplateField HeaderText="AdvanceDate" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdvanceDate" runat="server" Text='<%# Bind("AdvanceDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Mobile--%>
                                <asp:TemplateField HeaderText="Mode" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMode" runat="server" Text='<%# Bind("Mode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Remarks--%>
                                <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                               
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdAdvance" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>

    </table>
</asp:Content>
