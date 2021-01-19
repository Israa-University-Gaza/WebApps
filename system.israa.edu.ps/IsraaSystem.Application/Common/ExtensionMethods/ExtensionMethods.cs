using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Dynamic;
using System.Linq.Expressions;
using IsraaSystem.Core.Shared;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaAcademic;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using Newtonsoft.Json;

namespace IsraaSystem.Application.Common.ExtensionMethods
{
    public static class ExtensionMethods
    {



        public static IQueryable<T> Clean<T>(this IQueryable<T> source)
        {
            if (typeof(T).GetProperty("IsDelete") != null)
                source = source.Where("IsDelete != true");

            if (typeof(T).GetProperty("IsActive") != null)
                source = source.Where("IsActive != false");

            if (typeof(T).GetProperty("HasEdit") != null)
                source = source.Where("HasEdit != true");

            return source;

        }

        public static IEnumerable<T> Clean<T>(this IEnumerable<T> source)
        {
            if (typeof(T).GetProperty("IsDelete") != null)
                source = source.Where("IsDelete != true");

            if (typeof(T).GetProperty("IsActive") != null)
                source = source.Where("IsActive == true");

            if (typeof(T).GetProperty("HasEdit") != null)
                source = source.Where("HasEdit == false");

            return source;

        }




        public static IQueryable<T> IsNotDelete<T>(this IQueryable<T> source)
        {
            if (typeof(T).GetProperty("IsDelete") != null)
                source = source.Where("IsDelete != true");
            return source;

        }



        public static IEnumerable<T> IsNotDelete<T>(this IEnumerable<T> source)
        {
            if (typeof(T).GetProperty("IsDelete") != null)
                source = source.Where("IsDelete != true");
            return source;


        }



        public static IQueryable<T> IsActive<T>(this IQueryable<T> source)
        {
            return source.Where("IsActive == true");
        }






        //used by LINQ to SQL
        public static IQueryable<TSource> Page<TSource>(this IQueryable<TSource> source, int page, int pageSize)
        {
            return source.Skip((page - 1) * pageSize).Take(pageSize);
        }

        //used by LINQ
        public static IEnumerable<TSource> Page<TSource>(this IEnumerable<TSource> source, int page, int pageSize)
        {
            return source.Skip((page - 1) * pageSize).Take(pageSize);
        }



        public static IEnumerable<TSource> Sort<TSource>(this IEnumerable<TSource> source, string sortBy, bool reverse = false)
        {


            if (!String.IsNullOrWhiteSpace(sortBy))
            {
                return source.OrderBy(sortBy + (reverse ? " descending" : ""));
            }
            else
            {
                return source;
            }




        }

        public static IQueryable<TSource> Sort<TSource>(this IQueryable<TSource> source, string sortBy, bool reverse = false)
        {


            if (!String.IsNullOrWhiteSpace(sortBy))
            {
                return source.OrderBy(sortBy + (reverse ? " descending" : ""));
            }
            else
            {
                return source;
            }




        }


        public static IQueryable<TSource> AplayQueryOptions<TSource>(this IQueryable<TSource> source, QueryOptions queryOptions)
        {



            //SORT
            if (!(string.IsNullOrEmpty(queryOptions.sortColumnName)))
                source = source.Sort(queryOptions.sortColumnName, queryOptions.sortColumnDir == QueryOptionOrderDirection.desc);


            //totalRecords
            queryOptions.recordsTotal = source.Count();
            queryOptions.recordsFiltered = source.Count();

            //Paging
            source = source.Skip(queryOptions.start);
            if (queryOptions.length > 0) source = source.Take(queryOptions.length);

            return source;

        }



        public static string QueryOptionsGetJson<TSource>(this IEnumerable<TSource> data, IQueryOptions queryOptions)
        {

            var obj = new
            {
                queryOptions.draw,
                queryOptions.recordsFiltered,
                recordsTotal = queryOptions.recordsFiltered,
                queryOptions.customActionMessage,
                queryOptions.customActionStatus,
                data
            };


            var jsonSerializerSettings = new JsonSerializerSettings()
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };

            return JsonConvert.SerializeObject(obj, Formatting.None, jsonSerializerSettings);


        }


        //public static IEnumerable<TSource> SortAndPage<TSource>(this IEnumerable<TSource> source, int page, int pageSize, string sortBy, bool reverse = false)
        //{
        //    if (!string.IsNullOrEmpty(sortBy))
        //    {
        //        source = source.OrderBy(sortBy + (reverse ? " descending" : ""));
        //    }
        //    return source.Page(page, pageSize);


        //}



        //public static IQueryable<TSource> SortAndPage<TSource>(this IQueryable<TSource> source, int page, int pageSize, string sortBy, bool reverse = false)
        //{



        //    if (!string.IsNullOrEmpty(sortBy))
        //    {
        //        source = source.OrderBy(sortBy + (reverse ? " descending" : ""));
        //    }
        //    return source.Page(page, pageSize);


        //}



        public static IQueryable<TSource> SortAndPage<TSource>(this IQueryable<TSource> query, int? limitOffset, int? limitRowCount, string sortColumnName, bool sortDirection)
        {
            //Sort
            query = query.Sort(sortColumnName, sortDirection);

            //Paging
            if (limitOffset.HasValue)
            {
                query = query.Skip(limitOffset.Value).Take(limitRowCount.Value);
            }

            return query;

        }


        public static IEnumerable<TSource> WhereIf<TSource>(this IEnumerable<TSource> source, bool condition, Func<TSource, bool> predicate)
        {
            return condition ? source.Where(predicate) : source;
        }


        public static IQueryable<T> WhereIf<T>(this IQueryable<T> source, bool condition, Expression<Func<T, bool>> predicate)
        {

            return condition ? source.Where(predicate) : source;

        }



        public static int IsraaCDayID(this DateTime value)
        {

            var day = Convert.ToInt32(value.Date.DayOfWeek);


            return day == 6 ? 15 : day + 16;


        }

        public static int ReverseIsraaCDayID(this int value)
        {
            return value == 15 ? 6 : value - 16;
        }


        public static IEnumerable<T> ClearmMark<T>(this IEnumerable<T> source) where T : Mark
        {
            return source.Where("IsDelete == false").Where("HasEdit == false");

        }


        public static IQueryable<T> ClearmMark<T>(this IQueryable<T> source) where T : Mark
        {
            return source.Where("IsDelete == false").Where("HasEdit == false");

        }



        public static string GetEmpName(this EmployeePersonal source, int nameType)
        {
            var result = source.ArFirstName + " " + source.ArSecoundName + " " + source.ArFamilyName;
            return result;

        }






        public static bool IsNullOrEmpty<T>(this ICollection<T> source)
        {
            return source == null || source.Count <= 0;
        }


        public static bool AddIfNotContains<T>(this ICollection<T> source, T item)
        {
            if (source == null)
            {
                throw new ArgumentNullException("source");
            }

            if (source.Contains(item))
            {
                return false;
            }

            source.Add(item);
            return true;
        }




        public static TEntity FirstOrDefaultCache<TEntity>(this DbSet<TEntity> queryable, Expression<Func<TEntity, bool>> condition)
            where TEntity : class
        {
            return queryable
                       .Local.FirstOrDefault(condition.Compile()) // find in local cache
                   ?? queryable.FirstOrDefault(condition); // if local cache returns null check the db
        }


        public static IQueryable<T> StudentsCount<T>(this IQueryable<T> source) where T : Section
        {
            return source.Where("IsDelete == false").Where("HasEdit == false");

        }






    }
}