import 'package:flutter/cupertino.dart';
import 'package:weather_app/service/dio_helper/dio_helper.dart';
import 'package:weather_app/src/app_root.dart';

void main() {
  DioHelper.init();
  runApp(AppRoot());
}
