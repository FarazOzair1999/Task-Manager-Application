import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'SignUp.dart';
import 'Dashboard.dart';
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
{
  @override
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
            Text("Email",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "chuddybuddy@googol.com"),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 40,),
            Text("Password",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "Enter Your Password"),
              style: TextStyle(
                  fontSize: 20
              ),
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
                openHomepage()
              },
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
}