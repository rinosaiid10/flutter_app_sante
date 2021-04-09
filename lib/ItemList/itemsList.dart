import 'package:esante/core_functions/honeywell_scanner.dart';
import 'package:esante/models/inventory.dart';
import 'package:esante/ModificationItem//ModificationItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esante/constants/constant.dart';

class itemsList extends StatefulWidget{
  Map data;
  itemsList(this.data);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _itemsList(this.data);
  }

}

class _itemsList extends State<itemsList>{
  Map data;
  List mydata;
  // final String prefix="https://estock.ci/kipinventory/public/";
  _itemsList(this.data);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydata = data["data"];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        leading: Image.asset("assets/images/Logo.jpg",height: 50,),
        title: Text("INVENTAIRE",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions: [
          // Icon(Icons.account_circle_outlined,size: 50,)
          Icon(Icons.account_circle,size: 50,)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:ListView(
          padding: EdgeInsets.all(10),
          children: [
            Wrap(
              children: [
                Text("Image:",textScaleFactor:1.5,),
                SizedBox(width: 20,),
                Image.network(BaseUrlImage+mydata[0]["picture"],height: 100,),
              ],
            ),
            Divider(color: Colors.lightBlue,),
            /*
            Wrap(
              children: [
                Text("Id:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(data["id"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            Wrap(
              children: [
                Text("Code:",textScaleFactor: 1.5,),
                SizedBox(width: 10,),
                Text(data["code"].toString(),textScaleFactor: 1.5,),
              ],
            ),
             */
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Bien:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["name"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Date d'acquisition:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["date_acquisition"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Date Fin Garantie:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["date_fin_garantie"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Marque:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["marque"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            Wrap(
              children: [
                Text("Modele:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["model"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("  Détails",textScaleFactor: 1.5,),
                SizedBox(width:5,),
                TextFormField(
                  enabled: false,
                  maxLines: 4,
                  decoration: InputDecoration(hintText:mydata[0]["details"].toString(),border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)))),
                )
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Prix:",textScaleFactor: 1.5,),
                SizedBox(width: 10,),
                Text(mydata[0]["price"].toString()+" FCFA",textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Categories:",textScaleFactor: 1.5,),
                SizedBox(width: 10,),
                Text(mydata[0]["cat_name"].toString()+" FCFA",textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Agent:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["lastname"].toString()+" "+mydata[0]["firstname"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Service:",textScaleFactor: 1.5,),
                SizedBox(width: 20,),
                Text(mydata[0]["dep_name"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Etat:",textScaleFactor: 1.5,),
                SizedBox(width: 10,),
                Text(mydata[0]["etat"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Ajouté le:",textScaleFactor: 1.5,),
                SizedBox(width: 10,),
                Text(mydata[0]["created_at"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              children: [
                Text("Modifier le:",textScaleFactor: 1.5,),
                SizedBox(width: 10,),
                Text(mydata[0]["updated_at"].toString(),textScaleFactor: 1.5,),
              ],
            ),
            Divider(color: Colors.lightBlue,),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
                    child: Icon(Icons.close,color: Colors.white,),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),

                RaisedButton(
                   color:Colors.lightBlue,
                    child: Text("Modifier",style: TextStyle(color: Colors.white),),
                    onPressed: (){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
                       return ModifPatrimoine(this.data);
                     }));

                 })
              ],
            )
          ],
        ),
      ),
    );
  }

}