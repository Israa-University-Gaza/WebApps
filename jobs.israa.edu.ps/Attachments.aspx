<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Attachments.aspx.cs" Inherits="Default9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <link href="css/lightbox.min.css" rel="stylesheet" />
    <form runat="server">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                    <span class="caption-subject bold uppercase">المرفقات </span>
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">



                <div runat="server" id="not_found">
                    <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="typ" CssClass="form-control" runat="server">
                                    <asp:ListItem>صورة هوية</asp:ListItem>
                                    <asp:ListItem>شهادة ميلاد </asp:ListItem>
                                    <asp:ListItem>شهادة خبرة</asp:ListItem>
                                    <asp:ListItem>شهادة الثانوية العامة</asp:ListItem>
                                    <asp:ListItem>شهادة بكالوريوس</asp:ListItem>
                                    <asp:ListItem>شهادة ماجستير</asp:ListItem>
                                    <asp:ListItem>شهادة دكتوراة</asp:ListItem>
                                    <asp:ListItem>شهادات اخرى</asp:ListItem>
                                </asp:DropDownList>
                                <label for="form_control_1">نوع المرفق  </label>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9" style="direction: rtl; right: 0px; top: 0px;">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <span class="btn green btn-file">
                                <span class="fileinput-new">اختر الملف </span>
                                <span class="fileinput-exists">تغيير </span>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                               <span class="fileinput-filename"></span>&nbsp;
                                                       
                                <a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput"></a>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FileUpload1" runat="server" ForeColor="Red" SetFocusOnError="True" ErrorMessage="ارفع الملف"></asp:RequiredFieldValidator>
                                
                        </div>
                        <h2 id="msg" visible="false" runat="server" style="color:red" >ادخل صورة
                        </h2>
                        <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click"  CssClass="btn"   Text="اضافة" />
                        <%--<asp:ImageButton ID="ImageButton1" ImageUrl="~/images/Circle-icons-upload.svg.png" runat="server" Height="54px" Width="54px" OnClick="ImageButton1_Click" />--%>
                    </div>

                </div>



                <hr />

                <div style="direction: rtl">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1"
                        OnRowDataBound="GridView1_RowDataBound" AllowSorting="True" CssClass="table" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                            <asp:BoundField DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id" Visible="False" />
                            <asp:BoundField DataField="typ" HeaderText="نوع الوثيقة" SortExpression="typ" />
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("img") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>

                               
                                     <a class="example-image-link" href="<%# "ShowImage.ashx?id=" + Eval("id") %>" data-lightbox="example-2"
                                          data-title="Optional caption."><img class="example-image" 
                                              src="<%# "ShowImage.ashx?id=" + Eval("id") %>" height="154px" alt="image-1"/></a>




                                 <%--   <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/ShowImage.ashx?id=" + Eval("id") %>' Height="154px" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" Height="42px" ImageUrl="~/images/Symbols-Delete-icon.png" OnClientClick="return confirm(&quot;هل انت متأكد ؟؟&quot;)" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        DeleteCommand="DELETE FROM [hr_emp_img] WHERE [id] = @original_id " InsertCommand="INSERT INTO [hr_emp_img] ([emp_id], [img], [typ]) VALUES (@emp_id, @img, @typ)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [hr_emp_img] where emp_id=@emp ORDER BY [id] DESC" UpdateCommand="UPDATE [hr_emp_img] SET [emp_id] = @emp_id, [img] = @img, [typ] = @typ WHERE [id] = @original_id AND [emp_id] = @original_emp_id AND (([img] = @original_img) OR ([img] IS NULL AND @original_img IS NULL)) AND (([typ] = @original_typ) OR ([typ] IS NULL AND @original_typ IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="emp_id" Type="Int32" />
                            <asp:Parameter Name="img" Type="Object" />
                            <asp:Parameter Name="typ" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="emp" SessionField="emp_id" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="emp_id" Type="Int32" />
                            <asp:Parameter Name="img" Type="Object" />
                            <asp:Parameter Name="typ" Type="String" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_emp_id" Type="Int32" />
                            <asp:Parameter Name="original_img" Type="Object" />
                            <asp:Parameter Name="original_typ" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>

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
    <script src="css/lightbox-plus-jquery.min.js"></script>
 
    </span>
 
</asp:Content>

