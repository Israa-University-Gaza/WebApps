<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TopicsAll.aspx.cs" Inherits="Affairs_Topics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

     <div class="col-md-12">
           <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>البحث برقم الطالب  </div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="form-group">
                                                        <label>رقم الطالب :  </label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control"  runat="server" TextMode="Number"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="ادخل"></asp:RequiredFieldValidator>
                    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="بحث" OnClick="Button1_Click" />
                                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                                    </div>
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
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="SqlDataSource2" EmptyDataText="لا يوجد بيانات لعرضها" OnRowDataBound="GridView2_RowDataBound" AllowPaging="True" PageSize="50">
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
                        <asp:BoundField DataField="title" HeaderText="عنوان القضية" SortExpression="title" />
                        <asp:TemplateField HeaderText="تاريخ التقديم" SortExpression="DateEnter">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateEnter") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateEnter") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label554" runat="server" CssClass="btn badge-success"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                                    
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">إغلاق</button>
                                                   
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
                <asp:SqlDataSource ID="all" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentIssue %>" SelectCommand="SELECT   ROW_NUMBER() OVER (
	ORDER BY id
   ) row_num,* FROM [Topics] where isactive=1">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                        <asp:Parameter DefaultValue="False" Name="IsFinish" Type="Boolean"/>
                    </SelectParameters>
                </asp:SqlDataSource>
                
              
                <asp:SqlDataSource ID="byid" runat="server" ConnectionString="<%$ ConnectionStrings:IsraaStudentIssue %>" SelectCommand="SELECT   ROW_NUMBER() OVER (
	ORDER BY id
   ) row_num,* FROM [Topics] where isactive=1 and std_id=@sid">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="sid" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
              
            </div>
        </div>

    </div>
</asp:Content>

