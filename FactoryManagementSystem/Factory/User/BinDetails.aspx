<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BinDetails.aspx.cs" Inherits="FactoryManagementSystem.Factory.User.BinDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>Bin Details</strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvBinMoist"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"                            
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="BinDailyMoistId"
                            CssClass="table table-striped table-bordered table-hover table-condensed"                            
                            Width="90%">
                            <Columns>
                                <asp:TemplateField HeaderText="Bin No" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblBinId" runat="server" Text='<%# Bind("BinName") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="Company" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="Variety" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblVariety" runat="server" Text='<%# Bind("Variety") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="MOR UpMoist" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblMrnUpMoist" runat="server" Text='<%# Bind("MorningUpMoist") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="MOR DownMoist" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblMrnDownMoist" runat="server" Text='<%# Bind("MorningDownMoist") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="EVE UpMoist" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblEveUpMoist" runat="server" Text='<%# Bind("EvnUpmoist") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="EVE DownMoist" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblEveUpMoist" runat="server" Text='<%# Bind("EvnDownMoist") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="Shelling" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblShelling" runat="server" Text='<%# Bind("Shelling") %>'></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblremarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>                                   
                                </asp:TemplateField>   
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvBinMoist" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
