import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tree_animation/utils/logger.dart';


import 'my_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  initLogger(() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());

    await _main();
  });
}

Future<void> _main() async {
  // SidebarController sidebarController = Get.put(SidebarController());
  runApp(const MyApp());
}
