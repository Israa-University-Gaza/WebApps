<%@ Page Title="" Language="C#" MasterPageFile="~/Instructor/MasterPage.master" AutoEventWireup="true" EnableEventValidation="false" ValidateRequest="false" CodeFile="Viewhomework.aspx.cs" Inherits="Instructor_ViewAnnouncements" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12 col-md-12">
        <div class="well">

            <div style="background-color: red; width: 104px; height: 117px;" runat="server" id="close" class="col-sm-2 col-md-2">
                <div>
                    <h3 style="font-size: 18px; color: wheat"><span style="font-size: 18px; color: wheat" class="glyphicon glyphicon-stats	"></span>مغلق  </h3>
                     <h3 style="font-size: 13px; color: wheat"><span style="font-size: 13px; color: wheat" class="glyphicon glyphicon-shopping-cart"></span> الدرجة  <asp:Label ID="mark1" runat="server" Text=""></asp:Label> </h3>
                
                </div>
            </div>
            <div style="background-color: green; background-color: green; width: 104px; height: 114px;" runat="server" id="open" class="col-sm-3 col-md-3">
                <div>
                    <h3 style="font-size: 18px; color: wheat"><span style="font-size: 18px; color: wheat" class="glyphicon glyphicon-stats	"></span>متاح </h3>
                       <h3 style="font-size: 13px; color: wheat"><span style="font-size: 13px; color: wheat" class="glyphicon glyphicon-shopping-cart"></span> الدرجة  <asp:Label ID="mark" runat="server" Text=""></asp:Label> </h3>
                  
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
                <hr />
                <div style="align-content: center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="row_num" HeaderText="#" />
                            <asp:BoundField DataField="std_id" HeaderText="رقم الطالب" SortExpression="std_id" />
                            <asp:BoundField DataField="std_name" HeaderText="اسم الطالب" SortExpression="std_name" />
                            <asp:BoundField DataField="EnterDate" HeaderText="تاريخ التقديم" SortExpression="EnterDate" />
                            <asp:BoundField DataField="EditDate" HeaderText="تاريخ التعديل" SortExpression="EditDate" />
                            <asp:BoundField DataField="grade" HeaderText="الدرجة" SortExpression="grade" />
                            <asp:TemplateField HeaderText="معاينة">
                                <ItemTemplate>
                                    <%-- <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("id") %>' CssClass="btn-info"  OnClick="Button1_Click" Text="معاينة" />
                    <li style="" class="news-item"><%# Eval("title") %>&nbsp;&nbsp;<span style="color:red"> <%# Eval("dt") %></span>  </li>--%>
                                    <a class="btn-info" href='javascript:openDetailsWindow(<%#Eval("id")%>,1)'>معاينة</a>
                                    <%--  <a class="btn-success" href='Filess/<%# Eval("file_url")%>'> معاينة الملف</a>--%>
                                    <asp:HyperLink ID="HyperLink2" CssClass="btn-success" NavigateUrl='<%# "../Filess//"+Eval("file_dir") %>' runat="server">معاينة الملف</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
                <div style="text-align: center">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text=" تحميل التقرير Excel" OnClick="Button1_Click1" />
                    <br />
                    <br />
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT ROW_NUMBER() OVER (ORDER BY id desc) row_num,* FROM [e_HomeWork_answer_answer] WHERE ([h_id] = @h_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="h_id" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </p>
        </div>
    </div>
    <div class="well">
        <h3><span style="font-size: 18px;" class="glyphicon glyphicon-asterisk"></span>&nbsp;&nbsp;المشاهدات </h3>
        <p class="text-center">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [std_id], [name], [dt],  ROW_NUMBER() OVER (ORDER BY dt desc) row_num FROM [seen] WHERE (([typ] = @typ) AND ([re_id] = @re_id)) ORDER BY dt desc">
                <SelectParameters>
                    <asp:Parameter DefaultValue="how" Name="typ" Type="String" />
                    <asp:QueryStringParameter Name="re_id" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table" EmptyDataText="لا يوجد مشاهدات">
            <Columns>
                <asp:BoundField DataField="row_num" HeaderText="#" SortExpression="row_num"></asp:BoundField>
                <asp:BoundField DataField="std_id" HeaderText="رقم الطالب" SortExpression="std_id" />
                <asp:BoundField DataField="name" HeaderText="الاسم" SortExpression="name" />
                <asp:BoundField DataField="dt" HeaderText="اخر زيارة" SortExpression="dt" />

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
            <h4><span style="font-size: 18px;" class="glyphicon glyphicon-equalizer"></span>اضافة رد   </h4>

            <CKEditor:CKEditorControl ID="Editor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
            <asp:Button ID="Button2" CssClass="btn-primary" runat="server" Text="رد" OnClick="Button2_Click" />
        </div>

    </div>
</asp:Content>

