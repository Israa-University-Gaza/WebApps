using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Security.Cryptography.X509Certificates;
using System.Web.Mvc;
using AutoMapper;
using IsraaSystem.Application.Common.DtoBase;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.Web.MVCGrid.Rendering;
using MVCGrid.Models;
using MVCGrid.Web;

//using MVCGrid.Models;
//using MVCGrid.Web;

namespace IsraaSystem.Web
{
    public static class MVCGridTest
    {
        public static void RegisterGrids()
        {

            GridDefaults gridDefaults = new GridDefaults()
            {

                Paging = true,
                ItemsPerPage = 20,
                NoResultsMessage = "نأسف , لا توجد بيانات لعرضها",
                SummaryMessage = "عرض من {0} الى {1} من اصل {2} مدخلات",
                NextButtonCaption = "التالي",
                PreviousButtonCaption = "السابق",
                ProcessingMessage = "جاري جلب البيانات"

            };
            ColumnDefaults colDefaults = new ColumnDefaults()
            {
                EnableSorting = true
            };



            //MVCGridDefinitionTable.Add("DIGrid", new MVCGridBuilder<EmployeePersonal>()
            //    .WithAuthorizationType(AuthorizationType.AllowAnonymous)
            //    .AddColumns(cols =>
            //    {
            //        // Add your columns here
            //        cols.Add().WithColumnName("ArFirstName")
            //            .WithHeaderText("ArFirstName")
            //            .WithValueExpression(i => i.ArFirstName); // use the Value Expression to return the cell text for this column
            //        cols.Add().WithColumnName("UrlExample")
            //            .WithHeaderText("Edit")
            //            .WithValueExpression((i, c) => c.UrlHelper.Action("ObserversDistributionList", "Observer", new { id = 1 }));

            //    })
            //    .WithSorting(true, "RoomName")
            //    .WithPaging(true, 10)
            //    .WithRetrieveDataMethod((context) =>
            //    {
            //        // Query your data here. Obey Ordering, paging and filtering parameters given in the context.QueryOptions.
            //        // Use Entity Framework, a module from your IoC Container, or any other method.
            //        // Return QueryResult object containing IEnumerable<YouModelItem>
            //        var options = context.QueryOptions;
            //        int totalRecords;
            //        var service = DependencyResolver.Current.GetService<IObserverService>();
            //        IEnumerable<EmployeePersonal> items = service.ListTest(out totalRecords, options.GetLimitOffset(), options.GetLimitRowcount(), options.SortColumnName, options.SortDirection == SortDirection.Dsc);

            //        return new QueryResult<EmployeePersonal>()
            //        {
            //            Items = items,
            //            TotalRecords = totalRecords // if paging is enabled, return the total number of records of all pages
            //        };

            //    })
            //);




            //  MVCGridDefinitionTable.Add("PagingGrid", new MVCGridBuilder<EmployeePersonal>(gridDefaults, colDefaults)
            //      .WithAuthorizationType(AuthorizationType.AllowAnonymous)
            //      .AddColumns(cols =>
            //      {
            //          cols.Add("Id").WithSorting(false).WithValueExpression(p => p.EmployeeID.ToString());
            //          cols.Add("ArFirstName").WithHeaderText("الاسم الاول").WithValueExpression(p => p.ArFirstName).WithFiltering(true); ;
            //          cols.Add("ArFamilyName").WithHeaderText("الاسم الاخير").WithValueExpression(p => p.ArFamilyName);
            //          cols.Add("Mobile").WithHeaderText("رقم الجوال").WithValueExpression(p => p.Mobile);
            //          cols.Add("DateOfBirth").WithHeaderText("تاريخ الميلاد").WithValueExpression(p => p.DateOfBirth.ToString());


            //      })

            //      .WithAuthorizationType(AuthorizationType.AllowAnonymous)
            //      .WithSorting(sorting: true, defaultSortColumn: "LastName", defaultSortDirection: SortDirection.Dsc)
            //      .WithPaging(paging: true, itemsPerPage: 10, allowChangePageSize: true, maxItemsPerPage: 100)
            //      .WithAdditionalQueryOptionNames("search")
            //      .WithRetrieveDataMethod((context) =>
            //      {


            //          var options = context.QueryOptions;
            //          var result = new QueryResult<EmployeePersonal>();
            //          var unitOfWork = DependencyResolver.Current.GetService<IUnitOfWork>();

            //          string globalSearch = options.GetAdditionalQueryOptionString("search");

            //          IQueryable<EmployeePersonal> query;
            //          if (!string.IsNullOrEmpty(globalSearch))
            //          {
            //              query = unitOfWork.HumanResource.EmployeePersonal.OrderBy(x => x.EmployeeID).Where(x => x.ArFirstName.Contains(globalSearch)).AsQueryable();

            //          }
            //          else
            //          {
            //              query = unitOfWork.HumanResource.EmployeePersonal.OrderBy(x => x.EmployeeID).AsQueryable();

            //          }

            //          result.TotalRecords = query.Count();

            //          if (!String.IsNullOrWhiteSpace(options.SortColumnName))
            //          {
            //              query = query.OrderBy(options.SortColumnName + (options.SortDirection == SortDirection.Dsc ? " descending" : ""));
            //          }
            //          if (options.GetLimitOffset().HasValue)
            //          {
            //              query = query.Skip(options.GetLimitOffset().Value).Take(options.GetLimitRowcount().Value);
            //          }

            //          result.Items = query.ToList();
            //          return result;
            //      })
            //  );




            MVCGridDefinitionTable.Add("PermissionGetAllGrid", new MVCGridBuilder<EmplyeeView>(gridDefaults, colDefaults)

              .WithAuthorizationType(AuthorizationType.AllowAnonymous)
                .AddRenderingEngine("MyRenderingEngine", typeof(MyRenderingEngine))
              .AddColumns(cols =>
              {
                  cols.Add("ID").WithSorting(false).WithValueExpression(p => p.ID.ToString());
                  cols.Add("ArFirstName").WithHeaderText("ArFirstName")
                      .WithVisibility(true, true)
                      .WithValueExpression(p => p.ArFirstName)
                      .WithFiltering(true);
                  cols.Add("EmployeeNo").WithHeaderText("EmployeeNo")
                      .WithVisibility(true, true)
                      .WithValueExpression(p => p.EmployeeNo);
                  cols.Add("Mobile").WithHeaderText("Mobile")
                      .WithVisibility(true, true)
                      .WithValueExpression(p => p.Mobile);
                  cols.Add("DateOfBirth").WithHeaderText("DateOfBirth")
                      .WithVisibility(true, true)
                      .WithValueExpression(p => p.DateOfBirth.ToString());
              })
              .WithAuthorizationType(AuthorizationType.AllowAnonymous)
              .WithSorting(sorting: true, defaultSortColumn: "ArFirstName", defaultSortDirection: SortDirection.Dsc)
              .WithPaging(paging: true, itemsPerPage: 10, allowChangePageSize: true, maxItemsPerPage: 100)
              .WithAdditionalQueryOptionNames("search")
              .WithRetrieveDataMethod((context) =>
              {


                  var options = context.QueryOptions;
                  var result = new QueryResult<EmplyeeView>();
                  var unitOfWork = DependencyResolver.Current.GetService<IUnitOfWork>();
                  string globalSearch = options.GetAdditionalQueryOptionString("search");


                  IQueryable<EmplyeeView> query;
                  if (!string.IsNullOrEmpty(globalSearch))
                  {
                      query = unitOfWork.Academic.EmplyeeView.Clean().Where(x => x.ArFirstName.Contains(globalSearch));
                  }
                  else
                  {
                      query = unitOfWork.Academic.EmplyeeView.Clean();
                  }

                  result.TotalRecords = query.Count();
                  if (!String.IsNullOrWhiteSpace(options.SortColumnName))
                  {
                      query = query.OrderBy(options.SortColumnName + (options.SortDirection == SortDirection.Dsc ? " descending" : ""));
                  }
                  if (options.GetLimitOffset().HasValue)
                  {
                      query = query.Skip(options.GetLimitOffset().Value).Take(options.GetLimitRowcount().Value);
                  }

                  result.Items = query.ToList();

                  return result;


              })
          );


















            //    MVCGridDefinitionTable.Add("MarksGetAllGrid", new MVCGridBuilder<MarkDto>(gridDefaults, colDefaults)
            //    .WithAuthorizationType(AuthorizationType.AllowAnonymous)
            //    .AddColumns(cols =>
            //    {
            //        cols.Add("ID").WithSorting(false).WithValueExpression(p => p.ID.ToString());
            //        cols.Add("ArName").WithSorting(false).WithHeaderText("الاسم").WithValueExpression(p => p.ArName.ToString()).WithFiltering(true); ;
            //        cols.Add("MidtermMark").WithHeaderText("علامة النصفي").WithValueExpression(p => p.MidtermMark.ToString());
            //        cols.Add("FinalMark").WithHeaderText("علامة النهائي").WithValueExpression(p => p.FinalMark.ToString());
            //        cols.Add("WorkMark").WithHeaderText("اعمال الفصل").WithValueExpression(p => p.WorkMark.ToString());

            //    })


            //    .WithSorting(sorting: true, defaultSortColumn: "MidtermMark", defaultSortDirection: SortDirection.Dsc)
            //    .WithPaging(paging: true, itemsPerPage: 10, allowChangePageSize: true, maxItemsPerPage: 100)
            //    .WithAdditionalQueryOptionNames("search")
            //    .WithRetrieveDataMethod((context) =>
            //    {
            //        var result = new QueryResult<MarkDto>();
            //        var options = context.QueryOptions;

            //        IMarkService markService = DependencyResolver.Current.GetService<IMarkService>();

            //        IsraaQueryOptionInput israaQueryOptionInput = new IsraaQueryOptionInput()
            //        {
            //            SortColumnName = options.SortColumnName,
            //            SortDirection = options.SortDirection == SortDirection.Dsc,
            //            GlobalSearch = options.GetAdditionalQueryOptionString("search"),
            //            LimitOffset = options.GetLimitOffset(),
            //            LimitRowCount = options.GetLimitRowcount()
            //        };

            //        int? totalRecords;
            //        result.Items = markService.GetAll(israaQueryOptionInput, out totalRecords);

            //        result.TotalRecords = totalRecords;

            //        return result;


            //    })
            //);









            //MVCGridDefinitionTable.Add("GetAcademicSectionsMarks", new MVCGridBuilder<SectionsMarksDto>(gridDefaults, colDefaults)
            //    .WithAuthorizationType(AuthorizationType.AllowAnonymous)
            //    .AddColumns(cols =>
            //    {
            //        cols.Add("ID").WithSorting(false).WithValueExpression(p => p.ID.ToString());
            //        cols.Add("DepartmentName").WithSorting(false).WithHeaderText("DepartmentName").WithValueExpression(p => p.DepartmentName.ToString()).WithFiltering(true); ;
            //        cols.Add("CourseName").WithSorting(false).WithHeaderText("CourseName").WithValueExpression(p => p.CourseName.ToString()).WithFiltering(true); ;
            //        cols.Add("SectionNum").WithSorting(false).WithHeaderText("SectionNum").WithValueExpression(p => p.SectionNum.ToString()).WithFiltering(true); ;
            //        cols.Add("EmployeeName").WithSorting(false).WithHeaderText("EmployeeName").WithValueExpression(p => p.EmployeeName.ToString()).WithFiltering(true); ;
            //        cols.Add("IsMidAcademicAllAccreditation")
            //            .WithHtmlEncoding(false)
            //            .WithSorting(false)
            //            .WithHeaderText("نائب")
            //            .WithValueExpression((p, c) => p.IsMidAcademicAllAccreditation ? "btn-success" : "grey disabled ")
            //            .WithValueTemplate("<a href=\"javascript:;\" class=\"btn btn-xs {Value} \"> نائب</a>");
            //        cols.Add("IsMidDeanAllAccreditation")
            //            .WithHtmlEncoding(false)
            //            .WithSorting(false)
            //            .WithHeaderText("عميد")
            //            .WithValueExpression((p, c) => p.IsMidDeanAllAccreditation ? "btn-success" : "grey disabled ")
            //            .WithValueTemplate("<a href=\"javascript:;\" class=\"btn btn-xs {Value} \"> عميد</a>");
            //        cols.Add("IsMidTeacherAllAccreditation")
            //            .WithHtmlEncoding(false)
            //            .WithSorting(false)
            //            .WithHeaderText("محاضر")
            //            .WithValueExpression((p, c) => p.IsMidTeacherAllAccreditation ? "btn-success" : "grey disabled ")
            //            .WithValueTemplate("<a href=\"javascript:;\" class=\"btn btn-xs {Value} \"> محاضر</a>");

            //    })


            //    .WithSorting(sorting: true, defaultSortColumn: "CourseName", defaultSortDirection: SortDirection.Dsc)
            //    .WithPaging(paging: true, itemsPerPage: 10, allowChangePageSize: true, maxItemsPerPage: 100)
            //    .WithAdditionalQueryOptionNames("search")
            //    .WithRetrieveDataMethod((context) =>
            //    {
            //        var result = new QueryResult<SectionsMarksDto>();
            //        var options = context.QueryOptions;

            //        IMarkService markService = DependencyResolver.Current.GetService<IMarkService>();




            //        var input = new GetAcademicSectionsMarksInOut
            //        {
            //            SemesterId = 11,
            //            QueryOption = new IsraaQueryOptionInput()
            //            {
            //                SortColumnName = options.SortColumnName,
            //                SortDirection = options.SortDirection == SortDirection.Dsc,
            //                GlobalSearch = options.GetAdditionalQueryOptionString("search"),
            //                LimitOffset = options.GetLimitOffset(),
            //                LimitRowCount = options.GetLimitRowcount()
            //            }


            //        };


            //        int? totalRecords;
            //        result.Items = markService.GetAcademicSectionsMarks(input, out totalRecords);

            //        result.TotalRecords = totalRecords;

            //        return result;


            //    })
            //);


















        }
    }
}