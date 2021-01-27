<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonalInformation.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption font-red-sunglo">
                <span class="caption-subject bold uppercase">المعلومات الشخصية</span>
            </div>
            <div class="actions">
                <a class="btn btn-circle btn-icon-only blue" href="javascript:;">
                    <i class="icon-cloud-upload"></i>
                </a>
                <a class="btn btn-circle btn-icon-only green" href="javascript:;">
                    <i class="icon-wrench"></i>
                </a>
                <a class="btn btn-circle btn-icon-only red" href="javascript:;">
                    <i class="icon-trash"></i>
                </a>
            </div>
        </div>
        <div class="portlet-body form">
            <form role="form" runat="server">
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">

                                    <asp:TextBox ID="n1" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                    <label for="form_control_1">الاسم الاول </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="n1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n2" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                    <label for="form_control_1">الاسم الأب </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="n2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n3" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                    <label for="form_control_1">الاسم الجد </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="n3" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n4" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                    <label for="form_control_1">الاسم العائلة </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="n4" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="dop"  CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server" Enabled="False" ></asp:TextBox>
                                    <label for="form_control_1">تاريخ الميلاد</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dop" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="ID" CssClass="form-control" runat="server" ReadOnly="true" MaxLength="9" Enabled="False"></asp:TextBox>
                                    <label for="form_control_1">البطاقة الشخصية</label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="p_ID" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">مكان وتاريخ الاصدار </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="p_id" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:DropDownList ID="gender" CssClass="form-control" runat="server" Enabled="False">
                                        <asp:ListItem>ذكر</asp:ListItem>
                                        <asp:ListItem>أنثى</asp:ListItem>
                                    
                                    </asp:DropDownList>
                                    <label for="form_control_1">الجنس </label>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                        <div class="input-icon right">
                            <asp:TextBox ID="addres" CssClass="form-control" runat="server"></asp:TextBox>
                            <label for="form_control_1">العنوان كاملا</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="addres" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                        <div class="input-icon right">
                            <asp:TextBox ID="ENG_NAME" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                            <label for="form_control_1">الاسم باللغة الانجليزية</label>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:DropDownList ID="stat" CssClass="form-control" runat="server" Enabled="False">
                                        <asp:ListItem>اعزب</asp:ListItem>
                                        <asp:ListItem>متزوج</asp:ListItem>
                                        <asp:ListItem>مطلق</asp:ListItem>
                                        <asp:ListItem>ارمل</asp:ListItem>
                                    </asp:DropDownList>
                                   <%-- <asp:TextBox ID="stat" CssClass="form-control" runat="server"></asp:TextBox>--%>

                                    <label for="form_control_1">الحالة الإجتماعية </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="tel" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                    <label for="form_control_1">الهاتف الجوال </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tel" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="محمول خطأ " ControlToValidate="tel" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationExpression="05\d\d\d\d\d\d\d\d"></asp:RegularExpressionValidator>
                               
                                      </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">البريد الإلكتروني </label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="بريد خطأ" ControlToValidate="email" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="nat" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الجنسية الاصلية </label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="nat" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="nat1" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الجنسية الحالية </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="pob" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                    <label for="form_control_1">مكان الميلاد </label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="pob" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">

                                  <asp:DropDownList ID="rel" CssClass="form-control" runat="server" Enabled="False">
                                        <asp:ListItem>مسلم</asp:ListItem>
                                        <asp:ListItem>مسيحي</asp:ListItem>
                                    
                                    </asp:DropDownList>
                                    <label for="form_control_1">الديانة </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n_has" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">اسم الزوج /الزوجة </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="w_has" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">عمل الزوج/الزوجة </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                                <div class="input-icon right">
                                    <asp:TextBox ID="d_mar" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                                    <label for="form_control_1">تاريخ الزواج </label>

                                </div>
                            </div>
                            
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:DropDownList ID="h_stat" CssClass="form-control" runat="server">
                                     
                                         <asp:ListItem Value="-1">اختر</asp:ListItem>
                                         <asp:ListItem>سليم</asp:ListItem>
                                        <asp:ListItem>ذوي الاحتياجات الخاصة</asp:ListItem>
                                    
                                    </asp:DropDownList>
                                    <label for="form_control_1">الحالة الصحية </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="h_stat" runat="server" ErrorMessage="ادخل" InitialValue="-1" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="age" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                    <label for="form_control_1"> العمر </label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="age" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" ControlToValidate="age" Font-Size="Small" ForeColor="Red" MaximumValue="70" MinimumValue="16" SetFocusOnError="True">عمر خطأ</asp:RangeValidator>
                                      </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">

                                    <asp:TextBox ID="w_c_type" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">نوع العمل الحالي </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="w_c_place" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">مكانه </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                                <div class="input-icon right">
                                    <asp:TextBox ID="w_c_date" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                                    <label for="form_control_1">تاريخ الالتحاق بالعمل الحالي  </label>

                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="row">



                        <div class="col-md-6" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <%--  <asp:TextBox ID="TextBox4"  CssClass="form-control" runat="server"></asp:TextBox>--%>
                                    <asp:RadioButtonList ID="w_leav" CssClass="form-control" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">نعم</asp:ListItem>
                                        <asp:ListItem>لا</asp:ListItem>
                                    </asp:RadioButtonList>

                                    <%--<div class="md-radio-list">
                                                        <div class="md-radio">
                                                            <input type="radio" id="radio50" name="radio211" class="md-radiobtn">
                                                            <label for="radio50">
                                                                <span class="inc"></span>
                                                                <span class="check"></span>
                                                                <span class="box"></span> Option 1 </label>
                                                        </div>
                                                        <div class="md-radio has-error">
                                                            <input type="radio" id="radio51" name="radio211" class="md-radiobtn" checked="">
                                                            <label for="radio51">
                                                                <span class="inc"></span>
                                                                <span class="check"></span>
                                                                <span class="box"></span> Option 2 </label>
                                                        </div>
                                                        <div class="md-radio has-warning">
                                                            <input type="radio" id="radio52" name="radio231" class="md-radiobtn">
                                                            <label for="radio52">
                                                                <span class="inc"></span>
                                                                <span class="check"></span>
                                                                <span class="box"></span> Option 3 </label>
                                                        </div>
                                                    </div>--%>

                                    <label for="form_control_1">هل يمكن ترك العمل الحالي في اي وقت والالتحاق بالجامعة </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                                <div class="input-icon right">
                                    <asp:TextBox ID="d_leave" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                                    <label for="form_control_1">اذا كانت الاجابة نعم فما التاريخ المتوقع لترك العمل الحالي </label>

                                </div>
                            </div>

                        </div>
                    </div>





                </div>
                <div class="form-actions noborder">
                
                    <asp:Button ID="Button1" CssClass="btn blue" runat="server" Text="حفظ" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" CssClass="btn blue" runat="server" Text="تراجع" />
                </div>
            </form>
        </div>
    </div>
</asp:Content>

