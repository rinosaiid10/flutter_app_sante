import 'package:esante/AddDoctor/ajoutDocteur.dart';
import 'package:esante/AddPersonal/ajoutPersonnel.dart';
import 'package:esante/AddSpecialty/ajoutSpecialite.dart';
import 'package:esante/DoctorList/listerDoctor.dart';
import 'package:esante/PersonalList/listePersonnel.dart';
import 'package:esante/core_functions/honeywell_scanner.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilAttente extends StatefulWidget {
  @override
  _FilAttenteState createState() => _FilAttenteState();
}

class _FilAttenteState extends State<FilAttente> {
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
                  "Fil d'attente",
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
                          label: Text('Patient',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Genre',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Contact',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),
                        DataColumn(
                          label: Text('Médecin',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ),

                        DataColumn(
                          label: Text('Status',textAlign: TextAlign.center,textScaleFactor: 1,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
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
                            DataCell(Text('')),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
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
                      SizedBox(height: 350
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
