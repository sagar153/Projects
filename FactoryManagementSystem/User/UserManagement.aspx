<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="FactoryManagementSystem.User.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>User Management</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdUsers"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="UserId"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            OnRowCancelingEdit="grdUsers_RowCancelingEdit"
                            OnRowEditing="grdUsers_RowEditing"
                            OnRowUpdating="grdUsers_RowUpdating"
                            Width="90%">
                            <Columns>
                                <%--UserName--%>
                                <asp:TemplateField HeaderText="User Name" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtUserName" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The User Name field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtUserNames" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtUserNames" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The User Name field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--Password--%>
                                <asp:TemplateField HeaderText="Password" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtPassword" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Password field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPasswords" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtPasswords" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The Password field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--Admin Access--%>
                                <asp:TemplateField HeaderText="Admin Access"  HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chIsAdminAccess" runat="server" Checked='<%# Bind("Admin") %>'></asp:CheckBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdmin" runat="server" Text='<%# Bind("Admin") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:CheckBox ID="chkIsAdminAccess" runat="server"></asp:CheckBox>                                        
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--User Access--%>
                                <asp:TemplateField HeaderText="User Access"  HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chIsUserAccess" runat="server" Checked='<%# Bind("User") %>'></asp:CheckBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUser" runat="server" Text='<%# Bind("User") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:CheckBox ID="chkIsUserAccess" runat="server"></asp:CheckBox>                                        
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--Full Access--%>
                                <asp:TemplateField HeaderText="Full Access"  HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chIsFullAccess" runat="server" Checked='<%# Bind("Full") %>'></asp:CheckBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblFull" runat="server" Text='<%# Bind("Full") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:CheckBox ID="chkIsFullAccess" runat="server"></asp:CheckBox>                                        
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--FactoryOnly--%>
                                <asp:TemplateField HeaderText="Factory Only"  HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chIsFactoryOnly" runat="server" Checked='<%# Bind("FactoryOnly") %>'></asp:CheckBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblFactoryOnly" runat="server" Text='<%# Bind("FactoryOnly") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:CheckBox ID="chkIsFactoryOnly" runat="server"></asp:CheckBox>                                        
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <%--isActive--%>
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
                        <asp:AsyncPostBackTrigger ControlID="grdUsers" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
