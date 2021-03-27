<%@ Page Title="" Language="C#" MasterPageFile="~/Academic/MasterPage.master" AutoEventWireup="true" CodeFile="AcadmicEvaluateEmployee.aspx.cs" Inherits="Academic_AcadmicEvaluateEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
    <style>
        input[type=text] {
    width: 5%;
   
   
}
        .answers {
            width: 100%;
        }

            .answers tbody tr {
                width: 20%;
                float: right;
            }

                .answers tbody tr td {
                    padding: 0px;
                    border-top: none;
                }
    </style>
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#TeacherEvaluation').addClass("active open");
            $('#Eval3 a').css("background-color", "#575757");
            $('#TeacherEvaluation a span.arrow').addClass("open");
        });

        $(document).on('click', '.answers input[type=radio]', function () {
            $(this).parents("tr").find(".item-value").val($(this).val());
            var sum = 0; 
            $(this).parents("div.evaluate-group").find(".answers input[type=radio]:checked").each(function () {
                console.log($(this).val());
                sum +=  parseInt($(this).val());

            });
            $(this).parents("div.evaluate-group").find(".gourp-summation").val(sum);

            var total = 0;
            $(this).parents("div.total-group").find(".answers input[type=radio]:checked").each(function () {
                console.log($(this).val());
                total += parseInt($(this).val());

            });
            $(this).parents("div.total-group").find(".gourp-total").val(total);

            var percentage =((total / 225) * 100).toFixed(2);
            $(".Percentage-total").val(parseFloat(percentage));

         });

        
                
         
    </script>





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ul class="page-breadcrumb breadcrumb isra-contaner-heder">
        <li>
            <i class="fa fa-home"></i>
            <a href="#" class="font-ha">التقييم الأكاديمي لعضو هيئة التدريس من عمادة الكلية</a>
            <i class="fa fa-angle-left"></i>
        </li>

    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-md-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption"><i class="fa fa-cogs"></i>التقييم الأكاديمي لعضو هيئة التدريس من عمادة الكلية</div>
            </div>
            <div class="portlet-body form">
                <div class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                          
                            <div style="font-size: 14px;" class="alert alert-info alert-dismissable">
                                <asp:Label ID="EmpID" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                <div class="col-md-3">
                                    <strong>الاسم  : </strong>
                                    <asp:Label ID="Name" runat="server"></asp:Label><br />
                                </div>
                                <div class="col-md-3">
                                    <strong>الكلية التابع لها   : </strong>
                                    <asp:Label ID="ColageName" runat="server"></asp:Label><br />
                                </div>
                                <div class="col-md-3">
                                    <strong>القسم : </strong>
                                    <asp:Label ID="Department" runat="server"></asp:Label><br />

                                </div>
                                <div class="col-md-3">
                                    <strong>العبء الوظيفي : </strong>
                                    <asp:Label ID="Hours" runat="server"></asp:Label><br />
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div id="divMsg" runat="server" class="alert alert-warning alert-dismissable" visible="true" style="font-size: 14px;">
                                <div class="col-xs-10">
                                    <strong>
                                        <asp:Label ID="lblMsg" runat="server" Text="التقييم الجامعي"></asp:Label>
                                    </strong>
                                    <div style="clear: both"></div>
                                </div>
                                <button aria-hidden="true" data-dismiss="alert" class="close col-xs-2" style="margin-top: 4px;" type="button"></button>
                                <div style="clear: both"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                     <div class="total-group">
                        <asp:Label ID="EvaluationQuestionGroupID" runat="server" Text="1" Visible="false"></asp:Label>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                
                                <div class="evaluate-group">
                                   
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="EvaluationQuestionGroupID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label>
                                                <h4><%# Eval("GroupName") %></h4>
                                                <h4>  <div class="row">
                                              <input type="text" name="items_summation" class="gourp-summation" value="" style="color:red"/>/
                                   <input type="text" name="items_total" disabled="disabled" value='<%# Eval("GroupMark") %>' />
                                                    
                                                     </div></h4>

                                            </div>
                                        </div>


                                  
                                    <hr style="margin: 10px 0 15px 0" />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 5%;">#</th>
                                                        <th style="width: 45%; text-align: center">السؤال</th>
                                                        <th></th>
                                                        <th style="width: 50%; text-align: center">الدرجة</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource11" OnItemDataBound="Repeater11_ItemDataBound">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><span><%# Eval("RowNo") %>
                                                                    <asp:Label runat="server" ID="lblAspradiobuttonValue"></asp:Label></span>
                                                                    <asp:Label ID="answer" runat="server" Text='<%#  Eval("answer") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="EvaluationQuestionID" runat="server" Text='<%# Eval("ID") %>' Visible="false"></asp:Label></td>
                                                                <td><span><%# Eval("QuestionName") %></span></td>
                                                                <td>
                                                                    <input class="item-value" type="text" value="" hidden="hidden" />

                                                                </td>
                                                                <td>
                                                                    <asp:RadioButtonList ID="rblAnswers" runat="server" CssClass="answers" DataSourceID="SqlDataSource2" DataTextField="OptionText" DataValueField="OptionID">
                                                                    </asp:RadioButtonList>
                                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:IsraaEvaluation %>' SelectCommand="EvaluationQuestionOptionsGet" SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="EvaluationQuestionID" PropertyName="Text" Name="QuestionID" Type="Int32"></asp:ControlParameter>
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                                                        SelectCommand="GetEvaluationEmployeeQuestionsByGroup" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EvaluationQuestionGroupID" PropertyName="Text" Name="EvaluationQuestionGroupID" Type="Int32" />
                                                            <asp:Parameter DefaultValue="5" Name="SemesterID" Type="Int32"></asp:Parameter>
                                                            <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="-1" Name="EmployeeID" Type="Int32"></asp:ControlParameter>

                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                  

                                </div>
          
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:IsraaEvaluation %>"
                            SelectCommand="GetEvaluationQuestionGroup" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="2" Name="GroupType" Type="Int32"></asp:Parameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                   
                                               
              <h4>  <div class="row">نسبة التقييم
             <input type="text" name="items_total" class="gourp-total" value="" style="color:red"/>/  <input type="text" name="Default_total" value="225" disabled="disabled" />= <input type="text" name="Percentage" class="Percentage-total" value="" disabled="disabled" />%</div></h4>
 </div>
   </div>
                    <div class="form-actions fluid">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button ID="btnSave" runat="server" Text="تقديم وحفظ التقيم" class="btn green" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>
            </div>
       </div>
        </div>
</asp:Content>

