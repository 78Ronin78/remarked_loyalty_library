

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:remarked_loyalty_library/screens/home_screen/home_screen.dart';
import 'package:remarked_loyalty_library/screens/menu_link_screen.dart/menu_link_screen.dart';
import 'package:remarked_loyalty_library/screens/profile_screen/profile_screen.dart';
import 'package:remarked_loyalty_library/screens/restaurant_screen/restaurant_screen.dart';
import 'package:remarked_loyalty_library/screens/wallet_screen/wallet_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  //1 Создаем переменную для хранения индексной страницы
  var _bottomNavIndex = 0;

  //2 Создаем функцию списка с типом Widget, потому что в этом списке будут храниться виджеты других экранов навигации
  List<Widget> _screens() => [const HomeScreen(), const MenuLinkScreen(), const RestaurantScreen(), const ProfileScreen()];

  //3 Создаем список иконок
  //3.1 Список иконок может состоять из набора иконок встроенной библиотеки Icons или CupertinoIcons
  // List<IconData> iconDataList = [
  //   Icons.home,
  //   Icons.account_box_outlined,
  // ];

  //3.1 Если по дизайну треубется подключить дизайнерскую иконку или кастомную (custom), то можно составить список с изображениями
  //В таком случае требуется установить библиотеку flutter_svg_provider для поддержки векторного формата иконок (SVG), чтобы не терялось качество изображений
List<ImageProvider<Object>> iconDataList = [
  const Svg('C:/Users/User/Documents/repositories/remarked_loyalty_library/assets/svg/home.svg', color: Colors.white),
  const Svg('../assets/svg/stocks.svg', color: Colors.white),
  const Svg('../assets/svg/location.svg', color: Colors.white),
  const Svg('../assets/svg/profile.svg', color: Colors.white),
];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return null!;
        },
        child: SafeArea(
            child: Scaffold(
          //Вызываем параметр bottomNavigationBar: у Scaffold, но перед этим ставим библиотеку AnimatedBottomNavigationBar
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            //задаем параметр количества иконок, ссылаясь на наш список _iconDataList или _iconImageDataList
            itemCount: iconDataList.length,
            //задаем активную вкладку
            activeIndex: _bottomNavIndex,
            //задаем обязательный параметр onTap для обработки событий нажатия на вкладку
            onTap: (index) => setState(() => _bottomNavIndex = index),
            //строим вкладки tabbuilder
            tabBuilder: (int index, bool isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    iconDataList[index],
                    //здесь меняется цвет иконок нижнего меню
                    color: Colors.white,
                    size: 30.0,
                  ),
                  //ImageIcon(_iconImageData[index].image),
                  const SizedBox(height: 5),
                  isActive
                      ? Container(
                          height: 2,
                          width: 15,
                          color: const Color.fromARGB(255, 199, 16, 3),
                        )
                      : const SizedBox()
                ],
              );
            },
            //Фоновый цвет панели нижней навигации
            backgroundColor: Colors.black,
            //определяем положение плавающей иконки и распределение иконок равномерно по центру
            gapLocation: GapLocation.center,
          ),
          //Добавляем плавающую кнопку, если нужно
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 199, 16, 3),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WalletScreen()));
              },
              child: const Icon(
                Icons.wallet,
                color: Colors.white,
                size: 35,
              )),
          //Задаем отображение виджетов экранов в тело bottomNavigationBar
          body: _screens().elementAt(_bottomNavIndex),
        )));
  }
}