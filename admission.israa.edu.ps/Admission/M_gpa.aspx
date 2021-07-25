<%@ Page Title="" Language="C#" MasterPageFile="~/Admission/MasterPage.master" AutoEventWireup="true" CodeFile="M_gpa.aspx.cs" Inherits="Instructor_M_gpa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('.page-sidebar-menu li').removeClass("active").removeClass("open");
            $('.page-sidebar-menu li ul li').css("background-color", "");
            $('#AcademicSectionStudentsMarks').addClass("active open");
            $('#AcademicSectionStudentsMarks_2 a').css("background-color", "#575757");
            $('#AcademicSectionStudentsMarks_2 a span.arrow').addClass("open");

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<BR/>
<BR/>
<BR/>
    <div class="row">
    <div class="col-sm-6 col-md-6">
                <div class="form-group">
                    <label>رقم الطالب </label>
                    <asp:TextBox ID="std" Width="50%" CssClass="form-control" runat="server" AutoPostBack="True"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="std" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                
                    
                    
                </div>
            </div>
    <div class="col-sm-6 col-md-6">
                <div class="form-group">
                    <label>الفصل الدراسي </label>
                   
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control"  DataTextField="arname" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isra %>" SelectCommand="select id,arname from semester where id in ( select SemesterID from StdSemester where StudentID =(select id from [IsraPermissions].[dbo].[Student] where studentno =@std))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="std" Name="std" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
   <div class="row">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" CssClass="table">
            <Columns>
                <asp:BoundField DataField="SemesterID" HeaderText="الفصل" SortExpression="SemesterID" ReadOnly="True" />
                <asp:BoundField DataField="SemesterRegisteredHours" HeaderText="ساعات تسجيل فصلية" SortExpression="SemesterRegisteredHours" />
                <asp:BoundField DataField="SemesterFailedHour" HeaderText="ساعات رسوب فصلية" SortExpression="SemesterFailedHour" />
                <asp:BoundField DataField="SemesterCumulativeRegisteredHours" HeaderText="ساعات تسجيل متراكمة" SortExpression="SemesterCumulativeRegisteredHours" />
                <asp:BoundField DataField="SemesterGPA" HeaderText="معدل فصلي" SortExpression="SemesterGPA" />
                <asp:BoundField DataField="SemesterCumulativeGPA" HeaderText="معدل تراكمي فصلي" SortExpression="SemesterCumulativeGPA" />
                <asp:BoundField DataField="SemesterCumulativeHours" HeaderText="ساعات فصلية تراكمية" SortExpression="SemesterCumulativeHours" />
                <asp:BoundField DataField="SemesterGraduateGpa" HeaderText="معدل تراكمي فصلي خريج" SortExpression="SemesterGraduateGpa" />
                <asp:BoundField DataField="SemesterPlanSucceedHour" HeaderText="ساعات نجاح فصلية خطة" SortExpression="SemesterPlanSucceedHour" />
                <asp:BoundField DataField="SemesterCumulativeGraduateGPA" HeaderText="معدل تراكمي خريج" SortExpression="SemesterCumulativeGraduateGPA" />
                <asp:BoundField DataField="SemesterCumulativeGraduateHours" HeaderText="ساعات تراكمية فصلية خريج" SortExpression="SemesterCumulativeGraduateHours" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:isra %>" 
            DeleteCommand="DELETE FROM [StdSemester] WHERE [ID] = @original_ID AND [SemesterID] = @original_SemesterID AND (([SemesterRegisteredHours] = @original_SemesterRegisteredHours) OR ([SemesterRegisteredHours] IS NULL AND @original_SemesterRegisteredHours IS NULL)) AND (([SemesterFailedHour] = @original_SemesterFailedHour) OR ([SemesterFailedHour] IS NULL AND @original_SemesterFailedHour IS NULL)) AND (([SemesterCumulativeRegisteredHours] = @original_SemesterCumulativeRegisteredHours) OR ([SemesterCumulativeRegisteredHours] IS NULL AND @original_SemesterCumulativeRegisteredHours IS NULL)) AND (([SemesterGPA] = @original_SemesterGPA) OR ([SemesterGPA] IS NULL AND @original_SemesterGPA IS NULL)) AND (([SemesterCumulativeGPA] = @original_SemesterCumulativeGPA) OR ([SemesterCumulativeGPA] IS NULL AND @original_SemesterCumulativeGPA IS NULL)) AND (([SemesterCumulativeHours] = @original_SemesterCumulativeHours) OR ([SemesterCumulativeHours] IS NULL AND @original_SemesterCumulativeHours IS NULL)) AND (([SemesterGraduateGpa] = @original_SemesterGraduateGpa) OR ([SemesterGraduateGpa] IS NULL AND @original_SemesterGraduateGpa IS NULL)) AND (([SemesterPlanSucceedHour] = @original_SemesterPlanSucceedHour) OR ([SemesterPlanSucceedHour] IS NULL AND @original_SemesterPlanSucceedHour IS NULL)) AND (([SemesterCumulativeGraduateGPA] = @original_SemesterCumulativeGraduateGPA) OR ([SemesterCumulativeGraduateGPA] IS NULL AND @original_SemesterCumulativeGraduateGPA IS NULL)) AND (([SemesterCumulativeGraduateHours] = @original_SemesterCumulativeGraduateHours) OR ([SemesterCumulativeGraduateHours] IS NULL AND @original_SemesterCumulativeGraduateHours IS NULL))" InsertCommand="INSERT INTO [StdSemester] ([SemesterID], [SemesterRegisteredHours], [SemesterFailedHour], [SemesterCumulativeRegisteredHours], [SemesterGPA], [SemesterCumulativeGPA], [SemesterCumulativeHours], [SemesterGraduateGpa], [SemesterPlanSucceedHour], [SemesterCumulativeGraduateGPA], [SemesterCumulativeGraduateHours]) VALUES (@SemesterID, @SemesterRegisteredHours, @SemesterFailedHour, @SemesterCumulativeRegisteredHours, @SemesterGPA, @SemesterCumulativeGPA, @SemesterCumulativeHours, @SemesterGraduateGpa, @SemesterPlanSucceedHour, @SemesterCumulativeGraduateGPA, @SemesterCumulativeGraduateHours)" OldValuesParameterFormatString="original_{0}"
             SelectCommand="SELECT [SemesterID], [SemesterRegisteredHours], [SemesterFailedHour], [SemesterCumulativeRegisteredHours], [SemesterGPA], [SemesterCumulativeGPA], [SemesterCumulativeHours], [SemesterGraduateGpa], [SemesterPlanSucceedHour], [SemesterCumulativeGraduateGPA], [SemesterCumulativeGraduateHours], [ID] FROM [StdSemester] where StudentID =(select id from [IsraPermissions].[dbo].[Student] where studentno =@std and semesterid=@sem)" UpdateCommand="UPDATE [StdSemester] SET  [SemesterRegisteredHours] = @SemesterRegisteredHours, [SemesterFailedHour] = @SemesterFailedHour, [SemesterCumulativeRegisteredHours] = @SemesterCumulativeRegisteredHours, [SemesterGPA] = @SemesterGPA, [SemesterCumulativeGPA] = @SemesterCumulativeGPA, [SemesterCumulativeHours] = @SemesterCumulativeHours, [SemesterGraduateGpa] = @SemesterGraduateGpa, [SemesterPlanSucceedHour] = @SemesterPlanSucceedHour, [SemesterCumulativeGraduateGPA] = @SemesterCumulativeGraduateGPA, [SemesterCumulativeGraduateHours] = @SemesterCumulativeGraduateHours WHERE [ID] = @original_ID AND [SemesterID] = @original_SemesterID AND (([SemesterRegisteredHours] = @original_SemesterRegisteredHours) OR ([SemesterRegisteredHours] IS NULL AND @original_SemesterRegisteredHours IS NULL)) AND (([SemesterFailedHour] = @original_SemesterFailedHour) OR ([SemesterFailedHour] IS NULL AND @original_SemesterFailedHour IS NULL)) AND (([SemesterCumulativeRegisteredHours] = @original_SemesterCumulativeRegisteredHours) OR ([SemesterCumulativeRegisteredHours] IS NULL AND @original_SemesterCumulativeRegisteredHours IS NULL)) AND (([SemesterGPA] = @original_SemesterGPA) OR ([SemesterGPA] IS NULL AND @original_SemesterGPA IS NULL)) AND (([SemesterCumulativeGPA] = @original_SemesterCumulativeGPA) OR ([SemesterCumulativeGPA] IS NULL AND @original_SemesterCumulativeGPA IS NULL)) AND (([SemesterCumulativeHours] = @original_SemesterCumulativeHours) OR ([SemesterCumulativeHours] IS NULL AND @original_SemesterCumulativeHours IS NULL)) AND (([SemesterGraduateGpa] = @original_SemesterGraduateGpa) OR ([SemesterGraduateGpa] IS NULL AND @original_SemesterGraduateGpa IS NULL)) AND (([SemesterPlanSucceedHour] = @original_SemesterPlanSucceedHour) OR ([SemesterPlanSucceedHour] IS NULL AND @original_SemesterPlanSucceedHour IS NULL)) AND (([SemesterCumulativeGraduateGPA] = @original_SemesterCumulativeGraduateGPA) OR ([SemesterCumulativeGraduateGPA] IS NULL AND @original_SemesterCumulativeGraduateGPA IS NULL)) AND (([SemesterCumulativeGraduateHours] = @original_SemesterCumulativeGraduateHours) OR ([SemesterCumulativeGraduateHours] IS NULL AND @original_SemesterCumulativeGraduateHours IS NULL))">
          
              <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_SemesterID" Type="Int32" />
                <asp:Parameter Name="original_SemesterRegisteredHours" Type="Int32" />
                <asp:Parameter Name="original_SemesterFailedHour" Type="Int32" />
                <asp:Parameter Name="original_SemesterCumulativeRegisteredHours" Type="Int32" />
                <asp:Parameter Name="original_SemesterGPA" Type="Double" />
                <asp:Parameter Name="original_SemesterCumulativeGPA" Type="Double" />
                <asp:Parameter Name="original_SemesterCumulativeHours" Type="Int32" />
                  <asp:Parameter Name="original_SemesterGraduateGpa" Type="Double" />
                  <asp:Parameter Name="original_SemesterPlanSucceedHour" Type="Int32" />
                  <asp:Parameter Name="original_SemesterCumulativeGraduateGPA" Type="Double" />
                  <asp:Parameter Name="original_SemesterCumulativeGraduateHours" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SemesterID" Type="Int32" />
                <asp:Parameter Name="SemesterRegisteredHours" Type="Int32" />
                <asp:Parameter Name="SemesterFailedHour" Type="Int32" />
                <asp:Parameter Name="SemesterCumulativeRegisteredHours" Type="Int32" />
                <asp:Parameter Name="SemesterGPA" Type="Double" />
                <asp:Parameter Name="SemesterCumulativeGPA" Type="Double" />
                <asp:Parameter Name="SemesterCumulativeHours" Type="Int32" />
                <asp:Parameter Name="SemesterGraduateGpa" Type="Double" />
                <asp:Parameter Name="SemesterPlanSucceedHour" Type="Int32" />
                <asp:Parameter Name="SemesterCumulativeGraduateGPA" Type="Double" />
                <asp:Parameter Name="SemesterCumulativeGraduateHours" Type="Int32" />
            </InsertParameters>
              <SelectParameters>
                  <asp:ControlParameter ControlID="std" Name="std" PropertyName="Text" />
                  <asp:ControlParameter ControlID="DropDownList1" Name="sem" PropertyName="SelectedValue" />
              </SelectParameters>
            <UpdateParameters>
         
                <asp:Parameter Name="SemesterRegisteredHours" Type="Int32" />
                <asp:Parameter Name="SemesterFailedHour" Type="Int32" />
                <asp:Parameter Name="SemesterCumulativeRegisteredHours" Type="Int32" />
                <asp:Parameter Name="SemesterGPA" Type="Double" />
                <asp:Parameter Name="SemesterCumulativeGPA" Type="Double" />
                <asp:Parameter Name="SemesterCumulativeHours" Type="Int32" />
                <asp:Parameter Name="SemesterGraduateGpa" Type="Double" />
                <asp:Parameter Name="SemesterPlanSucceedHour" Type="Int32" />
                <asp:Parameter Name="SemesterCumulativeGraduateGPA" Type="Double" />
                <asp:Parameter Name="SemesterCumulativeGraduateHours" Type="Int32" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_SemesterID" Type="Int32" />
                <asp:Parameter Name="original_SemesterRegisteredHours" Type="Int32" />
                <asp:Parameter Name="original_SemesterFailedHour" Type="Int32" />
                <asp:Parameter Name="original_SemesterCumulativeRegisteredHours" Type="Int32" />
                <asp:Parameter Name="original_SemesterGPA" Type="Double" />
                <asp:Parameter Name="original_SemesterCumulativeGPA" Type="Double" />
                <asp:Parameter Name="original_SemesterCumulativeHours" Type="Int32" />
                <asp:Parameter Name="original_SemesterGraduateGpa" Type="Double" />
                <asp:Parameter Name="original_SemesterPlanSucceedHour" Type="Int32" />
                <asp:Parameter Name="original_SemesterCumulativeGraduateGPA" Type="Double" />
                <asp:Parameter Name="original_SemesterCumulativeGraduateHours" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>


