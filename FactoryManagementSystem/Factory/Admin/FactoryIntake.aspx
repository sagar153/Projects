<%@ Page Title="" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="FactoryIntake.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.FactoryIntake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <table style="width: 100%;">
            <tr>
                <td style="text-align: center">
                    <strong>Factory Intake Management</strong></td>
            </tr>
            <tr style="height: 20px;"></tr>
            <tr class="p-0 m-0" style="height: auto">

                <td>
                    <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdFactoryIntake"
                                runat="server"
                                AutoGenerateColumns="False"
                                ShowHeaderWhenEmpty="True"
                                AllowPaging="True"
                                AllowSorting="True"
                                ShowFooter="True"
                                EmptyDataText="No Records Found"
                                DataKeyNames="FactoryIntakeId"
                                CssClass="table table-striped table-bordered table-hover table-condensed"
                                OnRowCommand="grdFactoryIntake_RowCommand"
                                OnPageIndexChanging="grdFactoryIntake_PageIndexChanging"
                                PageSize="5"
                                Width="90%"
                                Height="500px">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="50px">

                                        <FooterTemplate>
                                            <asp:Button ID="btnAdd" runat="server" Text="Add"
                                                ValidationGroup="Insert" CssClass="btn btn-primary btn-sm"
                                                OnClick="btnAdd_Click" />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEditDetails" Text="Edit Intake" CommandName="EditIntake" runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkShowDetails" Text="Show Outake" CommandName="ShowOutake" runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--CompanyId--%>
                                    <asp:TemplateField HeaderText="Company" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompanyId" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Year--%>
                                    <asp:TemplateField HeaderText="Year" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBinName" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Date--%>
                                    <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--LorryNo--%>
                                    <asp:TemplateField HeaderText="Lorry No" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLorryNo" runat="server" Text='<%# Bind("LorryNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Variety--%>
                                    <asp:TemplateField HeaderText="Variety" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblVariety" runat="server" Text='<%# Bind("Variety") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Weight--%>
                                    <asp:TemplateField HeaderText="Weight" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWeight" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Moist--%>
                                    <asp:TemplateField HeaderText="Moist" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMoist" runat="server" Text='<%# Bind("Moist") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Bags--%>
                                    <asp:TemplateField HeaderText="Bags" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBags" runat="server" Text='<%# Bind("Bags") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Lot--%>
                                    <asp:TemplateField HeaderText="Lot" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLot" runat="server" Text='<%# Bind("Lot") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Executive--%>
                                    <asp:TemplateField HeaderText="Executive" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblExecutive" runat="server" Text='<%# Bind("Executive") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--BinId--%>
                                    <asp:TemplateField HeaderText="Bin" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBinId" runat="server" Text='<%# Bind("BinName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Remarks--%>
                                    <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--isActive--%>
                                    <asp:TemplateField HeaderText="Active" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblisActive" runat="server" Text='<%# Bind("isActive") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                                <PagerStyle HorizontalAlign="Left" />
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="grdFactoryIntake" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>

            </tr>

        </table>
    </div>
</asp:Content>
