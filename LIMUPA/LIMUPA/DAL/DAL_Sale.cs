using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIMUPA.DAL
{
    class DAL_Sale: DBConect
    {
        public List<Sale> GetAllSales()
        {
            return db.Sales.ToList();
        }
    }
}
