import 'package:buzzin/src/Service/connectivity_service.dart';
import 'package:buzzin/src/View/Core/Resources/app_strings.dart';
import 'package:buzzin/src/View/Core/Utils/global_constants.dart';
import 'package:buzzin/src/View/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/View/Config/app_theme.dart';
import 'src/ViewModel/Logic/bloc_providers.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final connectivityService = ConnectivityService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocProviders.buildBlocProviders(
          child: MaterialApp(
              navigatorKey: GlobalConstants.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              themeMode: ThemeMode.light,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              home: HomePage()),
        );
      },
    );
  }
}
