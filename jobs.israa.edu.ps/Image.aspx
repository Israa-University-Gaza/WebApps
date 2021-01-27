<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Image.aspx.cs" Inherits="Image" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <link href="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <form runat="server">


        <div class="portlet light ">
            <div class="portlet-title">
                <div class="caption font-red-sunglo">
                     
                    <span class="caption-subject bold uppercase">رفع الصورة الشخصية   </span>
                 
                </div>

            </div>
            <div class="portlet-body form" style="padding-bottom: 181px;">

                <div class="row " style="direction: rtl;">
                                               
                                                <div class="col-md-6">
                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                        <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"> </div>
                                                        <div>
                                                            <span class="btn red btn-outline btn-file">
                                                                <span class="fileinput-new"> اختار صورة </span>
                                                               
                                                            
        <asp:FileUpload ID="FileUpload1" runat="server" />
                                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> حذف </a>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                    <div  class="col-md-6">
                        <asp:Image ID="Image1"  Width="300px"  runat="server" />
                    </div>


                  
                                            </div>

                <div class="row" style="direction:rtl">
                     <h2 id="msg" visible="false" runat="server" style="color:red" >امتداد خاطئ</h2>
                      <asp:Button ID="Button1" CssClass="btn" runat="server" Text="رفع" OnClick="Button1_Click" />
                </div>
            </div>
        </div>


    
        </form>
     <script src="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        </span>
</asp:Content>

