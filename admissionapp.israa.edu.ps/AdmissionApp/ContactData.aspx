<%@ Page Title="" Language="C#" MasterPageFile="~/AdmissionApp/MasterPage.master" AutoEventWireup="true" CodeFile="ContactData.aspx.cs" Inherits="AdmissionApp_ContactData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#ContactData').addClass('holder-active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="portlet-body form">
        <div class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-2 control-label">الدولة</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCountryID" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [Country] WHERE (([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر الدولة'"></asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">المحافظة</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlGovernoratesID" runat="server" DataSourceID="SqlDataSource7" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [Governorates] WHERE ((CountryID=@CountryID) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المحافظة'">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCountryID" Name="CountryID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">المدينة</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCityID" runat="server" DataSourceID="SqlDataSource8" DataTextField="ArName" DataValueField="ID" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT [ID], [ArName] FROM [City] WHERE ((GovernoratesID=@GovernoratesID) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union Select -1 , N'إختر المدينة'">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlGovernoratesID" Name="GovernoratesID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <label class="col-md-2 control-label">اسم الحي</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNeighborhood" runat="server" CssClass="form-control" placeholder="ادخل اسم الحي"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">اسم الشارع</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control" placeholder="ادخل اسم الشارع"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">رقم المنزل</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtHomeNo" runat="server" CssClass="form-control" placeholder="ادخل رقم المنزل" ></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">العنوان بالتفصيل</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtAddressDetails" runat="server" CssClass="form-control" placeholder="ادخل العنوان بالتفصيل"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">البريد الإلكتروني</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="ادخل البريد الإلكتروني"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label">رقم الهاتف</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control numeric" placeholder="ادخل رقم الهاتف" MaxLength="7"></asp:TextBox>
                    </div>
                    <label class="col-md-2 control-label">رقم الجوال</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control numeric" placeholder="ادخل رقم الجوال" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <div class="col-md-5">
                        <a href="SuperiorData.aspx" class="btn btn-rounded green default">السابق</a>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSaveContactData" runat="server" class="btn blue btn btn-rounded default btn-block w80" OnClick="btnSaveContactData_Click" Text="حفظ" />
                    </div>
                    <div class="col-md-5" style="direction: ltr">
                        <asp:LinkButton ID="lbStudentWishes" runat="server" CssClass="btn btn-rounded green default" Visible="false" OnClick="lbStudentWishes_Click">التالي</asp:LinkButton>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>

