<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.Companies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>Company Management</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdCompany"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="CompanyId"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            OnRowCancelingEdit="grdBins_RowCancelingEdit"
                            OnRowEditing="grdBins_RowEditing"
                            OnRowUpdating="grdBins_RowUpdating"
                            Width="600px">
                            <Columns>
                                <asp:TemplateField HeaderText="Company Name" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtCompanyName" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Bin Name field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtCompanyNames" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtCompanyNames" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The Company Name field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active"  HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chIsActive" runat="server" Checked='<%# Bind("isActive") %>'></asp:CheckBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblisActive" runat="server" Text='<%# Bind("isActive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ItemStyle-Width="100px" ShowEditButton="True"
                                    ValidationGroup="Edit" />
                                <asp:TemplateField ItemStyle-Width="50px">
                                    <FooterTemplate>
                                        <asp:Button ID="btnAdd" runat="server" Text="Add"
                                            ValidationGroup="Insert" CssClass="btn btn-primary btn-sm"
                                            OnClick="btnAdd_Click" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdCompany" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
