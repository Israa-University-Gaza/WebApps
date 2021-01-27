<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="StudentBook.aspx.cs" Inherits="Admission_StudentBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblEmployeeName" runat="server" Visible="false"></asp:Label>

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
                    <div style="width: 19%; float: right;">
                        <ul class="ver-inline-menu tabbable margin-bottom-10 font-ha">
                            <li style="margin-bottom: 0;">
                                <div class="input-group">
                                    <asp:TextBox ID="txtStudentNo" runat="server" class="form-control" placeholder="الرجاء ادخال رقم الطالب" Style="font-family: Tahoma; font-size: 12px !important;"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="btnChechStudent" runat="server" Text="بحث" class="btn green" OnClick="btnChechStudent_Click" Style="height: 34px;" />
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img runat="server" id="image" class="img-responsive" style="width: 100%" alt="" />
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource10">
                                    <ItemTemplate>
                                        <h5 style="text-align: center;"><%# Eval("DisplayName") %> (<%# Eval("StudentNo") %>)</h5>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:isra %>"
                                    SelectCommand="GetStudentData" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </li>
                            <li id="litab1" runat="server"><a href="Student.aspx#tab1"><i class="fa fa-home"></i>الصفحة الرئيسية<span class="after"></span></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-list"></i>ملف الطالب </a>
                                <ul class="dropdown-menu ver-inline-menu tabbable margin-bottom-10 font-ha" role="menu" style="width: 199px; margin-right: 199px; margin-top: -38px">
                                    <li><a href="StudentProfile.aspx#tab1"><i class="fa fa-briefcase"></i>بيانات أساسية</a></li>
                                    <li><a href="StudentProfile.aspx#tab2"><i class="fa fa-male"></i>بيانات ولي الأمر</a></li>
                                    <li><a href="StudentProfile.aspx#tab3"><i class="fa fa-mobile-phone"></i>بيانات الإتصال</a></li>
                                    <li><a href="StudentProfile.aspx#tab4"><i class="fa fa-mobile-phone"></i>الرغبات وبيانات التجسير</a></li>
                                    <li><a href="StudentFinancialProfile.aspx"><i class="fa fa-edit"></i>الملف المالي</a></li>
                                    <li><a href="StudentScholarship.aspx"><i class="fa fa-edit"></i>منح الطالب</a></li>
                                    <li><a href="StudentImage.aspx"><i class="fa fa-edit"></i>تغيير صورة الطالب</a></li>
                                </ul>
                            </li>
                            <li><a href="StudentSemesterRegistration.aspx"><i class="fa fa-edit"></i>التسجيل الفصلي</a></li>
                            <li id="litab8" runat="server"><a href="Student.aspx#tab8"><i class="fa fa-list-alt"></i>تسجيل مساقات الخطة</a></li>
                            <li id="litab2" runat="server"><a href="Student.aspx#tab2"><i class="fa fa-list-alt"></i>الجدول الدراسي</a></li>
                            <li id="litab3" runat="server"><a href="Student.aspx#tab3"><i class="fa fa-table"></i>جدول الإمتحانات</a></li>
                            <li id="litab4" runat="server"><a href="Student.aspx#tab4"><i class="fa fa-book"></i>الخطة الدراسية</a></li>
                            <li id="litab5" runat="server"><a href="Student.aspx#tab5"><i class="fa fa-stack-exchange"></i>علامات المساقات</a></li>
                            <li id="litab6" runat="server"><a href="Student.aspx#tab6"><i class="fa fa-lock"></i>كشف درجات</a></li>
                            <li><a href="StudentBook.aspx"><i class="fa fa-book"></i>الكتب الدراسية</a></li>
                            <li id="litab10" runat="server"><a href="Student.aspx#tab10"><i class="fa fa-lock"></i>تحويل التخصص</a></li>
                            <li id="litab11" runat="server"><a href="Student.aspx#tab11"><i class="fa fa-lock"></i>تأجيل الفصل الدراسي</a></li>
                            <li id="litab7" runat="server"><a href="Student.aspx#tab7"><i class="fa fa-lock"></i>مستندات الطالب</a></li>
                            <li id="litab9" runat="server"><a href="Student.aspx#tab9"><i class="fa fa-lock"></i>إرسال SMS</a></li>
                            <li id="litab12" runat="server"><a href="Student.aspx#tab12"><i class="fa fa-lock"></i>شروط انتساب الطالب</a></li>
                            <li id="litab13" runat="server"><a href="Student.aspx#tab13"><i class="fa fa-lock"></i>تغير نوع الطالب</a></li>
                        </ul>
                    </div>
                    <div style="width: 81%; float: right;">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>حجز كتاب</h4>
                                </div>
                                <div class="col-md-9 isra-pl-0">
                                    <div id="divMsg1" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                        <asp:Label ID="lblMsg1" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                        <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                        <div style="clear: both"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 15px 0" />
                            <div class="row">
                                <div class="row">
                                    <label class="col-md-2 control-label">الكتاب : </label>
                                    <div class="col-md-5">
                                        <asp:DropDownList ID="ddlBook" runat="server" CssClass="form-control select2_category" DataSourceID="SqlDataSource2" DataTextField="ArName" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>"
                                            SelectCommand="SELECT ID, ArName FROM [Book] WHERE (([Accreditation] = 1 ) AND ([IsActive] = 1) AND ([IsDelete] = 0)) union select -1,N'إختر الكتاب'"></asp:SqlDataSource>
                                    </div>
                                    
                                    <div class="col-md- " style="text-align: left;">
                                        <asp:Button ID="btnStudentBookPDF" runat="server" CssClass="btn btn-info btn-xs" style="height:34px;padding-left:15px;padding-right:15px" Text="كشف بكتب الطالب المحجوزة" OnClick="btnStudentBookPDF_Click" />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-offset-2 col-md-1">
                                        <asp:Button ID="btnBuyBook" runat="server" class="btn green" Text="حجز الكتاب" OnClick="btnBuyBook_Click" />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>الكتب المحجوزة</h4>
                                    </div>
                                    <div class="col-md-9 isra-pl-0">
                                        <div id="divMsg2" runat="server" class="alert alert-warning alert-dismissable std-profile-msg" visible="false">
                                            <asp:Label ID="lblMsg2" runat="server" Style="font-weight: bold; float: right;"></asp:Label>
                                            <button aria-hidden="true" data-dismiss="alert" class="close" style="margin: 5px 10px 0 0; left: 0" type="button"></button>
                                            <div style="clear: both"></div>
                                        </div>
                                    </div>
                                </div>
                                <hr style="margin: 10px 0 15px 0" />
                                <div class="row">
                                    <% if (ListView1.Items.Count > 0)
                                       { %>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 35%; text-align: center">الكتاب</th>
                                                <th style="width: 30%; text-align: center">سعر الكتاب</th>
                                                <th style="width: 35%; text-align: center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="StudentBookID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                    <tr>
                                                        <td style="text-align: center"><span><%# Eval("BookName") %></span></td>
                                                        <td style="text-align: center"><span><%# Eval("BookPrice") %></span></td>
                                                        <td style="text-align: center"><span><%# (Eval("IsDeliverd").ToString()=="True")?"تم التسليم": "" %></span>
                                                            <asp:Button ID="btnDeleteStudentBook" runat="server" CssClass="btn btn-danger btn-xs" Text="إلغاء الحجز" OnClick="btnDeleteStudentBook_Click" Visible='<%# (Eval("IsDeliverd").ToString()=="True")?false: true %>' />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:isra %>"
                                                SelectCommand="GetStudentBooks" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lblStudentID" PropertyName="Text" Name="StudentID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </tbody>
                                    </table>
                                    <div class="clearfix"></div>
                                    <% }
                                       else
                                       {%>
                                    <div style="font-size: 14px; margin-top: 20px;" class="alert alert-info alert-dismissable">
                                        <div class="col-xs-11" style="text-align: center;">
                                            <strong>لا يوجد كتب محجوزة</strong>
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
    </div>
</asp:Content>

