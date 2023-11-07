import 'package:flutter/material.dart';
import 'package:provaflutter_targetsistemas/settings/app_routes.dart';
import 'package:provaflutter_targetsistemas/settings/app_theme.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = AppRoutes();
    final theme = AppTheme();
    return MaterialApp(
      title: 'Prova Flutter: Target Sistemas',
      theme: theme.themeAppDefault(context),
      debugShowCheckedModeBanner: false,
      routes: routes.routesMap,
      initialRoute: '/login',
    );
  }
}
