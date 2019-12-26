using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIMUPA.DAL
{
    class DAL_Permision: DBConect
    {
        public List<Permision> GetAllPermisions()
        {
            return db.Permisions.ToList();
        }
    }
}
