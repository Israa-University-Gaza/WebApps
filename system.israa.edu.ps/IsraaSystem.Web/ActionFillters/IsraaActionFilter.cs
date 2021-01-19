using System.Web.Mvc;
using IsraaSystem.Web.Common;

namespace IsraaSystem.Web.ActionFillters
{
    public class IsraaActionFilter : ActionFilterAttribute

    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            filterContext.Result.WithToastSuccess();
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            filterContext.Result.WithToastSuccess();
        }




    }
}