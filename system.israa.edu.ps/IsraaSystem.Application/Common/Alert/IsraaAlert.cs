using IsraaSystem.Application.Common.Enums;

namespace IsraaSystem.Application.Common.Alert
{
    public class IsraaAlert

    {
        public IsraaAlert(AlertTypeEnum AlertType, string message)
        {
            this.AlertType = AlertType.ToString();
            Message = message;

        }

        public string AlertType { get; set; }

        public string Message { get; set; }


    }



}