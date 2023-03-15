<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BinMoist.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.BinMoist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center">
                <strong>Bin Moist & shelling</strong></td>
        </tr>
        <tr style="height: 20px; text-align: right">
            <td>
                <button id="btnAdd" runat="server" cssclass="btn btn-primary btn-sm"
                    onserverclick="btnAdd_Click">
                    <i class="fas fa-plus"></i>
                </button>
            </td>
        </tr>
        <tr class="p-0 m-0" style="height: auto">
            <td style="padding-top: 2px;">
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdBinMoist"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="BinDailyMoistId"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            OnRowCommand="grdBinMoist_RowCommand"
                            OnPageIndexChanging="grdBinMoist_PageIndexChanging"
                            PageSize="10"
                            Width="100%">
                            <Columns>
                                <%--Date--%>
                                <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Bin--%>
                                <asp:TemplateField HeaderText="BinName" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBinName" runat="server" Text='<%# Bind("BinName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--CompanyId--%>
                                <asp:TemplateField HeaderText="Company" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <%--Variety--%>
                                <asp:TemplateField HeaderText="Variety" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVariety" runat="server" Text='<%# Bind("Variety") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--MorningUpMoist--%>
                                <asp:TemplateField HeaderText="MorningUpMoist" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMorningUpMoist" runat="server" Text='<%# Bind("MorningUpMoist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--MorningDownMoist--%>
                                <asp:TemplateField HeaderText="MorningDownMoist" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMorningDownMoist" runat="server" Text='<%# Bind("MorningDownMoist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--EvnUpmoist--%>
                                <asp:TemplateField HeaderText="EvnUpmoist" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEvnUpmoist" runat="server" Text='<%# Bind("EvnUpmoist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--EvnDownMoist--%>
                                <asp:TemplateField HeaderText="EvnDownMoist" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEvnDownMoist" runat="server" Text='<%# Bind("EvnDownMoist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Shelling--%>
                                <asp:TemplateField HeaderText="Shelling" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblShelling" runat="server" Text='<%# Bind("Shelling") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--ShellingDate--%>
                                <asp:TemplateField HeaderText="ShellingDate" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblShellingDate" runat="server" Text='<%# Bind("ShellingDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Lot--%>
                                <asp:TemplateField HeaderText="Lot" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLot" runat="server" Text='<%# Bind("Lot") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEditDetails" Text="Edit" CommandName="EditBinMoist" runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdBinMoist" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
