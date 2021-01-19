using System;

namespace IsraaSystem.Core.Classic.Shared
{
    public class Pagging
    {
        public string action { get; set; }
        public string updateTargetId { get; set; }

        public int pageCount { get; set; }
        public int pageSize { get; set; }
        int totalRecords { get; set; }
        public int currentPage { get; set; }

        public Pagging()
        {
        }

        public Pagging(string action, string updateTargetId, int currentPage, int pageSize)
        {
            this.action = action;
            this.updateTargetId = updateTargetId;
            this.currentPage = (currentPage == 0) ? 1 : currentPage;
            this.pageSize = (pageSize == 0) ? 50 : pageSize;
        }

        public int TotalRecords
        {
            get
            {
                return totalRecords;
            }
            set
            {
                totalRecords = value;
                pageCount = (int)Math.Ceiling((double)totalRecords / pageSize);
                currentPage = (pageCount < currentPage) ? pageCount : currentPage;
                currentPage = (currentPage < 1) ? 1 : currentPage;
            }
        }
    }
}
