import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';

import 'app/app.dart';
import 'app/app.locator.dart';

void main() async {
  await setupLocator();
  runApp(const App());
}