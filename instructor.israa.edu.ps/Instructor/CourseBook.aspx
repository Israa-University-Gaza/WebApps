<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" CodeFile="CourseBook.aspx.cs" Inherits="Instructor_CourseBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <script src="/ng/angular.min.js"></script>
    <script src="/ng/angular-sanitize.min.js"></script>
    <script src="/ng/plugins/angular-file-upload/angular-file-upload.min.js"></script>
    <script src="/ng/app/course-book-app.js"></script>

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="/assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#AcademicMenu, #CourseBook').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitlePlaceHolder" runat="Server">
    <span>الشؤون الأكاديمية</span>
    <i class="fa fa-angle-left" style="font-size: 15px; padding: 0 5px;"></i>
    <span>كتب المساقات</span>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">كتب المساقات</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-scrollable table-scrollable-borderless">
                                <% if (Repeater3.Items.Count > 0)
                                    { %>
                                <table class="table table-hover table-light">
                                    <thead>
                                        <tr class="uppercase">
                                            <th style="width: 15%;">كود المساق</th>
                                            <th style="width: 15%; text-align: center;">المساق</th>
                                            <th style="width: 20%; text-align: center;">المحاضر</th>
                                            <th style="width: 20%; text-align: center;">الكتاب</th>
                                        </tr>
                                    </thead>
                                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("CourseCode") %></td>
                                                <td style="text-align: center;"><%# Eval("CourseName") %></td>
                                                <td style="text-align: center;"><%# Eval("EmployeeName") %></td>
                                                <td style="text-align: center;">
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "WebServices/DownloadCourseBookFile.ashx?fileName=" + Eval("FileName") %>' Visible='<%# Eval("FileName").ToString() != "" %>'><%# (Eval("BookName").ToString() != "") ? Eval("BookName").ToString():"تنزيل" %></asp:HyperLink>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetTeacherCourseBooks" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </table>
                                <% }
                                    else
                                    {%>
                                <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                    <div class="col-xs-11" style="text-align: center;">
                                        <strong>لا يوجد مساقات وكتب</strong>
                                        <div style="clear: both"></div>
                                    </div>
                                    <button type="button" style="margin-top: 7px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                    <div style="clear: both"></div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" ng-app="app" ng-controller="AppController">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered calendar">
                <div class="portlet-title">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red uppercase font-ha">إرفع كتابك</span>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="alert alert-top" ng-class="{'alert-success':status==1,'alert-danger':status==0}" ng-show="isMsg">
                                <span style="font-weight: bold; float: right;">{{msg}}</span>
                                <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row form-group">
                                <label class="control-label col-md-2">المساق</label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" ng-model="courseId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaAcademic %>"
                                        SelectCommand="GetTeacherCoursesBooks" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" />
                                            <asp:ControlParameter ControlID="lblSemesterID" Name="SemesterID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="control-label col-md-2">اسم الكتاب</label>
                                <div class="col-md-9">
                                    <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" ng-model="bookName"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="control-label col-md-2">الكتاب</label>
                                <div class="col-md-9">
                                    <div class="fileUpload btn btn-primary" style="width: 150px; margin-bottom: 20px;">
                                        <span>إختر الملف</span>
                                        <input type="file" nv-file-select="" uploader="uploader" multiple class="upload" />
                                    </div>
                                    <table class="table" ng-show="uploader.queue.length ">
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;">الإسم</th>
                                                <th style="width: 10%; text-align: center;" ng-show="uploader.isHTML5">الحجم</th>
                                                <th style="width: 30%; text-align: center;" ng-show="uploader.isHTML5">التقدم</th>
                                                <th style="width: 10%; text-align: center;">الحالة</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="item in uploader.queue">
                                                <td><strong>{{ item.file.name }}</strong></td>
                                                <td ng-show="uploader.isHTML5" nowrap>{{ item.file.size/1024/1024|number:2 }} MB</td>
                                                <td ng-show="uploader.isHTML5">
                                                    <div class="progress" style="margin-bottom: 0;">
                                                        <div class="progress-bar" role="progressbar" ng-style="{ 'width': item.progress + '%' }"></div>
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    <span ng-hide="item.isSuccess || item.isCancel || item.isError"><i class="fa fa-refresh"></i></span>
                                                    <span ng-show="item.isSuccess"><i class="fa fa-check"></i></span>
                                                    <span ng-show="item.isCancel"><i class="fa fa-ban"></i></span>
                                                    <span ng-show="item.isError"><i class="fa fa-remove"></i></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>
                                        <button type="button" class="btn btn-success btn-s" ng-click="UploadCourseBook()" ng-disabled="!uploader.getNotUploadedItems().length">
                                            <span class="fa fa-upload"></span>
                                            <span>حفظ الكتاب</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
