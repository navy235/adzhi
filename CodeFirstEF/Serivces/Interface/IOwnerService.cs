using System;
using System.Linq;
using System.Collections.Generic;
using CoreHelper.Enum;
using CodeFirstEF.Models;
using CodeFirstEF.ViewModels;

namespace CodeFirstEF.Serivces
{
    public interface IOwnerService
    {
        Owner FindByMediaID(int MediaID);
    }
}