import 'dart:convert';
import 'dart:io';

import 'package:esante/core_functions/itemService.dart';
import 'package:esante/core_functions/serviceitems.dart';
import 'package:esante/models/inventory.dart';
import 'package:esante/models/item.dart';
import 'package:esante/ModificationItem/ModificationItem.dart';
import 'package:esante/ItemList/itemsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:esante/constants/constant.dart';


final String baseUrl = "https://estock.ci/kipinventory/public/";
final String itemsWebServiceUpdate = "http://192.168.1.7/kiptest/public/api/v1/items/";

class listePersonnel extends StatefulWidget {
  @override
  _listePersonnelState createState() => _listePersonnelState();
}

class _listePersonnelState extends State<listePersonnel > {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: Text("",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          actions: [

            Image.asset("assets/images/Logo.jpg",height: 50,),
          ],
        ),
        body: Container(
          child: singleChildScrollView(),
        )
    );
  }


  @override
  Widget singleChildScrollView(){
    return  SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Liste Personnel",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text('Date',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Photo',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Qr Code',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Nom et Prenom',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Type',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Email',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Mobile',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),


                        DataColumn(
                          label: Text('Action',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),

                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),

                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),
                            DataCell(Text('')),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 30),
              ),
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

          ),
        ),
      ),
    );

  }



}
