<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FactoryOutward.aspx.cs" Inherits="FactoryManagementSystem.Factory.User.FactoryOutward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center">
                <strong>FACTORY - OUTWARD</strong></td>
        </tr>
        <tr style="height: 10px;"></tr>
        <tr style="height: 20px;">
            <td style="width: 90%">
                <table>
                    <tr>
                        <td style="width: 35px;">Date:</td>
                        <td style="width: 50px; padding-right: 10px;">
                            <asp:TextBox TextMode="Date" runat="server" ID="calDate"></asp:TextBox></td>
                        <td style="width: 65px;">Company:</td>
                        <td style="width: 100px; padding-right: 10px;">
                            <asp:TextBox runat="server" ID="txtCompany"></asp:TextBox></td>
                        <td style="width: 50px;">Variety:</td>
                        <td style="width: 100px; padding-right: 10px;">
                            <asp:TextBox runat="server" ID="txtVariety"></asp:TextBox></td>
                        <td>
                            <button id="btnSearch" runat="server" cssclass="btn btn-primary btn-sm" onserverclick="btnSearch_ServerClick">
                                <i class="fas fa-search"></i>
                            </button>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: right; width: 10%">
                <button id="btnAdd" runat="server" cssclass="btn btn-primary btn-sm"
                    onserverclick="btnAdd_ServerClick">
                    <i class="fas fa-file-excel"></i>
                </button>
            </td>
        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdOutward"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            PageSize="10"
                            OnPageIndexChanging="grdOutward_PageIndexChanging"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            Width="100%">
                            <Columns>
                                <%--Date--%>
                                <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--CompanyName--%>
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
                                <%--LorryNo--%>
                                <asp:TemplateField HeaderText="LorryNo" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLorryNo" runat="server" Text='<%# Bind("LorryNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" Text="Total:" runat="server"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--Weight--%>
                                <asp:TemplateField HeaderText="Weight" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWeight" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Bags--%>
                                <asp:TemplateField HeaderText="Bags" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBags" runat="server" Text='<%# Bind("Bags") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--DCNo--%>
                                <asp:TemplateField HeaderText="DC.No" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDCNo" runat="server" Text='<%# Bind("DCNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Comp Exe--%>
                                <asp:TemplateField HeaderText="Comp.EXE" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExecutive" runat="server" Text='<%# Bind("CompanyExecutive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--Remarks--%>
                                <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdOutward" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>

    </table>
</asp:Content>
