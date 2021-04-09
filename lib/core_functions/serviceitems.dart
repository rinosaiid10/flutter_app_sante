
import 'dart:convert';

import 'package:esante/models/inventory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:esante/constants/constant.dart';

class getItems{
  int id;
  final String itemsWebservice="https://estock.ci/kipinventory/public/api/v1/items/";
  final String itemsWebService = "https://estock.ci/kipinventory/public/api/v1/items";
  iventoryItems itemsdata=new iventoryItems();
  getItems({@required this.id});

  // item data
    Future <Map>fetch(BuildContext context)async {
      Toast.show("Patientez svp 1/2.....", context, duration: 120);
      var response = await http.get(BaseUrlItem + this.id.toString());
      if (response.statusCode != 200) {
        Toast.show(
          "Error:" + response.statusCode.toString() + " Merci de réessayer 2/2",
          context,);
      }
      if (response.statusCode == 200) {
        Toast.show("Traitement de l'affichage 2/2.....", context, duration: 120);
          var data = jsonDecode(response.body);
          print(data["data"].toString());
          return data;
      }
    }

    // item_info data
  Future <Map>fetchItemInfo(BuildContext context)async {
    Toast.show("Patientez svp 1/2.....", context, duration: 120);
    var response = await http.get(BaseUrlItemInfo + this.id.toString());
    if (response.statusCode != 200) {
      Toast.show(
        "Error:" + response.statusCode.toString() + " Merci de réessayer 2/2",
        context,);
    }
    if (response.statusCode == 200) {
      Toast.show("Traitement de l'affichage 2/2.....", context, duration: 120);
      var data = jsonDecode(response.body);
      print(data["data"].toString());
      return data;
    }
  }

    // get goods list
    // Future<List<iventoryItems>> getListItem() async{
    //   var response = await http.get(itemsWebService);
    //
    //   if(response.statusCode == 200){
    //     List<dynamic> body = jsonDecode(response.body);
    //     List<iventoryItems> items = body.map(
    //             (dynamic item) => iventoryItems.fromJson(item)).toList();
    //     return items;
    //   } else{
    //     throw "Can't get items";
    //   }
    // }
 }
