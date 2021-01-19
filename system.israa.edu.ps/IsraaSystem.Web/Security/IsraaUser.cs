using IsraaSystem.Application.HumanResource;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaPermission;
using IsraaSystem.DataAccess.Sql.HumanResource;


namespace IsraaSystem.Web.Security
{
    public class IsraaUser
    {
        #region parm
        public Employee employee { get; set; }
        public List<Permission> Permissions { get; set; }
        public List<Role> roles { get; set; }

        public List<Area> Areas { get; set; }
        public string ImageUrl { get; set; }

        public string DisplayName { get; set; }

        public bool IsSuperAdmin { get; set; }
        #endregion



        #region constructors

        public IsraaUser(int id)
        {

            if (HttpContext.Current.Session["IsraaUser"] == null)
            {
                using (IsraPermissionEntities _data = new IsraPermissionEntities())
                {

                    employee = _data.Employee.Find(id);
                    if (employee == null) return;


                    Areas = employee.EmployeeArea.Select(x => x.Area).ToList();
                    if (employee.EmployeeRole.Count > 0)
                    {

                        roles = new List<Role>();
                        Permissions = new List<Permission>();


                        employee.EmployeeRole.ToList().ForEach(x =>
                        {

                            if (!x.IsActive || x.IsDelete) return;

                            //! all time roles
                            if (x.AvailableFrom == null & x.AvailableTo == null)
                            {
                                roles.Add(x.Role);
                            }
                            //! time range roles
                            if (x.AvailableFrom != null & x.AvailableTo != null)
                            {
                                if (DateTime.Now.Date >= x.AvailableFrom.Value.Date && DateTime.Now.Date <= x.AvailableTo.Value.Date)
                                {
                                    roles.Add(x.Role);
                                }
                            }
                            //! startDate to forever roles
                            if (x.AvailableFrom != null & x.AvailableTo == null)
                            {
                                if (DateTime.Now.Date >= x.AvailableFrom.Value.Date)
                                {
                                    roles.Add(x.Role);

                                }
                            }

                        });



                        roles.ForEach(x =>
                        {
                            Permissions.AddRange(x.RolePermission.Where(c => !c.IsDelete && c.IsActive).Select(r => r.Permission));
                        });

                    }

                    IsSuperAdmin = employee.IsSuperAdmin != null && (bool)employee.IsSuperAdmin;
                }



                //todo employee personal data : find another way
                var DT = EmployeeDA.GetEmployeeByEmployeeID(id);
                DisplayName = DT.Rows[0]["DisplayName"].ToString();
                ImageUrl = DT.Rows[0]["EmployeeImageURL"].ToString();




                HttpContext.Current.Session["IsraaUser"] = this;
            }
            else
            {
                var israaUser = (IsraaUser)HttpContext.Current.Session["IsraaUser"];
                roles = israaUser.roles;
                Areas = israaUser.Areas;
                Permissions = israaUser.Permissions;
                DisplayName = israaUser.DisplayName;
                ImageUrl = israaUser.ImageUrl;
                IsSuperAdmin = israaUser.IsSuperAdmin;
                DisplayName = israaUser.DisplayName;
                ImageUrl = israaUser.ImageUrl;

            }

        }


        #endregion


        #region methods

        public bool IsInArea(string area)
        {
            return IsSuperAdmin || Areas != null && Areas.Any(x => x.Name == area);
        }

        public bool IsInRole(string role)
        {
            return IsSuperAdmin || roles != null && roles.Any(x => x.Name == role);
        }

        public bool HasAction(string Action)
        {
            return IsSuperAdmin || Permissions != null && Permissions.Any(x => x.Name == Action);
        }

        #endregion

    }







}