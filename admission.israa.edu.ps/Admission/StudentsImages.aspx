<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentsImages.aspx.cs" Inherits="Admission_StudentsImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <link href="../assets/css/components-rounded-rtl.css" rel="stylesheet" />
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#Student').addClass("active open");
            $('#Student_5 a').css("background-color", "#575757");
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
                    <%if (ListView2.Items.Count > 0)
                        { %>
                    <div class="mt-element-card mt-element-overlay">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource20">
                                    <ItemTemplate>
                                        <asp:Label ID="StudentID2" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                        <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                                            <div class="mt-card-item">
                                                <div class="mt-card-avatar mt-overlay-1">
                                                    <%--<img id="image" src="<%# (!Convert.IsDBNull(Eval("StudentImage"))) ? String.Format("data:image/Bmp;base64,{0}\"", Convert.ToBase64String((byte[])(Eval("StudentImage")))) : "../images/std.jpg" %>" class="img-responsive" style="width: 136.25px; height: 156.883px;" alt="" />--%>
                                                     <img src="stdimg.aspx?id=<%# Eval("ID") %>"  class="img-responsive" style="width: 100%;" alt="" /></td>
                                                    <div class="mt-overlay">
                                                        <ul class="mt-info">
                                              <%--              <li>
                                                                <asp:LinkButton ID="UserLink" runat="server" class="btn default btn-outline" OnClick="UserLink_Click">
                                                                        <i class="fa fa-folder-open"></i>
                                                                        <span>فتح الملف</span>
                                                                </asp:LinkButton>
                                                            </li>--%>

                                                            <li>
                                                              <a href="Student.aspx?id=<%# Eval("ID") %>&tab=1" target="_blank"  class="btn default btn-outline" > <i class="fa fa-folder-open"></i> فتح الملف</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="mt-card-content">
                                                    <h3 class="mt-card-name"><%# Eval("StudentName") %></h3>
                                                    <p cl"mt-ass=card-desc font-grey-mint"><%# Eval("StudentNo") %></p>
                                                    <%--<div class="mt-card-desc font-grey-mint">
                                                    <table class="table">
                                                        <tr>
                                                            <th>العمر</th>
                                                            <td>16</td>
                                                        </tr>
                                                        <tr>
                                                            <th>الحالة</th>
                                                            <td>أعزب</td>
                                                        </tr>
                                                    </table>
                                                </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%# (Convert.ToInt32(Eval("No")) % 6 == 0)?"<div class=clearfix></div>":""%>
                                        
                                      
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource20" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentsImage" SelectCommandType="StoredProcedure">
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
                                <div class="clearfix"></div>
                                <div style="float: left!important; direction: ltr!important;">
                                    <asp:DataPager ID="DataPager2" runat="server" PageSize="18" PagedControlID="ListView2" class="pager col-md-12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" FirstPageText="الأول" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                            <asp:NextPreviousPagerField ButtonType="Link" PreviousPageText="السابق" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="true" />
                                            <asp:NumericPagerField ButtonType="Link" />
                                            <asp:NextPreviousPagerField ButtonType="Link" NextPageText="التالي" ShowFirstPageButton="false" ShowLastPageButton="false" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                                            <asp:NextPreviousPagerField ButtonType="Link" LastPageText="الأخير" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
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
                    <%} %>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</asp:Content>

