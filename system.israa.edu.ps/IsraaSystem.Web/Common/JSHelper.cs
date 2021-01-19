using System;
using IsraaSystem.Application.Common.Enums;

namespace IsraaSystem.Web.Common
{
    public static class JsHelper
    {
        public static string ShowToast(ToastTypeEnum toastTypeEnum, string msg)
        {
            return "showToast('" + msg + "','" + toastTypeEnum + "')";
        }


        public static String SubmitForm(string FormId)
        {
            return " $('#" + FormId + "').submit();";
        }

    }
}