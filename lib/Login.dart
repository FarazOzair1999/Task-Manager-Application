import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ForgotPassword.dart';
import 'SignUp.dart';
import 'Dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
int _Statuscode;
Future<Album> createAlbum(String username,String password) async {
  final response = await   http.post(

    Uri.https('chuddy-buddy-server.herokuapp.com','/api/token/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'Keep-Alive'
    },
    body: jsonEncode(<String, String>{
      "username": username,
      "password": password,
    }),

  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("login done");
    _Statuscode=response.statusCode;
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login.');
    _Statuscode=response.statusCode;

  }
}

class Album {
  final int id;
  final String refresh;
  final String access;


  Album({ this.id, this.refresh,this.access});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      refresh: json['refresh'],
      access: json['access'],
    );
  }
}
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
class login extends StatefulWidget{
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login>
{Future<Album> _logintoken;
  @override
  String Username="";
  String Password="";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Welcome Back!",
              style: TextStyle(fontSize: 35),),
            Text("Sign in to Continue",style: TextStyle(fontSize: 20,
                color:Colors.blue),),
              SizedBox(height: 20,),
            Text("Username",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "chuddybuddy@googol.com"),

              style: TextStyle(
                fontSize: 20,

              ),
              onChanged:(String email_txt) {
                Username=email_txt;
              },
            ),
            SizedBox(height: 40,),
            Text("Password",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "Enter Your Password"),
              style: TextStyle(
                  fontSize: 20
              ),
              onChanged:(String pass_txt) {
                Password=pass_txt;
              },
            ),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: openForgotPassword,
                child: Text("Forgot Password?", style: TextStyle(
                  fontSize: 20
                ),),
              )
            ],),

            SizedBox(height: 40,),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () => {
              setState(() {
              _logintoken =createAlbum(Username,Password);
              print(_logintoken);
              if (_Statuscode==200){
                openHomepage();
              }


              })},
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: ()=>
              {
                openSignUp()
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
    
  }
  void openSignUp()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
  }
  void openForgotPassword()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
  }
  void openHomepage()
  {

    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
FutureBuilder<Album> buildFutureBuilder() {
  return FutureBuilder<Album>(
    future: _logintoken,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data.access);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return CircularProgressIndicator();
    },
  );
}
}