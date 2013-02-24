using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Configuration;
using Lucene.Net.Analysis;
using Lucene.Net.Analysis.Standard;
using System.Web;

namespace Lucene.Net.China
{
    /// <summary>
    /// 
    /// </summary>
    public class ChineseAnalyzer : Analyzer
    {
        //private System.Collections.Hashtable stopSet;
        public static readonly System.String[] CHINESE_ENGLISH_STOP_WORDS = new string[321];

        //public string NoisePath = Environment.CurrentDirectory + "\\data\\sNoise.txt";

        public string NoisePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["AnalyzerPathsNoise"]);


        public ChineseAnalyzer()
        {
            StreamReader reader = new StreamReader(NoisePath, System.Text.Encoding.UTF8);
            string noise = reader.ReadLine();
            int i = 0;
            while (!string.IsNullOrEmpty(noise))
            {
                CHINESE_ENGLISH_STOP_WORDS[i] = noise;
                noise = reader.ReadLine();
                i++;
            }
        }

        /// <summary>Constructs a {@link StandardTokenizer} filtered by a {@link
        /// StandardFilter}, a {@link LowerCaseFilter} and a {@link StopFilter}. 
        /// </summary>
        public override TokenStream TokenStream(System.String fieldName, System.IO.TextReader reader)
        {
            TokenStream result = new ChineseTokenizer(reader);
            result = new StandardFilter(result);
            //result = new LowerCaseFilter(result);
            result = new StopFilter(true, result, StopFilter.MakeStopSet(CHINESE_ENGLISH_STOP_WORDS), false);
            return result;
        }
    }
}
