using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Event
/// </summary>
public class Event
{
    public string id { get; set; }
    public string title { get; set; }
    public string start { get; set; }
    public string end { get; set; }


    public string Course { get; set; }
    public string OfferdCourseID { get; set; }
    public string SectionID { get; set; }
    public string SectionNum { get; set; }
    public string InstructorID { get; set; }
    public string Instructor { get; set; }
    public string DayID { get; set; }
    public string RoomID { get; set; }
    public string Room { get; set; }
    public string FromHour { get; set; }
    public string ToHour { get; set; }
}