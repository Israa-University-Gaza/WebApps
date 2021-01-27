<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Experiences.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <style>
        .numberCircle {
  border-radius: 50%;
  behavior: url(PIE.htc);
  /* remove if you don't care about IE8 */
  width: 36px;
  height: 36px;
  padding: 8px;
  background: #fff;
  border: 2px solid #666;
  color: #666;
  text-align: center;
  
}
    </style>

    <form runat="server">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                    <span class="caption-subject bold uppercase">الخبرات العملية  </span>
                </div>

            </div>
            <div class="portlet-body form">



                <div runat="server" id="not_found">
                    <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_name" CssClass="form-control" runat="server" ValidationGroup="g1"></asp:TextBox>
                                <label for="form_control_1">اسم المؤسسة </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="exp_name" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationGroup="g1"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr" CssClass="form-control" runat="server" ValidationGroup="g1"></asp:TextBox>
                                <label for="form_control_1">عنوانها </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="exp_addr" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationGroup="g1"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3" style="direction: rtl;">
                        <div class="col-md-6" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_from" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server" ValidationGroup="g1"></asp:TextBox>
                                <label for="form_control_1">من </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="exp_from" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" ValidationGroup="g1" ></asp:RequiredFieldValidator>
                            </div>
                        </div>
                            </div>
                         <div class="col-md-6" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_to" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server" ValidationGroup="g1"></asp:TextBox>
                                <label for="form_control_1">الى </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="exp_to" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" ValidationGroup="g1" ></asp:RequiredFieldValidator>
                            </div>
                        </div>
                            </div>
                    </div>
                    
                    <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_type" CssClass="form-control" runat="server" ValidationGroup="g1"></asp:TextBox>
                                <label for="form_control_1">نوع العمل </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="exp_type" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationGroup="g1"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                  <h2 id="msg" visible="false" runat="server" class="text-center mt-0 mb-20" style="color:red">  </h2>
                <asp:Button ID="Button1" runat="server" Text="اضافة" CssClass="btn" OnClick="Button1_Click" ValidationGroup="g1" />
                <br />
                <div style="direction:rtl">



                    <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource5" OnItemDataBound="Repeater1_ItemDataBound">
                    <ItemTemplate>

                    
                    <div class="col-xs-2">
                                            <div class="mt-element-ribbon bg-grey-steel">
                                                <div class="ribbon ribbon-right ribbon-border-hor ribbon-color-success ribbon-round ribbon-shadow uppercase"> الخبرة بعد  <%# Eval("degree") %></div>
                                                <p class="ribbon-content"> <asp:Label ID="Label1" CssClass="numberCircle" runat="server" Text=""></asp:Label>   </p>
                                            </div>
                                        </div>
                       </ItemTemplate>
                    </asp:Repeater>
                    
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                     SelectCommand=" SELECT        distinct degree, ISNULL(dbo.calc_exp_degree(emp_Id,degree),N'لا يوجد خبرة')  الخبرة,dbo.hr_emp_cer_type.id
FROM            dbo.hr_emp_cer INNER JOIN
                         dbo.hr_emp_cer_type ON
						  dbo.hr_emp_cer.degree = dbo.hr_emp_cer_type.txt
						 where emp_Id=@emp
						 order by dbo.hr_emp_cer_type.id">
                    <SelectParameters>
                        <asp:SessionParameter Name="emp" SessionField="emp_id" />
                    </SelectParameters>
                </asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" GridLines="Horizontal" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id" Visible="False" />
                        <asp:TemplateField HeaderText="اسم المؤسسة" SortExpression="exp_name">
                            <EditItemTemplate>
                                

                                <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_name" Text='<%# Bind("exp_name") %>'  CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>

                            </EditItemTemplate>
                            <ItemTemplate>
                              
                                <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_name" Text='<%# Bind("exp_name") %>' ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="عنوانها" SortExpression="exp_addr">
                            <EditItemTemplate>
                              

                                <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr" Text='<%# Bind("exp_addr") %>'  CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                               

                                <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr" Text='<%# Bind("exp_addr") %>' ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="من" SortExpression="exp_from">
                            <EditItemTemplate>
                              <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_from" Text='<%# Bind("exp_from") %>'   CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_from" Text='<%# Bind("exp_from") %>' ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الى" SortExpression="exp_to">
                            <EditItemTemplate>
                               <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_to" Text='<%# Bind("exp_to") %>'  data-date-format="dd/mm/yyyy"   CssClass="form-control form-control-inline input-medium date-picker" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                              <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_to" Text='<%# Bind("exp_to") %>' ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع العمل" SortExpression="exp_type">
                            <EditItemTemplate>
                               <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_type" Text='<%# Bind("exp_type") %>'  CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_type" Text='<%# Bind("exp_type") %>' ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                               

                            </div>
                        </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="تعديل"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="تراجع"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                  <asp:LinkButton ID="LinkButton1"  Width="27px" runat="server" CssClass="btn btn-icon-only green" CausesValidation="False" CommandName="Edit" Text="تعديل">
                             <i class="fa fa-edit"></i>
                        </asp:LinkButton>         
                         
                        <asp:LinkButton ID="LinkButton2"  Width="27px" CssClass="btn btn-icon-only red" runat="server" CausesValidation="False" CommandName="Delete"
                             OnClientClick="return confirm(&quot;هل انت متأكد&quot;)" Text="حذف">
                             <i class="fa fa-times"></i>
                        </asp:LinkButton> </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
              

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                     DeleteCommand="DELETE FROM [hr_emp_exp] WHERE [id] = @original_id " 
                    InsertCommand="INSERT INTO [hr_emp_exp] ([emp_id], [exp_name], [exp_addr], [exp_from], [exp_to], [exp_type]) VALUES (@emp_id, @exp_name, @exp_addr, @exp_from, @exp_to, @exp_type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [hr_emp_exp]  where emp_id=@emp ORDER BY [id] DESC" 
                    UpdateCommand="UPDATE [hr_emp_exp] SET [exp_name] = @exp_name, [exp_addr] = @exp_addr, [exp_from] = @exp_from, [exp_to] = @exp_to, [exp_type] = @exp_type WHERE [id] = @original_id ">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="emp_id" Type="Int32" />
                        <asp:Parameter Name="exp_name" Type="String" />
                        <asp:Parameter Name="exp_addr" Type="String" />
                        <asp:Parameter Name="exp_from" Type="String" />
                        <asp:Parameter Name="exp_to" Type="String" />
                        <asp:Parameter Name="exp_type" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="emp" SessionField="emp_id" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="emp_id" Type="Int32" />
                        <asp:Parameter Name="exp_name" Type="String" />
                        <asp:Parameter Name="exp_addr" Type="String" />
                        <asp:Parameter Name="exp_from" Type="String" />
                        <asp:Parameter Name="exp_to" Type="String" />
                        <asp:Parameter Name="exp_type" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </div>
            <div class="row" >
                    <div class="col-md-6" style="direction: rtl;">
<%--<asp:HyperLink ID="HyperLink1" class="btn btn-primary mt-ladda-btn ladda-button" data-style="expand-right" runat="server">السابق </asp:HyperLink>--%>
                                  <a   class="btn red mt-ladda-btn ladda-button btn-outline"  runat="server" id="h1" data-style="slide-right" data-spinner-color="#333">
                                                    <span class="ladda-label">
                                                        <i class="icon-login"></i> السابق</span>
                                                </a>
             

                  
                    </div>
                     <div class="col-md-6">
    

                           <a   class="btn red mt-ladda-btn ladda-button btn-outline"  runat="server" id="h2" data-style="slide-right" data-spinner-color="#333">
                                                    <span class="ladda-label">
                                                        <i class="icon-logout"></i> التالي</span>
                                                </a>

                    </div>
  
        </div>
        </div>
    </form>
</asp:Content>

