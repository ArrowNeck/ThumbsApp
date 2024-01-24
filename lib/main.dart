import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thumbs_app/splash_screen.dart';

void main() {
  runApp(const ThumbsApp());
}

class ThumbsApp extends StatelessWidget {
  const ThumbsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Thumbs App',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            fontFamily: "DMSans",
            primaryColor: Colors.white,
            // brightness: Brightness.dark,
            primarySwatch: const MaterialColor(0xFFFFFFFF, <int, Color>{
              50: Color(0x0DFFFFFF),
              100: Color(0x1AFFFFFF),
              200: Color(0x33FFFFFF),
              300: Color(0x4DFFFFFF),
              400: Color(0x66FFFFFF),
              500: Color(0x80FFFFFF),
              600: Color(0x99FFFFFF),
              700: Color(0xB3FFFFFF),
              800: Color(0xCCFFFFFF),
              900: Color(0xE6FFFFFF),
            }),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
