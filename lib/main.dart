
import 'package:flutter/material.dart';

import 'Home/home.dart';

void main() {
  runApp(ekip());

}

class ekip extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:home() ,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
    );
  }
}
