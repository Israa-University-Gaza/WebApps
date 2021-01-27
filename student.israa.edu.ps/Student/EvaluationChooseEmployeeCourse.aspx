<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="EvaluationChooseEmployeeCourse.aspx.cs" Inherits="Student_EvaluationChooseEmployeeCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active");
            $('#menu15').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="index.html" class="font-ha">صفحة الطالب</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="#" class="font-ha">تقيم العملية التعليمية</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>تقيم العملية التعليمية</div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <h4>عزيزي الطالب .. عزيزتي الطالبة</h4>
                                <ul style="font-size: 15px;">
                                    <li>مشاركتك بهذا التقيم "بأمانة" تساعدنا بالنهوض أكثر بالجامعة والعملية التدريسية.</li>
                                    <li>ابدأ التقيم بالضغط علي زر بدء التقيم المقابل للمحاضر الذي تود تقيمه.</li>
                                    <li>لا يتم معرفة اسمك من خلال هذا التقيم</li>
                                </ul>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%;">#</th>
                                            <th style="width: 15%; text-align: center">رقم المساق</th>
                                            <th style="width: 20%; text-align: center">المساق</th>
                                            <th style="width: 10%; text-align: center">الشعبة</th>
                                            <th style="width: 25%; text-align: center">المحاضر</th>
                                            <th style="width: 25%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><span><%# Eval("RowNo") %></span>
                                                        <asp:Label ID="StdSectionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="CourseCode" runat="server" Text='<%# Eval("CourseCode") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="CourseArName" runat="server" Text='<%# Eval("CourseArName") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="SectionNum" runat="server" Text='<%# Eval("SectionNum") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Employee" runat="server" Text='<%# Eval("Employee") %>'></asp:Label></td>
                                                    <td>
                                                        <asp:Button ID="btnStartEvaluation" runat="server" Text='<%# (Convert.ToBoolean(Eval("IsEvaluated")))? "تم التقيم" : "بدء التقيم" %>' CssClass="btn green" Style="width: 80px; height: 26px; font-size: 12px;" OnClick="btnStartEvaluation_Click" Enabled='<%# (Convert.ToBoolean(Eval("IsEvaluated")))? false:true %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                                            SelectCommand="GetStudentSemesterSections" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-actions fluid">
                    <div class="col-md-12" style="text-align: left">
                        <span>نشكركم علي مصداقية وشفافية تقيمكم ...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
