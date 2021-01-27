<%@ Page Title="" Language="C#" MasterPageFile="~/Library/MasterPage.master" AutoEventWireup="true" CodeFile="ArticlesAddEdit.aspx.cs" Inherits="Library_ArticlesAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="glyphicon glyphicon-book"></i> قائمة المقالات لهذا العدد</div>
                <div class="tools">
                    <a class="collapse" href="javascript:;"></a>
                </div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                           <div class="form-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                            <label class="col-md-2 control-label">اسم الدورية </label>
                            <div class="col-md-4">
                                <asp:TextBox ID="name" runat="server" CssClass="form-control " Enabled="false" ></asp:TextBox>
                            </div>
                            <label class="col-md-2 control-label">رقم العدد </label>
                            <div class="col-md-4">
                                <asp:TextBox ID="number" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                            </div>

                        <div class="form-group">
                           
                            <div class="col-md-12">
                                <table class="table table-striped table-hover table-bordered" id="sample_editable_13">
                                    <thead>
                                        <tr>
                                           <%-- <th style="width: 5%!important; text-align: center">#</th>--%>
                                            <th style="width: 20%!important; text-align: center">عنوان المقال  </th>
                                            <th style="width: 20%!important; text-align: center">اسم المؤلف </th>
                                            <th style="width: 15%!important; text-align: center">رقم الصفحة</th>
                                               <th style="width: 15%!important; text-align: center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                        
                                           <td><asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td> <asp:TextBox ID="author" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td> <asp:TextBox ID="pageNo" runat="server" CssClass="form-control"></asp:TextBox></td>
                                           <td><asp:Button ID="Button1" runat="server" Text="حفظ" class="btn default btn-xs green" OnClick="Button1_Click"   /></td>
                                       </tr>
                                      
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                                            <ItemTemplate>
                                                <tr>
                                                   <asp:Label ID="Label2" runat="server" Visible="false" Text=' <%# Eval("Articles_ID") %>' ></asp:Label>
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text=' <%# Eval("Article_Title") %>' Enabled="false"></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text=' <%# Eval("Author") %>' Enabled="false"></asp:TextBox></td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text=' <%# Eval("PageNo") %>' Enabled="false"></asp:TextBox></td>
                                          <td>  <asp:Button ID="lbEdit" runat="server" Text="تحرير" class="btn default btn-xs black" OnClick="lbEdit_Click"  /></td>
                                                     </tr>
                                                     </ItemTemplate>

                                        </asp:Repeater>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:LibrarySystem %>' SelectCommand="PerArticlesGet" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Periodic_ID" DefaultValue="3" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>

                </div>

            </div>

        </div>

      </div>
</asp:Content>

