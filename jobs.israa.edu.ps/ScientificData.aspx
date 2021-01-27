<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScientificData.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form runat="server">


            <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption font-red-sunglo">
                <span class="caption-subject bold uppercase">البيانات العلمية </span>
            </div>
            <div class="actions">
                <a class="btn btn-circle btn-icon-only blue" href="javascript:;">
                    <i class="icon-cloud-upload"></i>
                </a>
                <a class="btn btn-circle btn-icon-only green" href="javascript:;">
                    <i class="icon-wrench"></i>
                </a>
                <a class="btn btn-circle btn-icon-only red" href="javascript:;">
                    <i class="icon-trash"></i>
                </a>
            </div>
        </div>
        <div class="portlet-body form">


        <div runat="server" id="not_found">
        <div class="col-md-2" style="direction: rtl;">
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="uni" CssClass="form-control" runat="server"></asp:TextBox>
                    <label for="form_control_1">اسم الجامعة او المؤسسة  </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uni" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="col-md-2" style="direction: rtl;">
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                        <asp:ListItem Value="-1"> اختر</asp:ListItem>
                        <asp:ListItem>أذريبيجان</asp:ListItem>
                        <asp:ListItem>اثيوبيا</asp:ListItem>
                        <asp:ListItem> اسبانيا</asp:ListItem>
                        <asp:ListItem> استراليا</asp:ListItem>
                        <asp:ListItem> افغانستان</asp:ListItem>
                        <asp:ListItem> الاتحاد السوفيتي</asp:ListItem>
                        <asp:ListItem> الارجنتين</asp:ListItem>
                        <asp:ListItem> الاردن</asp:ListItem>
                        <asp:ListItem> الامارات</asp:ListItem>
                        <asp:ListItem> الباكستان</asp:ListItem>
                        <asp:ListItem> البانيا</asp:ListItem>
                        <asp:ListItem> البحرين</asp:ListItem>
                        <asp:ListItem>البرازيل</asp:ListItem>
                        <asp:ListItem> البرتغال</asp:ListItem>
                        <asp:ListItem> الجزائر</asp:ListItem>
                        <asp:ListItem> الدنمارك</asp:ListItem>
                        <asp:ListItem> السعودية</asp:ListItem>
                        <asp:ListItem> السنغال</asp:ListItem>
                        <asp:ListItem> السودان</asp:ListItem>
                        <asp:ListItem> السويد</asp:ListItem>
                        <asp:ListItem> الصومال</asp:ListItem>
                        <asp:ListItem> الصين</asp:ListItem>
                        <asp:ListItem>العراق</asp:ListItem>
                        <asp:ListItem> الفلبين</asp:ListItem>
                        <asp:ListItem>الكميرون</asp:ListItem>
                        <asp:ListItem>الكنغو</asp:ListItem>
                        <asp:ListItem> الكونغو</asp:ListItem>
                        <asp:ListItem> الكويت</asp:ListItem>
                        <asp:ListItem> المالديف</asp:ListItem>
                        <asp:ListItem> المانيا</asp:ListItem>
                        <asp:ListItem> المجر</asp:ListItem>
                        <asp:ListItem> المغرب</asp:ListItem>
                        <asp:ListItem> المكسيك</asp:ListItem>
                        <asp:ListItem> النرويج</asp:ListItem>
                        <asp:ListItem> النمسا</asp:ListItem>
                        <asp:ListItem> النيجر</asp:ListItem>
                        <asp:ListItem> الهند</asp:ListItem>
                        <asp:ListItem> اليابان</asp:ListItem>
                        <asp:ListItem> اليمن</asp:ListItem>
                        <asp:ListItem> اليونان</asp:ListItem>
                        <asp:ListItem> امريكا</asp:ListItem>
                        <asp:ListItem> انجولا</asp:ListItem>
                        <asp:ListItem> اندونيسيا</asp:ListItem>
                        <asp:ListItem> اوزباكستان</asp:ListItem>
                        <asp:ListItem> اوغندا</asp:ListItem>
                        <asp:ListItem> اوكرانيا</asp:ListItem>
                        <asp:ListItem> ايران</asp:ListItem>
                        <asp:ListItem> ايرلندا</asp:ListItem>
                        <asp:ListItem> ايطاليا</asp:ListItem>
                        <asp:ListItem> برجواى</asp:ListItem>
                        <asp:ListItem> بريطانيا</asp:ListItem>
                        <asp:ListItem> بلجيكا</asp:ListItem>
                        <asp:ListItem> بلغاريا</asp:ListItem>
                        <asp:ListItem> "بنجلادش</asp:ListItem>
                        <asp:ListItem>بنما</asp:ListItem>
                        <asp:ListItem> بورتوركيو</asp:ListItem>
                        <asp:ListItem> بولندا</asp:ListItem>
                        <asp:ListItem> بيرو</asp:ListItem>
                        <asp:ListItem> بيلاروسيا</asp:ListItem>
                        <asp:ListItem> تانزانيا</asp:ListItem>
                        <asp:ListItem> تانغو</asp:ListItem>
                        <asp:ListItem> تاهيتى</asp:ListItem>
                        <asp:ListItem> تايلاند</asp:ListItem>
                        <asp:ListItem> تايوان</asp:ListItem>
                        <asp:ListItem> تركيا</asp:ListItem>
                        <asp:ListItem> >تشاد</asp:ListItem>
                        <asp:ListItem> تشيكوسلوفاكيا</asp:ListItem>
                        <asp:ListItem> توجو</asp:ListItem>
                        <asp:ListItem> تونس</asp:ListItem>
                        <asp:ListItem> جزر السلمون</asp:ListItem>
                        <asp:ListItem> جنوب افريقيا</asp:ListItem>
                        <asp:ListItem> جواتيمالا</asp:ListItem>
                        <asp:ListItem>رواندا</asp:ListItem>
                        <asp:ListItem> روسيا</asp:ListItem>
                        <asp:ListItem>رومانيا</asp:ListItem>
                        <asp:ListItem> زائير</asp:ListItem>
                        <asp:ListItem> زامبيا</asp:ListItem>
                        <asp:ListItem> زيمبابوى</asp:ListItem>
                        <asp:ListItem> ساحل العاج</asp:ListItem>
                        <asp:ListItem> سنغافورة</asp:ListItem>
                        <asp:ListItem> سوريا</asp:ListItem>
                        <asp:ListItem> سولفكيا</asp:ListItem>
                        <asp:ListItem> سويسرا</asp:ListItem>
                        <asp:ListItem> سيراليون</asp:ListItem>
                        <asp:ListItem> سيرلانكا</asp:ListItem>
                        <asp:ListItem> شيلى</asp:ListItem>
                        <asp:ListItem> صربيا</asp:ListItem>
                        <asp:ListItem> عمان</asp:ListItem>
                        <asp:ListItem> غانا</asp:ListItem>
                        <asp:ListItem> غير مدخل</asp:ListItem>
                        <asp:ListItem> غينيا</asp:ListItem>
                        <asp:ListItem> فرنسا</asp:ListItem>
                        <asp:ListItem> فلسطين</asp:ListItem>
                        <asp:ListItem> فنزويلا</asp:ListItem>
                        <asp:ListItem> فنلندا</asp:ListItem>
                        <asp:ListItem> فيتنام</asp:ListItem>
                        <asp:ListItem> فينا</asp:ListItem>
                        <asp:ListItem> قبرص</asp:ListItem>
                        <asp:ListItem> قرقيزيا</asp:ListItem>
                        <asp:ListItem> قطر</asp:ListItem>
                        <asp:ListItem> قيرقيزيا</asp:ListItem>
                        <asp:ListItem> كالدونيا</asp:ListItem>
                        <asp:ListItem> كرواتيا</asp:ListItem>
                        <asp:ListItem> كزاخستان</asp:ListItem>
                        <asp:ListItem> كندا</asp:ListItem>
                        <asp:ListItem> كوبا</asp:ListItem>
                        <asp:ListItem> كوريا الجنوبية</asp:ListItem>
                        <asp:ListItem> كوريا الشمالية</asp:ListItem>
                        <asp:ListItem> كولومبيا</asp:ListItem>
                        <asp:ListItem> كينيا</asp:ListItem>
                        <asp:ListItem> لاتفيا</asp:ListItem>
                        <asp:ListItem> لبنان</asp:ListItem>
                        <asp:ListItem> ليبريا</asp:ListItem>
                        <asp:ListItem> ليبيا</asp:ListItem>
                        <asp:ListItem> مالاجاش</asp:ListItem>
                        <asp:ListItem> مالطا</asp:ListItem>
                        <asp:ListItem> مالى</asp:ListItem>
                        <asp:ListItem> ماليزيا</asp:ListItem>
                        <asp:ListItem> مصر</asp:ListItem>
                        <asp:ListItem> ملدوفا</asp:ListItem>
                        <asp:ListItem> منغوليا</asp:ListItem>
                        <asp:ListItem> موريتانيا</asp:ListItem>
                        <asp:ListItem> موزمبيق</asp:ListItem>
                        <asp:ListItem> موناكو</asp:ListItem>
                        <asp:ListItem> ناميبيا</asp:ListItem>
                        <asp:ListItem> نيبال</asp:ListItem>
                        <asp:ListItem>نيجريا</asp:ListItem>
                        <asp:ListItem> نيكاراجوا</asp:ListItem>
                        <asp:ListItem> نيوزيلاند</asp:ListItem>
                        <asp:ListItem> هنغاريا</asp:ListItem>
                        <asp:ListItem> هولندا</asp:ListItem>
                        <asp:ListItem> يوغوسلافيا</asp:ListItem>
                    </asp:DropDownList>
                    <label for="form_control_1">الدولة </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
            

        <div class="col-md-2" style="direction: rtl;">
            <div class="col-md-6" style="direction: rtl;">
                <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                    <div class="input-icon right">
                        <asp:TextBox ID="from" CssClass="form-control form-control-inline input-medium date-picker" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months" runat="server"></asp:TextBox>
                        <label for="form_control_1">من  </label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="from" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-md-6" style="direction: rtl;">
                <div class="form-group form-md-line-input has-info">
                    <div class="input-icon">
                        <asp:TextBox ID="to" CssClass="form-control form-control-inline input-medium date-picker" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months" runat="server"></asp:TextBox>

                        <label for="form_control_1">الى  </label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="to" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-2" style="direction: rtl;">
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">

                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                              <asp:ListItem Value="-1"> اختر</asp:ListItem>
                              <asp:ListItem>مؤهل مهني</asp:ListItem>
                              <asp:ListItem>ثانوية عامة</asp:ListItem>
                              <asp:ListItem>دبلوم متوسط</asp:ListItem>
                              <asp:ListItem>بكالوريوس</asp:ListItem>
                              <asp:ListItem>دبلوم عالي</asp:ListItem>
                              <asp:ListItem>ماجستير</asp:ListItem>
                              <asp:ListItem>دكتوراة</asp:ListItem>
                              <asp:ListItem>دبلوم مهني سنتين</asp:ListItem>
                              <asp:ListItem>دورة تمريض 18 شهر</asp:ListItem>
                       

                    </asp:DropDownList>

                    <label for="form_control_1">الدرجة العلمية </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList2" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="col-md-2" style="direction: rtl;">
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                     <asp:DropDownList ID="maj" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="txt" DataValueField="id" OnDataBound="maj_DataBound">
                 
            </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [maj] ORDER BY [txt]"></asp:SqlDataSource>
                    <label for="form_control_1">التخصص </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="maj" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" InitialValue="-1" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="col-md-2" style="direction: rtl;">
             <div class="col-md-6" style="direction: rtl;">
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="date_degree" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                    <label for="form_control_1">التاريخ  </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="date_degree" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
</div>
             <div class="col-md-6" style="direction: rtl;">
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="gpa" CssClass="form-control" runat="server"></asp:TextBox>
                    <label for="form_control_1">التقدير </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="gpa" ErrorMessage="ادخل" Font-Size="Small" ForeColor="Red" SetFocusOnError="True" ValidationGroup="g1"></asp:RequiredFieldValidator>
                </div>
            </div>
                 </div>
        </div>

            <asp:Button ID="Button1" runat="server" Text="ادخل" CssClass="btn" OnClick="Button1_Click" ValidationGroup="g1" />

        </div>
             <h2 id="msg" visible="false" runat="server" class="text-center mt-0 mb-20" style="color:red">  </h2>
        <br />
        <div  style="direction:rtl">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table" GridLines="Horizontal" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="اسم الجامعة او المؤسسة" SortExpression="uni">
                    <EditItemTemplate>
                          <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("uni") %>'></asp:TextBox>
                    </div>
                              </div>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                      <%--  <asp:Label ID="Label1" runat="server" Text='<%# Bind("uni") %>'></asp:Label>--%>
                     
            <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="uni1" ReadOnly="true" Text='<%# Bind("uni") %>' CssClass="form-control" runat="server"></asp:TextBox>
                  

                </div>
            </div>
       
                    </ItemTemplate>
                    <ItemStyle Width="11.66667%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="الدولة" SortExpression="place">
                    <EditItemTemplate>
                         <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                       <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" SelectedValue='<%# Bind("place") %>' >
                             <asp:ListItem Value="-1"> اختر</asp:ListItem>
                        <asp:ListItem>أذريبيجان</asp:ListItem>
                        <asp:ListItem>اثيوبيا</asp:ListItem>
                        <asp:ListItem> اسبانيا</asp:ListItem>
                        <asp:ListItem> استراليا</asp:ListItem>
                        <asp:ListItem> افغانستان</asp:ListItem>
                        <asp:ListItem> الاتحاد السوفيتي</asp:ListItem>
                        <asp:ListItem> الارجنتين</asp:ListItem>
                        <asp:ListItem> الاردن</asp:ListItem>
                        <asp:ListItem> الامارات</asp:ListItem>
                        <asp:ListItem> الباكستان</asp:ListItem>
                        <asp:ListItem> البانيا</asp:ListItem>
                        <asp:ListItem> البحرين</asp:ListItem>
                        <asp:ListItem>البرازيل</asp:ListItem>
                        <asp:ListItem> البرتغال</asp:ListItem>
                        <asp:ListItem> الجزائر</asp:ListItem>
                        <asp:ListItem> الدنمارك</asp:ListItem>
                        <asp:ListItem> السعودية</asp:ListItem>
                        <asp:ListItem> السنغال</asp:ListItem>
                        <asp:ListItem> السودان</asp:ListItem>
                        <asp:ListItem> السويد</asp:ListItem>
                        <asp:ListItem> الصومال</asp:ListItem>
                        <asp:ListItem> الصين</asp:ListItem>
                        <asp:ListItem>العراق</asp:ListItem>
                        <asp:ListItem> الفلبين</asp:ListItem>
                        <asp:ListItem>الكميرون</asp:ListItem>
                        <asp:ListItem>الكنغو</asp:ListItem>
                        <asp:ListItem> الكونغو</asp:ListItem>
                        <asp:ListItem> الكويت</asp:ListItem>
                        <asp:ListItem> المالديف</asp:ListItem>
                        <asp:ListItem> المانيا</asp:ListItem>
                        <asp:ListItem> المجر</asp:ListItem>
                        <asp:ListItem> المغرب</asp:ListItem>
                        <asp:ListItem> المكسيك</asp:ListItem>
                        <asp:ListItem> النرويج</asp:ListItem>
                        <asp:ListItem> النمسا</asp:ListItem>
                        <asp:ListItem> النيجر</asp:ListItem>
                        <asp:ListItem> الهند</asp:ListItem>
                        <asp:ListItem> اليابان</asp:ListItem>
                        <asp:ListItem> اليمن</asp:ListItem>
                        <asp:ListItem> اليونان</asp:ListItem>
                        <asp:ListItem> امريكا</asp:ListItem>
                        <asp:ListItem> انجولا</asp:ListItem>
                        <asp:ListItem> اندونيسيا</asp:ListItem>
                        <asp:ListItem> اوزباكستان</asp:ListItem>
                        <asp:ListItem> اوغندا</asp:ListItem>
                        <asp:ListItem> اوكرانيا</asp:ListItem>
                        <asp:ListItem> ايران</asp:ListItem>
                        <asp:ListItem> ايرلندا</asp:ListItem>
                        <asp:ListItem> ايطاليا</asp:ListItem>
                        <asp:ListItem> برجواى</asp:ListItem>
                        <asp:ListItem> بريطانيا</asp:ListItem>
                        <asp:ListItem> بلجيكا</asp:ListItem>
                        <asp:ListItem> بلغاريا</asp:ListItem>
                        <asp:ListItem> "بنجلادش</asp:ListItem>
                        <asp:ListItem>بنما</asp:ListItem>
                        <asp:ListItem> بورتوركيو</asp:ListItem>
                        <asp:ListItem> بولندا</asp:ListItem>
                        <asp:ListItem> بيرو</asp:ListItem>
                        <asp:ListItem> بيلاروسيا</asp:ListItem>
                        <asp:ListItem> تانزانيا</asp:ListItem>
                        <asp:ListItem> تانغو</asp:ListItem>
                        <asp:ListItem> تاهيتى</asp:ListItem>
                        <asp:ListItem> تايلاند</asp:ListItem>
                        <asp:ListItem> تايوان</asp:ListItem>
                        <asp:ListItem> تركيا</asp:ListItem>
                        <asp:ListItem> >تشاد</asp:ListItem>
                        <asp:ListItem> تشيكوسلوفاكيا</asp:ListItem>
                        <asp:ListItem> توجو</asp:ListItem>
                        <asp:ListItem> تونس</asp:ListItem>
                        <asp:ListItem> جزر السلمون</asp:ListItem>
                        <asp:ListItem> جنوب افريقيا</asp:ListItem>
                        <asp:ListItem> جواتيمالا</asp:ListItem>
                        <asp:ListItem>رواندا</asp:ListItem>
                        <asp:ListItem> روسيا</asp:ListItem>
                        <asp:ListItem>رومانيا</asp:ListItem>
                        <asp:ListItem> زائير</asp:ListItem>
                        <asp:ListItem> زامبيا</asp:ListItem>
                        <asp:ListItem> زيمبابوى</asp:ListItem>
                        <asp:ListItem> ساحل العاج</asp:ListItem>
                        <asp:ListItem> سنغافورة</asp:ListItem>
                        <asp:ListItem> سوريا</asp:ListItem>
                        <asp:ListItem> سولفكيا</asp:ListItem>
                        <asp:ListItem> سويسرا</asp:ListItem>
                        <asp:ListItem> سيراليون</asp:ListItem>
                        <asp:ListItem> سيرلانكا</asp:ListItem>
                        <asp:ListItem> شيلى</asp:ListItem>
                        <asp:ListItem> صربيا</asp:ListItem>
                        <asp:ListItem> عمان</asp:ListItem>
                        <asp:ListItem> غانا</asp:ListItem>
                        <asp:ListItem> غير مدخل</asp:ListItem>
                        <asp:ListItem> غينيا</asp:ListItem>
                        <asp:ListItem> فرنسا</asp:ListItem>
                        <asp:ListItem> فلسطين</asp:ListItem>
                        <asp:ListItem> فنزويلا</asp:ListItem>
                        <asp:ListItem> فنلندا</asp:ListItem>
                        <asp:ListItem> فيتنام</asp:ListItem>
                        <asp:ListItem> فينا</asp:ListItem>
                        <asp:ListItem> قبرص</asp:ListItem>
                        <asp:ListItem> قرقيزيا</asp:ListItem>
                        <asp:ListItem> قطر</asp:ListItem>
                        <asp:ListItem> قيرقيزيا</asp:ListItem>
                        <asp:ListItem> كالدونيا</asp:ListItem>
                        <asp:ListItem> كرواتيا</asp:ListItem>
                        <asp:ListItem> كزاخستان</asp:ListItem>
                        <asp:ListItem> كندا</asp:ListItem>
                        <asp:ListItem> كوبا</asp:ListItem>
                        <asp:ListItem> كوريا الجنوبية</asp:ListItem>
                        <asp:ListItem> كوريا الشمالية</asp:ListItem>
                        <asp:ListItem> كولومبيا</asp:ListItem>
                        <asp:ListItem> كينيا</asp:ListItem>
                        <asp:ListItem> لاتفيا</asp:ListItem>
                        <asp:ListItem> لبنان</asp:ListItem>
                        <asp:ListItem> ليبريا</asp:ListItem>
                        <asp:ListItem> ليبيا</asp:ListItem>
                        <asp:ListItem> مالاجاش</asp:ListItem>
                        <asp:ListItem> مالطا</asp:ListItem>
                        <asp:ListItem> مالى</asp:ListItem>
                        <asp:ListItem> ماليزيا</asp:ListItem>
                        <asp:ListItem> مصر</asp:ListItem>
                        <asp:ListItem> ملدوفا</asp:ListItem>
                        <asp:ListItem> منغوليا</asp:ListItem>
                        <asp:ListItem> موريتانيا</asp:ListItem>
                        <asp:ListItem> موزمبيق</asp:ListItem>
                        <asp:ListItem> موناكو</asp:ListItem>
                        <asp:ListItem> ناميبيا</asp:ListItem>
                        <asp:ListItem> نيبال</asp:ListItem>
                        <asp:ListItem>نيجريا</asp:ListItem>
                        <asp:ListItem> نيكاراجوا</asp:ListItem>
                        <asp:ListItem> نيوزيلاند</asp:ListItem>
                        <asp:ListItem> هنغاريا</asp:ListItem>
                        <asp:ListItem> هولندا</asp:ListItem>
                        <asp:ListItem> يوغوسلافيا</asp:ListItem>
                    </asp:DropDownList>
                    
                    </div>
                             </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        
                        <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="place" ReadOnly="true" Text='<%# Bind("place") %>' CssClass="form-control" runat="server"></asp:TextBox>
                  

                </div>
            </div>
                    </ItemTemplate>
                    <ItemStyle Width="14.66667%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="من" SortExpression="from">
                    <EditItemTemplate>
                       <div class="col-md-2" style="direction: rtl;">
                            <div class="form-group form-md-line-input has-success" style="direction: rtl; width:8.5%">
                    <div class="input-icon right">
                        <asp:TextBox ID="TextBox3"  Width="80px"  CssClass="form-control form-control-inline input-medium date-picker" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months"  runat="server" Text='<%# Bind("from") %>'></asp:TextBox>
                  </div>
                                </div>
                            </div>
                   </EditItemTemplate>
                      <ItemTemplate>
                        <div class="form-group form-md-line-input has-success" style="direction: rtl;">
                    <div class="input-icon right">
                        <asp:TextBox ID="from" ReadOnly="true" CssClass="form-control"  Text='<%# Bind("from") %>' runat="server"></asp:TextBox>
                      

                    </div>
                </div>
                    </ItemTemplate>
                    <ItemStyle Width="8.5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="الى" SortExpression="to">
                    <EditItemTemplate>
                           <div class="col-md-2" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-success" >
                    <div class="input-icon right">
                        <asp:TextBox ID="TextBox4"  Width="80px" CssClass="form-control form-control-inline input-medium date-picker" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months"  runat="server" Text='<%# Bind("to") %>'></asp:TextBox>
                   </div>
                            </div>
                               </div>
                         </EditItemTemplate>
                    <ItemTemplate>
                        <div class="form-group form-md-line-input has-info">
                    <div class="input-icon">
                        <asp:TextBox ID="to" ReadOnly="true" CssClass="form-control" Text='<%# Bind("to") %>' runat="server"></asp:TextBox>

                  

                    </div>
                </div>
                    </ItemTemplate>
                    <ItemStyle Width="8.5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="الدرجة العلمية" SortExpression="degree">
                    <EditItemTemplate>
                       <div class="form-group form-md-line-input has-success" >
                    <div class="input-icon right">
                        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" SelectedValue='<%# Bind("degree") %>'>
                       <asp:ListItem Value="-1"> اختر</asp:ListItem>
                              <asp:ListItem>مؤهل مهني</asp:ListItem>
                             <asp:ListItem>ثانوية عامة</asp:ListItem>
                            <asp:ListItem>دبلوم متوسط</asp:ListItem>
                              <asp:ListItem>بكالوريوس</asp:ListItem>
                             <asp:ListItem>دبلوم عالي</asp:ListItem>
                             <asp:ListItem>ماجستير</asp:ListItem>
                              <asp:ListItem>دكتوراة</asp:ListItem>
                              <asp:ListItem>دبلوم مهني سنتين</asp:ListItem>
                             <asp:ListItem>دورة تمريض 18 شهر</asp:ListItem>
                       

                    </asp:DropDownList>
                        </div>
                           </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                      <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="degree" ReadOnly="true" Text='<%# Bind("degree") %>' CssClass="form-control" runat="server"></asp:TextBox>
                  

                </div>
            </div>
                    </ItemTemplate>
                    <ItemStyle Width="13.66667%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="التخصص">
                    <EditItemTemplate>
                       <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:DropDownList ID="cer" CssClass="form-control" runat="server" SelectedValue='<%# Bind("cer") %>' DataSourceID="SqlDataSource120" DataTextField="txt" DataValueField="id">
                 
 
            </asp:DropDownList>
     
           

                

                    <asp:SqlDataSource ID="SqlDataSource120" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [maj] ORDER BY [txt]"></asp:SqlDataSource>
     
           

                

                </div>
            </div>
                    </EditItemTemplate>
                    <ItemTemplate>



                                   <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="cer1" ReadOnly="true" Text='<%# Bind("cer") %>' CssClass="form-control" runat="server"></asp:TextBox>
                  

                </div>
            </div>

                       
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاريخ الحصول" SortExpression="date_degree">
                    <EditItemTemplate>
                         <div class="col-md-2" style="direction: rtl;">
                        <div class="form-group form-md-line-input has-success" >
                    <div class="input-icon right">
                        <asp:TextBox ID="TextBox6" Width="90px" CssClass="form-control form-control-inline input-medium date-picker"  data-date-format="dd/mm/yyyy" runat="server" Text='<%# Bind("date_degree") %>'></asp:TextBox>
                  </div>
                            </div>
                             </div>
                          </EditItemTemplate>
                    <ItemTemplate>
                       <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="date_degree" ReadOnly="true" Text='<%# Bind("date_degree") %>' CssClass="form-control" runat="server"></asp:TextBox>
                  

                </div>
            </div>
                    </ItemTemplate>
                    <ItemStyle Width="10.66667%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="التقدير" SortExpression="gpa">
                    <EditItemTemplate>
                        <div class="form-group form-md-line-input has-success"  >
                    <div class="input-icon right">
                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"  Width="80px" Text='<%# Bind("gpa") %>'></asp:TextBox>
                        </div>
                            </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <div class="form-group form-md-line-input has-info">
                <div class="input-icon">
                    <asp:TextBox ID="gpa" ReadOnly="true" Text='<%# Bind("gpa") %>' CssClass="form-control" runat="server"></asp:TextBox>
                  

                </div>
            </div>
                    </ItemTemplate>
                    <ItemStyle Width="10.66667%" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="تأكيد"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="تراجع"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1"  Width="27px" runat="server" CssClass="btn btn-icon-only green" CausesValidation="False" CommandName="Edit" Text="تعديل">
                             <i class="fa fa-edit"></i>
                        </asp:LinkButton>         
                         
                        <asp:LinkButton ID="LinkButton2"  Width="27px" CssClass="btn btn-icon-only red" runat="server" CausesValidation="False" CommandName="Delete"
                             OnClientClick="return confirm(&quot;هل انت متأكد&quot;)" Text="حذف">
                             <i class="fa fa-times"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="emp_id" HeaderText="emp_id" Visible="False" />
               
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             DeleteCommand="DELETE FROM [hr_emp_cer] WHERE [id] = @original_id"
             InsertCommand="INSERT INTO [hr_emp_cer] ([emp_id], [uni], [place], [from], [to], [degree], [date_degree], [gpa]) VALUES (@emp_id, @uni, @place, @from, @to, @degree, @date_degree, @gpa)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [hr_emp_cer] where emp_id=@emp  ORDER BY [id] DESC" 
            UpdateCommand="UPDATE [hr_emp_cer] SET  [uni] = @uni, [place] = @place, [from] = @from, [to] = @to, [degree] = @degree, [date_degree] = @date_degree, [gpa] = @gpa,[cer]=@cer WHERE [id] = @original_id ">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="emp_id" Type="Int32" />
                <asp:Parameter Name="uni" Type="String" />
                <asp:Parameter Name="place" Type="String" />
                <asp:Parameter Name="from" Type="String" />
                <asp:Parameter Name="to" Type="String" />
                <asp:Parameter Name="degree" Type="String" />
                <asp:Parameter Name="date_degree" Type="String" />
                <asp:Parameter Name="gpa" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="emp" SessionField="emp_id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="uni" Type="String" />
                <asp:Parameter Name="place" Type="String" />
                <asp:Parameter Name="from" Type="String" />
                <asp:Parameter Name="to" Type="String" />
                <asp:Parameter Name="degree" Type="String" />
                <asp:Parameter Name="date_degree" Type="String" />
                <asp:Parameter Name="gpa" Type="String" />
                <asp:Parameter Name="cer" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            </div>

                <div class="row" >
                    <div class="col-md-6" style="direction: rtl;">
<%--<asp:HyperLink ID="HyperLink1" class="btn btn-primary mt-ladda-btn ladda-button" data-style="expand-right" runat="server">السابق </asp:HyperLink>--%>
                                  <a   class="btn red mt-ladda-btn ladda-button btn-outline"  runat="server" id="h1" data-style="slide-right" data-spinner-color="#333">
                                                    <span class="ladda-label">
                                                        <i class="icon-login"></i> السابق</span>
                                                </a>
             

                  
                    </div>
                     <div class="col-md-6">
    

                           <a   class="btn red mt-ladda-btn ladda-button btn-outline"  runat="server" id="h2" data-style="slide-right" data-spinner-color="#333">
                                                    <span class="ladda-label">
                                                        <i class="icon-logout"></i> التالي</span>
                                                </a>

                    </div>
  
        </div>

                </div>
        
      
    </form>

    </asp:Content>

