using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Text.RegularExpressions;
using System.IO;
using System.Web;
using System.Configuration;

namespace Lucene.Net.China
{
    /// <summary>
    /// �ʿ��࣬�������δʿ�
    /// </summary>
    public class WordTree
    {

        public WordTree()
        {

        }
        /// <summary>
        /// �ֵ��ļ���·��
        /// </summary>
        //private static string DictPath = Environment.CurrentDirectory + "\\data\\sDict.txt";
        private static string DictPath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["AnalyzerPathsDict"]);
        /// <summary>
        /// �����ֵ�Ķ���
        /// </summary>
        public static Hashtable chartable = new Hashtable();

        /// <summary>
        /// �ֵ��ļ���ȡ��״̬
        /// </summary>
        private static bool DictLoaded = false;
        /// <summary>
        /// ��ȡ�ֵ��ļ����õ�ʱ��
        /// </summary>
        public static double DictLoad_Span = 0;

        /// <summary>
        /// ������ʽ
        /// </summary>
        public string strChinese = "[\u4e00-\u9fa5]";
        public string strNumber = "[0-9]";
        public string strEnglish = "[a-zA-Z]";


        /// <summary>
        /// ��ȡ�ַ�����
        /// </summary>
        /// <param name="Char"></param>
        /// <returns>
        /// 0: ����,1:Ӣ��,2:����
        ///</returns>
        public int GetCharType(string Char)
        {
            if (new Regex(strChinese).IsMatch(Char))
                return 0;
            if (new Regex(strEnglish).IsMatch(Char))
                return 1;
            if (new Regex(strNumber).IsMatch(Char))
                return 2;
            return -1;
        }

        /// <summary>
        /// ��ȡ�ֵ��ļ�
        /// </summary>
        public void LoadDict()
        {
            if (!DictLoaded)
            {
                BuidDictTree();
                DictLoaded = true;
            }
        }

        /// <summary>
        /// ������
        /// </summary>
        private void BuidDictTree()
        {
            long dt_s = DateTime.Now.Ticks;
            string char_s;
            StreamReader reader = new StreamReader(DictPath, System.Text.Encoding.UTF8);
            string word = reader.ReadLine();
            chartable.Add("word", null);
            while (!string.IsNullOrEmpty(word))
            {
                Hashtable t_chartable = chartable;
                for (int i = 0; i < word.Length; i++)
                {
                    char_s = word.Substring(i, 1);
                    if (!t_chartable.Contains(char_s))
                    {
                        t_chartable.Add(char_s, new Hashtable());
                    }
                    t_chartable = (Hashtable)t_chartable[char_s];
                }
                if (!t_chartable.Contains("word"))
                {
                    t_chartable.Add("word", null);
                }
                word = reader.ReadLine();
            }
            reader.Close();
        }
    }
}
