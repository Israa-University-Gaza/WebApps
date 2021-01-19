using IsraaSystem.Application.Repository.transaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IsraaSystem.Web.Areas.Repository.Models.transaction
{
    public class TransactionDetailsVM
    {
        public TransactionDto TransactionDto { get; set; }
        public TransactionDetailsDto TransactionDetailsDto { get; set; }

    }
}