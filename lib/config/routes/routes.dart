

import 'package:flutter/material.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/presentation/pages/booked/booked_page.dart';
import 'package:hotel/presentation/pages/booking/booking_page.dart';
import 'package:hotel/presentation/pages/cart/cart_page.dart';
import 'package:hotel/presentation/pages/home/MyHomePage.dart';
import 'package:hotel/presentation/pages/rooms/rooms_page.dart';
import 'package:hotel/presentation/pages/tourist_edit/tourist_edit_page.dart';
import 'package:hotel/presentation/pages/tourists/tourists_page.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return _materialRoute(const MyHomePage());

      case roomsPageRoute:
        return _materialRoute(const RoomsPage());
      case touristsPageRoute:
        return _materialRoute(const TouristsPage());
      case cartPageRoute:
        return _materialRoute(const CartPage());

      case bookingPageRoute:
        return _materialRoute(
            BookingPage(room: settings.arguments as Room));
      case touristEditPageRoute:
        return _materialRoute(
            TouristEditPage(tourist: settings.arguments as Tourist?));
      case bookedPageRoute:
        return _materialRoute(const BookedPage());

      default:
        return _materialRoute(const MyHomePage());
    }
  }


  static Route _materialRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}