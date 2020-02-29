
import 'package:flutter/material.dart';

class CustomTheme {
  // 칼라 팔레트 정의
  static final Color primaryColor = const Color(0XFF594031);

  static final mainTheme = ThemeData(
    // fontFamily: 'Jalnan', //'TmonTium', 'BMHANNA','NotoSansKR',
    // // Color Settings..
    // primaryColor: primaryColor,
    // primaryColorDark: const Color(0XFF8C7161), //CircleAvatar background #8C7161
    // primaryColorLight: const Color(0XFFF2ECE9),
    // canvasColor: Colors.white,
    // cursorColor: Colors.black,
    // backgroundColor: const Color(0XFFBFB2AA),
    
    // cardTheme: CardTheme(
    //   color: const Color(0XFFF2ECE9)
    // ),
    // textTheme: TextTheme(
    //     title: TextStyle(
    //       color: primaryColor,
    //     )
    //   ),
    // appBarTheme: AppBarTheme(
    //   textTheme: TextTheme(
    //     title: TextStyle(
    //       fontFamily: 'Jalnan',
    //       fontSize: 20.0,
    //       color: primaryColor,
    //     )
    //   ),
    //   iconTheme: IconThemeData(
    //     color: primaryColor
    //   ),
    //   actionsIconTheme: IconThemeData(
    //     color: primaryColor
    //   ),
    // ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: primaryColor
    // ),
    // sliderTheme: SliderThemeData(
    //   activeTickMarkColor: primaryColor,
    //   activeTrackColor: const Color(0XFFBFB2AA),
    //   valueIndicatorColor: primaryColor,
    //   thumbColor: primaryColor,
    //   inactiveTrackColor: Colors.brown[50],
    //   inactiveTickMarkColor: Colors.brown[100],
    // ),
    // pageTransitionsTheme: PageTransitionsTheme(
    //   // TODO PageTransitionsBuilder 수정 필요
    //   builders: {
    //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    //   }
    // ),
  );

  static final appBarGradient = LinearGradient(
    colors: [
      // const Color(0xFFD97925),
      // const Color(0xFFF2BF91),
      const Color(0xFFFFFFFF),
      const Color(0xFFFFFFFF),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp);
}

