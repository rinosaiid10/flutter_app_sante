import 'dart:convert';

import 'package:esante/Action/Action.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import 'package:esante/constants/constant.dart';


// core functions

Future <List<dynamic>> getCategories() async {
  var response= await http.get(BaseurlOff+"categories");
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }
}

// get one category
Future <List<dynamic>> getCategory(String id) async {
  var response= await http.get(BaseurlOff+"categories/"+id);
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }
}


Future <List<dynamic>> getFournisseur() async {
  var response= await http.get(BaseurlOff+"suppliers");
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }

}
Future <List<dynamic>> getBien() async {
  var response= await http.get(BaseurlOff+"items");
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }
}


Future <List<dynamic>> getAgent() async {
  var response= await http.get(BaseurlOff+"agents");
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }

}
Future <List<dynamic>> getSupplier() async {
  var response= await http.get(BaseurlOff+"suppliers");
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }

}

// get image
Future <List<dynamic>> getImage() async{
  var response = await http.get(BaseurlOff + "patrimonies"); // get patrimoines data
  if(response.statusCode == 200){
    var data = jsonDecode(response.body);
    var result = data["data"];
    return result;
  }
}

Future <List<dynamic>> getService() async {
  var response= await http.get(BaseurlOff+"departments");
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    var result=data["data"];
    return result;
  }

}

// ajouter un bien
AjoutBien(context,NomBien,PrixBien,DetailsBien,QuantiteBien,catId,fournId,img64,date_acquisition, date_fin_garantie, marque, model, etat) async {
  final ProgressDialog pr = ProgressDialog(context);
  pr.style(
      message: 'Envoie des données...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 2.0,
      maxProgress: 2.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  );
  pr.show();
   await http.post(BaseurlOff+"items",body: {
     'name':NomBien.toString(),
     'price':PrixBien.toString(),
     'details':DetailsBien.toString(),
     'quantity':QuantiteBien.toString(),
     'picture':img64.toString(),
     'category_id':catId.toString(),
     'supplier_id':fournId.toString(),
     'date_acquisition':date_acquisition.toString(),
     'date_fin_garantie':date_fin_garantie.toString(),
     'marque':marque.toString(),
     'model':model.toString(),
     'etat':etat
   }).then((response){
     print(response.body);
     pr.hide();
     if(response.statusCode==200){
       Toast.show("Données enregistrées avec succès", context);
       Navigator.pop(context);
     }else{
       Toast.show("Erreur  Merci de réessayer", context,backgroundColor: Colors.red);
     }
   },onError: (Exception){
     pr.hide();
     print(Exception);
   });
  pr.hide();


}

// function to login
Auth(context,email,password) async {
  final ProgressDialog pr = ProgressDialog(context);
  pr.style(
      message: 'Thanks for your patient...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  );
  pr.show();
  await http.post(BaseurlOff+"login",body: {
    'email':email.toString(),
    'password':password.toString()
  }).then((response){
    print(response.statusCode);
    pr.hide();
    if(response.statusCode==200){
       var data=jsonDecode(response.body);
       if(data["data"]==null){
         Toast.show("Login ou Mot de passe incorrecte", context,backgroundColor: Colors.red);
       }else{
         Toast.show("Bienvenue Agent "+data["data"]["name"], context,backgroundColor: Colors.blueAccent);
         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
           return action();
         }));
       }
    }else{
      Toast.show("Erreur d'accés à l'api ", context,backgroundColor: Colors.red);
    }

  });
  
  
}

AjoutPatrimoine(context,bienId,AgentId,serviceId) async {
  final ProgressDialog pr = ProgressDialog(context);
  pr.style(
      message: 'Envoie des données...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 2.0,
      maxProgress: 2.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  );
  pr.show();
  await http.post(BaseurlOff+"items_info",body: {
    'agent_id':AgentId.toString(),
    'department_id':serviceId.toString(),
    'item_id':bienId.toString()
  }).then((response){
    print(response.body);
    pr.hide();
    if(response.statusCode==200){
      Toast.show("Données enregistrées avec succès", context);
      Navigator.pop(context);
    }else{
      Toast.show("Erreur  Merci de réessayer", context,backgroundColor: Colors.red);
    }
  },onError: (Exception){
    pr.hide();
    print(Exception);
  });
  pr.hide();


}

// Modify items
ModItem(context, id, name, price, details, quantity, category_id, supplier_id, date_acquisition, date_fin_garantie, marque, model, etat) async{
  final ProgressDialog pr = ProgressDialog(context);
  pr.style(
    message: 'Sending data...',
    borderRadius: 10.0,
    backgroundColor: Colors.white,
    progressWidget: CircularProgressIndicator(),
    elevation: 10.0,
    insetAnimCurve: Curves.easeInOut,
    progress: 2.0,
    maxProgress: 2.0,
    progressTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
    ),
    messageTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 19.0,
      fontWeight: FontWeight.w600,
    ),
  );
  pr.show();
  await http.put(BaseurlOff + "items/" + id, body: {
    'name': name.toString(),
    'price': price.toString(),
    'details': details.toString(),
    'quantity': quantity.toString(),
    'category_id': category_id.toString(),
    'supplier_id': supplier_id.toString(),
    'date_acquisition': date_acquisition.toString(),
    'date_fin_garantie': date_fin_garantie.toString(),
    'marque': marque.toString(),
    'model': model.toString(),
    'etat': etat.toString()
  }).then((response){
    print(response.body);
    pr.hide();
    if(response.statusCode == 200){
      Toast.show("Donnees modifiees avec succes", context);
      Navigator.pop(context);
    } else{
      Toast.show("Erreur en modifiant les donnees", context);
    }
  }, onError: (Exception){
    pr.hide();
    print(Exception);
  });
  pr.hide();
}


// Modify patrimoine
ModPatrimoine(context,Id,bienId,AgentId,serviceId, etat) async {
  final ProgressDialog pr = ProgressDialog(context);
  pr.style(
      message: 'Envoie des données...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 2.0,
      maxProgress: 2.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
  );
  pr.show();
  await http.put(BaseurlOff +"items_info/"+Id, body: {
    'agent_id': AgentId.toString(),
    'department_id': serviceId.toString(),
    'item_id': bienId.toString(),
    'etat': etat.toString()
  }).then((response) {
    print(response.statusCode);
    pr.hide();
    if (response.statusCode == 200) {
      Toast.show("Données enregistrées avec succès", context);
      Navigator.pop(context);
    } else {
      Toast.show(
          "Erreur  Merci de réessayer", context, backgroundColor: Colors.red);
    }
  }, onError: (Exception) {
    pr.hide();
    print(Exception);
  });
  pr.hide();
}


