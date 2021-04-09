
import 'dart:convert';
import 'dart:io';

import 'package:esante/core_functions/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:combos/combos.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';


class ModifPatrimoine extends StatefulWidget{
  Map data;
  ModifPatrimoine(this.data);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _ModifPatrimoine(this.data);
  }


}

class _ModifPatrimoine extends State<ModifPatrimoine>{
  Map data;
  List mydata;
  _ModifPatrimoine(this.data);

  List<String>lBien=new List<String>();
  List<String>LAgent=new List<String>();
  List<String>LService=new List<String>();
  String Bien="Bien";
  String Agent="Agent";
  String Service="Services";
  String labelEtat = "Etat";
  String ItemsID="";


  File Img;
  String img64;
  String full_name="";
  int bienId,AgentId,serviceId;

  List<String> etat = ["actif", "amorti", "detruit", "vole", "don"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydata = data["data"];
    setState(() {
       Bien=mydata[0]["name"] ;
       // full_name = this.mydata[0]["firstname"] + " " + this.mydata[0]["lastname"];
       Agent=this.mydata[0]["firstname"];
       Service=this.mydata[0]["dep_name"];
       labelEtat = this.mydata[0]["etat"];
       ItemsID=this.mydata[0]["id"].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Modifier patrimoine",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions: [
          Image.asset("assets/images/Logo.jpg",height: 50,),
        ],
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 20,),
            Text("Merci de Renseigner le formulaire ci-dessous",textScaleFactor:1.5,textAlign: TextAlign.center,),
            SizedBox(height: 40,),
            Wrap(
              children: [
                ListCombo<String>(
                  closeAfterItemTapped: true,
                  child:  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(Bien.toString()),
                  ),
                  getList: () async {
                    await getBien().then((value){
                      if(value.isNotEmpty){
                        lBien.clear();
                        value.forEach((element) {
                          lBien.add(element["name"]);
                        });
                      }
                      setState(() {});
                    });
                    return lBien;
                  },
                  itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
                  onItemTapped: (item) {
                    print(item);
                    setState(() {
                      Bien=item.toString();
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                ListCombo<String>(
                  closeAfterItemTapped: true,
                  child:  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(Agent.toString()),
                  ),
                  getList: () async {
                    await getAgent().then((value){
                      if(value.isNotEmpty){
                        LAgent.clear();
                        value.forEach((element) {
                          LAgent.add(element["firstname"]);
                          setState(() {
                            full_name = Agent;
                          });
                        });
                      }
                      setState(() {
                      });
                    });
                    return LAgent;
                  },
                  itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
                  onItemTapped: (item) {
                    print(item);
                    setState(() {
                      Agent=item.toString();
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                ListCombo<String>(
                  closeAfterItemTapped: true,
                  child:  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(Service.toString()),
                  ),
                  getList: () async {
                    await getService().then((value){
                      if(value.isNotEmpty){
                        LService.clear();
                        value.forEach((element) {
                          LService.add(element["name"]);
                        });
                      }
                      setState(() {});
                    });
                    return LService;
                  },
                  itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
                  onItemTapped: (item) {
                    print(item);
                    setState(() {
                      Service=item.toString();
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                ListCombo<String>(
                  closeAfterItemTapped: true,
                  child:  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(labelEtat.toString()),
                  ),
                  getList: () async{
                    await Future.delayed(const Duration(milliseconds: 500));
                    return etat;
                  },
                  itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
                  onItemTapped: (item) {
                    print(item);
                    setState(() {
                      labelEtat=item.toString();
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () async {
                // on recupère les ids
                final ProgressDialog pr = ProgressDialog(context);
                pr.style(
                    message: 'Merci de patienter...',
                    borderRadius: 10.0,
                    backgroundColor: Colors.white,
                    progressWidget: CircularProgressIndicator(),
                    elevation: 10.0,
                    insetAnimCurve: Curves.easeInOut,
                    progress: 1.0,
                    maxProgress: 2.0,
                    progressTextStyle: TextStyle(
                        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
                    messageTextStyle: TextStyle(
                        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
                );
                pr.show();
                await getBien().then((value){
                  if(value.isNotEmpty){
                    value.forEach((element) {
                      if(element["name"]==Bien){
                        setState(() {
                          bienId=element["id"];
                        });
                      }
                    });
                  }
                });
                await getService().then((value){
                  if(value.isNotEmpty){
                    value.forEach((element) {
                      if(element["name"]==Service){
                        setState(() {
                          serviceId=element["id"];
                        });
                      }
                    });
                  }
                });
                await getAgent().then((value){
                  if(value.isNotEmpty){
                    value.forEach((element) {
                      if(element["firstname"]==Agent){
                        setState(() {
                          AgentId=element["id"];
                        });
                      }
                    });
                  }
                });
                pr.hide();
                print(AgentId);
                print(serviceId);
                print(bienId);
                print(ItemsID);
                print(full_name);
                print(Agent);
                if(AgentId!=null && serviceId!=null && bienId!=null){
                  Toast.show("Les id sont corrects", context);
                  ModPatrimoine(context,ItemsID,bienId,AgentId,serviceId, labelEtat);
                }else{
                  Toast.show("Merci de bien sélectionner les champs", context);
                }
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(child: Text("Valider",textScaleFactor: 1.3,style: TextStyle(color: Colors.white),),),
              ),
            )

          ],
        ),
      ) ,
    );
  }

}