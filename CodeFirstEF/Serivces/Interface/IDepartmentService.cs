using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;
namespace CodeFirstEF.Serivces
{
    public interface IDepartmentService
    {
        IEnumerable<Department> GetALL();
    }
}