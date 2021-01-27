<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="~/Library/E_BookAddEdit.aspx.cs" Inherits="Library_E_BookAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        window.x = function () {
            alert("I was called from a child iframe");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i>اضافة كتاب الكتروني</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">الرقم العام</label>
                            <div class="col-md-4">
                                <asp:TextBox ID="ISBN" runat="server" CssClass="form-control " placeholder="الرقم العام"></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">التصنيف</label>
                            <div class="col-md-4">
                                <asp:DropDownList ID="CategoryID" runat="server" CssClass="form-control " DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT [ID], [CategoryName] FROM [Category] Where IsDelete=0"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">عنوان الكتاب</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="BookTitle" runat="server" CssClass="form-control " placeholder="عنوان الكتاب"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">اسم المؤلف</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="AuthorName" runat="server" CssClass="form-control " placeholder="اسم المؤلف"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">لغة الكتاب</label>
                            <div class="col-md-10">

                                <asp:DropDownList ID="LanguageID" runat="server" CssClass="form-control" DataTextField="SubConstantName" DataValueField="SubConstantID" DataSourceID="SqlDataSource1"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="SELECT [SubConstantID], [SubConstantName] FROM [SubConstantTB] WHERE ([ConstantID] = @ConstantID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="5" Name="ConstantID" Type="Int32"></asp:Parameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">رفع الملف</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="hfurl" runat="server" CssClass="form-control " placeholder="الكتاب"></asp:TextBox>
                                <br />
                                <iframe id="uploadFrame" frameborder="0" height="200" width="480" scrolling="no" src="http://upload.israadc.edu.ps/"></iframe>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">صورة الغلاف</label>
                            <div class="col-md-10">
                                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl="~/images/logo.png" />
                                <asp:Label ID="Label5" runat="server" Text="Label" Visible="false"></asp:Label>
                            </div>
                        </div>

                    </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-2 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn green" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="تفريغ الحقول" CssClass="btn default" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

