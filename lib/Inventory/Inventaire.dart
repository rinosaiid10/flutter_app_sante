
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


class Inventaire extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _Inventaire();
  }


}

class _Inventaire extends State<Inventaire>{
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
      body: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: new ListView(
            padding: EdgeInsets.only(left: 20,right: 20),
            children: [
              SizedBox(height:60,),
              Text("Inventaire",textAlign: TextAlign.center,textScaleFactor: 1.8,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
              SizedBox(height:30,),

              Row(
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width/5,),
                  new Text("Date:          12/12/2020",textScaleFactor: 1.5,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height:30,),
              Row(
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width/5,),
                  new Text("Description: Test test",textScaleFactor:1.5,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height:30,),
              Row(
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width/5,),
                  new Text("Quantité:    12",textScaleFactor: 1.5,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height:200,),

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
                      SizedBox(height: 250
                        ,),

                      SizedBox(width: 140),
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
          )
      ),
    );
  }

}