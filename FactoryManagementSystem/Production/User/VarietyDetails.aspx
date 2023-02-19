<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VarietyDetails.aspx.cs" Inherits="FactoryManagementSystem.Production.User.VarietyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="text-align:center">
                <strong>VARIETIES - <label runat="server" id="lblVariety"/></strong></td>
        </tr>
        <tr style="height:20px;"></tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanelCR" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvVarieties"
                            runat="server"
                            AutoGenerateColumns="False"
                            ShowHeaderWhenEmpty="True"
                            OnRowCommand="gvVarieties_RowCommand"
                            AllowPaging="True"
                            AllowSorting="True"
                            ShowFooter="True"
                            EmptyDataText="No Records Found"
                            DataKeyNames="Area"
                            CssClass="table table-striped table-bordered table-hover table-condensed"                            
                            Width="600px">
                            <Columns>
                                <asp:TemplateField HeaderText="Area" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkArea" runat="server" CommandName="Details" Text='<%# Bind("Area") %>'></asp:LinkButton>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OrganiserName" HeaderStyle-HorizontalAlign="Center">                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganiserName" runat="server" Text='<%# Bind("OrganiserName") %>'></asp:Label>
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
                                
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="gvVarieties" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>

        </tr>
        
    </table>
</asp:Content>
