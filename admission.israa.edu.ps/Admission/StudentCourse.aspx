<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentCourse.aspx.cs" Inherits="Admission_StudentCourse" %>

<%@ Register Src="~/Admission/UserControls/StudentSideBar.ascx" TagPrefix="uc1" TagName="StudentSideBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../assets/stdimage/css/jquery.Jcrop.css" type="text/css" />
    <script src="../assets/stdimage/js/jquery.cropit.min.js"></script>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.holder-style').removeClass('holder-active');
            $('#StudentImage').addClass('holder-active');

            $('.image-editor').cropit({
                imageBackground: true,
                imageBackgroundBorderWidth: 15
            });
            $('.crop').click(function () {
                // Move cropped image data to hidden input
                var imageData = $('.image-editor').cropit('export');
                $('.hidden-image-data').val(imageData);
                $('#btnUpload').show();
            });
        });
    </script>
    <style>
        label.filebutton {
            width: 120px;
            height: 40px;
            overflow: hidden;
            position: relative;
            background-color: #ccc;
        }

        label span input {
            z-index: 999;
            line-height: 0;
            font-size: 50px;
            position: absolute;
            top: -2px;
            left: -700px;
            opacity: 0;
            filter: alpha(opacity = 0);
            -ms-filter: "alpha(opacity=0)";
            cursor: pointer;
            _cursor: hand;
            margin: 0;
            padding: 0;
        }

        .fileUpload {
            position: relative;
            overflow: hidden;
            padding: 7px;
            width: 20%;
        }

            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }

        .dropdown-menu li > a {
            clear: both;
            color: #333;
            display: block;
            font-weight: normal;
            line-height: 18px;
            padding: 0;
            text-decoration: none;
            white-space: nowrap;
        }

        .dropdown.open .dropdown-toggle {
            background: #e0eaf0 !important;
            color: #121212;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">قضايا الطالب
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblStdStatusID" runat="server" Visible="false"></asp:Label>

    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ملف الطالب</div>
                <div class="tools">
                    <a class="remove" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">

                    <uc1:StudentSideBar runat="server" ID="StudentSideBar" ActiveTab="StudentCourse" />
                    <div style="width: 81%; float: right;">
                        <div id="tab2" class="tab-pane" runat="server" clientidmode="Static">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <h4>طلبات تسجيل المساقات</h4>
                                        </div>
                                    </div>
                                    <hr style="margin: 10px 0 15px 0" />
                                    <br />
                                    <div class="row">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">الفصل الدراسي : </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSemester" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                                    SelectCommand="GetSemesters3" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <% if (listview1.Items.Count > 0)
                                        { %>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%; text-align: center">كود المساق</th>
                                                <th style="width: 20%; text-align: center">المساق</th>
                                                <th style="width: 16%; text-align: center">عدد الساعات</th>
                                                <th style="width: 16%; text-align: center">حالة  المساق</th>
                                                <th style="width: 16%; text-align: center"></th>
                                                <th style="width: 17%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="listview1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <tr>
                                                        <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="OfferdCourseID" runat="server" Text='<%# Eval("OfferdCourseID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="CourseID" runat="server" Text='<%# Eval("CourseID") %>' Visible="false"></asp:Label>
                                                        <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("CourseHours") %></span></td>

                                                        <td style="text-align: center">
                                                            <span><%# (Eval("IsNotRegisterd").ToString()=="1")? "<img src='../assets/img/icons/remain.jpg' width='18' height='18' />": "" %></span>
                                                            <span><%# (Eval("CourseStatusID").ToString()=="1")? "<img src='../assets/img/icons/11693605_10153855864475809_1372216708_n.gif' width='18' height='18' />": "" %></span>
                                                            <span><%# (Eval("CourseStatusID").ToString()=="3")? "<img src='../assets/img/icons/w.png' width='18' height='18' />": "" %></span>
                                                            <span><%# (Eval("CourseStatusID").ToString()=="6")? "<img src='../assets/img/icons/12226411_10153855864455809_1009013865_n.jpg' width='18' height='18' />": "" %></span>
                                                            <span><%# (Eval("CourseStatusID").ToString()=="7")? "<img src='../assets/img/icons/12207740_10153855864445809_964486009_n.jpg' width='18' height='18' />": "" %></span>
                                                            <span><%# (Eval("CourseStatusID").ToString()=="9") ? "الغاء تسجيل" : "" %></span>
                                                            <span><%# (Eval("CourseStatusID").ToString()=="11") ? "م.ك" : "" %></span>
                                                        </td>
                                                        <td style="text-align: center"><span><%# Eval("OfferdCourseStatus") %></span></td>

                                                        <td style="text-align: center">
                                                            <asp:CheckBox ID="cbIsRequest" runat="server" Checked='<%# Convert.ToInt32(Eval("ID"))>0 %>' Enabled="false" />
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="lbAccredit" runat="server" CssClass="btn green" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbAccredit_Click" Visible='<%# Convert.ToInt32(Eval("ID"))>0 && Convert.ToBoolean(Eval("IsAccredit"))==false %>'>تأكيد التسجيل</asp:LinkButton>
                                                            <asp:LinkButton ID="lbdeAccredit" runat="server" CssClass="btn red" Style="font-size: 11px; padding: 4px 10px;" OnClick="lbdeAccredit_Click" Visible='<%# Convert.ToInt32(Eval("ID"))>0 && Convert.ToBoolean(Eval("IsAccredit")) %>'>الغاء تأكيد التسجيل</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStudentCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlSemester" PropertyName="SelectedValue" Name="SemesterID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <% } %>
                                    <%  else
                                        { %>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center">
                                            <strong>لا يوجد طلبات للعرض  </strong>
                                            <div style="clear: both"></div>
                                        </div>
                                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                    <%  } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

