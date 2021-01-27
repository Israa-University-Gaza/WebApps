<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobsAvailable.aspx.cs" Inherits="JobsAvailable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div class="portlet light ">
                                <div class="portlet-title">
                                    <div class="caption" style="text-align: center">
                                        <i class="icon-share font-red-sunglo"></i>
                                        <span id="tit" runat="server" class="caption-subject font-red-sunglo bold uppercase"></span>
                                    </div>
                                    
                                </div>
                                <div class="portlet-body" style="direction:rtl; text-align: center;">
                                    <div class="note note-warning">
                                     <%--   <h4 class="block">Cross-browser compatibility</h4>--%>
                                        <p> <div id="pulsate-regular" style="padding:5px;"> عزيزي المشترك .. يرجى التأكد من صحة كافة البيانات المدخلة في السيرة الذاتية وخصوصا المؤهل العلمي والتخصص قبل التقدم بالطلب للوظائف المعلن عنها.
 </div>
                                            </p>
                                    </div>
                                 
                                  <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="GridView1_RowDataBound">
                                      <Columns>
                                          <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                                          <asp:BoundField DataField="job_name" HeaderText="الوظيفة" SortExpression="job_name" >
                                          <ItemStyle HorizontalAlign="Right" />
                                          </asp:BoundField>
                                          <asp:BoundField DataField="qualification" HeaderText="المؤهل العلمي " SortExpression="qualification" >
                                          <ItemStyle HorizontalAlign="Right" />
                                          </asp:BoundField>
                                          <asp:TemplateField>
                                              <ItemTemplate>
                                                  <asp:Button ID="Button1" runat="server" CssClass="btn blue" Text="تقدم بالطلب" CommandArgument='<%# Bind("id") %>' OnClick="Button1_Click" />
                                                  <asp:Label ID="Label1" runat="server"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                    </asp:GridView>




                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT dbo.hr_jobs_addv.id, dbo.hr_jobs_addv.job_name, dbo.hr_jobs_addv.qualification, dbo.job_emp_stat(@emp, dbo.hr_jobs_addv.id) AS حالة_الطلب FROM dbo.hr_jobs_addv INNER JOIN dbo.hr_adv ON dbo.hr_jobs_addv.adv_id = dbo.hr_adv.adv_id
WHERE ([Deadline] &gt; getdate()) ">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="emp" SessionField="emp_id" />
                                        </SelectParameters>
                                        
                                    </asp:SqlDataSource>




                                </div>
                            </div>
    </form>
</asp:Content>

