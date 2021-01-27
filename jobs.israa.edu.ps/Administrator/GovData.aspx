<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="GovData.aspx.cs" Inherits="Administrator_GovData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server"> 
    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption font-red-sunglo">
                <span class="caption-subject bold uppercase">المعلومات الشخصية الحكومية</span>
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

      <div class="portlet-body form" style="padding-bottom: 181px;">


                <div class="col-md-3" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-info">
                            <div class="input-icon">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" ValidationGroup="g1"></asp:TextBox>
                                <label for="form_control_1">رقم الهوية  </label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="هوية خطأ" ControlToValidate="TextBox1" ForeColor="#CC0000" ValidationExpression="\d\d\d\d\d\d\d\d\d" ValidationGroup="g1"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                    </div>

                <div class="col-md-3" style="direction: rtl;">

                    <asp:Button ID="Button1" CssClass="btn red" runat="server" Text="استعلام" OnClick="Button1_Click" ValidationGroup="g1" />
                    
                    </div>
                



             

            </div>
        <div class="portlet-body form" runat="server" id="data" style="padding-right: 30px">
         
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">

                                    <asp:TextBox ID="n1" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الاسم الاول </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n2" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الاسم الأب </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n3" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الاسم الجد </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n4" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الاسم العائلة </label>
                                    
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="BIRTH_DT"  CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server" ></asp:TextBox>
                                    <label for="form_control_1">تاريخ الميلاد</label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="ID" CssClass="form-control" runat="server" ReadOnly="true" MaxLength="9"></asp:TextBox>
                                    <label for="form_control_1">البطاقة الشخصية</label>

                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:DropDownList ID="gender" CssClass="form-control" runat="server">
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
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                  
                                    <asp:TextBox ID="stat" CssClass="form-control" runat="server"></asp:TextBox>

                                    <label for="form_control_1">الحالة الإجتماعية </label>

                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="pob" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">مكان الميلاد </label>
                                     
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
 <asp:TextBox ID="rel" CssClass="form-control" runat="server"></asp:TextBox>
                                  
                                    <label for="form_control_1">الديانة </label>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="MOTHER_ARB" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">اسم الام   </label>

                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="PREV_LNAME_ARB" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">اسم العائلة السابق    </label>

                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-3" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="ENG_NAME" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">الاسم باللغة الانجليزية      </label>

                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    





                </div>
           
        </div>
    </div>
        </form>
</asp:Content>

