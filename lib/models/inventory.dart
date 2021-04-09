
import 'package:flutter/material.dart';

class iventoryItems{

  int id,price, quantite;
  String code,lastname,fistname,department,name,details,picture,category,supplier,created_at;
  // iventoryItems({@required id,@required code,@required lastname,@required fistname,@required department,@required name,@required price,@required details,@required picture,@required category,@required supplier,@required created_at, @required quantite});
  iventoryItems({@required id,@required code,@required lastname,@required fistname,@required department,@required name,@required price,@required details,@required picture,@required category,@required supplier,@required created_at, @required quantite});

  factory iventoryItems.fromJson(Map<String,dynamic>items){
    return iventoryItems(
      id: items["id"],
      code: items["code"],
      lastname: items["lastname"],
      fistname: items["firstname"],
      department: items["department"],
      category: items["category"],
      details: items["details"],
      name: items["name"],
      price:items["price"],
      picture: items["picture"],
      supplier: items["supplier"],
      created_at: items["created_at"],
      quantite: items["quantite"],
    );

  }




}