
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

final String ipAddress = "192.168.1.34";
final String Baseurl="https://estock.ci/kipinventory/public/api/v1/";
final String BaseurlOff="http://" + ipAddress + "/kiptest/public/api/v1/";
final String BaseUrlItem="http://" + ipAddress + "/kiptest/public/api/v1/items/";
final String BaseUrlItemAll="http://" + ipAddress + "/kiptest/public/api/v1/items";
final String BaseUrlItemInfo = "http://" + ipAddress + "/kiptest/public/api/v1/items_info/";
final String BaseUrlImage = "http://" + ipAddress + "/kiptest/public/";
final String BaseUrlItemInfoAll= "http://" + ipAddress + "/kiptest/public/api/v1/items_info";

// progress dialog
ProgressDialog progressDialog(BuildContext context, String comment){
  final ProgressDialog pr = ProgressDialog(context);
  pr.style(
    message: comment,
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
}