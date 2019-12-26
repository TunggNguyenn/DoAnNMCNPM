using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Windows.Shapes;
using LIMUPA.BUS;

namespace LIMUPA.GUI
{
    /// <summary>
    /// Interaction logic for HomeWindow.xaml
    /// </summary>
    public partial class HomeWindow : Window
    {
        BUS_Color busColor = new BUS_Color();
        BUS_Brand busBrand = new BUS_Brand();
        BUS_Type busType = new BUS_Type();
        BUS_Goods busGoods = new BUS_Goods();
        BUS_Size busSize = new BUS_Size();


        public HomeWindow(string permisionName)
        {
            InitializeComponent();

            if (permisionName != "Quản lý")
            {
                saleTabItem.Visibility = Visibility.Collapsed;
                expensesTabItem.Visibility = Visibility.Collapsed;
            }

            cmbColors1.ItemsSource = cmbColors2.ItemsSource = busColor.GetAllColors();
            cmbBrands1.ItemsSource = cmbBrands2.ItemsSource = busBrand.GetAllBrands();
            cmbTypes1.ItemsSource = cmbTypes2.ItemsSource = busType.GetAllTypes();
            cmbSizes1.ItemsSource = cmbSizes2.ItemsSource = busSize.GetAllSizes();

            goodsListView1.ItemsSource = busGoods.GetAllGoods();
            goodsListView2.ItemsSource = busGoods.GetAllGoods();

            //Add Filter into Search
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(goodsListView2.ItemsSource);
            view.Filter = GoodsFilter;
        }

        private bool GoodsFilter(object item)
        {
            if (String.IsNullOrEmpty(searchTextBox2.Text))
            {
                return true;
            }
            else
            {
                return ((item as Good).GoodsName.IndexOf(searchTextBox2.Text, StringComparison.OrdinalIgnoreCase) >= 0)
                    || ((item as Good).GoodsCode.IndexOf(searchTextBox2.Text, StringComparison.OrdinalIgnoreCase) >= 0);
            }
        }

        private void logoutButton_Click(object sender, RoutedEventArgs e)
        {
            var ValidationWindowScreen = new ValidationWindow("LOGOUT");

            if (ValidationWindowScreen.ShowDialog() == true)
            {
                this.DialogResult = true;
                this.Close();
            }
            else
            {
                return;
            }
        }

        private void exitButton_Click(object sender, RoutedEventArgs e)
        {
            var ValidationWindowScreen = new ValidationWindow("EXIT");

            if (ValidationWindowScreen.ShowDialog() == true)
            {
                this.Close();
            }
            else
            {
                return;
            }
        }

        private void searchButton1_Click(object sender, RoutedEventArgs e)
        {
            if (searchTextBox1.Text.Length == 0)
            {
                return;
            }

            Good goods = busGoods.GetGoodsByGoodsCode(searchTextBox1.Text);

            if (goods.GoodsCode == searchTextBox1.Text)
            {
                var GoodsInformationWindowScreen = new GoodsInformationWindow(goods);

                if (GoodsInformationWindowScreen.ShowDialog() == true)
                {
                    return;
                }
                else
                {
                    return;
                }
            }

            //MessageBox.Show("Không tìm thấy...Vui lòng nhập lại Code!");
            var AnnouncementWindowScreen = new AnnouncementWindow("DON'T FIND THIS CODE...PLEASE TYPE AGAIN!");

            if (AnnouncementWindowScreen.ShowDialog() == true)
            {
                return;
            }
            else
            {
                return;
            }
        }

        private void minimumPrice1_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            minimumPrice1.Text = "";
        }

        private void maximumPrice1_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            maximumPrice1.Text = "";
        }

        private void goodsListView1_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedGoods = goodsListView1.SelectedIndex;
            //List<Good> goods = busGoods.GetAllGoods();
            List<Good> goods = goodsListView1.ItemsSource as List<Good>;

            var GoodsInformationWindowScreen = new GoodsInformationWindow(goods[selectedGoods]);

            if (GoodsInformationWindowScreen.ShowDialog() == true)
            {
                return;
            }
            else
            {
                return;
            }
        }

        private void refreshButton1_Click(object sender, RoutedEventArgs e)
        {
            var ValidationWindowScreen = new ValidationWindow("REFRESH");

            if (ValidationWindowScreen.ShowDialog() == true)
            {
                goodsListView1.ItemsSource = busGoods.GetAllGoods();

                searchTextBox1.Text = "";
                cmbColors1.SelectedIndex = -1;
                cmbBrands1.SelectedIndex = -1;
                minimumPrice1.Text = "minimum";
                maximumPrice1.Text = "maximum";
                cmbTypes1.SelectedIndex = -1;
                cmbSizes1.SelectedIndex = -1;
            }
            else
            {
                return;
            }
        }

        private void filterButton1_Click(object sender, RoutedEventArgs e)
        {
            var filteredColor1 = cmbColors1.SelectedIndex + 1;
            var filteredBrand1 = cmbBrands1.SelectedIndex + 1;
            double filteredMinimumPrice1 = 0.0f;
            if (!minimumPrice1.Text.ToString().Contains("minimum") && minimumPrice1.Text != "")
            {
                filteredMinimumPrice1 = double.Parse(minimumPrice1.Text);
            }
            double filteredMaximumPrice1 = 0.0f;
            if (!maximumPrice1.Text.ToString().Contains("maximum") && maximumPrice1.Text != "")
            {
                filteredMaximumPrice1 = double.Parse(maximumPrice1.Text);
            }
            var filteredType1 = cmbTypes1.SelectedIndex + 1;
            var filteredSize1 = cmbSizes1.SelectedIndex + 1;

            goodsListView1.ItemsSource = busGoods.GetGoodsByFilter(filteredColor1, filteredBrand1, filteredMinimumPrice1, filteredMaximumPrice1, filteredType1, filteredSize1);
        }

        private void searchTextBox2_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (searchTextBox2.Text.ToString() == "")
            {
                return;
            }
            CollectionViewSource.GetDefaultView(goodsListView2.ItemsSource).Refresh();
        }

        private void searchButton2_Click(object sender, RoutedEventArgs e)
        {
            if (searchTextBox2.Text.Length == 0)
            {
                return;
            }

            Good goods = busGoods.GetGoodsByGoodsCode(searchTextBox2.Text);

            if (goods.GoodsCode == searchTextBox2.Text)
            {
                var GoodsInformationWindowScreen = new GoodsInformationWindow(goods);

                if (GoodsInformationWindowScreen.ShowDialog() == true)
                {
                    return;
                }
                else
                {
                    return;
                }
            }

            //MessageBox.Show("Không tìm thấy...Vui lòng nhập lại Code!");
            var AnnouncementWindowScreen = new AnnouncementWindow("DON'T FIND THIS CODE...PLEASE TYPE AGAIN!");

            if (AnnouncementWindowScreen.ShowDialog() == true)
            {
                return;
            }
            else
            {
                return;
            }
        }

        private void minimumPrice2_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            minimumPrice2.Text = "";
        }

        private void maximumPrice2_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            maximumPrice2.Text = "";
        }

        private void refreshButton2_Click(object sender, RoutedEventArgs e)
        {
            var ValidationWindowScreen = new ValidationWindow("REFRESH");

            if (ValidationWindowScreen.ShowDialog() == true)
            {
                goodsListView2.ItemsSource = busGoods.GetAllGoods();

                searchTextBox1.Text = "";
                cmbColors2.SelectedIndex = -1;
                cmbBrands2.SelectedIndex = -1;
                minimumPrice2.Text = "minimum";
                maximumPrice2.Text = "maximum";
                cmbTypes2.SelectedIndex = -1;
                cmbSizes2.SelectedIndex = -1;
            }
            else
            {
                return;
            }
        }

        private void filterButton2_Click(object sender, RoutedEventArgs e)
        {
            var filteredColor2 = cmbColors2.SelectedIndex + 1;
            var filteredBrand2 = cmbBrands2.SelectedIndex + 1;
            double filteredMinimumPrice2 = 0.0f;
            if (!minimumPrice2.Text.ToString().Contains("minimum") && minimumPrice2.Text != "")
            {
                filteredMinimumPrice2 = double.Parse(minimumPrice2.Text);
            }
            double filteredMaximumPrice2 = 0.0f;
            if (!maximumPrice2.Text.ToString().Contains("maximum") && maximumPrice2.Text != "")
            {
                filteredMaximumPrice2 = double.Parse(maximumPrice2.Text);
            }
            var filteredType2 = cmbTypes2.SelectedIndex + 1;
            var filteredSize2 = cmbSizes2.SelectedIndex + 1;

            goodsListView2.ItemsSource = busGoods.GetGoodsByFilter(filteredColor2, filteredBrand2, filteredMinimumPrice2, filteredMaximumPrice2, filteredType2, filteredSize2);
        }

        private void goodsListView2_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedGoods = goodsListView2.SelectedItem as Good;

            Good updatedGoods = busGoods.GetGoodsById(selectedGoods.ID);

            if (updatedGoods.ID == selectedGoods.ID)
            {
                var UpdateWindowScreen = new UpdateWindow(updatedGoods);

                if (UpdateWindowScreen.ShowDialog() == true)
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

        private void addNewButton_Click(object sender, RoutedEventArgs e)
        {
            var AddNewindowScreen = new AddNewWindow();

            if (AddNewindowScreen.ShowDialog() == true)
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
}
