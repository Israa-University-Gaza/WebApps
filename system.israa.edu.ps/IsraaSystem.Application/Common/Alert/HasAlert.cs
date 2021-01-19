using System.Collections.Generic;
using IsraaSystem.Application.Common.Enums;

namespace IsraaSystem.Application.Common.Alert
{
    public interface IHasAlert
    {
        List<IsraaAlert> Alerts { get; set; }
        void AddAlert(AlertTypeEnum alertType, string message);
    }

    public class HasAlert : IHasAlert
    {


        public HasAlert()

        {
            Alerts = new List<IsraaAlert>();
        }

        public List<IsraaAlert> Alerts { get; set; }

        public void AddAlert(AlertTypeEnum alertType, string message)
        {
            Alerts.Add(new IsraaAlert(alertType, message));
        }


    }
}