using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIMUPA.DAL
{
    class DAL_Goods: DBConect
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

        public void UpdateGoods(Good info)
        {
            //Xác định đối tượng cần cập nhật
            var updatedGoods = db.Goods.Find(info.ID);

            //Thay đổi các thông tin mới
            updatedGoods.GoodsCode = info.GoodsCode;
            updatedGoods.GoodsName = info.GoodsName;
            updatedGoods.ID_Color = info.ID_Color;
            updatedGoods.ID_Brand = info.ID_Brand;
            updatedGoods.ID_Size = info.ID_Size;
            updatedGoods.ID_Type = info.ID_Type;
            updatedGoods.Number = info.Number;
            updatedGoods.Import_Date = info.Import_Date;
            updatedGoods.Price = info.Price;
            updatedGoods.Picture = info.Picture;

            db.SaveChanges();
        }

        public void DeleteGoods(Good info)
        {
            //db.Goods.Attach(info);
            for (int i = 0; i < db.Goods.ToList().Count; i++)
            {
                if (db.Goods.ToList()[i].ID == info.ID)
                {
                    db.Goods.Remove(db.Goods.ToList()[i]);
                    db.SaveChanges();

                    return;
                }
            }
        }
    }
}
