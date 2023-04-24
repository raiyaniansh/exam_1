import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  String? pass;
  String? email;
  Future<void> singup(String email,String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('e1', email);
    await prefs.setString('p1', pass);
  }

  Future<void> read() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     email = prefs.getString('e1');
     pass = prefs.getString('p1');
     notifyListeners();
  }
}
