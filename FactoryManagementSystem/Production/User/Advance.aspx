<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Advance.aspx.cs" Inherits="FactoryManagementSystem.Production.User.Advance" %>
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
                        <asp:GridView ID="gvAdv"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            OnRowCommand="gvAdv_RowCommand"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            PageSize="10"
                            DataKeyNames="OrganiserName"
                            OnPageIndexChanging="gvAdv_PageIndexChanging"
                            CssClass="table table-striped table-bordered table-hover table-condensed"                            
                            Width="600px">
                            <Columns>                                                                                              
                                <asp:TemplateField HeaderText="OrganiserName" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganiserName" Text='<%# Bind("OrganiserName") %>' runat="server" ></asp:Label>                                        
                                    </ItemTemplate>                                    
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="Advance" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdvance" Text='<%# Bind("Advance") %>' runat="server" ></asp:Label>                                        
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
                        <asp:AsyncPostBackTrigger ControlID="gvAdv" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
