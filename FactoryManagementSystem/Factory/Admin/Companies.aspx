<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.Companies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>Bin Management</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdBins"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="BinId"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            OnRowCancelingEdit="grdBins_RowCancelingEdit"
                            OnRowEditing="grdBins_RowEditing"
                            OnRowUpdating="grdBins_RowUpdating"
                            Width="600px">
                            <Columns>
                                <asp:TemplateField HeaderText="Bin Name" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtBinName" runat="server" Text='<%# Bind("BinName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtBinName" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Bin Name field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblBinName" runat="server" Text='<%# Bind("BinName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtBinNames" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtBinNames" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The Bin Name field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active"  HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chIsActive" runat="server" Checked='<%# Bind("isActive") %>'></asp:CheckBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblisActive" runat="server" Text='<%# Bind("isActive") %>'></asp:Label>
                                    </ItemTemplate>
                                    <%--<FooterTemplate>
                                        <asp:CheckBox ID="chkIsActive" runat="server" Checked='<%# Bind("isActive") %>'></asp:CheckBox>

                                    </FooterTemplate>--%>
                                </asp:TemplateField>
                                <asp:CommandField ItemStyle-Width="100px" ShowEditButton="True"
                                    ValidationGroup="Edit" />
                                <asp:TemplateField ItemStyle-Width="50px">
                                    <%--<ItemTemplate>
                                        <asp:LinkButton ID="lnkRemove" runat="server"
                                            CommandArgument='<%# Bind("BinId")%>'
                                            OnClientClick="return confirm
					('Are you sure you want to delete this bin?')"
                                            Text="Delete" OnClick="lnkRemove_Click"></asp:LinkButton>
                                    </ItemTemplate>--%>
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
                        <asp:AsyncPostBackTrigger ControlID="grdBins" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
