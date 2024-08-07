﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="Advertisement.aspx.cs" Inherits="Admission_Advertisement" %>

<%@ Register TagPrefix="cc1" Namespace="CuteEditor" Assembly="CuteEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/plugins/ckeditor/ckeditor.js"></script>
    <script src="../assets/scripts/form-validation.js"></script>


    <script type="text/javascript">
        $('document').ready(function () {
            FormValidation.init();
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#menu1').addClass("active open");
            $('#menu1_1 a').css("background-color", "#575757");
            $('#menu1 a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">اعلانات الطلبة</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>اعلانات الطلبة</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="Advertisement.aspx">اعلانات الطلبة</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("AdvertisementView"))
           { %>
        <div class="col-md-4">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>اعلانات الطلبة</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <% if (ListView1.Items.Count > 0)
                       { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 20%">عنوان</th>
                                <%-- <th style="width: 20%">الكلية</th>
                                   <th style="width: 20%">القسم</th>--%>
                                <th style="width: 10%; text-align: center">فعال</th>
                                <th style="width: 30%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:Label ID="AdvertisementID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                    <tr <%# (lblAdvertisementID.Text==Eval("ID").ToString())?"style='background-color:#F5F5F5'":"" %>>
                                        <td><span><%# Eval("Title") %></span></td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="cbIsActive_CheckedChanged" Checked='<%# Eval("IsActive") %>' Enabled='<%# (Permissions.Contains("AdvertisementActivate"))? true:false %>' />
                                        </td>
                                        <td style="text-align: center">
                                            <% if (Permissions.Contains("AdvertisementEdit"))
                                               { %>
                                            <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" OnClick="lbEdit_Click"><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                            <% } %>
                                            <% if (Permissions.Contains("AdvertisementDelete"))
                                               { %>
                                            <asp:LinkButton ID="lbDelete" runat="server" class="btn default btn-xs purple" OnClick="lbDelete_Click" OnClientClick="return confirm('هل انت متاكد من عملية الحذف؟')"><i class="fa fa-trash-o"></i> حذف</a></asp:LinkButton>
                                            <% } %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="SELECT * FROM [Advertisement] where [IsDelete]=0 and CatID=2 order by [ID] DESC"></asp:SqlDataSource>
                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <div class="clearfix"></div>
                    <% }
                       else
                       {%>
                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                        <div class="col-xs-11" style="text-align: center;">
                            <strong>لم يتم إضافة اعلان بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>
        <% if (Permissions.Contains("AdvertisementAdd") || Permissions.Contains("AdvertisementEdit"))
           { %>
        <div class="col-md-8">
            <div class="portlet box blue">
                <asp:Label ID="lblAdvertisementID" runat="server" Text="" Visible="false"></asp:Label>
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إضافة/تعديل اعلان</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">عنوان الاعلان</label>
                                <div class="col-md-10">
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control " placeholder="الرجاء ادخال عنوان الاعلان "></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">الكلية</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT  [ID], [ArName] FROM [College] where (IsDelete=0 and IsActive=1 and ID !=1) union  select 1,N'الكل' "></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">القسم</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT [ID], [ArName] FROM [Department] WHERE ([CollegeID] = @CollegeID and ID !=1) union  select 1,N'الكل'">

                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label">نوع الطالب</label>
                                <div class="col-md-10">
                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="SELECT top 2 [ID], [ArName] FROM [StudentTypes] union select 0,N'الكل' "></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">نص الاعلان</label>
                                <div class="col-md-10">
                                    <cc1:editor id="txtDetails" runat="server" height="500px" width="100%" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-9">
                                    <asp:CheckBox ID="cbActive" runat="server" Text="فعال" />
                                </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-2 col-md-9">
                                <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn default" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>


