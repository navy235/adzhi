﻿using System;
using System.Threading.Tasks;
using WebBackgrounder;
using CodeFirstEF.Lucene;

namespace CodeFirstEF.Jobs
{
    public class LuceneIndexingJob : Job
    {
        private readonly LuceneIndexingService _indexingService;

        public LuceneIndexingJob(TimeSpan frequence, TimeSpan timeout)
            : base("Lucene", frequence, timeout)
        {
            _indexingService = new LuceneIndexingService();
            _indexingService.UpdateIndex();
        }

        public override Task Execute()
        {
            return new Task(_indexingService.UpdateIndex);
        }
    }
}