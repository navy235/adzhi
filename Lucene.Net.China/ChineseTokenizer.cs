using System;
using System.Collections.Generic;
using System.Text;
using Lucene.Net.Analysis;
using Lucene.Net.Analysis.Tokenattributes;
using System.Collections;
using System.Text.RegularExpressions;
using System.IO;

namespace Lucene.Net.China
{
    public class ChineseTokenizer : Tokenizer
    {
        private static readonly object TreeWriterLock = new object();
        private int bufferIndex = 0;// 当前字符的位置
        private int dataLen = 0;// 字符长度
        private string text = string.Empty;
        /// <summary>
        /// 存在字符内容
        /// </summary>
        /// 
        private IEnumerator<Token> tokenIter;
        private List<Token> tokenBuffer;
        private ITermAttribute termAttribute = null;
        private IPositionIncrementAttribute positionAttribute = null;
        private ITypeAttribute typeAttribute = null;
        private static WordTree tree;

        /// <summary>Constructs a tokenizer for this Reader. </summary>
        public ChineseTokenizer(System.IO.TextReader reader)
        {
            this.input = reader;
            text = input.ReadToEnd();

            if (string.IsNullOrEmpty(text))
            {
                dataLen = 0;
            }
            else
            {
                dataLen = text.Length;
            }
            termAttribute = base.AddAttribute<ITermAttribute>();
            positionAttribute = base.AddAttribute<IPositionIncrementAttribute>();
            typeAttribute = base.AddAttribute<ITypeAttribute>();
        }

        public override bool IncrementToken()
        {
            if (tree == null)
            {
                lock (TreeWriterLock)
                {
                    if (tree == null)
                    {
                        tree = new WordTree();
                        tree.LoadDict();
                    }
                }
            }
            Token nextToken = null;
            if (tokenIter != null && tokenIter.MoveNext())
            {
                nextToken = tokenIter.Current;
            }
            else if (processNextSentence())
            {
                nextToken = tokenIter.Current;
            }
            if (nextToken != null)
            {
                termAttribute.SetTermBuffer(nextToken.Term);
                positionAttribute.PositionIncrement = nextToken.PositionIncrement;
                typeAttribute.Type = nextToken.Type;
                return true;
            }
            return false;
        }

        private bool processNextSentence()
        {
            string sentence = text;
            tokenBuffer = segmentSentence(sentence, bufferIndex, 1);
            tokenIter = tokenBuffer.GetEnumerator();
            return tokenIter.MoveNext();
        }

        private List<Token> segmentSentence(string sentence, int startOffset, int length)
        {

            List<Token> result = new List<Token>();
            Hashtable t_chartable = WordTree.chartable;
            string word = string.Empty;
            string currentChar;
            bufferIndex = startOffset;
            int tempStart = startOffset;
            int tempBufferIndex = bufferIndex;
            string tempword = string.Empty;
            while (true)
            {
                // 开始位置超过字符长度退出循环
                if (startOffset >= dataLen)
                {
                    break;
                }
                // 获取一个词
                currentChar = sentence.Substring(startOffset, length);

                if (string.IsNullOrEmpty(currentChar.Trim()))
                {
                    startOffset++;
                    bufferIndex = startOffset;
                    continue;
                }

                // 字符不在字典中
                if (!t_chartable.Contains(currentChar))
                {
                    #region 前缀为空
                    if (word == string.Empty)
                    {
                        // 继续取后面的字符
                        int j = startOffset + 1;
                        switch (tree.GetCharType(currentChar))
                        {  // 中文单词
                            case 0:
                                word += currentChar;
                                break;
                            // 英文单词
                            case 1:
                                while (j < dataLen)
                                {
                                    if (tree.GetCharType(sentence.Substring(j, 1)) != 1)
                                    {
                                        break;
                                    }
                                    j++;
                                }
                                word += sentence.Substring(startOffset, j - startOffset).ToLower();
                                break;
                            // 数字
                            case 2:
                                while (j < dataLen)
                                {
                                    if (tree.GetCharType(sentence.Substring(j, 1)) != 2)
                                    {
                                        break;
                                    }
                                    j++;
                                }
                                word += sentence.Substring(startOffset, j - startOffset);
                                break;
                            // 其他字符单词
                            default:
                                startOffset++;
                                bufferIndex = startOffset;
                                continue;
                        }
                        // 设置取下一个词的开始位置 
                        startOffset = j;
                    }
                    #endregion
                    else
                    #region 前缀不为空
                    {
                        // 非汉字/英文/数字则跳过
                        if (tree.GetCharType(currentChar) == -1)
                        {
                            startOffset++;
                        }
                    }
                    #endregion

                    #region 返回token对象
                    if (t_chartable.Contains("word"))
                    {
                        result.Add(new Token(word, bufferIndex, bufferIndex + word.Length));
                        bufferIndex = startOffset;
                        return result;
                    }
                    else
                    {
                        startOffset = tempStart + 1;
                        result.Add(new Token(tempword, tempBufferIndex, tempBufferIndex + tempword.Length));
                        bufferIndex = startOffset;
                        return result;
                    }
                    #endregion
                }
                // 字符在字典中
                word += currentChar;
                // 取得属于当前字符的词典树
                t_chartable = (Hashtable)t_chartable[currentChar];
                #region 存储当前所能返回的Token
                if (t_chartable.Contains("word") || word.Length == 1)
                {
                    tempword = word;
                    tempStart = startOffset;
                    tempBufferIndex = bufferIndex;
                }
                #endregion
                // 设置下一循环取下一个词的开始位置
                startOffset++;
                #region 已到字符串尾
                if (startOffset == dataLen)
                {
                    if (t_chartable.Contains("word") || word.Length == 1)
                    {
                        result.Add(new Token(word, bufferIndex, bufferIndex + word.Length));
                        bufferIndex = startOffset;
                        return result;
                    }
                    else
                    {
                        startOffset = tempStart + 1;
                        result.Add(new Token(tempword, tempBufferIndex, tempBufferIndex + tempword.Length));
                        bufferIndex = startOffset;
                        return result;
                    }
                }
                #endregion
            }

            return result;
        }



    }
}
