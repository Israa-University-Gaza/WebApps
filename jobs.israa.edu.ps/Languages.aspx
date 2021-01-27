<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Languages.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                    <span class="caption-subject bold uppercase">معرفة اللغات  </span>
                </div>

            </div>
            <div class="portlet-body form">



                <div runat="server" id="not_found">

                    <div class="col-md-2" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">

                                    <asp:ListItem Value="5">الألمانية</asp:ListItem>
                                    <asp:ListItem Value="33">الأمازيغية</asp:ListItem>
                                    <asp:ListItem Value="9">الأوكرانية</asp:ListItem>
                                    <asp:ListItem Value="2">الإنجليزية</asp:ListItem>
                                    <asp:ListItem Value="4">الاسبانية</asp:ListItem>
                                    <asp:ListItem Value="35">الاشارة للصم</asp:ListItem>
                                    <asp:ListItem Value="28">الاوردو</asp:ListItem>
                                    <asp:ListItem Value="25">الباشتية</asp:ListItem>
                                    <asp:ListItem Value="24">الباكستانية</asp:ListItem>
                                    <asp:ListItem Value="14">البرتغالية</asp:ListItem>
                                    <asp:ListItem Value="18">البلغارية</asp:ListItem>
                                    <asp:ListItem Value="26">البنجالية</asp:ListItem>
                                    <asp:ListItem Value="12">البوسنية</asp:ListItem>
                                    <asp:ListItem Value="6">التركية</asp:ListItem>
                                    <asp:ListItem Value="22">التشيكية</asp:ListItem>
                                    <asp:ListItem Value="8">الروسية</asp:ListItem>
                                    <asp:ListItem Value="20">الرومانية</asp:ListItem>
                                    <asp:ListItem Value="19">السويدية</asp:ListItem>
                                    <asp:ListItem Value="11">الصربية</asp:ListItem>
                                    <asp:ListItem Value="29">الصينية</asp:ListItem>
                                    <asp:ListItem Value="34">العبرية</asp:ListItem>
                                    <asp:ListItem Value="1">العربية</asp:ListItem>
                                    <asp:ListItem Value="23">الفارسية</asp:ListItem>
                                    <asp:ListItem Value="3">الفرنسية</asp:ListItem>
                                    <asp:ListItem Value="7">الكردية</asp:ListItem>
                                    <asp:ListItem Value="10">الكرواتية</asp:ListItem>
                                    <asp:ListItem Value="31">الكورية</asp:ListItem>
                                    <asp:ListItem Value="30">الماليزية</asp:ListItem>
                                    <asp:ListItem Value="15">النرويجية</asp:ListItem>
                                    <asp:ListItem Value="27">الهندية</asp:ListItem>
                                    <asp:ListItem Value="32">اليابانية</asp:ListItem>
                                    <asp:ListItem Value="13">اليوغسلافية</asp:ListItem>
                                    <asp:ListItem Value="17">اليونانية</asp:ListItem>
                                    <asp:ListItem Value="21">ايطالية</asp:ListItem>
                                    <asp:ListItem Value="16">بولندية</asp:ListItem>
                                </asp:DropDownList>
                                <label for="form_control_1">اللغة  </label>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="lan_conversation" CssClass="form-control" runat="server">
                                    <asp:ListItem>جيد جدا</asp:ListItem>
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>ضعيف</asp:ListItem>
                                </asp:DropDownList>
                                <label for="form_control_1">المحادثة </label>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="lan_write" CssClass="form-control" runat="server">
                                    <asp:ListItem>جيد جدا</asp:ListItem>
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>ضعيف</asp:ListItem>
                                </asp:DropDownList>
                                <label for="form_control_1">الكتابة </label>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="lan_read" CssClass="form-control" runat="server">
                                    <asp:ListItem>جيد جدا</asp:ListItem>
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>ضعيف</asp:ListItem>
                                </asp:DropDownList>
                                <label for="form_control_1">القراءة </label>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                <label for="form_control_1">ملاحظات </label>

                            </div>
                        </div>
                    </div>
                   
                </div>
                 <asp:Button ID="Button1" runat="server" Text="ادخل" CssClass="btn" OnClick="Button1_Click" />
                <div style="direction: rtl">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                            <asp:TemplateField HeaderText="اللغة " SortExpression="lan_name">
                                <EditItemTemplate>
                               <%--     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("lan_name") %>'></asp:TextBox>--%>

                                     
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" SelectedValue='<%# Bind("lan_name") %>'>

                                    <asp:ListItem >الألمانية</asp:ListItem>
                                    <asp:ListItem >الأمازيغية</asp:ListItem>
                                    <asp:ListItem >الأوكرانية</asp:ListItem>
                                    <asp:ListItem >الإنجليزية</asp:ListItem>
                                    <asp:ListItem >الاسبانية</asp:ListItem>
                                    <asp:ListItem >الاشارة للصم</asp:ListItem>
                                    <asp:ListItem >الاوردو</asp:ListItem>
                                    <asp:ListItem >الباشتية</asp:ListItem>
                                    <asp:ListItem >الباكستانية</asp:ListItem>
                                    <asp:ListItem >البرتغالية</asp:ListItem>
                                    <asp:ListItem >البلغارية</asp:ListItem>
                                    <asp:ListItem >البنجالية</asp:ListItem>
                                    <asp:ListItem >البوسنية</asp:ListItem>
                                    <asp:ListItem >التركية</asp:ListItem>
                                    <asp:ListItem >التشيكية</asp:ListItem>
                                    <asp:ListItem >الروسية</asp:ListItem>
                                    <asp:ListItem >الرومانية</asp:ListItem>
                                    <asp:ListItem >السويدية</asp:ListItem>
                                    <asp:ListItem >الصربية</asp:ListItem>
                                    <asp:ListItem >الصينية</asp:ListItem>
                                    <asp:ListItem >العبرية</asp:ListItem>
                                    <asp:ListItem >العربية</asp:ListItem>
                                    <asp:ListItem >الفارسية</asp:ListItem>
                                    <asp:ListItem >الفرنسية</asp:ListItem>
                                    <asp:ListItem >الكردية</asp:ListItem>
                                    <asp:ListItem >الكرواتية</asp:ListItem>
                                    <asp:ListItem >الكورية</asp:ListItem>
                                    <asp:ListItem >الماليزية</asp:ListItem>
                                    <asp:ListItem >النرويجية</asp:ListItem>
                                    <asp:ListItem >الهندية</asp:ListItem>
                                    <asp:ListItem >اليابانية</asp:ListItem>
                                    <asp:ListItem >اليوغسلافية</asp:ListItem>
                                    <asp:ListItem >اليونانية</asp:ListItem>
                                    <asp:ListItem >ايطالية</asp:ListItem>
                                    <asp:ListItem >بولندية</asp:ListItem>
                                </asp:DropDownList>
                             

                            </div>
                        </div>
                 
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                
                                <asp:TextBox ID="Label1" CssClass="form-control" ReadOnly="true" runat="server" Text='<%# Bind("lan_name") %>' > </asp:TextBox>
                                </div>
                                         </div>


                                 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="المحادثة" SortExpression="lan_conversation">
                                <EditItemTemplate>
                                    
                                       <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="lan_conversation" CssClass="form-control"  runat="server" SelectedValue='<%# Bind("lan_conversation") %>'>
                                    <asp:ListItem>جيد جدا</asp:ListItem>
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>ضعيف</asp:ListItem>
                                </asp:DropDownList>
                             

                            </div>
                        </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                   <%-- <asp:Label ID="Label2" runat="server" Text='<%# Bind("lan_conversation") %>'></asp:Label>--%>
                                <asp:TextBox ID="Label2" ReadOnly="true" CssClass="form-control" runat="server" Text='<%# Bind("lan_conversation") %>' > </asp:TextBox>
                                </div>
                                         </div>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="الكتابة" SortExpression="lan_write">
                               
                                <EditItemTemplate>
                                   <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="DropDownList111" CssClass="form-control"  runat="server" SelectedValue='<%# Bind("lan_write") %>'>
                                    <asp:ListItem>جيد جدا</asp:ListItem>
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>ضعيف</asp:ListItem>
                                </asp:DropDownList>
                             

                            </div>
                        </div>
                                </EditItemTemplate>
                               
                                <ItemTemplate>
                                   
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                   <%-- <asp:Label ID="Label2" runat="server" Text='<%# Bind("lan_conversation") %>'></asp:Label>--%>
                                <asp:TextBox ID="TextBox6" ReadOnly="true" CssClass="form-control" runat="server" Text='<%# Bind("lan_write") %>' > </asp:TextBox>
                                </div>
                                         </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="القراءة" SortExpression="lan_read">
                                
                                <EditItemTemplate>
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:DropDownList ID="DropDownList11" CssClass="form-control"  runat="server" SelectedValue='<%# Bind("lan_read") %>'>
                                    <asp:ListItem>جيد جدا</asp:ListItem>
                                    <asp:ListItem>متوسط</asp:ListItem>
                                    <asp:ListItem>ضعيف</asp:ListItem>
                                </asp:DropDownList>
                             

                            </div>
                        </div>
                                </EditItemTemplate>
                                
                                <ItemTemplate>
                                    
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                   <%-- <asp:Label ID="Label2" runat="server" Text='<%# Bind("lan_conversation") %>'></asp:Label>--%>
                                <asp:TextBox ID="Label3" ReadOnly="true" CssClass="form-control" runat="server" Text='<%# Bind("lan_read") %>' > </asp:TextBox>
                                </div>
                                         </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ملاحظات" SortExpression="lan_notes">
                                <EditItemTemplate>
                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                 <asp:TextBox ID="TextBox5" ReadOnly="true" CssClass="form-control"  runat="server" Text='<%# Bind("lan_notes") %>'></asp:TextBox>
                             

                            </div>
                        </div>

                                   



                                </EditItemTemplate>
                                <ItemTemplate>
                                   <%-- <asp:Label ID="Label5" runat="server" Text='<%# Bind("lan_notes") %>'></asp:Label>--%>

                                    <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                   <%-- <asp:Label ID="Label2" runat="server" Text='<%# Bind("lan_conversation") %>'></asp:Label>--%>
                                <asp:TextBox ID="Label5" ReadOnly="true" CssClass="form-control" runat="server" Text='<%# Bind("lan_notes") %>' > </asp:TextBox>
                                </div>
                                         </div>
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
                        </asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [hr_emp_lang] WHERE [id] = @original_id "
                     InsertCommand="INSERT INTO [hr_emp_lang] ([emp_id], [lan_name], [lan_conversation], [lan_write], [lan_read], [lan_notes]) VALUES (@emp_id, @lan_name, @lan_conversation, @lan_write, @lan_read, @lan_notes)" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [hr_emp_lang] where emp_id=@emp ORDER BY [id] DESC" 
                    UpdateCommand="UPDATE [hr_emp_lang] SET [emp_id] = @emp_id, [lan_name] = @lan_name, [lan_conversation] = @lan_conversation, [lan_write] = @lan_write, [lan_read] = @lan_read, [lan_notes] = @lan_notes WHERE [id] = @original_id">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="emp_id" Type="Int32" />
                        <asp:Parameter Name="lan_name" Type="String" />
                        <asp:Parameter Name="lan_conversation" Type="String" />
                        <asp:Parameter Name="lan_write" Type="String" />
                        <asp:Parameter Name="lan_read" Type="String" />
                        <asp:Parameter Name="lan_notes" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="emp" SessionField="emp_id" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="emp_id" Type="Int32" />
                        <asp:Parameter Name="lan_name" Type="String" />
                        <asp:Parameter Name="lan_conversation" Type="String" />
                        <asp:Parameter Name="lan_write" Type="String" />
                        <asp:Parameter Name="lan_read" Type="String" />
                        <asp:Parameter Name="lan_notes" Type="String" />
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


