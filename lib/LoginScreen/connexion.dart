
import 'package:esante/Accueil/Accueil.dart';
import 'package:esante/Action/Action.dart';
import 'package:esante/AddSpecialty/ajoutSpecialite.dart';
import 'package:esante/Caissiere/Caissiere.dart';
import 'package:esante/Infirmiere/Infirmiere.dart';
import 'package:esante/Medecin/Medecin.dart';
import 'package:esante/Pharmacienne/Pharmacienne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class connexion extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _connexion();
  }

}

class _connexion extends State<connexion>{
  bool value=true;
  final TextEditingController password=new TextEditingController();
  final TextEditingController email=new TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new ListView(
          padding: EdgeInsets.only(left: 20,right: 20),
          children: [
            SizedBox(height:30,),
            Row(
             children: [
               IconButton(icon:Icon(Icons.close,color: Colors.red,size: 40,), onPressed: (){
                 Navigator.pop(context);
               }),
               SizedBox(width:MediaQuery.of(context).size.width/5,),
               new Text("Login",textScaleFactor: 2.5,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
             ],
           ),
            Divider(color: Colors.lightBlue,),
            SizedBox(height:MediaQuery.of(context).size.height/9,),
            Text("Email:",textScaleFactor: 1.5,),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "example@website.com",border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )),
            ),
            SizedBox(height:30,),
            Text("Password:",textScaleFactor: 1.5,),
            TextFormField(
              controller: password,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(hintText: "*****",border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )),
            ),
         Row(
          children: [
           Checkbox(value: value,onChanged:(v){
             if(v){
               value=false;
             }else{
               value=true;
             }
           },),
           Text("remenber")
         ], 
        ),
            Row(
              children: [
                RaisedButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new action();

                  }));
                },
                  color: Colors.lightBlue,
                  child: Text("SIGN IN      Admin",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Row(
              children: [
                RaisedButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new Accueil();

                  }));
                },
                  color: Colors.lightBlue,
                  child: Text("SIGN IN    Accueil",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Row(
              children: [
                RaisedButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new Infirmiere();

                  }));
                },
                  color: Colors.lightBlue,
                  child: Text("SIGN IN   Infirmière",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Row(
              children: [
                RaisedButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new Medecin();

                  }));
                },
                  color: Colors.lightBlue,
                  child: Text("SIGN IN  Docteur",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Row(
              children: [
                RaisedButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new Pharmacienne();

                  }));
                },
                  color: Colors.lightBlue,
                  child: Text("SIGN IN pharmacienne",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Row(
              children: [
                RaisedButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new Caissiere();

                  }));
                },
                  color: Colors.lightBlue,
                  child: Text("SIGN IN  caissière",textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),


            SizedBox(height:10,),
            Text("Forgot Password?",textScaleFactor: 1.2,)

          ],
        )
      ),
    );
  }

}








