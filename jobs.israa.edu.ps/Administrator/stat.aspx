<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="stat.aspx.cs" Inherits="Administrator_stat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        >
    <link href="../css/lightbox.min.css" rel="stylesheet" />
    <form runat="server">
        <div class="modal fade"  style="font-family:Al-Jazeera-Arabic;color:black" id="basic"   tabindex="-1" role="basic" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                    <h4 class="modal-title" style="padding-left: 195px;font-size: medium;padding-top: 23px;"> السيرة الذاتية </h4>
                                                </div>
                                                <div class="modal-body" style=" font-size: large;"> 
                                                   
                                                    <iframe id="cccv" runat="server" width="100%" height="400"></iframe>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">اغلاق</button>
                                                   
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
    <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase">استعلام عن حالة طلب </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">


                <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="id" CssClass="form-control" runat="server"></asp:TextBox>
                                <label for="form_control_1">رقم الهوية  </label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="id" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="هوية خطأ" ControlToValidate="id" ForeColor="#CC0000" ValidationExpression="\d\d\d\d\d\d\d\d\d"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                    </div>

                <div class="col-md-3" style="direction: rtl;">

                    <asp:Label ID="Label1" Visible="false" runat="server" Text="طلب غير مدخل"></asp:Label>
                    <asp:Button ID="Button1" CssClass="btn red" runat="server" Text="استعلام" OnClick="Button1_Click" />
                    <asp:HyperLink Visible="false" ID="HyperLink1" runat="server">معاينة الطلب</asp:HyperLink>
                    </div>
                



             

            </div>
        </div>

        <div runat="server" id="res" class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase"> نتيجة الاستعلام </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">


                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s1" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">المعلومات الشخصية  </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s2" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">البيانات العلمية   </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s3" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1"> اللغات  </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s4" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">الخبرات العملية   </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s5" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">القدرات والمهارت الشخصية   </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s6" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1"> خبرات اخرى  </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s7" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1"> المعرفون  </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s8" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">الحياة العملية   </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s9" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">المرفقات   </label>
                             
                            </div>
                        </div>
                    </div>
                <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s10" CssClass="form-control" runat="server"></asp:TextBox>
                                 <label for="form_control_1">السيرة الذاتية   </label>
                              <a runat="server" id="cvv" class="btn red btn-outline sbold" data-toggle="modal" href="#basic"> <i class="far fa-question-circle"></i>  عرض السيرة الذاتية </a>
                            </div>
                        </div>
                    </div>
                <div class="col-md-8" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="s11" CssClass="form-control" runat="server"></asp:TextBox>
                              <asp:Image ID="Image1" runat="server" Height="150px" Width="119px" />
                                 <label for="form_control_1">الصورة الشخصية</label>
                               
                            </div>
                        </div>
                    </div>

                
                



             

            </div>
        </div>
        <hr/>
        <br/>
    
        <div runat="server" id="Div1" class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase">  المرفقات </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">
                 <asp:DataList ID="DataList1" runat="server"  DataSourceID="SqlDataSource2" HorizontalAlign="Right" RepeatColumns="4" RepeatDirection="Horizontal">
                 <%-- <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" ShowHeader="False" Width="100%" EmptyDataText="لا يوجد مرفقات" GridLines="Horizontal">--%>
         
                    <ItemTemplate>
                <div class="col-md-4" style="direction: rtl;">
                        
                            <%--<asp:Image Width="250px" ID="Image2" runat="server" ImageUrl='<%# "~/ShowImage.ashx?id="+Eval("id") %>' />--%>

                     <a class="example-image-link" href="<%# "../ShowImage.ashx?id=" + Eval("id") %>" data-lightbox="example-2"
                                          data-title="Optional caption."><img class="example-image" 
                                              src="<%# "../ShowImage.ashx?id=" + Eval("id") %>" height="154px" alt="image-1"/></a>
<%# Eval("typ") %>
                    </div>
                 </ItemTemplate>
              
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [hr_emp_img] WHERE ([emp_id] = @emp_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="id" Name="emp_id" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                
                



             

            </div>
        </div>
           
        <hr/>
        <br/>
    
        <div runat="server" id="Div2" class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase">  الوظائف المتقدم لها  </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px; direction:rtl">
                 
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table" EmptyDataText="لا يوجد وظائف تقدم لها المشترك" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="job_name" HeaderText="الوظيفة" SortExpression="job_name" />
                        <asp:BoundField DataField="dat" HeaderText="تاريخ التقديم" SortExpression="dat" />
                        <asp:TemplateField HeaderText="المؤهل">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cer") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("cer") %>'></asp:Label>
                                &nbsp;(
                                <asp:Label ID="Label2" runat="server" style="color: #3399FF" Text='<%# Bind("التخصص") %>'></asp:Label>
                                &nbsp;)
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حالة_الطلب">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("حالة_الطلب") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("حالة_الطلب") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                
                



             

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                     SelectCommand="SELECT        dbo.hr_jobs_addv.job_name, CONVERT(nvarchar(30), dat, 103) AS dat, dbo.cer_type(dbo.hr_jobs_emp.emp) AS cer, dbo.cer_name(dbo.hr_jobs_emp.emp) AS التخصص, dbo.job_emp_stat(dbo.hr_jobs_emp.emp, dbo.hr_jobs_emp.job) 
                         AS حالة_الطلب
FROM            dbo.hr_jobs_emp INNER JOIN
                         dbo.hr_jobs_addv ON dbo.hr_jobs_emp.job = dbo.hr_jobs_addv.id
WHERE        (dbo.hr_jobs_emp.emp = @emp)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="id" Name="emp" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

                
                



             

            </div>
        </div>

        <div runat="server" id="Div3" class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase">  خبرات الموظف  </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px; direction:rtl">
                 
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSource5" OnRowDataBound="GridView2_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="degree" HeaderText="الدرجة العلمية" SortExpression="degree" />
                        <asp:TemplateField HeaderText="الخبرة" SortExpression="Column1">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("الخبرة") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="exp_lab1" runat="server" style="letter-spacing: 1px;" Text='<%# Bind("الخبرة") %>' CssClass="btn red"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                
                



             

                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                     SelectCommand=" SELECT        distinct degree, ISNULL(dbo.calc_exp_degree(emp_Id,degree),N'لا يوجد خبرة')  الخبرة,dbo.hr_emp_cer_type.id
FROM            dbo.hr_emp_cer INNER JOIN
                         dbo.hr_emp_cer_type ON
						  dbo.hr_emp_cer.degree = dbo.hr_emp_cer_type.txt
						 where emp_Id=@emp
						 order by dbo.hr_emp_cer_type.id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="id" Name="emp" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

                
                



             

            </div>
        </div>

        </form>
        <script src="../css/lightbox-plus-jquery.min.js"></script>
</asp:Content>

