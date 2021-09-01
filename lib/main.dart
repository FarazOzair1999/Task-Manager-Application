import 'dart:async';
import 'Login.dart';
import 'package:flutter/material.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
{
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3),openLogin);
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/chuddybuddy.jpg')
            )
          ),
        ),
      ),
    );
  }
  void openLogin()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  }
}
