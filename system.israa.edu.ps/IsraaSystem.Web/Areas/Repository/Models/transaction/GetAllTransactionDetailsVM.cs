using IsraaSystem.Application.Repository.transaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static IsraaSystem.Application.Repository.transaction.RepoTransactionService;

namespace IsraaSystem.Web.Areas.Repository.Models.transaction
{
    public class GetAllTransactionDetailsVM
    {
        public GetMaterialDetailsDto getMaterialDetailsOutput { get; set; }
        public GetAllTransactionDetailsInput getAllTransactionDetailsInput { get; set; }
    }
}