using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Library_LibraryLogin : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ID_TextChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        bool validate = ValidateControls(new WebControl[] { ID });
        DataTable DT = DataAccess.BorrowerDataGet(ID.Text);

        if (validate)
        {
            if (DT.Rows.Count > 0)
            {
                if (
                    DataAccess.LibraryRegisterAddEdit("", ID.Text, UserID) > 0)
                {
                    ShowToast(this, "تم تسجيل الدخول للمكتبة بنجاح", "", "success");
                }
                else ShowToast(this, "هناك خطأ حاول مرة اخرى", "", "error");

            }
            else           ShowToast(this, "رقم الطالب/الموظف غير موجود", "", "error");
        }
        else ShowToast(this, "الرجاء تعبئة البيانات المطلوبة", "", "error");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EmptyControls(new WebControl[] { ID });
    }
}