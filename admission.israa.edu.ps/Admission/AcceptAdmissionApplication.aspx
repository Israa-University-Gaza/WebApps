<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="AcceptAdmissionApplication.aspx.cs" Inherits="Admission_AcceptAdmissionApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
       <script type="text/javascript">
           $('document').ready(function () {
               $('.page-sidebar-menu li').removeClass("active").removeClass("open");
               $('.page-sidebar-menu li ul li').css("background-color", "");
               $('#ShowAdmissionApplication').addClass("active open");
               $('#ShowAdmissionApplication_3 a').css("background-color", "#575757");
               $('#ShowAdmissionApplication a span.arrow').addClass("open");
           });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="AcceptAdmissionApplication.aspx" class="font-ha">قبول رغبات الطلاب</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-reorder"></i>قبول رغبات الطلاب</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                                <div class="form-group row">
                                    <label class="col-md-2 control-label">نوع طلب الالتحاق </label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlProgram" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="SELECT ID, ArName FROM [Program] WHERE ([IsActive] = 1) AND ([IsDelete] = 0)"></asp:SqlDataSource>
                                    </div>
                                       <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtStudentNo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                                </div>
                         
                     
                   
                    <div class="form-group row">
                        <label class="control-label col-md-2">إسم الطالب : </label>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFirstName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtSecoundName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArThirdName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:TextBox ID="txtArFamilyName" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-offset-4 col-md-4"></label>
                        <div class="col-lg-offset-2 col-md-8">
                            <asp:Button ID="btnFilter" runat="server" Text="بحث" class="btn green" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                    <div class="clearfix"></div>
                            <hr />
                            <div class="row table-responsive">
                                <% if (ListView1.Items.Count > 0)
                                   { %>
                                <div class="table-scrollable">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="width: 7%; text-align: center">رقم الطالب</th>
                                            <th scope="col" style="width: 7%; text-align: center">اسم الطالب</th>
                                            <th scope="col" style="width: 7%; text-align: center">البرنامج</th>
                                            <th scope="col" style="width: 7%; text-align: center">الثانوية</th>
                                            <th scope="col" style="width: 5%; text-align: center">معدل الثانوية</th>
                                            <th scope="col" style="width: 7%; text-align: center">اسم الكلية(للحاصلين علي الدبلوم</th>
                                            <th scope="col" style="width: 7%; text-align: center">التخصص</th>
                                            <th scope="col" style="width: 5%; text-align: center">معدل</th>
                                            <th scope="col" style="width: 5%; text-align: center">تقدير الشامل</th>
                                            <th scope="col" style="width: 5%; text-align: center">سنوات الخبرة</th>
                                            <th scope="col" style="width: 250px!important; text-align: center"> الرغبات</th>
                                            <th scope="col" style="width: 50%; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource5">
                                            <ItemTemplate>
                                                <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                                <tr>
                                                    <td style="text-align: center"><span><%# Eval("StudentNo") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("StudentName") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("Program") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("TawjehyType") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("TawjehyGPA") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("OldUniversity") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("OldDepartment") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("OldUniversityGPA") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ShamelRate") %></span></td>
                                                    <td style="text-align: center"><span><%# Eval("ExpertYears") %></span></td>
                                                    <td style="width:250px!important;text-align: center;position:relative">
                                                        <asp:RadioButtonList ID="rblWishes" runat="server" DataSourceID="SqlDataSource60" DataValueField="DepartmentID" DataTextField="DepartmentName" CssClass="table wajed"></asp:RadioButtonList>
                                                        <asp:SqlDataSource ID="SqlDataSource60" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                                            SelectCommand="GetStudentWishes" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="StudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:LinkButton ID="lbAccept" runat="server" class="btn default btn-xs black" OnClick="lbAccept_Click"><i class="fa fa-edit"></i> إعتماد</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="GetAdmissionApplication" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                                <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                                <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                                <asp:ControlParameter ControlID="txtArThirdName" DefaultValue="%" PropertyName="Text" Name="ArThirdName" Type="String" />
                                                <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                       
                                             </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                                </div>
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="30" PagedControlID="ListView1" class="pager">
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
                                    <div class="col-xs-11" style="text-align: center">
                                        <strong>لا يوجد طلبات إلتحاق</strong>
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
        </div>
    </div>
</asp:Content>

