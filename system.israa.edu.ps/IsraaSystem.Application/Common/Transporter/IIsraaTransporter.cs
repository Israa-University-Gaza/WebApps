using System.Collections.Generic;
using IsraaSystem.Core.Classic.Shared;

namespace IsraaSystem.Application.Common.Transporter
{
    public interface IIsraaTransporter
    {

        Pagging Pager { get; set; }


        IList<int> SelectedItems { get; set; }


    }

    public class IsraaTransporter
    {



        public IsraaTransporter()
        {

        }

        public Pagging Pager { get; set; }

        public IList<int> SelectedItems { get; set; }



    }
}