<%@ Page Title="" Language="C#" MasterPageFile="~/Affairs/MasterPage.master" AutoEventWireup="true" CodeFile="TopicsAccDept.aspx.cs" Inherits="Affairs_Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box red">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i> المواضيع (قسم القروض والمنح الدراسية) </div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="SqlDataSource1" EmptyDataText="لا يوجد بيانات لعرضها" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="رقم الطالب">
                            <ItemTemplate>
                                <asp:Label ID="stdNo" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="اسم الطالب">
                            <ItemTemplate>
                                <asp:Label ID="stdName" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Program" HeaderText="البرنامج" SortExpression="Program" />
                        <asp:BoundField DataField="title" HeaderText="عنوان القضية" SortExpression="title" />
                        <asp:BoundField DataField="DateEnter" HeaderText="تاريخ التقديم" SortExpression="DateEnter" />
                        <asp:TemplateField HeaderText="حالة القضية">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Font-Size="11pt"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                &nbsp; &nbsp;<asp:Button ID="Button12" runat="server" CssClass="btn-warning" Text="معاينة" data-toggle="modal" href='<%# "#basic"+Eval("id") %>' />

                                <div class="modal fade" id='<%# "basic"+Eval("id") %>' tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog" style=" width: 804px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">
                                                    <asp:Label ID="Label55" runat="server" Text='<%# Bind("title") %>'></asp:Label></h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="https://israa.edu.ps/Contracts/assets/logo.png" Width="265px" /><br />
                                                <br />
                                                <div style="text-align: right;font-family: revert">
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>الفصل الدراسي :  </label>
                                                        <asp:Label ID="SemesterName" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>التاريخ :  </label>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateEnter") %>' ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>البرنامج :  </label>
                                                        <asp:Label ID="program" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>المستوى :  </label>
                                                        <asp:Label ID="StudentLevel" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>اسم الطالب :  </label>
                                                        <asp:Label ID="StudentName" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>الكلية :  </label>
                                                        <asp:Label ID="StudentCollege" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>الرقم الجامعي :  </label>
                                                        <asp:Label ID="StudentNo" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>القسم :  </label>
                                                        <asp:Label ID="StudentDepartment" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                   <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>ساعات الدراسة :  </label>
                                                        <asp:Label ID="StudentStudiedHour" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>المعدل التراكمي :  </label>
                                                        <asp:Label ID="StudentGPAUniversity" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>ساعات النجاح :  </label>
                                                        <asp:Label ID="StudentSucceedHour" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>الرصيد العام :  </label>
                                                        <asp:Label ID="StudentBalance" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>ساعات التسجيل :  </label>
                                                        <asp:Label ID="StudentRegisteredHours" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>منح :  </label>
                                                        <asp:Label ID="ScholarshipArName" runat="server" ></asp:Label>--  <asp:Label ID="ScholarshipValue" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>معدل الفصل السابق :  </label>
                                                        <asp:Label ID="SemesterGPA" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>ع.ساعات نجاح الفصل السابق :  </label>
                                                        <asp:Label ID="SemesterSucceedHour" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>

                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>قروض :  </label>
                                                        <asp:Label ID="LoanValue" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>قرض خارجي :  </label>
                                                        <asp:Label ID="LoanValue1" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>عنوان الموضوع:  </label>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                    <div class="form-group">
                                                        <label>تفاصيل الموضوع : </label>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("det") %>'></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                       <div class="form-group">
                                                        <label>الإعتماد:  </label>
                                                           <asp:DropDownList ID="Deptacc" CssClass="form-control" runat="server">
                                                          <%--      <asp:ListItem Value="-1">اختر</asp:ListItem>--%>
                    <asp:ListItem Value="1">موافقة</asp:ListItem>
                    <asp:ListItem Value="0">رفض</asp:ListItem>
                                                           </asp:DropDownList>
                                                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Deptacc" ErrorMessage="اختر" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                        &nbsp;
                                                    </div>
                                                        <div class="form-group">
                                                        <label>راي قسم المنح:  </label>
                                                            <asp:TextBox ID="DeptComment"  CssClass="form-control" TextMode="MultiLine"  runat="server"></asp:TextBox>
                                                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DeptComment" ErrorMessage="اختر" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                        &nbsp;
                                                            <asp:HiddenField ID="HiddenField1" Value='<%# Bind("id") %>' runat="server" />
                                                    </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                    <asp:Button ID="Button1" CommandArgument='<%# Bind("row_num") %>' OnClick="Button1_Click" CssClass="btn btn-info" runat="server" Text="حفظ" />
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true">
                            <ItemTemplate>
                                <asp:Button ID="Btn_del" runat="server"  CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' OnClick="Btn_del_Click" OnClientClick="return confirm(&quot;هل انت متأكد ؟؟&quot;)" Text="حذف" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentIssue %>" SelectCommand="SELECT   ROW_NUMBER() OVER (
	ORDER BY id
   ) row_num,*,[IsraaAcademic].[dbo].[GetStudentProgram1](std_id) Program FROM [Topics] WHERE (([IsActive] = 1) AND ([IsFinish] = 0) and DeptAcc is null)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Topics] WHERE [ID] = @original_ID ">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Det" Type="String" />
                        <asp:Parameter Name="std_id" Type="String" />
                        <asp:Parameter Name="DateEnter" Type="DateTime" />
                        <asp:Parameter Name="StudentAffComment" Type="String" />
                        <asp:Parameter Name="StudentAffAcc" Type="Boolean" />
                        <asp:Parameter Name="AcadmicComment" Type="String" />
                        <asp:Parameter Name="AcadmicAcc" Type="Boolean" />
                        <asp:Parameter Name="MangmentComment" Type="String" />
                        <asp:Parameter Name="MangmentAcc" Type="Boolean" />
                        <asp:Parameter Name="IsFinish" Type="Boolean" />
                        <asp:Parameter Name="IsActive" Type="Boolean" />
                        <asp:Parameter Name="StudentAffAccdate" Type="DateTime" />
                        <asp:Parameter Name="acadmicAccdate" Type="DateTime" />
                        <asp:Parameter Name="mangmentAccdate" Type="DateTime" />
                        <asp:Parameter Name="DeptComment" Type="String" />
                        <asp:Parameter Name="Deptacc" Type="Boolean" />
                        <asp:Parameter Name="DeptAccdate" Type="DateTime" />
                        <asp:Parameter Name="DeptAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="AcadmicAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="mangmentAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="StudentAffAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="FinishData" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Det" Type="String" />
                        <asp:Parameter Name="std_id" Type="String" />
                        <asp:Parameter Name="DateEnter" Type="DateTime" />
                        <asp:Parameter Name="StudentAffComment" Type="String" />
                        <asp:Parameter Name="StudentAffAcc" Type="Boolean" />
                        <asp:Parameter Name="AcadmicComment" Type="String" />
                        <asp:Parameter Name="AcadmicAcc" Type="Boolean" />
                        <asp:Parameter Name="MangmentComment" Type="String" />
                        <asp:Parameter Name="MangmentAcc" Type="Boolean" />
                        <asp:Parameter Name="IsFinish" Type="Boolean" />
                        <asp:Parameter Name="IsActive" Type="Boolean" />
                        <asp:Parameter Name="StudentAffAccdate" Type="DateTime" />
                        <asp:Parameter Name="acadmicAccdate" Type="DateTime" />
                        <asp:Parameter Name="mangmentAccdate" Type="DateTime" />
                        <asp:Parameter Name="DeptComment" Type="String" />
                        <asp:Parameter Name="Deptacc" Type="Boolean" />
                        <asp:Parameter Name="DeptAccdate" Type="DateTime" />
                        <asp:Parameter Name="DeptAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="AcadmicAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="mangmentAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="StudentAffAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="FinishData" Type="DateTime" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_title" Type="String" />
                        <asp:Parameter Name="original_Det" Type="String" />
                        <asp:Parameter Name="original_std_id" Type="String" />
                        <asp:Parameter Name="original_DateEnter" Type="DateTime" />
                        <asp:Parameter Name="original_StudentAffComment" Type="String" />
                        <asp:Parameter Name="original_StudentAffAcc" Type="Boolean" />
                        <asp:Parameter Name="original_AcadmicComment" Type="String" />
                        <asp:Parameter Name="original_AcadmicAcc" Type="Boolean" />
                        <asp:Parameter Name="original_MangmentComment" Type="String" />
                        <asp:Parameter Name="original_MangmentAcc" Type="Boolean" />
                        <asp:Parameter Name="original_IsFinish" Type="Boolean" />
                        <asp:Parameter Name="original_IsActive" Type="Boolean" />
                        <asp:Parameter Name="original_StudentAffAccdate" Type="DateTime" />
                        <asp:Parameter Name="original_acadmicAccdate" Type="DateTime" />
                        <asp:Parameter Name="original_mangmentAccdate" Type="DateTime" />
                        <asp:Parameter Name="original_DeptComment" Type="String" />
                        <asp:Parameter Name="original_Deptacc" Type="Boolean" />
                        <asp:Parameter Name="original_DeptAccdate" Type="DateTime" />
                        <asp:Parameter Name="original_DeptAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_AcadmicAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_mangmentAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_StudentAffAccerdationEmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_FinishData" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
              
            </div>
        </div>

    </div>
    <div class="col-md-12">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>ارشيف المواضيع </div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="SqlDataSource2" EmptyDataText="لا يوجد بيانات لعرضها" OnRowDataBound="GridView2_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="رقم الطالب">
                            <ItemTemplate>
                                <asp:Label ID="stdNo" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="اسم الطالب">
                            <ItemTemplate>
                                <asp:Label ID="stdName" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                              <asp:BoundField DataField="Program" HeaderText="البرنامج" SortExpression="Program" />
                        <asp:BoundField DataField="title" HeaderText="عنوان القضية" SortExpression="title" />
                        <asp:BoundField DataField="DateEnter" HeaderText="تاريخ التقديم" SortExpression="DateEnter" />
                        <asp:TemplateField HeaderText="حالة القضية">
                            <ItemTemplate>
                                رأي القسم: 
                          
                                <asp:HyperLink ID="Dept" runat="server" data-toggle="modal" href='<%# "#Dept"+Eval("id") %>' ></asp:HyperLink>
                                <asp:Label ID="DeptDate" runat="server" Font-Size="11pt"></asp:Label><br/>
                                <div class="modal fade" id='<%# "Dept"+Eval("id") %>' tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog" style=" width: 804px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">
                                                    <asp:Label ID="Label553" runat="server" Text='<%# Bind("title") %>'></asp:Label></h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:Image ID="Image11" runat="server" ImageUrl="https://israa.edu.ps/Contracts/assets/logo.png" Width="265px" /><br />
                                                <br />
                                                <asp:Label ID="DeptComment1" Font-Size="Larger" runat="server" Text=""></asp:Label>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                   
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                            </div>
                              رأي شؤون الطلبة:  
                             
                                 <asp:HyperLink ID="StudentAff" runat="server" data-toggle="modal" href='<%# "#aff"+Eval("id") %>' ></asp:HyperLink>
                                <asp:Label ID="StudentAffDate" runat="server" Font-Size="11pt"></asp:Label><br/>
                                <div class="modal fade" id='<%# "aff"+Eval("id") %>' tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog" style=" width: 804px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("title") %>'></asp:Label></h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="https://israa.edu.ps/Contracts/assets/logo.png" Width="265px" /><br />
                                                <br />
                                                <asp:Label ID="StudentAffComment1" Font-Size="Larger" runat="server" Text=""></asp:Label>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                   
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                            </div>
                               راي الشؤون الأكاديمية: 
                                <asp:HyperLink ID="acadmicAcc" runat="server" data-toggle="modal" href='<%# "#acadmic"+Eval("id") %>' ></asp:HyperLink>
                              
                                <asp:Label ID="acadmicAccdate" runat="server" Font-Size="11pt"></asp:Label><br/>

                                <div class="modal fade" id='<%# "acadmic"+Eval("id") %>' tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog" style=" width: 804px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("title") %>'></asp:Label></h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="https://israa.edu.ps/Contracts/assets/logo.png" Width="265px" /><br />
                                                <br />
                                                <asp:Label ID="acadmicComment1" Font-Size="Larger" runat="server" Text=""></asp:Label>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                   
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                            </div>

                               رأي الشؤون الإدارية: 
                              
                                   <asp:HyperLink ID="mangmentAcc" runat="server" data-toggle="modal" href='<%# "#mangment"+Eval("id") %>' ></asp:HyperLink>
                                <asp:Label ID="mangmentAccdate" runat="server" Font-Size="11pt"></asp:Label><br/>

                                <div class="modal fade" id='<%# "mangment"+Eval("id") %>' tabindex="-1" role="basic" aria-hidden="true">
                                    <div class="modal-dialog" style=" width: 804px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("title") %>'></asp:Label></h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:Image ID="Image4" runat="server" ImageUrl="https://israa.edu.ps/Contracts/assets/logo.png" Width="265px" /><br />
                                                <br />
                                                <asp:Label ID="mangmentComment1" Font-Size="Larger" runat="server" Text=""></asp:Label>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                   
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                            </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                &nbsp; &nbsp;<asp:Button ID="Button122" runat="server" CssClass="btn-warning" Text="معاينة" data-toggle="modal" href='<%# "#basic"+Eval("id") %>' />
                                  <asp:Button ID="btn_fin" CssClass="btn btn-danger" runat="server" Text="إنجاز" CommandArgument='<%# Eval("ID") %>' OnClick="btn_fin_Click" OnClientClick="return confirm(&quot;هل تم إنجاز الموضوع من طرف القسم ؟؟&quot;)" />
                                <div class="modal fade" id='<%# "basic"+Eval("id") %>' tabindex="-1" role="basic" aria-hidden="true">

                                    <div class="modal-dialog" style=" width: 804px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("title") %>'></asp:Label></h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="https://israa.edu.ps/Contracts/assets/logo.png" Width="265px" /><br />
                                                <br />
                                                <div style="text-align: right;font-family: revert">
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>الفصل الدراسي :  </label>
                                                        <asp:Label ID="SemesterName" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>التاريخ :  </label>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateEnter") %>' ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>البرنامج :  </label>
                                                        <asp:Label ID="program" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>المستوى :  </label>
                                                        <asp:Label ID="StudentLevel" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>اسم الطالب :  </label>
                                                        <asp:Label ID="StudentName" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>الكلية :  </label>
                                                        <asp:Label ID="StudentCollege" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>الرقم الجامعي :  </label>
                                                        <asp:Label ID="StudentNo" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>القسم :  </label>
                                                        <asp:Label ID="StudentDepartment" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                   <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>ساعات الدراسة :  </label>
                                                        <asp:Label ID="StudentStudiedHour" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>المعدل التراكمي :  </label>
                                                        <asp:Label ID="StudentGPAUniversity" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>ساعات النجاح :  </label>
                                                        <asp:Label ID="StudentSucceedHour" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>الرصيد العام :  </label>
                                                        <asp:Label ID="StudentBalance" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>ساعات التسجيل :  </label>
                                                        <asp:Label ID="StudentRegisteredHours" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>منح :  </label>
                                                        <asp:Label ID="ScholarshipArName" runat="server" ></asp:Label>--  <asp:Label ID="ScholarshipValue" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>معدل الفصل السابق :  </label>
                                                        <asp:Label ID="SemesterGPA" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>ع.ساعات نجاح الفصل السابق :  </label>
                                                        <asp:Label ID="SemesterSucceedHour" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>

                                                    <div class="row"> 
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                        <label>قروض :  </label>
                                                        <asp:Label ID="LoanValue" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                          <div class="col-sm-6">
                                                              <div class="form-group">
                                                        <label>قرض خارجي :  </label>
                                                        <asp:Label ID="LoanValue1" runat="server" ></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>عنوان الموضوع:  </label>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                                        &nbsp;
                                                    </div>
                                                    <div class="form-group">
                                                        <label>تفاصيل الموضوع : </label>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("det") %>'></asp:Label>
                                                    </div>
                                                    <div class="row">
                                                       <div class="form-group">
                                                        <label>الإعتماد:  </label>
                                                           <asp:DropDownList ID="Deptacc" CssClass="form-control" runat="server">
<%--                                                                <asp:ListItem Value="-1">اختر</asp:ListItem>--%>
                    <asp:ListItem Value="1">موافقة</asp:ListItem>
                    <asp:ListItem Value="0">رفض</asp:ListItem>
                                                           </asp:DropDownList>
                                                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Deptacc" ErrorMessage="اختر" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                        &nbsp;
                                                    </div>
                                                        <div class="form-group">
                                                        <label>راي قسم المنح:  </label>
                                                            <asp:TextBox ID="DeptComment"  CssClass="form-control" TextMode="MultiLine"  runat="server"></asp:TextBox>
                                                           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DeptComment" ErrorMessage="اختر" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                        &nbsp;
                                                            <asp:HiddenField ID="HiddenField1" Value='<%# Bind("id") %>' runat="server" />
                                                    </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                    <asp:Button ID="Button1" CommandArgument='<%# Bind("row_num") %>' OnClick="Button1_Click1" CssClass="btn btn-info" runat="server" Text="حفظ" />
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                              
                            
                              
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentIssue %>" SelectCommand="SELECT   ROW_NUMBER() OVER (
	ORDER BY id
   ) row_num,*,[IsraaAcademic].[dbo].[GetStudentProgram1](std_id) Program FROM [Topics] WHERE (([IsActive] = @IsActive) AND ([IsFinish] = @IsFinish) and DeptAcc is not null)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                        <asp:Parameter DefaultValue="False" Name="IsFinish" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
              
            </div>
        </div>

    </div>
</asp:Content>

