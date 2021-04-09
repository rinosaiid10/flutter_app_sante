
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


class ajoutSpecialite extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _ajoutSpecialite();
  }


}

class _ajoutSpecialite extends State<ajoutSpecialite>{
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
    selectedDate.then((value) {
      var date = DateFormat('dd-MM-yyyy').format(value);
      print("SELECTED_DATE==$date");
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // showDatePickrDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("Retour",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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
            Text("Ajouter Spécialité",textAlign: TextAlign.center,textScaleFactor: 1.8,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            SizedBox(height: 40,),
            Wrap(
              children: [
                TextFormField(
                  controller: NomBien,
                  decoration: InputDecoration(
                      hintText: "Libellé",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),


            Wrap(
              children: [
                TextFormField(
                  controller: brand,
                  decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),

            SizedBox(height: 60,),
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
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Valider".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
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
          ],
        ),
      ) ,
    );
  }

}