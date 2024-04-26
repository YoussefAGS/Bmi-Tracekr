import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app/connectivity_controller.dart';
import 'core/common/screens/network_conniction.dart';

class BmiTrackerApp extends StatelessWidget {
  const BmiTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnected,
        builder: (_, value, __) {
      if (value) {
        return ScreenUtilInit(
          designSize: const Size(375, 810),
          minTextAdapt: true,
          child:  MaterialApp(
            locale: Locale('en'),
            title: 'BmiTrackerApp',
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return widget!;
                    },
                  ),
                ),
              );
            },
            home: Home(),
          ),
        );
      } else {
        return MaterialApp(
            title: 'Store App',
            debugShowCheckedModeBanner: false,
            home: NoNetWorkScreen());
      }
    },
  );
}
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

