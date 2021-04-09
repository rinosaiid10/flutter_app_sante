import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category{

  int id;
  String name, description, created_at, updated_at;
  Category({id, name, description, created_at, updated_at});

  factory Category.fromJson(Map<String, dynamic> categories){
    return Category(
      id: categories["id"],
      name: categories["name"],
      description: categories["description"],
      created_at: categories["created_at"],
      updated_at: categories["updated_at"],
    );
  }

}