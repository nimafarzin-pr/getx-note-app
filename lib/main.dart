import 'package:fl_ui_app/src/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_ui_app/src/binding/RootBindings.dart';
import 'package:fl_ui_app/src/screens/AddNoteScreen.dart';
import 'package:fl_ui_app/src/screens/SearchScreen.dart';
import 'package:fl_ui_app/src/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          themeMode: ThemeMode.light,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
                name: "/splash",
                page: () => const SplashScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/home",
                page: () => const HomeScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/add",
                page: () => const AddNoteScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/search",
                page: () => const SearchScreen(),
                binding: RootBinding()),
          ],
          initialRoute: '/splash',
          builder: (context, widget) {
            // ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(),
    );
    return const SplashScreen();
  }
}
