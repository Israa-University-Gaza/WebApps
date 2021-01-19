using System;

namespace IsraaSystem.Application.Common.CustomExceptions
{
    public class FriendlyException : Exception
    {
        public FriendlyException()
        {
        }

        public FriendlyException(string message) : base(message)
        {
        }

        public FriendlyException(string message, Exception innerException) : base(message, innerException)
        {
        }
    }
}