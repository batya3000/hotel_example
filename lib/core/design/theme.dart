

import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/styles.dart';

ThemeData myAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: whiteColor,
    fontFamily: 'Inter',
    appBarTheme: myAppBarTheme(),
    bottomNavigationBarTheme: myBottomNavigationBarTheme(),
    floatingActionButtonTheme: myFloatingActionButtonTheme(),
    cardTheme: myCardTheme(),
    elevatedButtonTheme: myElevatedButtonTheme(),
    textSelectionTheme: myTextSelectionThemeData(),
    inputDecorationTheme: myInputDecorationTheme(),
    dialogTheme: myDialogTheme(),
    datePickerTheme: myDatePickerThemeData(),
  );
}



AppBarTheme myAppBarTheme() {
  return const AppBarTheme(
    color: whiteColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: blackColor),
    titleTextStyle: titleTextStyle,
  );
}

BottomNavigationBarThemeData myBottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      elevation: elevation10,
      selectedItemColor: blackColor,
      unselectedItemColor: gray2Color,
      selectedLabelStyle: bottomNavTextStyle,
      unselectedLabelStyle: bottomNavTextStyle.copyWith(color: gray2Color),
  );
}

FloatingActionButtonThemeData myFloatingActionButtonTheme() {
  return const FloatingActionButtonThemeData(
    backgroundColor: blackColor,
    elevation: elevation10,
    //sizeConstraints: BoxConstraints(minHeight: ),
    iconSize: size20,
  );
}
CardTheme myCardTheme() {
  return CardTheme(
      elevation: elevation0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius16)
      )
  );
}

ElevatedButtonThemeData myElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius16)
      ),
    ),
  );
}

InputDecorationTheme myInputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelStyle: floatingLabelTextStyle,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    labelStyle: labelTextStyle,
    filled: true,
    fillColor: surfaceColor,
    hoverColor: Colors.blue,
    focusColor: gray2Color,
    // contentPadding: EdgeInsets.all(padding16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius16),
      borderSide: const BorderSide(
          color: grayColor,
          width: border1
      ),

    ),
  );
}

TextSelectionThemeData myTextSelectionThemeData() {
  return const TextSelectionThemeData(
    cursorColor: blackColor,
    selectionColor: gray2Color,
    selectionHandleColor: blackColor,
  );
}

DialogTheme myDialogTheme() {
  return DialogTheme(
    backgroundColor: whiteColor,
    elevation: elevation10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius16)
    ),
    titleTextStyle: titleTextStyle,
    contentTextStyle: bodyTextStyle.copyWith(color: gray2Color),
    actionsPadding: const EdgeInsets.only(bottom: padding16, right: padding16),

  );
}

DatePickerThemeData myDatePickerThemeData() {
  return DatePickerThemeData(
    backgroundColor: whiteColor,
    rangePickerBackgroundColor: surfaceColor,
    rangePickerHeaderBackgroundColor: whiteColor,
    rangeSelectionBackgroundColor: Color(0xFFC0DAFF),
    rangePickerHeaderForegroundColor: blackColor,
    rangePickerHeaderHelpStyle: bodyTextStyle,
    rangePickerHeaderHeadlineStyle: titleTextStyle,
    headerBackgroundColor: whiteColor,
    headerForegroundColor: blackColor,
    todayForegroundColor: MaterialStateProperty.all(primaryColor),

    todayBorder: const BorderSide(width: 0),
    dayBackgroundColor: MaterialStateProperty.all(primaryColor),
  );
}
