import 'package:flutter/material.dart';

class Heritage{

  int id, code_valide, agent_id, department_id, item_id, created_at, updated_at;
  String code;
  Heritage({id, code, code_valide, agent_id, department_id, item_id, created_at, updated_at});

  factory Heritage.fromJson(Map<String, dynamic> heritages){
    return Heritage(
      id: heritages["id"],
      code: heritages["code"],
      code_valide: heritages["code_valide"],
      agent_id: heritages["agent_id"],
      department_id: heritages["department_id"],
      item_id: heritages["item_id"],
      created_at: heritages["created_at"],
      updated_at: heritages["updated_at"]
    );
  }


}