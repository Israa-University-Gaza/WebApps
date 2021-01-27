<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="OfficeOfferCourse.aspx.cs" Inherits="Academic_OfficeOfferCourse" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../assets/datepicker/clockface.css" rel="stylesheet" type="text/css" />
    <link href="../assets/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />

    <script src="../assets/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="../assets/datepicker/clockface.js" type="text/javascript"></script>
    <script src="../assets/datepicker/metronic.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#OfficeOfferCourse').addClass("active open");
           

            $('.date-picker').datepicker({
                rtl: true,
                orientation: "right",
                autoclose: true,
                format: 'yyyy/mm/dd',
            });
            $('.clockface_1').clockface();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">الشؤون الأكاديمية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li>
            <button data-close-others="true" data-delay="1000" data-hover="dropdown" data-toggle="dropdown" class="btn font-ha dropdown-toggle" style="padding: 0px!important; background-color: #FAFAFA!important;" type="button">
                <span>طرح مساق مكتبي</span> <i class="fa fa-angle-down"></i>
            </button>
            <ul role="menu" class="dropdown-menu pull-left">
                <li class="font-ha"><a href="OfficeOfferCourse.aspx">طرح مساق مكتبي</a></li>

            </ul>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblEmployeeID" runat="server" Visible="false"></asp:Label>
    <div class="row">

        <div class="col-md-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>طرح مساق مكتبي</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <div class="row">
                                <asp:Label ID="lblOfferCourseID" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                            <div class="form-group">

                                <label class="control-label col-md-2">الفصل الدراسي</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource1" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="SELECT ID, ArName FROM [Semester] where ID=20 ORDER BY ID DESC"></asp:SqlDataSource>
                                </div>                                                                                                                                                  
                                <label class="control-label col-md-2">القسم</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlDepartments3" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">المساق</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlOfficeCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDepartment" PropertyName="SelectedValue" Name="DepartmentID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <label class="control-label col-md-2">المحاضر</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlInstructor" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlOfficeInstructors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">تاريخ الإمتحان</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtFinalExamDate" runat="server" CssClass="form-control date-picker" placeholder="الرجاء ادخال تاريخ الإمتحان" Style="text-align: center;"></asp:TextBox>
                                </div>


                                <label class="control-label col-md-2" style="padding-right: 0; padding-left: 0">وقت الإمتحان </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtFinalExamTimeFrom1" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                </div>

                                <div class="col-md-2">
                                    <asp:TextBox ID="txtFinalExamTimeTo1" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <label class="control-label col-md-2">يوم المحاضرة</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlDay" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlCDays" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>


                                <label class="control-label col-md-2" style="padding-right: 0; padding-left: 0">وقت المحاضرة </label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtFromHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center;"></asp:TextBox>
                                </div>

                                <div class="col-md-2">
                                    <asp:TextBox ID="txtToHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="15:00" Style="text-align: center;"></asp:TextBox>
                                </div>
                            </div>--%>
                        </div>

                        <div class="form-actions fluid">
                            <div class="row">
                                <div class="col-md-offset-2 col-md-5">
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" class="btn green" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>اضافة محاضرة للمساقات المطروحة مكتبياً</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="col-md-2 control-label isra-text-aling-right">الفصل</label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlSemester1" runat="server" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="DataBind" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlSemesters" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <% if (ListView1.Items.Count > 0)
                        { %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 5%">#</th>
                                <th style="text-align: center; width: 15%">رقم المساق</th>
                                <th style="text-align: center; width: 15%">المساق</th>
                                <th style="text-align: center; width: 15%">المحاضر</th>
                                <th style="text-align: center; width: 15%">موعد الامتحان</th>
                                <th style="text-align: center; width: 15%">يوم المحاضرة</th>
                                <th colspan="2" style="text-align: center; width: 15%">وقت المحاضرة</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5" OnItemDataBound="ListView1_ItemDataBound">
                                <ItemTemplate>
                                    <asp:Label ID="SectionID" runat="server" Text='<%# Eval("SectionID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="CDayID" runat="server" Text='<%# Eval("CDayID") %>' Visible="false"></asp:Label>
                                    <td><span><%# Eval("RowNo") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("CourseCode") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("CourseName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("InstructorName") %></span></td>
                                    <td style="text-align: center"><span><%# Eval("FinalExamDate") %></span>
                                        <br />
                                        <span><%# Eval("FinalExamTimeFrom") +"-"+ Eval("FinalExamTimeTo") %></span>
                                    </td>
                                    <td style="text-align: center">
                                        <asp:DropDownList ID="ddlDay" runat="server" CssClass="select2_category form-control" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="ID" Enabled='<%# ((Convert.ToInt32(Eval("IsValied").ToString()) == 1)) %>'></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="ddlCDays" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFromHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center" Text='<%# Eval("FromHour") %>' Enabled='<%# ((Convert.ToInt32(Eval("IsValied").ToString()) == 1)) %>'></asp:TextBox></td>
                                    <td>
                                        <asp:TextBox ID="txtToHour" runat="server" data-format="HH:mm" MaxLength="5" CssClass="form-control clockface_1" placeholder="14:00" Style="text-align: center" Text='<%# Eval("ToHour") %>' Enabled='<%# ((Convert.ToInt32(Eval("IsValied").ToString()) == 1)) %>'></asp:TextBox></td>
                                    <td style="text-align: center">
                                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success btn-sm " Text="حفظ" Width="50px" OnClick="btnAdd_Click" Enabled='<%# (Convert.ToInt32(Eval("IsValied").ToString()) ==1) %>' />
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:isra %>' SelectCommand="GetOfficeOfferdCourseSections" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlSemester1" PropertyName="SelectedValue"  Name="SemesterID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="lblEmployeeID" PropertyName="Text" Name="EmployeeID" Type="Int32" DefaultValue="-1"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>

                    <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                            <asp:NumericPagerField ButtonType="Link" ButtonCount="3" />
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
                            <strong>لم يتم طرح مساقات مكتبية بعد</strong>
                            <div style="clear: both"></div>
                        </div>
                        <button type="button" style="margin-top: 4px;" class="close col-xs-2" data-dismiss="alert" aria-hidden="true"></button>
                        <div style="clear: both"></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
