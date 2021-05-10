import 'package:flutter/material.dart';
class ForgotPassword extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: forgotPassword()
    );
  }
}
class forgotPassword extends StatefulWidget{
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}
class _forgotPasswordState extends State<forgotPassword>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            Text("Forgot Password",
              style: TextStyle(fontSize: 35),),
            Text("Please Enter Your Email to recieve reset notification",style: TextStyle(fontSize: 20,
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

            Expanded(child: Center(
              child: Container(padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xfff96060)
                ),
                child: Text("Send Reset request", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white),),
              ),
            ))
          ],
        ),
      ),

    );
  }
}