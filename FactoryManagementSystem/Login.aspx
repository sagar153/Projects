<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FactoryManagementSystem.User.Login" %>


<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> </title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <%--<webopt:BundleReference runat="server" Path="~/Content/css" />--%>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet" />
    <link href="Content/login.css" rel="stylesheet" />
</head>
<body>
    <section class="ftco-section">
        <div class="container">
            
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-10">
                    <div class="wrap d-md-flex">
                        
                        <div class="login-wrap p-4 p-lg-5">
                            <div class="d-flex">
                                <div >
                                    <h3 class="mb-4">Sign In</h3>
                                </div>
                                <asp:Label ID="lblStatus" runat="server" Text="" style="color:red;font-size:15px;padding-top:10px;padding-left:15px;"></asp:Label>
                            </div>
                            <form runat="server">
                                <asp:ScriptManager runat="server">
                                    <Scripts>
                                        <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                                        <%--Framework Scripts--%>
                                        <asp:ScriptReference Name="MsAjaxBundle" />
                                        <asp:ScriptReference Name="jquery" />
                                        <asp:ScriptReference Name="bootstrap" />
                                        <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                                        <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                                        <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                                        <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                                        <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                                        <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                                        <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                                        <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                                        <asp:ScriptReference Name="WebFormsBundle" />
                                        <%--Site Scripts--%>
                                    </Scripts>
                                </asp:ScriptManager>
                                <div class="form-group">
                                    <label class="label" for="name">Username</label>
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Username" required=""/>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="password">Password</label>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control" placeholder="Password" required=""/>
                                </div>
                                <div class="form-group">
                                    <label class="label" for="Year">Year</label>
                                    <asp:DropDownList runat="server" class="form-control" required="">
                                        <asp:ListItem Text="" Value="" />
                                        <asp:ListItem Text="2022-23" Value="2022-23"></asp:ListItem>
                                        <asp:ListItem Text="2023-24" Value="2023-24"></asp:ListItem>
                                        <asp:ListItem Text="2024-25" Value="2024-25"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:Button runat="server" ID="btnLogin" type="submit" class="form-control btn btn-primary submit px-3" Text="Sign In" OnClick="btnLogin_Click"></asp:Button>
                                </div>                                
                            </form>
                        </div>
                        <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                            <div class="text w-100">
                                <h2>Welcome to login</h2>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
