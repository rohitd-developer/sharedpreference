import 'package:flutter/material.dart';
import 'package:practice_2/home.dart';
import 'package:practice_2/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//loginFlag determines Login state in bool form
  runApp(MaterialApp(
    title: 'SharedPreference',
    home: sharedPreferences.getBool('loginFlag') == true ? HomePage() : Login(),
  ));
}
