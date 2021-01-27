using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
public class Department
{
    public string id { get; set; }
    public string name { get; set; }
    public string title { get; set; }
    public string relationship { get; set; }
    public List<Department> children { get; set; }
}