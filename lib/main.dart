import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/app_providers.dart';
import 'package:project/route.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: AppProvider.bind(),
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: themeProvider.lightScheme,
        darkTheme: themeProvider.dartkThem,
        themeMode: themeProvider.themeMode,
        initialRoute: AppRoutes.desboard,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
