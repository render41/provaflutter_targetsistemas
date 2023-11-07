import 'package:flutter/material.dart';
import 'package:provaflutter_targetsistemas/features/capture_infos/view/capture_infos_page.dart';
import 'package:provaflutter_targetsistemas/features/login/view/login_page.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> routesMap = {
    '/login': (context) => const LoginPage(),
    '/capture_infos': (context) => const CaptureInfosPage(),
  };
}
