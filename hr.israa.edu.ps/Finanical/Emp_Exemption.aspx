<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Emp_Exemption.aspx.cs" Inherits="Finanical_Emp_Exemption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Emp_Exemption.aspx" class="font-ha"> اعفاءات الموظف</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
       <% if (Permissions.Contains("ExemptionView"))
           { %>
    <div class="row">
        <div class="col-md-12">
    <div class="portlet box blue">
            <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>  اعفاءات الموظف   </div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                    </div>
                </div>

          <div class="portlet-body form">
                    <div class="form-horizontal">
        <div class="form-body">
                              <div class="form-group">
                               <label class="col-md-3 control-label" style="text-align: right">اسم الموظف</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="DropDownList8" class="form-control" placeholder="ادخل اسم الموظف" runat="server" DataSourceID="SqlDataSource20" DataTextField="DisplayName" DataValueField="Emp_ID" CssClass="select2_category form-control" data-placeholder="Choose a Category" TabIndex="1"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource20" ConnectionString='<%$ ConnectionStrings:HumanResources %>' SelectCommand="SELECT Emp_ID,DisplayName FROM [Employee_TB] union select 0,N'  '"></asp:SqlDataSource>

                                </div>


                               
                            </div> 
                           

                                        <div class="clearfix"></div>
                                  <div class="form-group">
                                <label class="col-md-3 control-label">الشهر </label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" class="form-control"  CssClass="select2_category form-control" placeholder="اختر الشهر "  >
                                       <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="1">يناير</asp:ListItem>
                                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                                        <asp:ListItem Value="3">مارس</asp:ListItem>
                                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                                         <asp:ListItem Value="5">مايو</asp:ListItem>
                                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                                        <asp:ListItem Value="8">أغسطس</asp:ListItem>
                                        <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                        <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                              
                                </div>
                             
                                      <asp:Label ID="Label11" runat="server" Text="1"></asp:Label>
                               
                                <label class="col-md-3 control-label">السنة </label>
                                <div class="col-md-2">
                                  <%--  <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>--%>
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>

               <div class="form-actions fluid">
                            <div class="col-md-offset-3 col-md-9">
                         <asp:Button ID="Button3" runat="server" Text="عرض الاعفاءات" class="btn green" OnClick="Button2_Click"/>
                                <asp:Button ID="btnCancel" runat="server" Text="إلغاء" class="btn default"  />
                            </div>
                        </div>
            
                                </div>
                        </div></div>
         </div>
            </div>
         </div>

        <div class="col-md-12">
    <div class="portlet box red">
        <asp:HiddenField ID="HiddenField1" runat="server" />
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-reorder"></i>اعفاءات  الموظف     </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
 
                            <div class="portlet-body">
                                
                           
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 20%">اسم الموظف </th>
                               
                                    <th style="width: 10%; text-align: center">النوع </th>
                                    <th style="width: 15%; text-align: center">شهر  الاحتساب</th>
                                     <th style="width: 10%; text-align: center">  القيمة </th>
                                    <th style="width: 15%; text-align: center"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" >
                                    <ItemTemplate>
                                        <asp:Label ID="ExemptionID" runat="server" Text='<%# Eval("Exemption_ID") %>' Visible="false"></asp:Label>
                                        <tr>
                                            <td><span><%# Eval("Ar_F_Name") %> </span></td>
                                        
                                            <td style="text-align: center">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Exemption_Type") %>'></asp:Label></td>
                                            <td style="text-align: center"><asp:Label ID="Motivation_S_Date" runat="server" Text='<%# Eval("Exemption_Month") %>'></asp:Label></td>
                                             <td style="text-align: center"><asp:Label ID="Motivation_Value" runat="server" Text='<%# Eval("Exemption_Value") %>'></asp:Label></td>
                                           
                                            <td style="text-align: center">
                                            </td>
                                        <%--   <td style="text-align: center">
                                                <asp:LinkButton ID="lbEdit" runat="server" class="btn default btn-xs black" ><i class="fa fa-edit"></i> تحرير</asp:LinkButton>
                                                   <% if (Permissions.Contains("ExemptionAdopt"))
           { %>
                                                <asp:LinkButton ID="lbSubmit" runat="server" class="btn default btn-xs green" OnClientClick="return confirm('هل انت متاكد من الاعتماد؟')"><i class="fa fa-trash-o"></i> اعتماد</a></asp:LinkButton>
                                    <%} %>      </td>--%>

                    
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                        
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                    SelectCommand="SELECT [Exemption_TB].*,[Exemption_Type_TB].Exemption_Type,[Employee_TB].* FROM [Exemption_TB]
                                     inner join [Exemption_Type_TB] on [Exemption_TB].Exemption_Type_ID=[Exemption_Type_TB].Exemption_Type_ID
                                    inner join [Employee_TB] on [Exemption_TB].Emp_ID=[Employee_TB].Emp_ID
                                     where Exemption_TB.Emp_ID=@Emp_ID and Exemption_TB.Exemption_Month=@Month and Exemption_TB.Exemption_Year=@year
                                    
                                     ">

                                      <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList8" PropertyName="SelectedValue" Type="Int32" Name="Emp_ID"  ></asp:ControlParameter>
                                       <asp:ControlParameter ControlID="Label11" PropertyName="Text" Name="UserID" Type="Int32" ></asp:ControlParameter>

                                        <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" DefaultValue="" Name="Year" Type="Int32"  ></asp:ControlParameter>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Month" Type="Int32" ></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </tbody>
                        </table>
                    </div>
                </div>


          </div>
</div>
    <%} %>
</asp:Content>

