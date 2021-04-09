
import 'dart:convert';

import 'package:esante/models/inventory.dart';
import 'package:esante/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class itemService{
  int id;
  final String itemsWebService = "https://estock.ci/kipinventory/public/api/v1/items";
  iventoryItems itemsdata=new iventoryItems();
  Item item = new Item();
  itemService({this.id});

  // get goods list
  Future<List<Item>> getListItem() async{
    var response = await http.get(itemsWebService);
    debugPrint(response.body);
    // if(response.statusCode == 200){
    //   var parsed = json.decode(response.body);
    //   List jsonResponse = parsed["data"] as List;
    //   return jsonResponse.map((dynamic item) => Item.fromJson(item)).toList();
    // } else{
    //   print('Error, could not load data');
    //   throw Exception('Failed to load data');
    // }
  }

  // fetch
}
