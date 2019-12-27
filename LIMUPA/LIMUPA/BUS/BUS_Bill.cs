using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIMUPA.DAL;

namespace LIMUPA.BUS
{
    class BUS_Bill
    {
        DAL_Bill dalBill = new DAL_Bill();

        public string GetNextBillCode()
        {
            int id = 0;

            List<Bill> bills = dalBill.GetAllBills();

            if (bills.Count != 0)
            {
                id = int.Parse(bills[bills.Count - 1].BillCode) + 1;
            }

            return $"{id}";
        }

        public void AddBill(Bill info)
        {
            dalBill.AddBill(info);
        }
    }
}
