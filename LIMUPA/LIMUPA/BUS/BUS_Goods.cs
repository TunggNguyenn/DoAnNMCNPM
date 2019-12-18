using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIMUPA.DAL;

namespace LIMUPA.BUS
{
    class BUS_Goods
    {
        DAL_Goods dalGoods = new DAL_Goods();

        public List<Good> GetAllGoods()
        {
            return dalGoods.GetAllGoods();
        }

        public void AddGoods(Good newGoods)
        {
            dalGoods.AddGoods(newGoods);
        }

        public Good GetGoodsByGoodsCode(string goodsCode)
        {
            Good goods = new Good();
            for(int i = 0; i < dalGoods.GetAllGoods().Count; i++)
            {
                if(dalGoods.GetAllGoods()[i].GoodsCode == goodsCode)
                {
                    goods = dalGoods.GetAllGoods()[i];
                    break;
                }
            }

            return goods;
        }

        public Good GetGoodsById(int id)
        {
            return dalGoods.GetGoodsById(id);
        }

        public void DeleteGoods(Good info)
        {
            dalGoods.DeleteGoods(info);
        }

        public void UpdateGoods(Good info)
        {
            dalGoods.UpdateGoods(info);
        }
    }
}
