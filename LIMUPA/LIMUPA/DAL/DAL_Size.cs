﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIMUPA.DAL
{
    class DAL_Size : DBConnect
    {
        public List<Size> GetAllSizes()
        {
            return db.Sizes.ToList();
        }
    }
}
