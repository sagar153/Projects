<%@ Page Title="" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="FactoryOutward.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.FactoryOutward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hdnFactoryIntakeId" runat="server"/>
<div>
        <table style="width: 100%;">
            <tr>
                <td style="text-align: center">
                    <strong>Factory Outward Mangement</strong></td>
            </tr>
            <tr style="height: 20px;"></tr>
            <tr>

                <td>
                    <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grdFactoryOutward"
                                runat="server"
                                AutoGenerateColumns="False"
                                ShowHeaderWhenEmpty="True"
                                AllowPaging="True"
                                AllowSorting="True"
                                ShowFooter="True"
                                EmptyDataText="No Records Found"
                                DataKeyNames="FactoryIntakeId"
                                CssClass="table table-striped table-bordered table-hover table-condensed"
                                OnRowCommand="grdFactoryOutward_RowCommand"
                                OnPageIndexChanging="grdFactoryOutward_PageIndexChanging"
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

                                    <%--DCNo--%>
                                    <asp:TemplateField HeaderText="DCNo" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDCNo" runat="server" Text='<%# Bind("DCNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Remarks--%>
                                    <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--ShowingDate--%>
                                    <asp:TemplateField HeaderText="Showing Date" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblShowingDate" runat="server" Text='<%# Bind("ShowingDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--ShowingMoist--%>
                                    <asp:TemplateField HeaderText="Showing Moist" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblShowingMoist" runat="server" Text='<%# Bind("ShowingMoist") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--Hours--%>
                                    <asp:TemplateField HeaderText="Hours" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHours" runat="server" Text='<%# Bind("Hours") %>'></asp:Label>
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
                            <asp:AsyncPostBackTrigger ControlID="grdFactoryOutward" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>

            </tr>

        </table>
    </div>
</asp:Content>
