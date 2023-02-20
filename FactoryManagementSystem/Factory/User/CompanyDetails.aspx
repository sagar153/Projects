<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="FactoryManagementSystem.Factory.User.CompanyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <asp:HiddenField ID="hdnCompanyId" runat="server"/>
    <table style="width: 100%;">
        <tr>
            <td style="text-align: center">
                <strong>COMPANY - <Label id="lblCompanyName" runat="server"/></strong></td>
        </tr>
        <tr style="height: 20px; text-align: right">
            <td>
                <button id="btnAdd" runat="server" cssclass="btn btn-primary btn-sm"
                    onserverclick="btnAdd_ServerClick">
                    <i class="fas fa-file-excel"></i>
                </button>
            </td>
        </tr>
        <tr style="height: 20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdCompanyDetails"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"             
                            PageSize="10"
                            OnPageIndexChanging="grdCompanyDetails_PageIndexChanging"
                            CssClass="table table-striped table-bordered table-hover table-condensed"                          
                            Width="90%">
                            <Columns>
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
                                <asp:TemplateField HeaderText="SH. Date" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("ShellingDate") %>'></asp:Label>
                                    </ItemTemplate>                              
                                </asp:TemplateField>
                                <%--CompanyName--%>
                                <asp:TemplateField HeaderText="SH. Moist" HeaderStyle-HorizontalAlign="Center">                                   
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("ShellingMoist") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <%--BinName--%>
                                <asp:TemplateField HeaderText="Bags" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblBinName" runat="server" Text='<%# Bind("Bags") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>
                                <%--Remarks--%>
                                <asp:TemplateField HeaderText="Lot" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Lot") %>'></asp:Label>
                                    </ItemTemplate>                              
                                </asp:TemplateField>
                                <%--CompanyName--%>
                                <asp:TemplateField HeaderText="Hrs" HeaderStyle-HorizontalAlign="Center">                                   
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("Hrs") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>                                  
                                <%--Executive--%>
                                <asp:TemplateField HeaderText="Executive" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblExecutive" runat="server" Text='<%# Bind("Executive") %>'></asp:Label>
                                    </ItemTemplate>                                   
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdCompanyDetails" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>

    </table>
</asp:Content>
