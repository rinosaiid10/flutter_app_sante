import 'dart:convert';

import 'package:esante/models/category.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class CategoryService{

  int id;
  final String categoryWebService = "https://estock.ci/kipinventory/public/api/v1/items";
  Category category = new Category();
  CategoryService({this.id});

  Future<Map> fetch(BuildContext context) async{
    Toast.show("Patientez svp 1/2...", context, duration: 120);
    var response = await http.get(categoryWebService + this.id.toString());
    if(response.statusCode != 200){
      Toast.show("Error: " + response.statusCode.toString() + " Merci de reessayer 2/2...", context);
    }
    if(response.statusCode == 200){
      Toast.show("Traitement de l'affichage 2/2...", context, duration: 120);
      var data = jsonDecode(response.body);
      print(data.toString());
      return data["data"];
    }



  }

}