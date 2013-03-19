using System;
using System.Linq;
using System.Collections.Generic;
using CodeFirstEF.ViewModels;
using CodeFirstEF.Models;

namespace CodeFirstEF.Serivces
{
    public interface IAuctionCalendarService
    {
        AuctionCalendar Create(AuctionCalendar model);

        IQueryable<AuctionCalendar> GetALL(int MediaID);

        bool ValidateAuction(int MediaID, DateTime startTime, DateTime endTime);
    }
}