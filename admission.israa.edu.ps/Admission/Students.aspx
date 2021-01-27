<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="Admission_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_1 a').css("background-color", "#575757");
            $('#Student a span.arrow').addClass("open");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <% if (Permissions.Contains("StudentsView"))
            { %>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>طلاب الجامعة</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtStudentNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <label class="control-label col-md-2">رقم الملف : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtFileNumber" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlStudentStatus" runat="server" class="form-control" DataTextField="ArName" DataValueField="ID" DataSourceID="SqlDataSource23"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource23" runat="server"
                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                SelectCommand="Select ID, ArName From StudentStatus union select -1,N'جميع الحالات'"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">إسم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFirstName" runat="server" class="form-control arabic-input"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtSecoundName" runat="server" class="form-control arabic-input"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArThirdName" runat="server" class="form-control arabic-input"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control arabic-input"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-md-8 col-lg-offset-2">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <% if (ListView1.Items.Count > 0)
                                { %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; width: 3%">رقم</th>
                                        <th style="text-align: center; width: 10%">رقم الطالب</th>
                                        <th style="text-align: center; width: 15%">إسم الطالب</th>
                                        <th style="text-align: center; width: 10%">نوع الطالب</th>
                                        <th style="text-align: center; width: 10%">حالة الطالب</th>
                                        <th style="text-align: center; width: 16%">الكلية</th>
                                        <th style="text-align: center; width: 16%">القسم</th>
                                        <th style="text-align: center; width: 8%">رقم الملف</th>
                                        <th style="text-align: center; width: 12%">المعدل التراكمي </th>
                                        <th style="text-align: center; width: 5%">استلم بطاقة الطالب</th>
                                        <th style="text-align: center; width: 5%">استلم حقيبة الطالب</th>
                                        <th style="text-align: center; width: 5%">استلم شهادة التخرج </th>
                                        <th style="text-align: center; width: 5%"></th>
                                        <th style="text-align: center; width: 5%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                                        <ItemTemplate>
                                            <tr>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="TawjehyNo" runat="server" Text='<%# Eval("TawjehyNo") %>' Visible="false"></asp:Label>

                                                <asp:Label ID="StudentNo" runat="server" Text='<%# Eval("StudentNo") %>' Visible="false"></asp:Label>


                                                <td style="text-align: center;"><%# Eval("No") %>

                                                </td>
                                                <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                                <td style="text-align: center;"><a href="Student.aspx?id=<%# Eval("ID") %>&tab=1" target="_blank"><%# Eval("StudentName") %></a></td>
                                                <td style="text-align: center;"><%# Eval("StudentType") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentStatus") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentCollege") %></td>
                                                <td style="text-align: center;"><%# Eval("StudentDepartment") %></td>
                                                <td style="text-align: center;"><%# Eval("FileNumber") %></td>
                                                <td style="text-align: center;"><%# Eval("SemesterCumulativeGraduateGPA") %></td>
                                                <td style="text-align: center;">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("StdCardRecieved") %>' AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" Enabled='<%# (Eval("StdCardRecieved").ToString()=="True")? false:true %>' /></td>
                                                <td style="text-align: center;">
                                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Eval("StdBagRecieved") %>' AutoPostBack="true" OnCheckedChanged="CheckBox2_CheckedChanged" Enabled='<%# (Eval("StdBagRecieved").ToString()=="True")? false:true %>' /></td>
                                                <td style="text-align: center;">
                                                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Eval("StdCertificateRecieved") %>' AutoPostBack="true" OnCheckedChanged="CheckBox3_CheckedChanged" Enabled='<%# (Eval("StdCertificateRecieved").ToString()=="True")? false:true %>' /></td>
                                                <td style="text-align: center;">
                                                    <%--                                                    <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click">فتح الملف</asp:LinkButton>--%>
                                                    <asp:LinkButton ID="LinkButtonTest" runat="server" class="btn default btn-xs black" OnClick="LinkButtonTest_OnClick">فتح الملف</asp:LinkButton>

                                                </td>
                                                <td style="text-align: center;">
                                                    <%--                                                    <asp:LinkButton ID="lbOpenStudent" runat="server" class="btn default btn-xs black" OnClick="lbOpenStudent_Click">فتح الملف</asp:LinkButton>--%>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn default btn-xs black" OnClick="LinkButton1_OnClick">طلب التحاق</asp:LinkButton>

                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:isra %>"
                                        SelectCommand="GetStudents" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlStudentStatus" PropertyName="SelectedValue" Name="StudentStatusID" Type="Int32" />
                                            <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                            <asp:ControlParameter ControlID="txtFileNumber" DefaultValue="%" PropertyName="Text" Name="FileNumber" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                            <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArThirdName" DefaultValue="%" PropertyName="Text" Name="ArThirdName" Type="String" />
                                            <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </tbody>
                            </table>
                            <div class="clearfix"></div>
                            <div style="float: left!important; direction: ltr!important;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1" class="pager col-md-12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                        <asp:NumericPagerField ButtonType="Link" />
                                        <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                        <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <div class="clearfix"></div>
                            <% }
                                else
                                {%>
                            <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                <div class="col-xs-11" style="text-align: center">
                                    <strong>لا يوجد نتائج للبحث</strong>
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
        </div>
        <% } %>
    </div>
</asp:Content>

