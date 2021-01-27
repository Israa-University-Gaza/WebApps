using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Config
/// </summary>
public class Config
{
    static string semesterID="8";
    public Config()
    {
        semesterID = "8";
    }
    public static string SemesterID
    {
        get
        {
            return semesterID;
        }
    }






}



public enum StudentInstallmentAccreditation
{

    loansDivisionAccerdiation = 5124,
    affairsManagerAccreditation = 5105,
    academicAccerdiation = 5487,
    managmentAccreditation = 5009,

};