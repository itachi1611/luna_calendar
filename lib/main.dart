import 'package:flutter/material.dart';
import 'package:luna_calendar/app/app_page.dart';

import 'services/db/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageService().init();

  runApp(const AppPage());
}
