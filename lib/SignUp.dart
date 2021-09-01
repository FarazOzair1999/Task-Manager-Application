import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'Login.dart';
Future<Album> createAlbum(String email,String username,String password) async {
  final response = await   http.post(

    Uri.https('chuddy-buddy-server.herokuapp.com','api/create-user/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'Keep-Alive'
    },
    body: jsonEncode(<String, String>{
      "email": email,
      "username": username,
      "password": password,
    }),


  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("User created");
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String email;
  final String username;
  final String password;


  Album({this.id, this.email,this.username, this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
    );
  }
}
class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup(),
    );
  }
}
class signup extends StatefulWidget{
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup>
{
  @override
  String Email="";
  String Password="";
  String Username="";
  Future<Album> _futureAlbum;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
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
            Text("Sign Up",
              style: TextStyle(fontSize: 35),),
            Text("Complete all the fields in order to sign up",style: TextStyle(fontSize: 20,
                color:Colors.blue),),
            SizedBox(height: 20,),
            Text("Email",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "chuddybuddy@googol.com"),
              style: TextStyle(
                  fontSize: 20
              ),
              onChanged:(String email_txt) {
                Email=email_txt;
              },
            ),
            SizedBox(height: 20,),
            Text("Username",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "chuddybuddy"),
              style: TextStyle(
                  fontSize: 20
              ),
              onChanged:(String username_txt) {
                Username=username_txt;
              },
            ),
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            Text("Re-Type Password",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "Enter Your Password just like above"),
              style: TextStyle(
                  fontSize: 20
              ),
            ),

            SizedBox(height: 40,),

            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: ()  {setState(() {
                _futureAlbum =createAlbum(Email,Username,Password);
              openLogin();

              });},

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
  void openLogin()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  }
}