import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:practice_2/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';
  String password = '';
  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String mail = sharedPreferences.getString('email');
    print(email);
    String pass = sharedPreferences.getString('password');

    setState(() {
      this.email = mail;
      this.password = pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: <Widget>[
          FlatButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setBool('loginFlag', false);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text('Logout'))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email: ' + email,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Password: ' + password,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
