<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Identifiers.aspx.cs" Inherits="Default7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                    <span class="caption-subject bold uppercase">اشخاص يعرفونك من خلال دراستك او عملك (عدا الاقارب) :  المعرفون </span>
                </div>

            </div>
            <div class="portlet-body form">



                <div runat="server" id="not_found">
                    <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_name" CssClass="form-control" runat="server"></asp:TextBox>
                                <label for="form_control_1">الاسم  </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="exp_name" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr" CssClass="form-control" runat="server"></asp:TextBox>
                                <label for="form_control_1">المهنة </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="exp_addr" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-4" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_type" CssClass="form-control" runat="server"></asp:TextBox>
                                <label for="form_control_1"> العنوان </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="exp_type" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <asp:Button ID="Button1" runat="server" Text="اضافة" CssClass="btn" OnClick="Button1_Click" />

                <div style="direction:rtl">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                            <asp:TemplateField HeaderText="الاسم" SortExpression="name">
                                <EditItemTemplate>
                                    
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr" CssClass="form-control" Text='<%# Bind("name") %>' runat="server"></asp:TextBox>
                             

                            </div>
                        </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="المهنة" SortExpression="job">
                                <EditItemTemplate>
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr1" CssClass="form-control" Text='<%# Bind("job") %>' runat="server"></asp:TextBox>
                             

                            </div>
                        </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("job") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="العنوان" SortExpression="add">
                                <EditItemTemplate>
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="exp_addr12"  CssClass="form-control" Text='<%# Bind("add") %>' runat="server"></asp:TextBox>
                             

                            </div>
                        </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("add") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="تأكيد"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="تراجع"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton1"  Width="27px" runat="server" CssClass="btn btn-icon-only green" CausesValidation="False" CommandName="Edit" Text="تعديل">
                             <i class="fa fa-edit"></i>
                        </asp:LinkButton>         
                         
                        <asp:LinkButton ID="LinkButton2"  Width="27px" CssClass="btn btn-icon-only red" runat="server" CausesValidation="False" CommandName="Delete"
                             OnClientClick="return confirm(&quot;هل انت متأكد&quot;)" Text="حذف">
                             <i class="fa fa-times"></i>
                        </asp:LinkButton></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                         DeleteCommand="DELETE FROM [hr_emp_identifier] WHERE [id] = @original_id " InsertCommand="INSERT INTO [hr_emp_identifier] ([emp_id], [name], [job], [add]) VALUES (@emp_id, @name, @job, @add)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [hr_emp_identifier] where emp_id=@emp ORDER BY [id] DESC" 
                        UpdateCommand="UPDATE [hr_emp_identifier] SET  [name] = @name, [job] = @job, [add] = @add WHERE [id] = @original_id">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="emp_id" Type="Int32" />
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="job" Type="String" />
                            <asp:Parameter Name="add" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="emp" SessionField="emp_id" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="job" Type="String" />
                            <asp:Parameter Name="add" Type="String" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
              

                
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

