using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIMUPA.DAL
{
    class DAL_Goods : DBConnect
    {
        public List<Good> GetAllGoods()
        {
            return db.Goods.ToList();
        }

        public void AddGoods(Good newGoods)
        {
            db.Goods.Add(newGoods);
            db.SaveChanges();
        }

        public Good GetGoodsById(int id)
        {
            return db.Goods.Find(id);
        }

        public void DeleteGoods(Good info)
        {
            //db.Goods.Attach(info);
            for(int i= 0; i < db.Goods.ToList().Count; i++)
            {
                if(db.Goods.ToList()[i].ID == info.ID)
                {
                    db.Goods.Remove(db.Goods.ToList()[i]);
                    db.SaveChanges();

                    return;
                }
            }

        }

        public void UpdateGoods(Good info)
        {
            var goods = db.Goods.Find(info.ID);

            goods.GoodsCode = info.GoodsCode;
            goods.GoodsName = info.GoodsName;
            goods.Color = info.Color;
            goods.Brand = info.Brand;
            goods.Size = info.Size;
            goods.Type = info.Type;
            goods.Price = info.Price;
            goods.Picture = info.Picture;

            db.SaveChanges();
        }
    }
}
