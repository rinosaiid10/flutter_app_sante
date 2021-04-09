import 'package:esante/AddDoctor/ajoutDocteur.dart';
import 'package:esante/AddPersonal/ajoutPersonnel.dart';
import 'package:esante/AddProduct/ajoutProduit.dart';
import 'package:esante/AddSpecialty/ajoutSpecialite.dart';
import 'package:esante/DoctorList/listerDoctor.dart';
import 'package:esante/ExitProduct/SortirProduit.dart';
import 'package:esante/HospitalizedPatients/PatientHospitalise.dart';
import 'package:esante/Inventory/Inventaire.dart';
import 'package:esante/NewHospitalization/NouvelleHospitalisation.dart';
import 'package:esante/PersonalList/listePersonnel.dart';
import 'package:esante/ProductList/ListProduit.dart';
import 'package:esante/RDVList/ListeRDV.dart';
import 'package:esante/SaveOrder/SauveCommande.dart';
import 'package:esante/core_functions/honeywell_scanner.dart';
import 'package:esante/waitingline/FilAttente.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Medecin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Medecin();
  }

}

class _Medecin extends State<Medecin>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        leading: Image.asset("assets/images/Logo.jpg",height: 50,),
        title: Text("Docteur",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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
                  return listeRDV();
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
                child: Center(child: Text("Liste des RDV",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return FilAttente ();
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
                child: Center(child: Text("Fil d'attente",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return PatientHospitalise();
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
                child: Center(child: Text("Patients Hospitalisés",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return NewHospitalisation();
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
                child: Center(child: Text("New Hospitalisation",textScaleFactor: 1.2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ),
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