
import 'package:esante/LoginScreen/connexion.dart';
import 'package:esante/Rdv/RDV.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      body: Center(

        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child:Image.asset("assets/images/Logo.jpg",height: 200,),
            ),
            SizedBox(height: 5,),
            new Text("",textAlign: TextAlign.center,textScaleFactor: 2,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () { Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                return new connexion();

              }));},
              child: Text("LOGIN",style: TextStyle(color: Colors.black),textScaleFactor: 4,),
            ),

            Center(
              child: Image.asset(""),
            ),
            SizedBox(height: 10,),
            new Text("",textAlign: TextAlign.center,textScaleFactor: 2,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onPressed: () { Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                return new Rdv();

              }));},
              child: Text("RDV",style: TextStyle(color: Colors.black),textScaleFactor: 4,),
            ),

          ],


        ),


      ),

    );

  }

}