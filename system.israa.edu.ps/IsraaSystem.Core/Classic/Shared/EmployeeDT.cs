using System.Data;

namespace IsraaSystem.Core.Classic.Shared
{
    public class DataTableVM
    {
        public Pagging pagging { get; set; }

        public DataTable data { get; set; }

        public DataTableVM(Pagging pagging)
        {
            this.pagging = pagging;
        }
    }
}
