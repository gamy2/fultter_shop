import 'package:flutter/material.dart';
import 'package:my_store/app/app.dart';
import 'package:my_store/core/service/services_locator.dart';

void main() {
  ServicesLocator().setupLocator();
  runApp(MyApp());
}
