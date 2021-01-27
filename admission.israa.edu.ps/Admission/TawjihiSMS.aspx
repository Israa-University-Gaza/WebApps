<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="TawjihiSMS.aspx.cs" Inherits="Admission_TawjihiSMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>




        $('document').ready(function () {

            $('.txtMessageExcle').keyup(function () {
                var max = 210;
                var len = $(this).val().length;
                if (len >= max) {
                    $('#charNum').text('تجاوزت الحد الأقصى لعدد الحروف');
                } else {
                    var char =  len;
                    $('#charNum').text( ' عدد الأحرف  :'+ char  );
                }
            });
        });




    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb  isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="Default.aspx" class="font-ha">القبول والتسجيل</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="SendSMS.aspx" class="font-ha">إرسال رسائل SMS اكسل
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

     <div class="row">
        <div class="col-md-12">
            <div class="portlet box blue">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>ارسال رسائل جوال اكسل  </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="form-horizontal">
                        <div class="form-body">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>



                            <div class="form-group">
                                <label class="col-md-3 control-label"> الملف :</label>
                                <div class="col-md-5">
<%--                                    <asp:DropDownList ID="ddlSection" runat="server" class="select2_category form-control" DataSourceID="SqlDataSource6" DataTextField="SectionNum" DataValueField="ID"></asp:DropDownList>--%>



                                    <div class="input-group">

                                        <asp:FileUpload ID="FileUpload1" runat="server"  />


                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">نص الرسالة :</label>
                                <div class="col-md-5">
                                    <asp:TextBox  ID="txtMessage" runat="server" class="form-control txtMessageExcle" placeholder="الرجاء ادخال نص الرسالة هنا" TextMode="MultiLine" Rows="6"></asp:TextBox>

                                    <div id="charNum"></div>

                                    </div>
                            </div>
                        </div>
                        <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btnSend" runat="server" Text="إرسال الرسالة" class="btn green" OnClick="btnSend_OnClick" />
<%--                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default" OnClick="btnCancel_Click" />--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

