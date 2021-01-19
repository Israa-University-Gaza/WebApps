using System;
using System.Web;
using System.Web.Mvc;

namespace IsraaSystem.Web.Security
{
    public abstract class BaseViewPage : WebViewPage
    {
        public virtual IsraaUser ThisUser
        {
            get { return new IsraaUser(Convert.ToInt32(HttpContext.Current.User.Identity.Name)); }
        }
    }
    public abstract class BaseViewPage<TModel> : WebViewPage<TModel>
    {
        public virtual IsraaUser ThisUser
        {
            get { return new IsraaUser(Convert.ToInt32(HttpContext.Current.User.Identity.Name)); }
        }
    }
}

