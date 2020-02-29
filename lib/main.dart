import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:wolcen_guide/screens/app_home.dart';
import 'package:wolcen_guide/utils/route_generator.dart';
import 'package:wolcen_guide/styles/main_theme.dart';
import 'package:wolcen_guide/l10n/localization.dart';


void main() {
  runApp(MainApp());

  //Admob 광고 코드 설정부
  const String admobAppId = "ca-app-pub-5924040435579261~4220470288"; //애드몹 앱ID 입력
  FirebaseAdMob.instance.initialize(appId: admobAppId);
}

class MainApp extends StatelessWidget {

  // static const String routeName = '/';

  // 스마트배너 높이 확인 메소드
  double getSmartBannerHeight(MediaQueryData mediaQuery) {
    // 키보드 상태 체크
    if (mediaQuery.viewInsets.bottom != 0) {
      return 0.0;
    }

    // https://developers.google.com/admob/android/banner#smart_banners
    if (Platform.isAndroid) {
      if (mediaQuery.size.height > 720) return 90.0;
      if (mediaQuery.size.height > 400) return 50.0;
      return 32.0;
    }
    // https://developers.google.com/admob/ios/banner#smart_banners
    // Smart Banners on iPhones have a height of 50 points in portrait and 32 points in landscape.
    // On iPads, height is 90 points in both portrait and landscape.
    if (Platform.isIOS) {
      // TODO use https://pub.dartlang.org/packages/device_info to detect iPhone/iPad?
      // if (iPad) return 90.0;
      if (mediaQuery.orientation == Orientation.portrait) return 50.0;
      return 32.0;
    }

    // No idea, just return a common value.
    return 50.0;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Admob 광고 삽입
    BannerAd myBanner = BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId:
        "ca-app-pub-5924040435579261/5190238341", // Admob 광고단위ID 입력 (for test) BannerAd.testAdUnitId  
      size: AdSize.smartBanner,
      // targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    myBanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 0.0, //60.0,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        horizontalCenterOffset: 0.0, //10.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );

    return MaterialApp(
      // 라우팅
      initialRoute: AppHome.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
      routes: {
        AppHome.routeName: (context) => AppHome(title: AppLocalizations.of(context).appTitle),
      },
      // 디버깅 용도
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      checkerboardOffscreenLayers: false,
      debugShowCheckedModeBanner: false,
      // 디버깅 끝
      title: 'Cat Care Note',
      // theme: ThemeData.dark(),
      theme: CustomTheme.mainTheme,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en', ''), // English
          const Locale('ko', ''), // Korean
        ],
      // home: CatList(title: 'Cat Care Note'),
      // Admob 배너광고부 화면 덮음 현상을 막기 위한 Builder
      builder: (BuildContext context, Widget widget) {
        var mediaQuery = MediaQuery.of(context);

        return Padding(
          child: widget,
          padding: EdgeInsets.only(bottom: getSmartBannerHeight(mediaQuery)),
        );
      },
    );
  }
}