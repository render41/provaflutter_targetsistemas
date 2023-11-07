import 'package:flutter/material.dart';
import 'package:provaflutter_targetsistemas/features/capture_infos/viewModel/capture_info_store.dart';
import 'package:provaflutter_targetsistemas/features/login/viewModel/login_store.dart';
import 'package:provaflutter_targetsistemas/settings/app_settings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final captureInfoStore = CaptureInfoStore();
  await captureInfoStore.loadInfoList();
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginStore>(create: (context) => LoginStore()),
        Provider<CaptureInfoStore>(create: (context) => captureInfoStore),
      ],
      child: const AppSettings(),
    ),
  );
}
