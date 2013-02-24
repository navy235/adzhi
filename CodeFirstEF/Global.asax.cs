using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Optimization;
using StackExchange.Profiling;
using StackExchange.Profiling.MVCHelpers;
using Microsoft.Web.Infrastructure.DynamicModuleHelper;
using CodeFirstEF.Concrete;
using WebActivator;
using Elmah;
using Elmah.Contrib.Mvc;

namespace CodeFirstEF
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            ControllerBuilder.Current.SetControllerFactory(new NinjectControllerFactory());


            //// Setup profiler for Controllers via a Global ActionFilter
            //GlobalFilters.Filters.Add(new ProfilingActionFilter());

            //GlobalFilters.Filters.Add(new ElmahHandleErrorAttribute());
            //// initialize automatic view profiling
            //var copy = ViewEngines.Engines.ToList();
            //ViewEngines.Engines.Clear();
            //foreach (var item in copy)
            //{
            //    ViewEngines.Engines.Add(new ProfilingViewEngine(item));
            //}

            //MiniProfilerEF.Initialize(false);
        }


        /// <summary>
        /// The application begin request event.
        /// </summary>
        protected void Application_BeginRequest()
        {
            //MiniProfiler profiler = null;

            //// might want to decide here (or maybe inside the action) whether you want
            //// to profile this request - for example, using an "IsSystemAdmin" flag against
            //// the user, or similar; this could also all be done in action filters, but this
            //// is simple and practical; just return null for most users. For our test, we'll
            //// profile only for local requests (seems reasonable)
            //if (Request.IsLocal)
            //{
            //    profiler = MiniProfiler.Start();
            //}

            //using (profiler.Step("Application_BeginRequest"))
            //{
            //    // you can start profiling your code immediately
            //}
        }

        /// <summary>
        /// The application end request.
        /// </summary>
        protected void Application_EndRequest()
        {
            //MiniProfiler.Stop();
        }

    }
}