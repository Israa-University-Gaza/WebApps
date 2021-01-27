<%@ Page Title="" Language="C#" MasterPageFile="~/Finanical/MasterPage.master" AutoEventWireup="true" CodeFile="Salary_Form.aspx.cs" Inherits="Finanical_Salary_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .input-small1 {
            width: 80px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="../APP_HRM/Emp_Info_AddEdit - Copy.aspx" class="font-ha">الصفحة الرئيسية</a>
            <i class="fa fa-angle-left"></i>
        </li>
        <li><a href="Salary_Form.aspx" class="font-ha">استمارة راتب</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <% if (Permissions.Contains("SalaryFormView"))
       { %>
    <div class="row">
        <div id="adpotsalary" runat="server" visible="false">
           <div class="col-md-12"> 
<div class="portlet box green"> 
     <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i> اعتماد استمارة الراتب</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                        <a href="javascript:;" class="collapse"></a>

                    </div>
                </div>
      <div class="portlet-body">
      <div class="col-md-7" style="padding: 0!important">
                            <div class="col-md-12" style="padding: 0!important">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">الأساسي</th>
                                            <th style="text-align: center">اضافات</th>
                                            <th style="text-align: center">خصميات</th>
                                            <th style="text-align: center">فروقات</th>
                                            <th style="text-align: center">ضريبة</th>
                                            <th style="text-align: center">في البنك</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater4" DataSourceID="SqlDataSource4" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <asp:Label ID="Salary_ID" runat="server" Visible="false" Text='<%# Eval("Salary_ID") %>'></asp:Label>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Main1" runat="server" Text='<%# Eval("Main_Salary") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Plus1" runat="server" Text='<%# Eval("Plus_Total") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Discount1" runat="server" Text='<%# Eval("Discount_Total") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Diff1" runat="server" Text='<%# Eval("Differences_Total") %>'></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="Tax" runat="server" Text='<%# Eval("TaxValue") %>' ></asp:Label></td>
                                                    <td style="text-align: center">
                                                        <asp:Label ID="InBank1" runat="server" Text='<%# Eval("InBank") %>'></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT * FROM [Salary_Transaction_TB] WHERE (([Emp_ID] = @Emp_ID) AND ([Salary_Month_ID] = @Salary_Month_ID) AND ([Year] = @Year))">
                                            <SelectParameters>
                                                  <asp:ControlParameter ControlID="Label5" Name="Emp_ID" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Salary_Month_ID" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="Year" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
           <div class="form-actions fluid">
                    <div class="col-md-offset-5 col-md-7">
                        <% if (Permissions.Contains("SalaryFormAdopt"))
                           { %>
                        <asp:Button ID="Button3" runat="server" Text="اعتماد"  class="btn green" OnClick="Button1_Click" />
                        <%} %>
                      
                    
                    </div>
                </div>
    </div></div>
        </div></div>
        <div class="col-md-12">
            <div class="portlet box red">
                <div class="portlet-title">
                    <div class="caption"><i class="fa fa-cogs"></i>استمارة الراتب</div>
                    <div class="tools">
                        <a class="remove" href="javascript:;"></a>
                        <a href="javascript:;" class="collapse"></a>

                    </div>
                </div>
                <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:Label ID="Label5" runat="server" Text="" Visible="false"></asp:Label>
                 <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                 <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>

                <div class="portlet-body">
                    <div>
                        <div class="table-responsive col-md-5" style="padding-right: 0!important">
                            <div class="col-md-12" style="padding: 0!important">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <asp:Repeater ID="Repeater5" DataSourceID="SqlDataSource6" runat="server">
                                            <ItemTemplate>
                                        <tr>
                                            <th>قسيمة شهر</th>
                                            <th>
                                                <asp:Label ID="month" runat="server" Text='<%#Eval("month1") %>'></asp:Label></th>
                                              <th> سنة</th>
                                            <th>
                                               <asp:Label ID="year" runat="server" Text='<%#Eval("Year") %>'></asp:Label> </th>
                                        </tr>
                                                </ItemTemplate>
                                                </asp:Repeater>
                                           <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="Salary_Transaction_TB_Get" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                           <asp:ControlParameter ControlID="Label4" Name="Salary_ID" Type="Int16" PropertyName="Text" />
                                                 </SelectParameters>
                                        </asp:SqlDataSource>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="width: 25%;">رقم الهوية</td>
                                                    <td style="width: 25%;">
                                                        <asp:Label ID="SSN" runat="server" Text='<%# Eval("Emp_SSN") %>'  Font-Size="X-Small" ></asp:Label>
                                                    </td>
                                                    <td style="width: 25%;">نوع العقد</td>
                                                    <td style="width: 25%;">
                                                        <asp:Label ID="Contract" runat="server" Text='<%# Eval("ContractType") %>'  Font-Size="X-Small"  ></asp:Label></td>

                                                </tr>
                                                <tr>
                                                    <td>الرقم الوظيفي</td>
                                                    <td>
                                                        <asp:Label ID="EmployeeNO" runat="server" Text='<%# Eval("EmployeeNO") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                    <td>الفئة</td>
                                                    <td>
                                                        <asp:Label ID="Degree" runat="server" Text='<%# Eval("cat") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>الاسم</td>
                                                    <td>
                                                        <asp:Label ID="Emp_Name" runat="server" Text='<%# Eval("DisplayName")%>' Font-Size="X-Small"></asp:Label>
                                                    <td>درجة الاقدمية</td>
                                                    <td>
                                                        <asp:Label ID="OldDegree" runat="server" Text="" Font-Size="X-Small"  ></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>القسم</td>
                                                    <td>
                                                        <asp:Label ID="Department" runat="server" Text='<%# Eval("DepName") %>'   Font-Size="X-Small" ></asp:Label></td>
                                                    <td>الحالة الاجتماعية</td>
                                                    <td>
                                                        <asp:Label ID="Status" runat="server" Text='<%# Eval("Emp_Marital_Status") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>الوظيفة</td>
                                                    <td>
                                                        <asp:Label ID="JobTitle" runat="server" Text='<%# Eval("JobName") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                    <% if (((Label)Repeater1.Items[0].FindControl("Status")).Text != "1044")
                                                     { %>
                                                     <td>عدد الاولاد</td>
                                                    <td>
                                                        <asp:Label ID="Sons" runat="server" Text='<%# Eval("Emp_Children_No") %>'  Font-Size="X-Small" ></asp:Label></td>
                                              <%} %>  </tr>
                                                <tr>
                                                    <td>الشهادة</td>
                                                    <td>
                                                        <asp:Label ID="Qualification" runat="server" Text='<%# Eval("Qualifaction") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                    <td>معالين آخرين</td>
                                                    <td>
                                                        <asp:Label ID="DepNo" runat="server" Text='<%# Eval("Emp_Dependent_No") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>البنك</td>
                                                    <td>
                                                        <asp:Label ID="Bank" runat="server" Text='<%# Eval("bank") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Emp_Gender") %>' Visible="false"></asp:Label>
                                                  <% if (((Label)Repeater1.Items[0].FindControl("Label3")).Text != "False")
                                                     { %>   <td>عدد الزوجات</td>
                                                    <td>
                                                        <asp:Label ID="WifesNO" runat="server" Text='<%# Eval("Emp_Wifes_No") %>'  Font-Size="X-Small" ></asp:Label></td>

                                                </tr>
                                                <% } %>
                                                <tr>
                                                    <td>الفرع</td>
                                                    <td>
                                                        <asp:Label ID="BankDep" runat="server" Text='<%# Eval("Bank_Branch") %>'  Font-Size="X-Small" ></asp:Label></td>
                                                    <td>اعفاءات</td>
                                                    <td>
                                                        <asp:Label ID="Exemptions" runat="server" Text="" Font-Size="X-Small"  ></asp:Label></td>

                                                </tr>
                                                <tr>

                                                    <td>رقم الحساب</td>
                                                    <td>
                                                        <asp:Label ID="BankAccount" runat="server" Text='<%# Eval("Emp_Bank_Account_NO") %>'  Font-Size="Small" ></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="EmployeeDetailsGet" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                  <asp:ControlParameter ControlID="Label5" Name="Emp_ID" Type="Int32" PropertyName="Text" />
                                      
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                        <div class="col-md-7" style="padding-right: 0!important">
                            <div class="col-md-12" style="padding: 0!important">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th colspan="5" style="text-align: center">الإضافـــــات</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>الرمز</td>
                                            <td>الإضافات</td>
                                            <td>الكمية</td>
                                            <td>الوصف</td>
                                            <td>القيمة</td>
                                            <td></td>
                                            <td></td>

                                        </tr>
                                        <asp:Repeater ID="Repeater2" DataSourceID="SqlDataSource2" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                  
                                                    <td>  <asp:Label ID="PlusID" runat="server" Text='<%# Eval("Plus_ID") %>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="P_Symbol" runat="server" Text='<%# Eval("Plus_Code") %>' Font-Size="X-Small" CssClass="form-control input-small1 "></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="P_Plus" runat="server" Text='<%# Eval("Type") %>' Font-Size="X-Small" CssClass="form-control input-small1 "></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="P_Percentage" runat="server" Text='<%# Eval("Plus_Rate") %>' Font-Size="X-Small" CssClass="form-control input-small1 "></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="P_Desc" runat="server" Text='<%# Eval("Plus_Desc") %>' Font-Size="X-Small" CssClass="form-control input-small1 "></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="P_Value" runat="server" Text='<%# Eval("Plus_Type_Value") %>' Font-Size="X-Small" CssClass="form-control input-small1" ></asp:TextBox></td>
                                                    <td>
                                                        <asp:LinkButton ID="PlusAdopt" runat="server" class="btn default btn-xs green" OnClick="PlusAdopt_Click" Visible="false"><i class="fa fa-edit">اعتماد</i> </asp:LinkButton></td>


                                                    <td>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" class="btn default btn-xs purple" OnClick="LinkButton2_Click" OnClientClick="return confirm('هل انت متاكد من الحذف؟')"><i class="fa fa-trash-o"></i> حذف </a></asp:LinkButton>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT * FROM [Plus_TB]
                                            
                                             WHERE (([Emp_ID] = @Emp_ID) AND ([Plus_Month] = @Plus_Month) AND ([Plus_Year] = @Plus_Year))  AND IsDelete=0">
                                            <SelectParameters>
                                                  <asp:ControlParameter ControlID="Label5" Name="Emp_ID" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Plus_Month" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="Plus_Year" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <tr>
                                            <td colspan="4">المجموع</td>

                                            <td>
                                                <asp:TextBox ID="P_Total"  runat="server" Text="TextBox" Font-Size="X-Small" CssClass="form-control input-small1 "></asp:TextBox></td>
                       
                                             </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12" style="padding: 0!important;">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th colspan="5" style="text-align: center">الخصميـــــات</th>

                                        </tr>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>الرمز</td>
                                            <td>الخصميات</td>
                                            <td>الكمية</td>
                                            <td>الوصف</td>
                                            <td>القيمة</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <asp:Repeater ID="Repeater3" DataSourceID="SqlDataSource3" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                     
                                                    <td> <asp:Label ID="DiscountID" runat="server" Text='<%# Eval("Discount_ID") %>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="D_Symbol" runat="server" Text='<%# Eval("Discount_Code") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="D_Discount" runat="server" Text='<%# Eval("Type") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="D_Percentage" runat="server" Text='<%# Eval("Discount_Rate") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="D_Desc" runat="server" Text='<%# Eval("Discount_Desc") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="D_Value" runat="server" Text='<%# Eval("Discount_Value") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:LinkButton ID="DiscountAdopt" runat="server" class="btn default btn-xs green" OnClick="DiscountAdopt_Click" Visible="false"><i class="fa fa-edit"></i> اعتماد</asp:LinkButton></td>


                                                    <td>
                                                        <asp:LinkButton ID="DiscountDelete" runat="server" class="btn default btn-xs purple" OnClick="DiscountDelete_Click" OnClientClick="return confirm('هل انت متاكد من الحذف؟')"><i class="fa fa-trash-o"></i> حذف </a></asp:LinkButton>
                                                    </td>



                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT * FROM [Discount_TB]
                                            
                                             WHERE (([Emp_ID] = @Emp_ID) AND ([Discount_Month] = @Discount_Month) AND ([Discount_Year] = @Discount_Year)) AND IsDelete=0 ">
                                            <SelectParameters>
                                                  <asp:ControlParameter ControlID="Label5" Name="Emp_ID" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Discount_Month" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="Discount_Year" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <tr>

                                            <td colspan="4">المجموع</td>

                                            <td>
                                                <asp:TextBox ID="DisTotal" runat="server" Text="TextBox" Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12" style="padding: 0!important;">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th colspan="5" style="text-align: center">الفروقات</th>

                                        </tr>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>الرمز</td>
                                            <td>الفروقات</td>
                                            <td>الكمية</td>
                                            <td>الوصف</td>
                                            <td>القيمة</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <asp:Repeater ID="Repeater6" DataSourceID="SqlDataSource5" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td> <asp:Label ID="DiffID" runat="server" Text='<%# Eval("Diff_ID") %>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="Diff_Symbol" runat="server" Text='<%# Eval("Diff_Code") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="Diff_Discount" runat="server" Text='<%# Eval("Type") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="Diff_Percentage" runat="server" Text='<%# Eval("Diff_Rate") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="Diff_Desc" runat="server" Text='<%# Eval("Diff_Desc") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox ID="Diff_Value" runat="server" Text='<%# Eval("Diff_Value") %>' Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>

                                                    <td>
                                                        <asp:LinkButton ID="DiffAdopt" runat="server" class="btn default btn-xs green" OnClick="DiffAdopt_Click" Visible="false"><i class="fa fa-edit"></i>اعتماد</asp:LinkButton></td>


                                                    <td>
                                                        <asp:LinkButton ID="DiffDelete" runat="server" class="btn default btn-xs purple" OnClick="DiffDelete_Click" OnClientClick="return confirm('هل انت متاكد من الحذف؟')"><i class="fa fa-trash-o"></i> حذف </a></asp:LinkButton>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:HumanResources %>'
                                            SelectCommand="SELECT * FROM [Differences_TB]
                                            
                                             WHERE (([Emp_ID] = @Emp_ID) AND ([Diff_Month] = @Diff_Month) AND ([Diff_Year] = @Diff_Year))  AND IsDelete=0">
                                            <SelectParameters>
                                                  <asp:ControlParameter ControlID="Label5" Name="Emp_ID" Type="Int32" PropertyName="Text" />
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" Name="Diff_Month" Type="Int32"></asp:ControlParameter>
                                                <asp:ControlParameter ControlID="Label2" PropertyName="Text" Name="Diff_Year" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <tr>

                                            <td colspan="4">المجموع</td>

                                            <td>
                                                <asp:TextBox ID="Diff_Total" runat="server" Text="TextBox" Font-Size="X-Small" CssClass="form-control input-small1"></asp:TextBox></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <%--<div class="col-md-5">
                            <div class="col-md-12">
                                <table class="table table-striped table-hover">

                                    <tbody>
                                        <asp:Repeater ID="Repeater5" DataSourceID="SqlDataSource4" runat="server">
                                            <ItemTemplate>

                                                <tr>
                                                    <td>الأساسي</td>
                                                    <td>
                                                        <asp:Label ID="Main" runat="server" Font-Size="X-Small" Text='<%# Eval("Main_Salary") %>'></asp:Label></td>
                                                    <td>خصميات</td>
                                                    <td>
                                                        <asp:Label ID="Discount" runat="server" Font-Size="X-Small" Text='<%# Eval("Discount_Total") %>'></asp:Label></td>
                                                    <td>فروقات </td>
                                                    <td>في البنك</td>

                                                </tr>
                                                <tr>
                                                    <td>الاضافات</td>
                                                    <td>
                                                        <asp:Label ID="Plus" runat="server" Font-Size="X-Small" Text='<%# Eval("Plus_Total") %>'></asp:Label>
                                                    </td>
                                                    <td>ضريبة</td>
                                                    <td>
                                                        <asp:Label ID="Tax" runat="server" Font-Size="X-Small" Text='<%# Eval("TaxValue") %>' Visible="false"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="Differences" runat="server" Font-Size="X-Small" Text='<%# Eval("Differences_Total") %>'></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="InBank" runat="server" Font-Size="X-Small" Text='<%# Eval("InBank") %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>اجمالي</td>
                                                    <td>
                                                        <asp:Label ID="Total" runat="server" Font-Size="X-Small" Text="Label"></asp:Label>
                                                    </td>
                                                    <td>م.الخصميات</td>
                                                    <td>
                                                        <asp:Label ID="total_Discount" runat="server" Font-Size="X-Small" Text='<%# Eval("Discount_Total") %>'></asp:Label></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </tbody>
                                </table>
                            </div>

                        </div>--%>

                      
                    </div>
                </div>
                <div class="clearfix"></div>

                   <div class="form-actions fluid">
                    <div class="col-md-offset-5 col-md-7">
                        <% if (Permissions.Contains("SalaryFormAdopt"))
                           { %>
                        <asp:Button ID="Button1" runat="server" Text="اعتماد" Visible="false" class="btn blue" OnClick="Button1_Click" />
                        <%} %>
                        <% if (Permissions.Contains("SalaryFormEdit"))
                           { %>
                        <asp:Button ID="Button2" runat="server" Text="تعديل" OnClick="Button2_Click" class="btn default" />
                        <%} %>
                    
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%} %>
</asp:Content>

 