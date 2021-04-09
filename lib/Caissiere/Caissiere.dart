import 'package:esante/AddDoctor/ajoutDocteur.dart';
import 'package:esante/AddPersonal/ajoutPersonnel.dart';
import 'package:esante/AddSpecialty/ajoutSpecialite.dart';
import 'package:esante/DoctorList/listerDoctor.dart';
import 'package:esante/InvoiceList/listerFacture.dart';
import 'package:esante/PersonalList/listePersonnel.dart';
import 'package:esante/SaveInvoice/SauveFacture.dart';
import 'package:esante/core_functions/honeywell_scanner.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Caissiere extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Caissiere();
  }

}

class _Caissiere  extends State<Caissiere >{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        leading: Image.asset("assets/images/Logo.jpg",height: 50,),
        title: Text("Caissière",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions: [
          // Icon(Icons.account_circle_outlined,size: 50,)
          Icon(Icons.account_circle,size: 50,),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                 return SauveFacture();
               }));
              },
              child: new Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(color: Colors.lightBlue,boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(child: Text("Save Facture",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return listeFacture();
                }));
              },
              child: new Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(color: Colors.lightBlue,boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(child: Text("Liste Facture",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }

}