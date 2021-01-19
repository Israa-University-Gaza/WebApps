using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IsraaSystem.Web.Areas.FacebookShare.Models
{
    public class Posts
    {
        public List<Post> data { get; set; }
        public Paging paging { get; set; }
    }

    public class Post
    {
        public string id { get; set; }
        public string message { get; set; }
        public string created_time { get; set; }
        public string story { get; set; }
        public string permalink_url { get; set; }
    }

    public class Paging
    {
        public string next { get; set; }
        public string previous { get; set; }
    }
}