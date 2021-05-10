import 'package:flutter/material.dart';
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
            ),
            SizedBox(height: 20,),
            Text("Username",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "chuddybuddy"),
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Text("Password",style: TextStyle(fontSize: 25,
                color:Colors.black),),
            TextField(
              decoration: InputDecoration(hintText: "Enter Your Password"),
              style: TextStyle(
                  fontSize: 20
              ),
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
              onPressed: ()
              {
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
}