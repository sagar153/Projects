<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organiser.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.Organiser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>ORGANISER</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdOrganiser"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="OrganiserId"
                            CssClass="table table-striped table-bordered table-hover table-condensed"
                            OnRowCancelingEdit="grdOrganiser_RowCancelingEdit"
                            OnRowEditing="grdOrganiser_RowEditing"
                            OnRowUpdating="grdOrganiser_RowUpdating"
                            PageSize="10"
                            OnPageIndexChanging="grdOrganiser_PageIndexChanging"
                            Width="90%">
                            <Columns>
                                <asp:TemplateField HeaderText="Organiser Name" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOrganiserName" runat="server" Text='<%# Bind("OrganiserName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtOrganiserName" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The OrganiserName field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganiserName" runat="server" Text='<%# Bind("OrganiserName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtOrganiserNames" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtOrganiserNames" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The OrganiserName field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Father Name" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFatherName" runat="server" Text='<%# Bind("FatherName") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtFatherName" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The FatherName field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblFatherName" runat="server" Text='<%# Bind("FatherName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtFatherNames" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtFatherNames" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The FatherName field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtMobile" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Mobile field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtMobiles" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtMobiles" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The Mobile field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtArea" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtArea" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Area field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblArea" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtAreas" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtAreas" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The Area field is required." />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Village" HeaderStyle-HorizontalAlign="Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtVillage" runat="server" Text='<%# Bind("Village") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtVillage" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Village field is required." />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblVillage" runat="server" Text='<%# Bind("Village") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtVillages" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="txtVillages" Display="Dynamic"
                                            ValidationGroup="Insert"
                                            CssClass="text-danger"
                                            ErrorMessage="The Village field is required." />
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
                        <asp:AsyncPostBackTrigger ControlID="grdOrganiser" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
