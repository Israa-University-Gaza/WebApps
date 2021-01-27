using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Academic_AcadmicEvaluateEmployee : UserPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
               if (Session["EvalutionEmployee"] != null)
            {
                string[] data = Session["EvalutionEmployee"].ToString().Split(',');
                EmpID.Text = data[0];
                Name.Text = data[1];
                ColageName.Text = data[2];
                if( data[3]!=null)    Label1.Text = data[3];
                Session["EvalutionEmployee"] = null;
               
            }

            else
            {
                Response.Redirect("EvaluationChooseEmployee.aspx");
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool valid = true;
        DataTable dtEvaluationQuestionAnswer = new DataTable();
        dtEvaluationQuestionAnswer.Columns.Add("EvaluationQuestionID", typeof(int));
        dtEvaluationQuestionAnswer.Columns.Add("EvaluationQuestionAnswer", typeof(int));

        foreach (RepeaterItem groupItem in Repeater1.Items)
        {
            Repeater repeater11 = (Repeater)groupItem.FindControl("repeater11");
        foreach (RepeaterItem item in repeater11.Items)
        {
            Label EvaluationQuestionID = (Label)item.FindControl("EvaluationQuestionID");
            RadioButtonList rblAnswers = (RadioButtonList)item.FindControl("rblAnswers");

            if (rblAnswers.SelectedItem != null)
            {
                DataRow r = dtEvaluationQuestionAnswer.NewRow();
                r["EvaluationQuestionID"] = EvaluationQuestionID.Text;
                r["EvaluationQuestionAnswer"] = rblAnswers.SelectedValue;
                dtEvaluationQuestionAnswer.Rows.Add(r);
            }
            else
            {
                valid = false;
                break;
            }
        }

       
        }
        

        if (valid)
        {

            DataTable DT = DataAccess.AddEvaluationEmployeeQAnswer(EmpID.Text, dtEvaluationQuestionAnswer, EmployeeID);
            ShowMsg(DT.Rows[0]["msg"].ToString(), (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0) ? "success" : "danger");
            if (Convert.ToInt32(DT.Rows[0]["status"].ToString()) > 0)
                Response.Redirect("EvaluationChooseEmployee.aspx");




        }
        else
        {
            ShowMsg("الرجاء الإجابة علي جميع الأسئلة المدرجة ...", "danger");
        }
    }
    //protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        Label lblId = (Label)e.Item.FindControl("EvaluationQuestionID");
    //        RadioButtonList RadioButtonList1 = (RadioButtonList)e.Item.FindControl("rblAnswers");
    //        for (int vLoop = 0; vLoop < RadioButtonList1.Items.Count; vLoop++)
    //        {
    //            RadioButtonList1.Items[vLoop].Attributes.Add("onclick", "javascript:GetRadioButtonSelectedValue()");
    //        }
    //    }
    //}
    public void ShowMsg(string msg = "", string status = "warning")
    {
        lblMsg.Text = msg;
        divMsg.Attributes.Add("Class", "alert alert-" + status + " alert-dismissable");
    }
    protected void Repeater11_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (((Label)e.Item.FindControl("answer")).Text!="-1")
        ((RadioButtonList)e.Item.FindControl("rblAnswers")).SelectedValue = ((Label)e.Item.FindControl("answer")).Text;


        //javascript     
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            RadioButtonList rbClick = (RadioButtonList)e.Item.FindControl("rblAnswers");
            Label lblAspradiobuttonValue = (Label)e.Item.FindControl("lblAspradiobuttonValue");
            rbClick.Attributes.Add("class", "item-value");
            rbClick.Attributes.Add("data-value", rbClick.SelectedValue);
        }
    
        
    }
}