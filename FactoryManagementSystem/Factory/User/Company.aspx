﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="FactoryManagementSystem.Factory.User.Companies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>COMPANIES</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvCompanies"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            OnRowCommand="gvCompanies_RowCommand"
                            AllowPaging="True"
                            AllowSorting="True"
                            PageSize="10"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="CompanyId"
                            OnPageIndexChanging="gvCompanies_PageIndexChanging"
                            CssClass="table table-striped table-bordered table-hover table-condensed"                            
                            Width="600px">
                            <Columns>
                                <asp:TemplateField HeaderText="Company Id" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyId" runat="server" Text='<%# Bind("CompanyId") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company Name" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>                               
                                <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDetails" Text="View Details" CommandName="Details" runat="server" ></asp:LinkButton>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>   
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvCompanies" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
