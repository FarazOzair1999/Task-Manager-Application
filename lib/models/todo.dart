import 'package:flutter/cupertino.dart';

class Todo {
  int id;
  String title;
  String description;
  String todoDate;

  //Constructor
  todoMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id;
    mapping['title']=title;
    mapping['description']=description;
    mapping['todoDate']=todoDate;
    return mapping;
  }

}

