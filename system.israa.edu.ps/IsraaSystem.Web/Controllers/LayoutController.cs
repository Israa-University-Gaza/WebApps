using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Web.Security;

namespace IsraaSystem.Web.Controllers
{
    [Authorize]
    public class LayoutController : Controller
    {
        private IsraaUser ThisUser()
        {
            return new IsraaUser(Convert.ToInt32(User.Identity.Name));
        }

        [ChildActionOnly]
        public PartialViewResult dropdown_user()
        {
            var model = ThisUser();
            return PartialView("dropdown_user", model);
        }

        [ChildActionOnly]
        public PartialViewResult dropdown_Programs()
        {
            var model = ThisUser();
            return PartialView("_Programs", model);
        }



        [ChildActionOnly]
        public PartialViewResult DropdownNotification()
        {
            return PartialView();
        }


        public ActionResult SideBarNav()
        {
            string area = "Home";
            if (HttpContext.Request.RequestContext.RouteData.DataTokens["area"] != null)
            {
                area = HttpContext.Request.RequestContext.RouteData.DataTokens["area"].ToString().ToLower();

            }
            NavItemStart navItemStart = GetNavItems(area);



            return PartialView("_Menu", navItemStart);
        }


        public ActionResult MenuHorizontal()
        {
            string area = "Home";
            if (HttpContext.Request.RequestContext.RouteData.DataTokens["area"] != null)
            {
                area = HttpContext.Request.RequestContext.RouteData.DataTokens["area"].ToString().ToLower();

            }
            NavItemStart navItemStart = GetNavItems(area);



            return PartialView("_MenuHorizontal", navItemStart);
        }

        private NavItemStart GetNavItems(string area)
        {
            NavItemStart navItemStart = new NavItemStart(ThisUser(), "Home", "الرئيسية", "#");

            if (area == "repository")
            {


                navItemStart = new NavItemStart(new IsraaUser(11), "RepositoryMenu", "إدارة المخازن", "/Repository/Material", "icon-bar-chart")
                    .AddItem(new NavItemHeading("navItemheading", "الاصناف والموارد")
                        .AddItem(new NavItemDefinition(
                            name: "menu-material",
                            displayName: "ادارة الاصناف",
                            icon: "icon-user-follow",
                            area: "Repository",
                            controller: "Material",
                            action: "Index"))
                            .AddItem(new NavItemDefinition(
                            name: "menu-material-unit",
                            displayName: "وحدات الأصناف",
                            icon: "icon-user-follow",
                            area: "Repository",
                            controller: "MaterialUnit",
                            action: "Index"))

                        .AddItem(new NavItemDefinition(
                            name: "menu-material-type",
                            displayName: "تصنيفات الأصناف",
                            icon: "icon-user-follow",
                            area: "Repository",
                            controller: "MaterialType",
                            action: "Index"))
                            .AddItem(new NavItemDefinition(
                            name: "menu-supplier",
                            displayName: "الموردون",
                            icon: "icon-user-follow",
                            area: "Repository",
                            controller: "Supplier",
                            action: "Index"))
                            .AddItem(new NavItemDefinition(
                            name: "menu-repository-department",
                            displayName: "أقسام المخزن",
                            icon: "icon-user-follow",
                            area: "Repository",
                            controller: "Department",
                            action: "Index"))
                    ).AddItem(new NavItemHeading("navItemheading", "ادارة حركات المخزن")
                        .AddItem(new NavItemDefinition(
                                name: "menu-transaction",
                                displayName: "الحركات",
                                icon: "icon-user-follow",
                                area: "",
                                controller: "",
                                action: "")
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-import",
                                displayName: "الواردات",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "Index"
                            ))
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-Export",
                                displayName: "الصادرات",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "IndexExport"
                            ))
                             .AddItem(new NavSubItemDefinition(
                                name: "menu-Movment",
                                displayName: "النقل",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "IndexMovment"
                            ))
                             .AddItem(new NavSubItemDefinition(
                                name: "menu-Destruction",
                                displayName: "الإتلاف",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "IndexDestruction"
                            ))
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-RestorationSupplier",
                                displayName: "الارجاع الى المورد",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "IndexRestorationSupplier"
                            ))
                             .AddItem(new NavSubItemDefinition(
                                name: "menu-RestorationDepartment",
                                displayName: "الارجاع الى المخزن",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "IndexRestorationDepartment"
                            ))
                               .AddItem(new NavSubItemDefinition(
                                name: "menu-Inventory",
                                displayName: "الجرد",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "Transaction",
                                action: "IndexInventory"
                            ))
                            )
                            .AddItem(new NavItemDefinition(
                                name: "menu-Custody",
                                displayName: "العهد",
                                icon: "icon-user-follow",
                                area: "",
                                controller: "",
                                action: "")
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-ExportCustody",
                                displayName: "صرف عهدة",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "CustodyDetails",
                                action: "IndexExportCustody"
                            ))
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-WithdrawalCustody",
                                displayName: "سحب عهدة",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "CustodyDetails",
                                action: "IndexWithdrawalCustody"
                            ))
                             .AddItem(new NavSubItemDefinition(
                                name: "menu-MovmentCustody",
                                displayName: "نقل عهدة",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "CustodyDetails",
                                action: "IndexMovmentCustody"
                            ))
                            )
                               .AddItem(new NavItemDefinition(
                                name: "menu-StoreStatistics",
                                displayName: "احصائية المخزن",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "RepositoryBalance",
                                action: "Index"))
                                .AddItem(new NavItemDefinition(
                                name: "menu-MaterialCard",
                                displayName: "بطاقة الصنف",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "RepositoryBalance",
                                action: "IndexAllMaterial"))
                                .AddItem(new NavItemDefinition(
                                name: "menu-RepositoryCustody",
                                displayName: "عهد الموظفين",
                                icon: "icon-user-follow",
                                area: "Repository",
                                controller: "CustodyDetails",
                                action: "IndexRepositoryCustody"))
                    );

            }
            else if (area == "academic")
            {
                navItemStart = new NavItemStart(new IsraaUser(11), "AcademicMenu", "الشؤون الأكاديمية", "/Academic/Dashboard", "icon-bar-chart")
                    .AddItem(new NavItemHeading("navItemheading", "الجداول الدراسية")
                        .AddItem(new NavItemDefinition(
                            name: "menu-offerd-course-add",
                            displayName: "طرح مساق جديد",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "OfferdCourse",
                            action: "Add"))
                        .AddItem(new NavItemDefinition(
                            name: "menu-offerd-course",
                            displayName: "إدارة المساقات المطروحة",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "OfferdCourse",
                            action: "Index"))

                        .AddItem(new NavItemDefinition(
                            name: "menu-study-table",
                            displayName: "برنامج الجداول الدراسية",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "StudyTable",
                            action: "Index"))
                        .AddItem(new NavItemDefinition(
                            name: "menu-study-table-print",
                            displayName: "طباعة الجداول الدراسية",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "StudyTable",
                            action: "Print"))
                    ).AddItem(new NavItemHeading("navItemheading", "ادارة العلامات")
                        .AddItem(new NavItemDefinition(
                                name: "menu-mark",
                                displayName: "اعتماد العلامات",
                                icon: "icon-user-follow",
                                area: "",
                                controller: "",
                                action: "")
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-mark-studentMark",
                                displayName: "اعتماد علامات الطلاب",
                                icon: "icon-user-follow",
                                area: "Academic",
                                controller: "Mark",
                                action: "StudentMark"
                            ))
                            .AddItem(new NavSubItemDefinition(
                                name: "menu-mark-sectionMark",
                                displayName: "اعتماد علامات الشعب",
                                icon: "icon-user-follow",
                                area: "Academic",
                                controller: "SectionMark",
                                action: "Index"
                            )).AddItem(new NavSubItemDefinition(
                                name: "menu-mark-special",
                                displayName: "اعتماد المكتبي - الصيفي",
                                icon: "icon-user-follow",
                                area: "Academic",
                                controller: "Mark",
                                action: "SpecialFinalMark"
                            )))
                    ).AddItem(new NavItemHeading("navItemheading", "إدارة الطلاب")
                        .AddItem(new NavItemDefinition(
                            name: "menu-academic-warning",
                            displayName: "عرض الطلاب",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "Student",
                            action: "Index"))
                        .AddItem(new NavItemDefinition(
                            name: "menu-academic-warning",
                            displayName: "التحذير الأكاديمي",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "AcademicWarning",
                            action: "Index")))
                    .AddItem(new NavItemHeading("navItemheading", "إدارة المعادلات")
                        .AddItem(new NavItemDefinition(
                            name: "menu-transformatio",
                            displayName: "عرض المعادلات",
                            icon: "icon-user-follow",
                            area: "Academic",
                            controller: "Transformation",
                            action: "Index")));

            }
            else if (area == "exam")
            {
                navItemStart = new NavItemStart(new IsraaUser(11), "examMenu", "الإمتحانات", "/Exam/Observer", "icon-bar-chart")
                    .AddItem(new NavItemHeading("navItemheading", "المراقبين")
                        .AddItem(new NavItemDefinition(
                            name: "menu-observer-observersDistribution",
                            displayName: "توزيع المراقبين",
                            icon: "icon-user-follow",
                            area: "Exam",
                            controller: "Observer",
                            action: "ObserversDistribution")));



            }
            else if (area == "affairs")
            {
                navItemStart = new NavItemStart(new IsraaUser(11), "affairsMenu", "احصائيات", "/affairs/Dashboard", "icon-bar-chart")
                    .AddItem(new NavItemHeading("navItemheading", "ادارة ساعات التطوع")
                        .AddItem(new NavItemDefinition(
                            name: "menu-observer-observersDistribution",
                            displayName: "ساعات التطوع",
                            icon: "icon-user-follow",
                            area: "Affairs",
                            controller: "StudentVolunteer",
                            action: "Index"))).AddItem(new NavItemHeading("navItemheading", "إدارة الطلاب")
                        .AddItem(new NavItemDefinition(
                            name: "menu-academic-warning",
                            displayName: "عرض الطلاب",
                            icon: "icon-user-follow",
                            area: "Affairs",
                            controller: "Student",
                            action: "Index")));



            }
            else if (area == "administrator")
            {
                navItemStart = new NavItemStart(new IsraaUser(11), "administratorMenu", "مدير الأنظمة", "/Administrator/Dashboard", "icon-bar-chart")
                    .AddItem(new NavItemHeading("navItemheading", "وحدات المنظمة")
                        .AddItem(new NavItemDefinition(
                            name: "menu-administrator-organizationUnit",
                            displayName: "وحدات الأنظمة",
                            icon: "icon-user-follow",
                            area: "Administrator",
                            controller: "OrganizationUnit",
                            action: "Index"))
                        .AddItem(new NavItemDefinition(
                            name: "menu-administrator-organizationJop",
                            displayName: "وظائف الأنظمة",
                            icon: "icon-user-follow",
                            area: "Administrator",
                            controller: "OrganizationJop",
                            action: "Index"
                        ))
                    );

            }
            return navItemStart;
        }

    }



    public class NavItemStart
    {
        public string Name { get; }

        public string DisplayName { get; set; }

        public object CustomData { get; set; }

        public string Icon { get; set; }


        public string Url { get; set; }

        public IsraaUser User { get; set; }


        public List<NavItemHeading> Items { get; set; }

        public NavItemStart(IsraaUser user, string name, string displayName, string url = null, string icon = null, object customData = null)
        {
            if (string.IsNullOrEmpty(name))
                throw new ArgumentNullException("name", "Menu name can not be empty or null.");

            if (displayName == null)
                throw new ArgumentNullException("displayName", "Display name of the menu can not be null.");

            Name = name;
            DisplayName = displayName;
            User = user;
            Url = url;
            Icon = icon;
            CustomData = customData;

            Items = new List<NavItemHeading>();
        }

        public NavItemStart AddItem(NavItemHeading menuItem)
        {
            menuItem.User = this.User;
            Items.Add(menuItem);
            return this;
        }

        public void RemoveItem(string name)
        {
            Items.RemoveAll(m => m.Name == name);
        }
    }



    public class NavItemHeading
    {

        public string Name { get; }

        public string DisplayName { get; set; }

        public object CustomData { get; set; }



        public IsraaUser User { get; set; }

        public List<NavItemDefinition> Items { get; set; }


        public NavItemHeading(string name, string displayName, object customData = null)
        {
            if (string.IsNullOrEmpty(name))
                throw new ArgumentNullException("name", "Menu name can not be empty or null.");

            if (displayName == null)
                throw new ArgumentNullException("displayName", "Display name of the menu can not be null.");

            Name = name;
            DisplayName = displayName;
            CustomData = customData;

            Items = new List<NavItemDefinition>();
        }

        public NavItemHeading AddItem(NavItemDefinition menuItem)
        {
            menuItem.User = this.User;
            if (menuItem.RequiredPermission)
            {
                string requiredPermission =
                    String.Format("{0}.{1}.{2}", menuItem.Area, menuItem.Controller, menuItem.Action);
                if (User.IsSuperAdmin) Items.Add(menuItem);
                if (User.HasAction(requiredPermission))
                {
                    Items.Add(menuItem);
                }

                return this;
            }
            else
            {
                Items.Add(menuItem);

            }
            return this;
        }

        public void RemoveItem(string name)
        {
            Items.RemoveAll(m => m.Name == name);
        }
    }




    public class NavItemDefinition
    {
        public string Name { get; }

        public string DisplayName { get; set; }

        public object CustomData { get; set; }

        public int Order { get; set; }

        public string Icon { get; set; }

        public string _url;
        public string Area { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }

        public bool RequiredPermission { get; set; }

        public IsraaUser User { get; set; }


        public List<NavSubItemDefinition> Items { get; set; }

        public string Url
        {
            get { return "/" + Area + "/" + Controller + "/" + Action; }
            set { _url = value; }
        }


        public NavItemDefinition(string name, string displayName, string area, string controller, string action, bool requiredPermission = false, int order = 0, string icon = null, object customData = null)
        {
            if (string.IsNullOrEmpty(name))
                throw new ArgumentNullException("name", "Menu name can not be empty or null.");

            if (displayName == null)
                throw new ArgumentNullException("displayName", "Display name of the menu can not be null.");

            Name = name;
            DisplayName = displayName;
            Area = area;
            Controller = controller;
            Action = action;
            RequiredPermission = requiredPermission;
            Order = order;
            Icon = icon;
            CustomData = customData;

            Items = new List<NavSubItemDefinition>();
        }

        public NavItemDefinition AddItem(NavSubItemDefinition menuItem)
        {
            menuItem.User = this.User;
            if (menuItem.RequiredPermission)
            {
                string requiredPermission =
                    String.Format("{0}.{1}.{2}", menuItem.Area, menuItem.Controller, menuItem.Action);
                if (User.IsSuperAdmin) Items.Add(menuItem);
                if (User.HasAction(requiredPermission))
                {
                    Items.Add(menuItem);
                }

                return this;
            }
            else
            {
                Items.Add(menuItem);

            }
            return this;
        }

        public void RemoveItem(string name)
        {
            Items.RemoveAll(m => m.Name == name);
        }
    }



    public class NavSubItemDefinition
    {
        public string Name { get; }

        public string DisplayName { get; set; }

        public int Order { get; set; }

        public string Icon { get; set; }

        private string _url;

        public bool RequiredPermission { get; set; }

        public bool RequiresAuthentication { get; set; }

        public bool IsLeaf => Items.IsNullOrEmpty();

        public string Target { get; set; }

        public object CustomData { get; set; }

        public bool IsEnabled { get; set; }

        public bool IsVisible { get; set; }

        public IsraaUser User { get; set; }

        public string Area { get; }
        public string Controller { get; }
        public string Action { get; }


        public virtual List<NavSubItemDefinition> Items { get; }

        public string Url
        {
            get { return "/" + Area + "/" + Controller + "/" + Action; }
            set { _url = value; }
        }


        public NavSubItemDefinition(string name, string displayName, string area, string controller, string action, string icon = null,
            bool requiresAuthentication = false, bool requiredPermission = false, int order = 0,
            object customData = null, string target = null, bool isEnabled = true, bool isVisible = true)
        {
            Name = name;
            DisplayName = displayName;
            Area = area;
            Controller = controller;
            Action = action;
            Icon = icon;
            RequiresAuthentication = requiresAuthentication;
            RequiredPermission = requiredPermission;
            Order = order;
            CustomData = customData;
            Target = target;
            IsEnabled = isEnabled;
            IsVisible = isVisible;

            Items = new List<NavSubItemDefinition>();
        }

        public NavSubItemDefinition AddItem(NavSubItemDefinition menuItem)
        {
            menuItem.User = this.User;
            if (menuItem.RequiredPermission)
            {
                string requiredPermission =
                    String.Format("{0}.{1}.{2}", menuItem.Area, menuItem.Controller, menuItem.Action);
                if (User.IsSuperAdmin) Items.Add(menuItem);
                if (User.HasAction(requiredPermission))
                {
                    Items.Add(menuItem);
                }

                return this;
            }
            else
            {
                Items.Add(menuItem);

            }
            return this;
        }

        public void RemoveItem(string name)
        {
            Items.RemoveAll(m => m.Name == name);
        }
    }




}

