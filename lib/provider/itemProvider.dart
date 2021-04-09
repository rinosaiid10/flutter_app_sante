import 'dart:convert';

import 'package:esante/models/inventory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class ItemProvider extends ChangeNotifier {

  int id;
  final String itemsWebservice = "https://estock.ci/kipinventory/public/api/v1/items/";
  iventoryItems itemsdata = new iventoryItems();

  //getItems({@required this.id});

  Future <Map> fetch(BuildContext context) async {
    Toast.show("Patientez svp 1/2.....", context, duration: 120);
    var response = await http.get(itemsWebservice + this.id.toString());
    if (response.statusCode != 200) {
      Toast.show(
        "Error:" + response.statusCode.toString() + " Merci de réessayer 2/2",
        context,);
    }
    if (response.statusCode == 200) {
      Toast.show("Traitement de l'affichage 2/2.....", context, duration: 120);
      var data = jsonDecode(response.body);
      print(data.toString());
      return data["data"][0];
    }
  }

}