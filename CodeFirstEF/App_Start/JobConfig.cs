using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity.Migrations;
using StackExchange.Profiling;
using StackExchange.Profiling.MVCHelpers;
using Microsoft.Web.Infrastructure.DynamicModuleHelper;
using WebActivator;
using WebBackgrounder;
using Elmah;
using Elmah.Contrib.Mvc;
using CodeFirstEF.App_Start;
using CodeFirstEF.Jobs;
using CodeFirstEF.Concrete;
using CodeFirstEF.Migrations;

[assembly: WebActivator.PreApplicationStartMethod(typeof(JobConfig), "PreStart")]
[assembly: WebActivator.PostApplicationStartMethod(typeof(JobConfig), "Start")]
[assembly: WebActivator.ApplicationShutdownMethod(typeof(JobConfig), "Shutdown")]

namespace CodeFirstEF.App_Start
{
    public static class JobConfig
    {
        private static JobManager _jobManager;

        public static void PreStart()
        {
            MiniProfilerPreStart();
        }

        public static void Start()
        {
            MiniProfilerPostStart();
            //DbMigratorPostStart();
            BackgroundJobsPostStart();
            AppPostStart();
        }

        public static void Shutdown()
        {
            BackgroundJobsStop();
        }

        private static void BackgroundJobsPostStart()
        {
            var jobs = new IJob[]
            {
                new WorkItemCleanupJob(TimeSpan.FromDays(1), () => new CodeFirstContext(), timeout: TimeSpan.FromDays(4)),
                new LuceneIndexingJob(TimeSpan.FromMinutes(10), timeout: TimeSpan.FromMinutes(2))
            };

            var coordinator = new WebFarmJobCoordinator(new EntityWorkItemRepository(() => new CodeFirstContext()));
            _jobManager = new JobManager(jobs, coordinator)
            {
                RestartSchedulerOnFailure = true
            };
            _jobManager.Fail(ex => Elmah.ErrorLog.GetDefault(null).Log(new Error(ex)));
            _jobManager.Start();
        }

        private static void BackgroundJobsStop()
        {
            _jobManager.Dispose();
        }


        private static void MiniProfilerPreStart()
        {
            MiniProfilerEF.Initialize();
            DynamicModuleUtility.RegisterModule(typeof(MiniProfilerStartupModule));
        }

        private static void MiniProfilerPostStart()
        {
            var copy = ViewEngines.Engines.ToList();
            ViewEngines.Engines.Clear();
            foreach (var item in copy)
            {
                ViewEngines.Engines.Add(new ProfilingViewEngine(item));
            }
        }

        private static void DbMigratorPostStart()
        {
            var dbMigrator = new DbMigrator(new CodeFirstEF.Migrations.Configuration());
            // After upgrading to EF 4.3 and MiniProfile 1.9, there is a bug that causes several 
            // 'Invalid object name 'dbo.__MigrationHistory' to be thrown when the database is first created; 
            // it seems these can safely be ignored, and the database will still be created.
            dbMigrator.Update();
        }

        private static void AppPostStart()
        {
            GlobalFilters.Filters.Add(new ElmahHandleErrorAttribute());
        }

        private class MiniProfilerStartupModule : IHttpModule
        {
            public void Init(HttpApplication context)
            {
                context.BeginRequest += (sender, e) => MiniProfiler.Start();

                context.AuthorizeRequest += (sender, e) =>
                {
                    bool stopProfiling;
                    var httpContext = HttpContext.Current;

                    if (httpContext == null)
                    {
                        stopProfiling = true;
                    }
                    else
                    {
                        // Temporarily removing until we figure out the hammering of request we saw.
                        //var userCanProfile = httpContext.User != null && HttpContext.Current.User.IsInRole(Const.AdminRoleName);
                        var requestIsLocal = httpContext.Request.IsLocal;

                        //stopProfiling = !userCanProfile && !requestIsLocal
                        stopProfiling = !requestIsLocal;
                    }

                    if (stopProfiling)
                    {
                        MiniProfiler.Stop(true);
                    }
                };

                context.EndRequest += (sender, e) => MiniProfiler.Stop();
            }

            public void Dispose()
            {
            }
        }

    }
}