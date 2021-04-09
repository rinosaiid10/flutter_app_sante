import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Item{

  int id, price, quantity;
  String image, name, detail, category, supplier, date_acquisition, date_fin_garantie, marque, model, etat;
  Item({id, name, price, detail, quantity, category, supplier, image, date_acquisition, date_fin_garantie, marque, model, etat});

  factory Item.fromJson(Map<String, dynamic> items){
    return Item(
      id : items["id"],
      name : items["name"],
      price : items["price"],
      detail: items["details"],
      quantity: items["quantite"],
      category: items["category"],
      supplier: items["supplier"],
      image: items["picture"],
      date_acquisition: items["date_acquisition"],
      date_fin_garantie: items["date_fin_garantie"],
      marque: items["marque"],
      model: items["model"],
      etat: items["etat"],
    );
  }

}