using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CoreHelper.Checking;
using CoreHelper.Http;
using CoreHelper.Data.Interface;
using CoreHelper.Data.Infrastructure;
using CodeFirstEF.Concrete;
using CodeFirstEF.Models;
using CodeFirstEF.Lucene;

namespace CodeFirstEF.Controllers
{
    public class ServerController : Controller
    {
        //
        // GET: /Lucene/
        // GET: /Area/
        private IUnitOfWork DB_Service;

        public ServerController(IUnitOfWork _DB_Service)
        {
            DB_Service = _DB_Service;
        }

        public ActionResult Index()
        {

            BaseEfUnitOfWork content = new CodeFirstContext();
            LuceneIndexingService Service = new LuceneIndexingService(content);
            Service.UpdateIndex();


            return View();
        }


        public ActionResult Search(string q = "石家庄")
        {
            int page = 1;
            LuceneSearchService Service = new LuceneSearchService();
            IQueryable<OutDoor> packageVersions = DB_Service.Set<OutDoor>();
            string sortOrder = string.Empty;
            var searchFilter = GetSearchFilter(q, sortOrder, page);
            int totalHits;
            packageVersions = Service.Search(packageVersions, searchFilter, out totalHits);

            ViewBag.Count = String.Join(",", packageVersions.Select(x => x.Name));
            return View();
        }

        private SearchFilter GetSearchFilter(string q, string sortOrder, int page)
        {
            var searchFilter = new SearchFilter
            {
                SearchTerm = q,
                Skip = (page - 1) * 20, // pages are 1-based. 
                Take = 20,
                IncludePrerelease = false
            };
            searchFilter.SortProperty = SortProperty.Hit;
            return searchFilter;
        }
    }
}
