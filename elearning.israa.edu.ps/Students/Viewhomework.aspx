﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Students/MasterPage.master" AutoEventWireup="true" CodeFile="Viewhomework.aspx.cs" ValidateRequest="false" Inherits="Instructor_ViewAnnouncements" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12 col-md-12">
        <div runat="server" id="er" style="background-color: #ffe9dc; border-color: #31708f; padding: 15px; margin-bottom: 20px; direction: rtl; border: 1px solid; border-radius: 4px;">
            <strong style="color: #7c3d18;">خطأ - Error</strong>
            <div runat="server" id="ertxt" style="color: #7c3d18;"></div>


        </div>
        <div class="well" runat="server" id="homework" style="text-align: center">

            <div style="background-color: red; width: 104px; height: 114px;" runat="server" id="close" class="col-sm-2 col-md-2">
                <div>
                    <h3 style="font-size: 18px; color: wheat"><span style="font-size: 18px; color: wheat" class="glyphicon glyphicon-stats	"></span>مغلق 

                    </h3>
                    <h3 style="font-size: 13px; color: wheat"><span style="font-size: 13px; color: wheat" class="glyphicon glyphicon-shopping-cart"></span> الدرجة  <asp:Label ID="mark1" runat="server" Text=""></asp:Label> </h3>
                    <span id="edit" runat="server" style="font-size: smaller; color: wheat;">لا يمكن التعديل</span>

                </div>
            </div>
            <div style="background-color: green; background-color: green; width: 104px; height: 114px;" runat="server" id="open" class="col-sm-3 col-md-3">
                <div>
                    <h3 style="font-size: 18px; color: wheat"><span style="font-size: 18px; color: wheat" class="glyphicon glyphicon-stats	"></span>متاح </h3>
                       <h3 style="font-size: 13px; color: wheat"><span style="font-size: 13px; color: wheat" class="glyphicon glyphicon-shopping-cart"></span> الدرجة  <asp:Label ID="mark" runat="server" Text=""></asp:Label> </h3>
                    <span id="edit1" runat="server" style="font-size: smaller; color: wheat;">لا يمكن التعديل</span>


                </div>
            </div>
            <%--<div style="background-color:green;background-color:darkgoldenrod;width: 75%;height: 26px;" 
         runat="server" id="Div1" class="col-sm-3 col-md-3">
<div >
    <span style="color:wheat">حالة التسليم:<strong>
    
    </strong>تاريخ التسليم:<strong>
    
    </strong>تاريخ التعديل:<strong>  </strong>  </span>
 

</div>
</div>--%>
            <div class="row">
                <div class="col-sm-3 col-md-3">
                    <div class="form-group" style="text-align: center">


                        <div class="well">
                            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server">حالة التسليم</asp:HyperLink>
                            </h4>
                            <p class="text-justify">
                                <asp:Label ID="stat" runat="server" Text="لم يتم التسليم"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-md-3">
                    <div class="form-group" style="text-align: center">

                        <div class="well">
                            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server">تاريخ التسليم</asp:HyperLink>
                            </h4>
                            <p class="text-justify">
                                <asp:Label ID="dt_deliv" runat="server" Text="لم يتم التسليم"></asp:Label>

                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-md-3">
                    <div class="form-group" style="text-align: center">

                        <div class="well">
                            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink5" runat="server">تاريخ التعديل</asp:HyperLink>
                            </h4>
                            <p class="text-justify">
                                <asp:Label ID="dt_edit" runat="server" Text="لم يتم التسليم"></asp:Label>

                            </p>
                        </div>


                    </div>
                </div>
            </div>
            <br />
            <hr />
            <h3><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;اخر موعد للتسليم :&nbsp;<asp:Label ID="Label1" runat="server" Font-Names="Tahoma"></asp:Label>
                &nbsp;الساعة :<asp:Label ID="Label2" runat="server" Font-Names="Tahoma"></asp:Label>
            </h3>
            <p class="text-center">


                <hr />

                <div class="form-group" style="text-align: center">

                    <div>
                        <asp:Label ID="det" runat="server" Text="Label"></asp:Label>
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server">معاينة الملف المرفق </asp:HyperLink>
                    </div>

                </div>
                <div class="form-group" style="text-align: center">

                    <div>


                        <CKEditor:CKEditorControl ID="Editor2" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                    </div>

                </div>
                <div class="form-group" style="text-align: center">
                    <label>رفع ملف  </label>
                    <div>

                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>

                </div>

                <asp:Button ID="Button1" runat="server" Text="تسليم الإجابة" CssClass="btn-danger" Width="462px" OnClick="Button1_Click" />

            </p>
        </div>
        <div runat="server" id="Done" style="text-align: -webkit-center;" class="well">

            <asp:Image ID="Image1" ImageUrl="~/assets/true.png" runat="server" Height="250px" Width="255px" />
            <h3>تم اضافة الحل بنجاح</h3>
            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Students/Default.aspx" runat="server">الصفحة الرئيسية</asp:HyperLink>
        </div>
        <div runat="server" id="notDone" style="text-align: -webkit-center;" class="well">

            <asp:Image ID="Image2" ImageUrl="https://cdn2.iconfinder.com/data/icons/web-and-apps-interface/32/Cancel-512.png" Height="250px" Width="255px"  runat="server" />
              <h3>عزيزي الطالب لقد قمت برفع ملف فارغ او نص فارغ يرجى إعادة المحاولة مرة أخرى ..</h3>
                 <h3>لم يتم حل الواجب يرجى اعادة المحاولة</h3>
            <asp:HyperLink ID="HyperLink6" NavigateUrl="~/Students/Default.aspx" runat="server">رجوع</asp:HyperLink>
        </div>

        <div class="well">
            <h5><span style="font-size: 18px;" class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp; الأشخاص الذين شاهدوا هذا المحتوى </h5>
            <p class="text-center">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [std_id], [name], [dt],  ROW_NUMBER() OVER (ORDER BY dt desc) row_num FROM [seen] WHERE (([typ] = @typ) AND ([re_id] = @re_id)) ORDER BY dt desc">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="how" Name="typ" Type="String" />
                        <asp:QueryStringParameter Name="re_id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table" EmptyDataText="لا يوجد مشاهدات">
                <Columns>

                    <asp:BoundField DataField="row_num" HeaderText="#" SortExpression="row_num"></asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="الاسم" SortExpression="name" />

                </Columns>
            </asp:GridView>
        </div>
        <hr />
        <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
            <ItemTemplate>
                <div class="col-sm-12 col-md-12">
                    <div class="well">
                        <h4><span style="font-size: 14px;" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server"><%# Eval("Name") %></asp:HyperLink>
                            <span style="font-family: Tahoma; color: green; font-size: small"><%# Eval("dt") %></span>
                            <asp:ImageButton ID="ImageButton1" CommandArgument='<%# Eval("id")%>' OnClick="ImageButton1_Click" runat="server" Width="25px" Height="25px" ImageUrl="~/assets/del.png" OnClientClick="return confirm('ها انت متأكد ؟؟؟')" />
                        </h4>
                        <p class="text-justify">
                            <%# Eval("comment") %>- 
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <hr>
        <div class="col-sm-12 col-md-12">
            <div class="well">
                <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span>اضافة تعليق   </h4>

                <CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                <asp:Button ID="Button2" CssClass="btn-primary" runat="server" Text="ارسال" OnClick="Button2_Click" />
            </div>

        </div>
        

    </div>
</asp:Content>
