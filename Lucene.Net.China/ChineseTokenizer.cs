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
        private int bufferIndex = 0;// ��ǰ�ַ���λ��
        private int dataLen = 0;// �ַ�����
        private string text = string.Empty;
        /// <summary>
        /// �����ַ�����
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
                // ��ʼλ�ó����ַ������˳�ѭ��
                if (startOffset >= dataLen)
                {
                    break;
                }
                // ��ȡһ����
                currentChar = sentence.Substring(startOffset, length);

                if (string.IsNullOrEmpty(currentChar.Trim()))
                {
                    startOffset++;
                    bufferIndex = startOffset;
                    continue;
                }

                // �ַ������ֵ���
                if (!t_chartable.Contains(currentChar))
                {
                    #region ǰ׺Ϊ��
                    if (word == string.Empty)
                    {
                        // ����ȡ������ַ�
                        int j = startOffset + 1;
                        switch (tree.GetCharType(currentChar))
                        {  // ���ĵ���
                            case 0:
                                word += currentChar;
                                break;
                            // Ӣ�ĵ���
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
                            // ����
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
                            // �����ַ�����
                            default:
                                startOffset++;
                                bufferIndex = startOffset;
                                continue;
                        }
                        // ����ȡ��һ���ʵĿ�ʼλ�� 
                        startOffset = j;
                    }
                    #endregion
                    else
                    #region ǰ׺��Ϊ��
                    {
                        // �Ǻ���/Ӣ��/����������
                        if (tree.GetCharType(currentChar) == -1)
                        {
                            startOffset++;
                        }
                    }
                    #endregion

                    #region ����token����
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
                // �ַ����ֵ���
                word += currentChar;
                // ȡ�����ڵ�ǰ�ַ��Ĵʵ���
                t_chartable = (Hashtable)t_chartable[currentChar];
                #region �洢��ǰ���ܷ��ص�Token
                if (t_chartable.Contains("word") || word.Length == 1)
                {
                    tempword = word;
                    tempStart = startOffset;
                    tempBufferIndex = bufferIndex;
                }
                #endregion
                // ������һѭ��ȡ��һ���ʵĿ�ʼλ��
                startOffset++;
                #region �ѵ��ַ���β
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
