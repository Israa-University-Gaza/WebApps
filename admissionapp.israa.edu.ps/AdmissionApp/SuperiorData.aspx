<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="SuperiorData.aspx.cs" Inherits="AdmissionApp_SuperiorDate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#SuperiorData').addClass('holder-active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet-body form">
        <div class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-2 control-label">صلة القرابة</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCSuperiorLink" runat="server" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCSuperiorLink_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=12) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1, N'إختر صلة القرابة' union SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=15) AND (ArName=N'غير ذلك') AND ([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">اسم ولي الامر</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="link" runat="server" class="form-group" visible="false">
                    <label class="col-md-2 control-label">صلة القرابة</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorLink" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" style="padding-left: 0;">رقم هوية ولي الامر</label>
                    <div class="col-md-4">
                        <asp:Label ID="lblFatherSSN" runat="server" Visible="false"></asp:Label>
                        <asp:TextBox ID="txtSuperiorSSN" CssClass="form-control numeric" runat="server"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">عنوان ولي الأمر</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorAddress" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">مهنة ولي الأمر</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCSuperiorJopID" runat="server" DataSourceID="SqlDataSource5" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCSuperiorJopID_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT  [ID], [ArName] FROM [ConstantDetails] WHERE  ((ConstantID=11) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المهنة' union SELECT [ID], [ArName] FROM [ConstantDetails] WHERE ((ConstantID=15) AND (ArName=N'غير ذلك') AND ([IsActive] = 1) AND ([IsDelete] = 0))"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">مكان العمل</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorPlaceJop" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div id="job" runat="server" class="form-group" visible="false">
                    <label class="col-md-2 control-label">مهنة ولي الأمر</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorJop" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">هاتف ولي الامر</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorPhone" CssClass="form-control numeric" runat="server"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">جوال ولي الامر</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtSuperiorMobile" CssClass="form-control numeric" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-md-5">
                        <a href="MainData.aspx" class="btn btn-rounded green default">السابق</a>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSaveSuperiorData" runat="server" CssClass="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveSuperiorData_Click" Text="حفظ" />
                    </div>
                    <div class="col-md-5" style="direction: ltr">
                        <asp:LinkButton ID="lbContactData" runat="server" CssClass="btn btn-rounded green default" Visible="false" OnClick="lbContactData_Click">التالي</asp:LinkButton>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>




