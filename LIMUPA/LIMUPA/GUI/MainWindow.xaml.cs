using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using LIMUPA.BUS;
using LIMUPA.GUI;

namespace LIMUPA
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BUS_Color busColor = new BUS_Color();
        BUS_Brand busBrand = new BUS_Brand();
        BUS_Type busType = new BUS_Type();
        BUS_Goods busGoods = new BUS_Goods();

        public MainWindow()
        {
            InitializeComponent();

            cmbColors1.ItemsSource = busColor.GetAllColors();
            cmbBrands1.ItemsSource = busBrand.GetAllBrands();
            cmbTypes1.ItemsSource = busType.GetAllTypes();
            goodsListView1.ItemsSource = busGoods.GetAllGoods();
            goodsListView2.ItemsSource = busGoods.GetAllGoods();
        }

        private void searchButton_Click(object sender, RoutedEventArgs e)
        {
            if(searchTextBox.Text.Contains("Mã Code") || searchTextBox.Text.Length == 0)
            {
                return;
            }

            Good goods = busGoods.GetGoodsByGoodsCode(searchTextBox.Text);

            if (goods.GoodsCode == searchTextBox.Text)
            {
                var goodsInformationScreen = new GoodsInformation(goods);

                if (goodsInformationScreen.ShowDialog() == true)
                {
                    return;
                }
                else
                {
                    return;
                }
            }

            MessageBox.Show("Không tìm thấy...Vui lòng nhập lại Code!");
        }

        private void goodsListView1_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedGoods = goodsListView1.SelectedIndex;
            List<Good> goods = busGoods.GetAllGoods();

            var goodsInformationScreen = new GoodsInformation(goods[selectedGoods]);

            if (goodsInformationScreen.ShowDialog() == true)
            {
                return;
            }
        }

        private void goodsListView2_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

            var selectedGoods = goodsListView2.SelectedItem as Good;

            Good updatedGoods = busGoods.GetGoodsById(selectedGoods.ID);

            if (updatedGoods.ID == selectedGoods.ID)
            {
                var updateWindowsScreen = new UpdateWindows(updatedGoods);

                if (updateWindowsScreen.ShowDialog() == true)
                {
                    goodsListView1.ItemsSource = busGoods.GetAllGoods();
                    goodsListView2.ItemsSource = busGoods.GetAllGoods();

                    return;
                }
                else
                {
                    return;
                }
            }
        }

        private void addNew_Click(object sender, RoutedEventArgs e)
        {
            var addNewindowsScreen = new AddNewWindows();
            
            if(addNewindowsScreen.ShowDialog() == true)
            {
                goodsListView1.ItemsSource = busGoods.GetAllGoods();
                goodsListView2.ItemsSource = busGoods.GetAllGoods();
            }
        }

    }
}
