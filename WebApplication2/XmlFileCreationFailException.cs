using System;
using System.Runtime.Serialization;

namespace WebApplication2
{
    [Serializable]
    internal class XmlFileCreationFailException : Exception
    {
        public XmlFileCreationFailException()
        {
        }

        public XmlFileCreationFailException(string message) : base(message)
        {
        }

        public XmlFileCreationFailException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected XmlFileCreationFailException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}