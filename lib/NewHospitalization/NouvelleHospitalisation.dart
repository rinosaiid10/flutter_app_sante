
import 'dart:convert';
import 'dart:io';

import 'package:esante/core_functions/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:combos/combos.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';


class NewHospitalisation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _NewHospitalisation();
  }


}

class _NewHospitalisation extends State<NewHospitalisation>{
  final TextEditingController NomBien=new TextEditingController();
  final TextEditingController PrixBien=new TextEditingController();
  final TextEditingController DetailsBien=new TextEditingController();
  final TextEditingController QuantiteBien=new TextEditingController();
  final TextEditingController brand =new TextEditingController();
  final TextEditingController model=new TextEditingController();
  final TextEditingController observation = new TextEditingController();
  final TextEditingController state = new TextEditingController();

  List<String>categories=new List<String>();
  List<String>fourn=new List<String>();

  List<String>lChambre=new List<String>();

  String Chambre="Type de Chambre";

  List<String>lNomPatient=new List<String>();

  String NomPatient="Nom Patient";

  String catego="Catégories";
  String fournisseur="Fournisseurs";
  File Img;
  String img64;
  int catId,fournId;

  // date picker
  TextEditingController _dateAcquisition = new TextEditingController();
  TextEditingController _dateGuarantee = new TextEditingController();
  String etat = "actif";
  DateTime selectedDate = DateTime.now();


  // showdatepicker
  showDatePickrDialog(BuildContext context) {
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime(2020),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // showDatePickrDialog(context);
  }

  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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
            Text("New Hospitalisation",textAlign: TextAlign.center,textScaleFactor: 1.8,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),

            SizedBox(height: 10,),

            SizedBox(height: 10,),
            Wrap(
              children: [
                TextFormField(
                  controller: model,
                  decoration: InputDecoration(
                      hintText: "N° de Chamnre",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
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
                    child: Text(Chambre.toString()),
                  ),
                  getList: () async {
                    await getBien().then((value){
                      if(value.isNotEmpty){
                        lChambre.clear();
                        value.forEach((element) {
                          lChambre.add(element["name"]);
                        });
                      }
                      setState(() {});
                    });
                    return lChambre;
                  },
                  itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
                  onItemTapped: (item) {
                    print(item);
                    setState(() {
                      Chambre=item.toString();
                    });
                  },
                )
              ],
            ),
            // Wrap(
            //   children: [
            //     TextFormField(
            //       controller: model,
            //       decoration: InputDecoration(
            //           hintText: "Type de Chambre",
            //           border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                ListCombo<String>(
                  closeAfterItemTapped: true,
                  child:  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(NomPatient.toString()),
                  ),
                  getList: () async {
                    await getBien().then((value){
                      if(value.isNotEmpty){
                        lNomPatient.clear();
                        value.forEach((element) {
                          lNomPatient.add(element["name"]);
                        });
                      }
                      setState(() {});
                    });
                    return lNomPatient;
                  },
                  itemBuilder: (context, parameters, item) => ListTile(title: Text(item)),
                  onItemTapped: (item) {
                    print(item);
                    setState(() {
                      NomPatient=item.toString();
                    });
                  },
                )
              ],
            ),
            // Wrap(
            //   children: [
            //     TextFormField(
            //       controller: model,
            //       decoration: InputDecoration(
            //           hintText: "Nom de Patient",
            //           border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(height: 10,),
            Wrap(
              children: <Widget>[
                TextFormField(
                  controller: _dateAcquisition,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today, color: Colors.blue,),
                    labelText: "Date",
                    hintText: "Ex. 28/09/1996",
                    hintStyle: TextStyle(fontSize: 20.0),
                  ),
                  onTap: ()async{
                    DateTime date = DateTime(2020);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2099));
                    _dateAcquisition.text = DateFormat('dd-MM-yyyy').format(date);
                  },
                ),
              ],
            ),
            SizedBox(height: 140,),
            Wrap(
              children: <Widget> [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MaterialButton(

                      color: Colors.red,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.close,color: Colors.white,size: 18,
                      ),
                      onPressed: () {Navigator.pop(context);},
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),

                    // IconButton(icon:Icon(Icons.close,color: Colors.red,size: 45,), onPressed: (){
                    //   Navigator.pop(context);
                    // }),
                    // FlatButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(18.0),
                    //       side: BorderSide(color: Colors.red)),
                    //   color: Colors.white,
                    //   textColor: Colors.red,
                    //   padding: EdgeInsets.all(8.0),
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Add to Cart".toUpperCase(),
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 150),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Confirmer".toUpperCase(),
                          style: TextStyle(fontSize: 10)),
                    ),
                  ],
                )

                // Visibility(
                //   visible: widget.isDelete,
                //   child: Chip(
                //     label: Text(''),
                //
                //     deleteIcon: Icon(
                //       Icons.cancel,
                //     ),
                //     onDeleted: () {
                //       setState(() {
                //         widget.isDelete = !widget.isDelete;
                //       });
                //     },
                //     deleteIconColor: Colors.redAccent,
                //     deleteButtonTooltipMessage: 'Remove this chip',
                //
                //   ),
                // ),
              ],
            ),
            // Wrap(
            //   children: <Widget> [
            //
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: <Widget>[
            //
            //         RaisedButton(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //               side: BorderSide(color: Colors.blue)),
            //           onPressed: () {},
            //           color: Colors.blue,
            //           textColor: Colors.white,
            //           child: Center(child: Text("Annuler",textScaleFactor: 1,style: TextStyle(color: Colors.white),),),
            //         ),
            //
            //         // IconButton(icon:Icon(Icons.close,color: Colors.red,size: 45,), onPressed: (){
            //         //   Navigator.pop(context);
            //         // }),
            //         // FlatButton(
            //         //   shape: RoundedRectangleBorder(
            //         //       borderRadius: BorderRadius.circular(18.0),
            //         //       side: BorderSide(color: Colors.red)),
            //         //   color: Colors.white,
            //         //   textColor: Colors.red,
            //         //   padding: EdgeInsets.all(8.0),
            //         //   onPressed: () {},
            //         //   child: Text(
            //         //     "Add to Cart".toUpperCase(),
            //         //     style: TextStyle(
            //         //       fontSize: 14.0,
            //         //     ),
            //         //   ),
            //         // ),
            //         SizedBox(width: 150),
            //         RaisedButton(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10.0),
            //               side: BorderSide(color: Colors.blue)),
            //           onPressed: () {},
            //           color: Colors.blue,
            //           textColor: Colors.white,
            //           child: Center(child: Text("Confirmer",textScaleFactor: 1,style: TextStyle(color: Colors.white),),),
            //         ),
            //       ],
            //     )
            //
            //     // Visibility(
            //     //   visible: widget.isDelete,
            //     //   child: Chip(
            //     //     label: Text(''),
            //     //
            //     //     deleteIcon: Icon(
            //     //       Icons.cancel,
            //     //     ),
            //     //     onDeleted: () {
            //     //       setState(() {
            //     //         widget.isDelete = !widget.isDelete;
            //     //       });
            //     //     },
            //     //     deleteIconColor: Colors.redAccent,
            //     //     deleteButtonTooltipMessage: 'Remove this chip',
            //     //
            //     //   ),
            //     // ),
            //   ],
            // ),

          ],
        ),
      ) ,
    );
  }

}