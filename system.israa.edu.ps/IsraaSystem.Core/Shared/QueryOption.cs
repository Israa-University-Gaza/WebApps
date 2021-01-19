using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;


namespace IsraaSystem.Core.Shared
{
    public interface IQueryOptions
    {
        int draw { get; set; }
        int start { get; set; }
        int length { get; set; }
        int recordsFiltered { get; set; }
        int recordsTotal { get; set; }

        QueryOptionColumnSearch search { get; set; }
        List<QueryOptionColumnOrder> order { get; set; }
        List<QueryOptionColumn> columns { get; set; }
        string sortColumnName { get; }
        QueryOptionOrderDirection sortColumnDir { get; }
        string customActionType { get; set; }
        string customActionName { get; set; }
        List<int> SelectedItems { get; set; }
        string customActionMessage { get; set; }
        string customActionStatus { get; set; }
        void AddSuccessAlert(string msg = "تمت العملية بنجاح");
    }

    public class QueryOptions : IQueryOptions
    {
        public int draw { get; set; }

        public int start { get; set; }
        public int length { get; set; }

        //
        private string _sortColumnName;

        public int recordsFiltered { get; set; }
        public int recordsTotal { get; set; }

        public QueryOptionColumnSearch search { get; set; }
        public List<QueryOptionColumnOrder> order { get; set; }
        public List<QueryOptionColumn> columns { get; set; }


        public string sortColumnName
        {
            get
            {
                return columns.ElementAtOrDefault(order.FirstOrDefault().column).name;
            }
        }




        public QueryOptionOrderDirection sortColumnDir
        {
            get
            {
                var queryOptionOrderDirection = order.FirstOrDefault().dir;
                return queryOptionOrderDirection;
            }
        }

        public string customActionType { get; set; }
        public string customActionName { get; set; }

        public List<int> SelectedItems { get; set; }

        public string customActionMessage { get; set; }
        public string customActionStatus { get; set; }

        public string SearchKey
        {
            get { return search.value; }
        }


        public void AddSuccessAlert(string msg = "تمت العملية بنجاح")
        {
            customActionMessage = msg;

            customActionStatus = "OK";
        }

        public void AddErrorAlert(string msg = "خطأ في العملية")
        {
            customActionMessage = msg;

            customActionStatus = "Error";
        }



    }

    public enum QueryOptionOrderDirection
    {
        asc, desc
    }

    public class QueryOptionColumnOrder
    {
        public int column { get; set; }
        public QueryOptionOrderDirection dir { get; set; }
    }
    public class QueryOptionColumnSearch
    {
        public string value { get; set; }
        public string regex { get; set; }
    }

    public class QueryOptionColumn
    {
        public string data { get; set; }
        public string name { get; set; }
        public Boolean searchable { get; set; }
        public Boolean orderable { get; set; }
        public QueryOptionColumnSearch search { get; set; }

    }

}