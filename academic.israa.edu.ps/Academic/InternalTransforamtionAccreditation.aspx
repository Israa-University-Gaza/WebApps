<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="InternalTransforamtionAccreditation.aspx.cs" Inherits="Academic_InternalTransforamtionAccreditation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <% if (Permissions.Contains("TransforamtionAccreditation"))
        { %>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#TransforamtionAccreditation').addClass("active open");
            $('#TransforamtionAccreditation_2 a').css("background-color", "#575757");
            $('#TransforamtionAccreditation a span.arrow').addClass("open");
        });
    </script>
    <%} %>
    <% if (Permissions.Contains("DeanTransforamtionAccreditation"))
        { %>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#DeanTransforamtionAccreditation').addClass("active open");
            $('#DeanTransforamtionAccreditation_2 a').css("background-color", "#575757");
            $('#TransforamtionAccreditation a span.arrow').addClass("open");
        });
    </script>
    <%} %>
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
                <span>إعتماد مساقات  المعادلة الداخلية</span> <i class="fa fa-angle-down"></i>
            </button>
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>إعتماد مساقات المعادلة الداخلية</div>
                    <div class="tools">
                        <a class="collapse" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group row">
                        <asp:Label ID="EmpID" runat="server" Text="" Visible="false"></asp:Label>
                        <label class="col-md-2 control-label">البرنامج</label>
                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlProgram" runat="server" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeePrograms" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">الكلية</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCollege" runat="server" DataSourceID="SqlDataSource6" DataTextField="ArName" DataValueField="ID" AutoPostBack="true" CssClass="select2_category form-control" OnSelectedIndexChanged="ddlCollege_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeCollages" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" PropertyName="Text" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" Name="ProgramID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <label class="col-md-1 control-label">القسم</label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource3" DataTextField="ArName" DataValueField="ID" CssClass="select2_category form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="GetEmployeeDepartments" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="EmpID" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlCollege" PropertyName="SelectedValue" Name="CollegeID" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">رقم الطالب : </label>
                        <div class="col-md-6">
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
                    <div class="table-responsive">
                        <% if (ListView1.Items.Count > 0)
                            { %>
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th style="text-align: right; width: 3%; padding: 8px;">#</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">رقم الطالب</th>
                                    <th style="text-align: center; width: 15%; padding: 8px 0px;">اسم الطالب</th>
                                    <th style="text-align: center; width: 10%; padding: 8px 0px;">التخصص</th>
                                    <th style="text-align: center; width: 8%; padding: 8px 0px;">نوع الطالب</th>
                                    <th style="text-align: center; width: 8%; padding: 8px 0px;">ساعات الخطة</th>
                                    <th style="text-align: center; width: 8%; padding: 8px 0px;">ساعات معادلة</th>
                                    <th style="text-align: center; width: 20%; padding: 8px 0px;">الاعتمادات</th>
                                    <th style="text-align: center; width: 18%; padding: 8px 0px;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <asp:Label ID="StudentID" runat="server" Text='<%# Eval("StudentID") %>' Visible="false"></asp:Label>
                                        <tr <%# Eval("AllDeanAccreditation").ToString()=="0" &&  Eval("AllAcademicAccreditation").ToString()=="0" ? "style='color:red;'" : Eval("AllDeanAccreditation").ToString()=="1" &&  Eval("AllAcademicAccreditation").ToString()=="1" ? "style='color:green;'" : "" %>>
                                            <td style="text-align: center;"><%# Eval("RowNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentNo") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentName") %></td>
                                            <td style="text-align: center;"><%# Eval("DepartmentName") %></td>
                                            <td style="text-align: center;"><%# Eval("StudentType") %></td>
                                            <td style="text-align: center;"><%# Eval("PlanTotalHours") %></td>
                                            <td style="text-align: center;"><%# Eval("SumOfHours") %></td>

                                            <td style="text-align: center;">
                                                <span><%# ( Eval("ExistDeanAccreditation").ToString()== "1"   &&  Eval("AllDeanAccreditation").ToString()== "0")?"اعتماد جزئي عميد" :Eval("AllDeanAccreditation").ToString()== "1"? " اعتماد كلي عميد " : " غير معتمدة من العميد"%></span>
                                                <br />
                                                <span><%# ( Eval("ExistAcademicAccreditation").ToString()== "1"   &&  Eval("AllAcademicAccreditation").ToString()== "0")?"اعتماد جزئي نائب أكاديمي" :Eval("AllAcademicAccreditation").ToString()== "1"? " اعتماد كلي نائب اكاديمي " : " غير معتمدة من النائب الاكاديمي"%></span>
                                            </td>
                                            <td style="text-align: center;">
                                                <asp:LinkButton ID="lbEditTransformation" runat="server" class="btn default btn-xs black" OnClick="lbEditTransformation_Click"><i  class="fa fa-edit"></i></a>عرض وتعديل</asp:LinkButton>
                                                       <br />
                                                <% if (Permissions.Contains("TransforamtionAccreditation"))
                                                    { %>
                                                <asp:LinkButton ID="lbAccrediteTransformation" runat="server" OnClick="lbAccrediteTransformation_Click" Visible='<%# Eval("AllAcademicAccreditation").ToString() =="0"  %>' CssClass="btn btn-sm btn-success "> اعتماد المعادلة</asp:LinkButton>
                                                <asp:LinkButton ID="lbUnaccrediteTransformation" runat="server" OnClick="lbUnaccrediteTransformation_Click" Visible='<%# Eval("ExistAcademicAccreditation").ToString()=="1" %>' CssClass="btn btn-sm btn-danger ">الغاء اعتماد المعادلة </asp:LinkButton>
                                                <%} %>
                                                <% if (Permissions.Contains("DeanTransforamtionAccreditation"))
                                                    { %>
                                                <asp:LinkButton ID="lbDeanAccrediteTransformation" runat="server" class="btn default btn-xs green" OnClick="lbDeanAccrediteTransformation_Click" Visible='<%# (Eval("AllAcademicAccreditation").ToString() == "0" && Eval("AllDeanAccreditation").ToString() == "0" ) %>' CssClass="btn btn-sm btn-success ">  اعتماد المعادلة  </asp:LinkButton>
                                                <br />
                                                <asp:LinkButton ID="lbDeanUnaccrediteTransformation" runat="server" class="btn default btn-xs red" OnClick="lbDeanUnaccrediteTransformation_Click" Visible='<%# Eval("ExistAcademicAccreditation").ToString() == "0" && Eval("ExistDeanAccreditation").ToString()=="1"  && Eval("AllDeanAccreditation").ToString()=="1" %>' CssClass="btn btn-sm btn-danger "> الغاء اعتماد المعادلة   </asp:LinkButton>
                                                <%} %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetDepartmentInternalTransformation" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtStudentNo" DefaultValue="%" PropertyName="Text" Name="StudentNo" Type="String" />
                                        <asp:ControlParameter ControlID="txtArFirstName" DefaultValue="%" PropertyName="Text" Name="ArFirstName" Type="String" />
                                        <asp:ControlParameter ControlID="txtSecoundName" DefaultValue="%" PropertyName="Text" Name="ArSecoundName" Type="String" />
                                        <asp:ControlParameter ControlID="txtArFamilyName" DefaultValue="%" PropertyName="Text" Name="ArFamilyName" Type="String" />
                                        <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="-1" PropertyName="Text" Name="DepartmentID" Type="Int32" />

                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="100" PagedControlID="ListView1" class="pager">
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
                            <div class="col-xs-11" style="text-align: center">
                                <strong>لا يوجد معادلات طلاب بعد</strong>
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
</asp:Content>
