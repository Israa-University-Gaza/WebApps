<%@ Page Title="" Language="C#" MasterPageFile="~/StudyTable/MasterPage.master" AutoEventWireup="true" CodeFile="StudyTableProgram.aspx.cs" Inherits="StudyTable_StudyTableProgram" %>

<asp:Content ID="Style" ContentPlaceHolderID="StylePlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS CSS -->
    <link href="../newassets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <link href="../newassets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="../newassets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS CSS -->
    <link href="../ng/plugins/angular-ui-notification.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Script" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <!-- BEGIN PAGE LEVEL PLUGINS JS -->
    <script src="../newassets/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="../newassets/global/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
    <script src="../newassets/global/plugins/fullcalendar/lang/ar.js"></script>
    <script src="../newassets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="../newassets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS JS -->

    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../newassets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../newassets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->

    <script src="../ng/angular.min.js"></script>
    <script src="../ng/plugins/ui-bootstrap-tpls-1.3.3.min.js"></script>
    <script src="../ng/plugins/angular-ui-notification.min.js"></script>

    <script src="app.js"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('#tab_1_2').removeClass('active');
            $('#tab_1_3').removeClass('active');
            $('#tab_1_4').removeClass('active');
        });
    </script>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="row" ng-app="CalenderApp">
        <div class="col-md-12" ng-controller="AppController">
            <!-- BEGIN PORTLET -->
            <div class="portlet light bordered">
                <div class="portlet-title tabbable-line">
                    <div class="caption caption-md">
                        <i class="icon-globe theme-font hide"></i>
                        <span class="caption-subject font-blue-madison bold uppercase">برنامج الجدول الدراسي</span>
                    </div>
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab_1_1" data-toggle="tab">جدول الطالب</a>
                        </li>
                        <li>
                            <a href="#tab_1_2" data-toggle="tab">جدول المحاضر</a>
                        </li>
                        <li>
                            <a href="#tab_1_3" data-toggle="tab">جدول القاعات</a>
                        </li>
                        <li>
                            <a href="#tab_1_4" data-toggle="tab">جدول المساق</a>
                        </li>
                    </ul>
                </div>
                <div class="portlet-body">
                    <!--BEGIN TABS-->
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1_1">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <asp:DropDownList ID="ddlBlocks" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID" ng-model="blockid" ng-change="changeBlock(blockid)"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [Block] WHERE ([IsActive] = 1) AND ([IsDelete] = 0) union select -1, N'إختر جدول الطالب'"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-6 col-sm-12" style="text-align: left">
                                    <span>عدد الساعات : </span><span>{{ blockHours }}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div id="calendar1" class="span8 calendar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="tab_1_2">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <asp:DropDownList ID="ddlInstructors" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="ID" ng-model="instructorid" ng-change="changeInstructor(instructorid)"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="SELECT ID, [HumanResources].[dbo].[GetEmployeeName](ID,3) as DisplayName FROM [Employee] WHERE ([IsActive] = 1) AND ([IsDelete] = 0) union select -1, N'إختر المحاضر'"></asp:SqlDataSource>
                                    <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra2 %>" SelectCommand="GetAcademicEmployees" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
                                </div>
                                <div class="col-md-6 col-sm-12" style="text-align: left">
                                    <span>عدد الساعات : </span><span>{{ instructorHours }}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div id="calendar2" class="span8 calendar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="tab_1_3">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <asp:DropDownList ID="ddlRooms" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" ng-model="roomid" ng-change="changeRoom(roomid)"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, Name FROM [Room] WHERE ([IsActive] = 1) AND ([IsDelete] = 0) union select -1, N'إختر القاعة'"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-6 col-sm-12" style="text-align: left">
                                    <span>عدد الساعات : </span><span>{{ roomHours }}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div id="calendar3" class="span8 calendar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane active" id="tab_1_4">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <asp:DropDownList ID="ddlOfferdCourse" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="CourseID" ng-model="courseid" ng-change="changeCourse(courseid)"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT CourseID, (Select '( ' +  CourseCode + ' ) ' + ArName From Course Where ID=CourseID) as Name FROM [OfferdCourse] WHERE ([SemesterID] = 6) AND ([IsDelete] = 0) union select -1, N'إختر المساق'"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-6 col-sm-12" style="text-align: left">
                                    <span>عدد الساعات : </span><span>{{ courseHours }}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div id="calendar4" class="span8 calendar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--END TABS-->
                </div>
            </div>
            <!-- END PORTLET -->

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel" ng-show="isSelectedLecture()">تعديل محاضرة لشعبة {{ lecture.selectedSectionNum }} لمساق {{ lecture.selectedCourse }}</h4>
                            <h4 class="modal-title" id="myModalLabel" ng-hide="isSelectedLecture()">إضافة محاضرة جديدة</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <div class="form-body">
                                    <div class="form-group" ng-hide="isSelectedLecture()">
                                        <label class="control-label col-md-3">المساق :</label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource5" DataTextField="CourseArName" DataValueField="ID" ng-model="lecture.selectedOfferedCourse" ng-change="changeOfferdCourse()"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetAcademicOfferdCourses" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-group" ng-hide="isSelectedLecture()">
                                        <label class="control-label col-md-3">الشعبة :</label>
                                        <div class="col-md-8">
                                            <select class="form-control" ng-model="lecture.selectedSection">
                                                <option value="-1">اختر الشعبة</option>
                                                <option ng-repeat="section in sections" value="{{ section.ID }}">{{ section.SectionNum }}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">المحاضر :</label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource2" DataTextField="DisplayName" DataValueField="ID" ng-model="lecture.selectedInstructor"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">قاعة :</label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control select2" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" ng-model="lecture.selectedRoom"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">اليوم :</label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlDayID" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="ArName" DataValueField="ID" ng-model="lecture.selectedDay"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [ConstantDetails] WHERE ((ConstantID=4) and ([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر اليوم'"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">التوقيت :</label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" placeholder="من" style="text-align: center;" ng-model="lecture.selectedFromHour" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" placeholder="الي" style="text-align: center;" ng-model="lecture.selectedToHour" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-3" style="text-align: right;">
                                    <div class="btn-group" ng-show="isSelectedLecture()">
                                        <button type="button" class="btn btn-danger dropdown-toggle">حذف</button>
                                        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                            <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a ng-click="deleteLecture()">حذف المحاضرة</a>
                                            </li>
                                            <li>
                                                <a ng-click="deleteFromBlock()">حذف الشعبة من جدول الطالب</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <button type="button" class="btn btn-primary" ng-click="save()">حفظ</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">إنهاء</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

