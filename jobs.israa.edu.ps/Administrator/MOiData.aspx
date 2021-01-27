<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/MasterPage.master" AutoEventWireup="true" CodeFile="MOiData.aspx.cs" Inherits="Administrator_GovData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server"> 
    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption font-red-sunglo">
                <span class="caption-subject bold uppercase">معلومات وزارة الشؤون الاجتماعية </span>
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
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">

                                    <asp:TextBox ID="n1" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">اسم الخدمة المقدمة </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n2" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">نوع المنظمة المقدمة للخدمة </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n3" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">نوع الخدمة</label>
                                    
                                </div>
                            </div>
                        </div>
                        

                    </div>
                    <div class="row">
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">

                                    <asp:TextBox ID="n4" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">العملة </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n5" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">المبلغ </label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success">
                                <div class="input-icon">
                                    <asp:TextBox ID="n6" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form_control_1">تاريخ التسليم</label>
                                    
                                </div>
                            </div>
                        </div>
                        

                    </div>




                </div>
           
        </div>
    </div>
        </form>
</asp:Content>

