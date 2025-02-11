import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oruphones/app.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

