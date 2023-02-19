<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Production.aspx.cs" Inherits="FactoryManagementSystem.Production.Admin.Production" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center">
                <strong>PRODUCTION</strong></td>
        </tr>
        <tr style="height: 20px; text-align: right">
            <td>
                <button id="btnAdd" runat="server" cssclass="btn btn-primary btn-sm"
                    onserverclick="btnAdd_Click">
                    <i class="fas fa-plus"></i>
                </button>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdProduction"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="ProductionId"
                            OnRowCommand="grdProduction_RowCommand"
                            PageSize="10"
                            OnPageIndexChanging="grdProduction_PageIndexChanging"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            Width="90%">
                            <Columns>
                                <%--OrganiserName--%>
                                <asp:TemplateField HeaderText="OrganiserName" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganiserName" runat="server" Text='<%# Bind("OrganiserName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--FarmerName--%>
                                <asp:TemplateField HeaderText="Farmer Name" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFarmerName" runat="server" Text='<%# Bind("FarmerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--FatherName--%>
                                <asp:TemplateField HeaderText="Father Name" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFatherName" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Mobile--%>
                                <asp:TemplateField HeaderText="Mobile" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Variety--%>
                                <asp:TemplateField HeaderText="Variety" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVariety" runat="server" Text='<%# Bind("Variety") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--SurveyNo--%>
                                <asp:TemplateField HeaderText="SurveyNo" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurveyNo" runat="server" Text='<%# Bind("SurveyNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--ACRES--%>
                                <asp:TemplateField HeaderText="ACRES" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblACRES" runat="server" Text='<%# Bind("ACRES") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Village--%>
                                <asp:TemplateField HeaderText="Village" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVillage" runat="server" Text='<%# Bind("Village") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Area--%>
                                <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArea" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--ShowingDate--%>
                                <asp:TemplateField HeaderText="ShowingDate" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblShowingDate" runat="server" Text='<%# Bind("ShowingDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--HarvestDate--%>
                                <asp:TemplateField HeaderText="HarvestDate" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblHarvestDate" runat="server" Text='<%# Bind("HarvestDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--TotalTonnage--%>
                                <asp:TemplateField HeaderText="TotalTonnage" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalTonnage" runat="server" Text='<%# Bind("TotalTonnage") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Remarks--%>
                                <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEditDetails" Text="Edit" CommandName="EditProd" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdProduction" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>

    </table>
</asp:Content>
