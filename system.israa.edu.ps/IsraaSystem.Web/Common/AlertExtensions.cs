using System.Collections.Generic;
using System.Web.Mvc;

namespace IsraaSystem.Web.Common
{





    public class Alert

    {

        public string Command { get; set; }

        public string Message { get; set; }

        public string FormIdToSubmit { get; set; }


        public Alert(string command, string message, string formIdToSubmit)

        {

            Command = command;
            Message = message;
            FormIdToSubmit = formIdToSubmit;
        }

    }



    public static class AlertExtensions

    {

        private const string Alerts = "_Alerts";



        public static List<Alert> GetAlerts(this TempDataDictionary tempData)

        {

            if (!tempData.ContainsKey(Alerts))

            {

                tempData[Alerts] = new List<Alert>();

            }



            return (List<Alert>)tempData[Alerts];

        }




        public static ActionResult WithToastSuccess(this ActionResult result, string message = "تمت العملية بنجاح", string formIdToSubmit = "israa-form")

        {

            return new AlertDecoratorResult(result, "success", message, formIdToSubmit);

        }



        public static ActionResult WithToastInfo(this ActionResult result, string message, string formIdToSubmit)

        {

            return new AlertDecoratorResult(result, "info", message, formIdToSubmit);

        }



        public static ActionResult WithToastWarning(this ActionResult result, string message, string formIdToSubmit)

        {

            return new AlertDecoratorResult(result, "warning", message, formIdToSubmit);

        }



        public static ActionResult WithToastError(this ActionResult result, string message, string formIdToSubmit)

        {

            return new AlertDecoratorResult(result, "error", message, formIdToSubmit);

        }

    }



    public class AlertDecoratorResult : ActionResult

    {

        public ActionResult InnerResult { get; set; }

        public string Command { get; set; }

        public string Message { get; set; }

        public string FormIdToSubmit { get; set; }



        public AlertDecoratorResult(ActionResult innerResult, string command, string message, string formIdToSubmit)

        {

            InnerResult = innerResult;

            Command = command;

            Message = message;

            FormIdToSubmit = formIdToSubmit;
        }



        public override void ExecuteResult(ControllerContext context)

        {
            var alerts = context.Controller.TempData.GetAlerts();

            alerts.Add(new Alert(Command, Message, FormIdToSubmit));

            InnerResult.ExecuteResult(context);
        }

    }
}