import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';

import 'package:hotel/presentation/pages/cart/cart_page.dart';
import 'package:hotel/presentation/pages/rooms/rooms_page.dart';
import 'package:hotel/presentation/pages/tourists/tourists_page.dart';
import 'package:hotel/presentation/widgets/my_bottom_navigation_bar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const RoomsPage(),
    const TouristsPage(),
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: _buildAppBar(_currentIndex),
       // backgroundColor: Colors.red,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 65,
            child: MyBottomNavigationBar(
                onTap: (int index) => _onItemTapped(index),
                currentIndex: _currentIndex
            )
        ),
      )
    );
  }

  PreferredSizeWidget _buildAppBar(int currentIndex) {
    String title = "";
    switch(currentIndex) {
      case 0:
        title = "Номера";
      case 1:
        title = "Туристы";
      case 2:
        title = "Корзина";
    }

    return AppBar(
      title: Text(title),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}