<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Areas.aspx.cs" Inherits="FactoryManagementSystem.Production.User.Areas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>ACRES</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvAreas"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            OnRowCommand="gvAreas_RowCommand"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames=""
                            CssClass="table table-striped table-bordered table-hover table-condensed"                            
                            Width="600px">
                            <Columns>
                                <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblArea" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                                    </ItemTemplate> 
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" Text="Total:" runat="server"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>                                                               
                                <asp:TemplateField HeaderText="ACRES" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblACRES" Text='<%# Bind("ACRES") %>' runat="server" ></asp:Label>                                        
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
                        <asp:AsyncPostBackTrigger ControlID="gvAreas" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
