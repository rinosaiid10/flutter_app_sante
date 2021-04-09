import 'package:esante/AddDoctor/ajoutDocteur.dart';
import 'package:esante/AddPersonal/ajoutPersonnel.dart';
import 'package:esante/AddSpecialty/ajoutSpecialite.dart';
import 'package:esante/DoctorList/listerDoctor.dart';
import 'package:esante/Hospitalization/Hospitalization.dart';
import 'package:esante/PatientList/listePatient.dart';
import 'package:esante/PersonalList/listePersonnel.dart';
import 'package:esante/core_functions/honeywell_scanner.dart';
import 'package:esante/patients%20to%20be%20treated/Patientatraiter.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Infirmiere extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Infirmiere ();
  }

}

class _Infirmiere  extends State<Infirmiere >{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        leading: Image.asset("assets/images/Logo.jpg",height: 50,),
        title: Text("Infirmière ",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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
                 return PatientTraiter();
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
                child: Center(child: Text("Patients à Traiter",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return listePatient();
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
                child: Center(child: Text("Liste des Patients",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return Hospitalization();
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
                child: Center(child: Text("Hospitalisation",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),

            SizedBox(height: 20,),

            SizedBox(height: 20,),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Historique()));
            //   },
            //   child: new Container(
            //     height: 60,
            //     width: 200,
            //     decoration: BoxDecoration(color: Colors.lightBlue,boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.8),
            //         spreadRadius: 2,
            //         blurRadius: 5,
            //         offset: Offset(0, 7), // changes position of shadow
            //       ),
            //     ],borderRadius: BorderRadius.all(Radius.circular(10))),
            //     child: Center(child: Text("Historique",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

}