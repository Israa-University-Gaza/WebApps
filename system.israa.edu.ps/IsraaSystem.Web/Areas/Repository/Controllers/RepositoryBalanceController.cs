using IsraaSystem.Application.Common.UnitOfWork;
using IsraaSystem.Application.Repository.transaction;
using IsraaSystem.Core.Shared;
using IsraaSystem.Web.Areas.Repository.Models.transaction;
using IsraaSystem.Web.Controllers;
using log4net;
using System.Linq;
using System.Web.Mvc;
using IsraaSystem.Application.Common.ExtensionMethods;
using IsraaSystem.Application.Common.UnitOfWork;
using log4net;
using IsraaSystem.Application.Repository.transaction;
using static IsraaSystem.Application.Repository.transaction.RepoTransactionService;

namespace IsraaSystem.Web.Areas.Repository.Controllers
{
    public class RepositoryBalanceController : IsraaBaseController
    {
        private IRepoTransactionService TransactionService;
        public RepositoryBalanceController(ILog looger, IUnitOfWork unitOfWork, IRepoTransactionService transactionService) : base(looger, unitOfWork)
        {
            TransactionService = transactionService;
        }

        // GET: Repository/RepositoryBalance
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult IndexAllMaterial()
        {
            return View();
        }
        public ActionResult IndexAllMaterialDetails(int materialId)
        {
            var material = UnitOfWork.Repository.Material.Find(materialId);
            var bal = UnitOfWork.Repository.RepositoryBalance.Where(x => x.MaterialId == materialId && x.UnitId == material.UnitId).Select(x => x.Quantity).Sum();
            //GetMaterialDetailsDto model = new GetMaterialDetailsDto()
            //{
            //    MaterialId = materialId,
            //    MaterialName = material.Name + " ( " + material.MaterialUnit.Name + " ) ",
            //    QuantityBalanc = bal
            //};

            GetAllTransactionDetailsInput model = new GetAllTransactionDetailsInput()
            {
                MaterialId = materialId,
                MaterialName = material.Code + " - " + material.Name + " ( " + material.MaterialUnit.Name + " ) ",
                QuantityBalanc = bal
            };
            return View(model);
        }

        public ActionResult LoadData(QueryOptions queryOptions, GetAllBalanceInput model)
        {
            var query = TransactionService.GetAllRepositoryBalance(queryOptions, model);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");
        }

        public ActionResult LoadMaterialsData(QueryOptions queryOptions, string MaterialName)
        {
            var query = TransactionService.GetAllMaterials(queryOptions, MaterialName);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");
        }

        [HttpPost]
        public ActionResult LoadMaterialsDetails(QueryOptions queryOptions, GetAllTransactionDetailsInput input)
        {
            var query = TransactionService.GetAllTransactionDetails(queryOptions, input);
            return Content(query.QueryOptionsGetJson(queryOptions), "application/json");
        }


    }
}