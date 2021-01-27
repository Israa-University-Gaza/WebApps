<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CV.aspx.cs" Inherits="Default11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link href="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <form runat="server">

    
    <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                      <span class="caption-subject bold uppercase"> PDF</span>
                    <span class="caption-subject bold uppercase">السيرة الذاتية الملفات المسموح تحميلها   </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">



                <div runat="server" id="not_found">
                    
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
                        <h2 id="msg" visible="false" runat="server" style="color:red" >امتداد خاطئ</h2>
                        <asp:Button ID="Button1" runat="server"  OnClick="Button1_Click"  CssClass="btn"   Text="اضافة" />
                        <%--<asp:ImageButton ID="ImageButton1" ImageUrl="~/images/Circle-icons-upload.svg.png" runat="server" Height="54px" Width="54px" OnClick="ImageButton1_Click" />--%>
                   <h3 runat="server" id="no" style="direction:rtl">لا يوجد سيرة ذاتية مرفقة </h3>
                         </div>
                    
                    <iframe runat="server" id="cv_up" width="100%" height="650px"></iframe>
                </div>



                <hr />

                <div style="direction: rtl">

                    

                    

                </div>

            </div>
        </div>
        </form>
      </span>
</asp:Content>

