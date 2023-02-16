<%@ Page Title="" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="FactoryIntake.aspx.cs" Inherits="FactoryManagementSystem.Factory.Admin.FactoryIntake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="width:64.3%; height:100%; overflow-x:scroll">
        <table >
            <tr>
                <td>
                    <strong>Factory Intake Management</strong></td>
            </tr>
            <tr style="height: 20px;"></tr>
            <tr class="p-0 m-0" style="height:auto">

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
                                OnRowCancelingEdit="grdFactoryIntake_RowCancelingEdit"
                                OnRowEditing="grdFactoryIntake_RowEditing"
                                OnRowUpdating="grdFactoryIntake_RowUpdating"
                                OnRowDataBound="grdFactoryIntake_RowDataBound"
                                OnPageIndexChanging="grdFactoryIntake_PageIndexChanging"
                                PageSize="5"
                                Width="600px"
                                Height="500px">
                                <Columns>
                                    <%--CompanyId--%>
                                    <asp:TemplateField HeaderText="Company" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlCompany" runat="server"></asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="ddlCompany" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Company field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompanyId" runat="server" Text='<%# Bind("CompanyId") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlCompanies" runat="server"></asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="ddlCompanies" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Company field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Year--%>
                                    <asp:TemplateField HeaderText="Year" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtYear" runat="server" Text='<%# Bind("Year") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtYear" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Year field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBinName" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtYears" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtYears" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Year field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Date--%>
                                    <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:Calendar ID="calDate" runat="server" SelectedDate='<%# Bind("Date") %>'></asp:Calendar>
                                            <%--                                        <asp:RequiredFieldValidator runat="server"
                                            ControlToValidate="calDate" Display="Dynamic"
                                            ValidationGroup="Edit"
                                            CssClass="text-danger"
                                            ErrorMessage="The Date field is required." />--%>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Calendar ID="calDates" runat="server" SelectedDate='<%# DateTime.Now %>'></asp:Calendar>
<%--                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtYears" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Date field is required." />--%>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--LorryNo--%>
                                    <asp:TemplateField HeaderText="Lorry No" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLorryNo" runat="server" Text='<%# Bind("LorryNo") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtLorryNo" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Lorry No field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLorryNo" runat="server" Text='<%# Bind("LorryNo") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtLorryNos" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtLorryNos" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Lorry No field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Variety--%>
                                    <asp:TemplateField HeaderText="Variety" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtVariety" runat="server" Text='<%# Bind("Variety") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtVariety" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Variety field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblVariety" runat="server" Text='<%# Bind("Variety") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtVarietys" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtVarietys" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Variety field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Weight--%>
                                    <asp:TemplateField HeaderText="Weight" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtWeight" runat="server" Text='<%# Bind("Weight") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtWeight" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Weight field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblWeight" runat="server" Text='<%# Bind("Weight") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtWeights" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtWeights" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Weight field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Moist--%>
                                    <asp:TemplateField HeaderText="Moist" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMoist" runat="server" Text='<%# Bind("Moist") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtMoist" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Moist field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMoist" runat="server" Text='<%# Bind("Moist") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtMoists" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtMoists" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Moist field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Bags--%>
                                    <asp:TemplateField HeaderText="Bags" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtBags" runat="server" Text='<%# Bind("Bags") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtBags" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Bags field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBags" runat="server" Text='<%# Bind("Bags") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtBagss" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtBagss" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Bags field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Lot--%>
                                    <asp:TemplateField HeaderText="Lot" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLot" runat="server" Text='<%# Bind("Lot") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtLot" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Lot field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLot" runat="server" Text='<%# Bind("Lot") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtLots" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="txtLots" Display="Dynamic"
                                                ValidationGroup="Insert"
                                                CssClass="text-danger"
                                                ErrorMessage="The Lot field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Executive--%>
                                    <asp:TemplateField HeaderText="Executive" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtExecutive" runat="server" Text='<%# Bind("Executive") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExecutive" runat="server" Text='<%# Bind("Executive") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtExecutives" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--BinId--%>
                                    <asp:TemplateField HeaderText="Bin" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlBin" runat="server"></asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="ddlBin" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Company field is required." />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBinId" runat="server" Text='<%# Bind("BinId") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlBins" runat="server"></asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server"
                                                ControlToValidate="ddlBins" Display="Dynamic"
                                                ValidationGroup="Edit"
                                                CssClass="text-danger"
                                                ErrorMessage="The Company field is required." />
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--Remarks--%>
                                    <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRemark" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <%--isActive--%>
                                    <asp:TemplateField HeaderText="Active" HeaderStyle-HorizontalAlign="Center">
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
