using System;
using System.Collections.Generic;
using System.Linq;
using IsraaSystem.Application.Common.ServiceBase;
using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.DataAccess.EntityFrameWork.IsraaHumanResource;
using log4net;

namespace IsraaSystem.Application.Administration.Notification
{
    public interface INotificationService : IIsraaService
    {
        void Send(int recipientId, int notificationFlagId, string title, string body, string href, int senderId = 1);
        List<Notifications> GetAll(int recipientID);
    }

    public class NotificationService : IsraaService, INotificationService
    {

        public NotificationService(IUnitOfWork unitOfWork, ILog logger) : base(unitOfWork, logger)
        {
        }

        public void Send(int recipientId, int notificationFlagId, string title, string body, string href, int senderId = 1)
        {

            unitOfWork.HumanResource.Notifications.Add(new Notifications()
            {
                RecipientID = recipientId,
                SenderID = senderId,
                Body = body,
                Href = href,
                InsertDate = DateTime.Now,
                Title = title,
                NotificationFlagID = notificationFlagId
            });
            unitOfWork.Complete();
        }

        public List<Notifications> GetAll(int recipientID)
        {
            unitOfWork.HumanResource.Configuration.ProxyCreationEnabled = false;
            //var result = unitOfWork.HumanResource.Notifications.Where(x => x.RecipientID == recipientID).OrderBy(x => x.InsertDate).Take(20).ToList();
            return new List<Notifications>();
        }


    }
}









