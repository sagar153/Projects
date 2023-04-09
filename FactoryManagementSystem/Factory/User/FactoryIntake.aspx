<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation ="false" CodeBehind="FactoryIntake.aspx.cs" Inherits="FactoryManagementSystem.Factory.User.FactoryIntake" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center">
                <strong>FACTORY - INTAKE</strong></td>
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
                        <asp:GridView ID="grdFactoryIntake"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            PageSize="10"
                            OnPageIndexChanging="grdFactoryIntake_PageIndexChanging"
                            EmptyDataText="No Records Found"
                            DataKeyNames="FactoryIntakeId"
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
                                <%--Executive--%>
                                <asp:TemplateField HeaderText="Organisor" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblExecutive" runat="server" Text='<%# Bind("Executive") %>'></asp:Label>
                                    </ItemTemplate>                                   
                                </asp:TemplateField>

                                <%--LorryNo--%>
                                <asp:TemplateField HeaderText="Lorry No" HeaderStyle-HorizontalAlign="Center">                                    
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

                                <%--Moist--%>
                                <asp:TemplateField HeaderText="In Moist" HeaderStyle-HorizontalAlign="Center">
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblMoist" runat="server" Text='<%# Bind("Moist") %>'></asp:Label>
                                    </ItemTemplate>
                                   
                                </asp:TemplateField>

                                <%--BinName--%>
                                <asp:TemplateField HeaderText="Bin" HeaderStyle-HorizontalAlign="Center">
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblBinName" runat="server" Text='<%# Bind("BinName") %>'></asp:Label>
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
                        <asp:AsyncPostBackTrigger ControlID="grdFactoryIntake" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>

    </table>
</asp:Content>
